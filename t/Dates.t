#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 327;
use Test::Warn;

BEGIN {
    use FindBin;
    use lib $FindBin::Bin;
    use_ok( 'C4::Dates', qw(format_date format_date_in_iso) );
}

sub isBadDate {
    my ($tdate,$tformat) = @_;
    my $retval = 0;
    if (index('iso,us,metric',$tformat)>=0) {
        if ($tdate =~ /^00*-/ || $tdate =~ /-00*-/ ||
            $tdate =~ /-00*$/ || $tdate =~ /-00* /) {

            $retval = 1;
        }
    }
    elsif ($tformat eq 'sql') {
        if ($tdate =~ /^0000/ || $tdate =~ /^....00/ ||
            $tdate =~ /^......00/) {

            $retval = 1;
        }
    }
    return $retval;
}

sub describe ($$) {
    my $front = sprintf( "%-25s", shift );
    my $tail = shift || 'FAILED';
    return "$front : $tail";
}

# Keep the number of test elements per [array] equal or the predicted number of tests
# needs to be different for different (fake) sysprefs.
my %thash = (
    iso    => [ '2001-1-1',           '1989-9-21',          '1952-1-0',           '1989-9-21 13:46:02', '2001-01-01', '1989-09-21', '1952-01-00', '1989-09-21 13:46:02' ],
    metric => [ "1-1-2001",           '21-9-1989',          '00-1-1952',          '21-9-1989 13:46:02', "01-01-2001", '21-09-1989', '00-01-1952', '21-09-1989 13:46:02' ],
    us     => [ "01-01-2001",         '09-21-1989',         '01-00-1952',         '09-21-1989 13:46:02' ],
    sql    => [ '20010101    010101', '19890921    143907', '19520100    000000', '19890921    134602' ],
    rfc822 => [ 'Wed, 02 Oct 2002 15:00:00 +0200', 'Fri, 10 Sep 2010 08:00:00 +0500' ],
);

my ( $date, $format, $today, $today0, $val, $re, $syspref );
my @formats              = sort keys %thash;
my $fake_syspref_default = 'us';
my $fake_syspref         = (@ARGV) ? shift : $ENV{KOHA_TEST_DATE_FORMAT};
if ($fake_syspref) {
    diag "You asked for date format '$fake_syspref'.";
    unless ( scalar grep { /^$fake_syspref$/ } @formats ) {
        diag "Warning: Unkown date format '$fake_syspref', reverting to default '$fake_syspref_default'.";
        $fake_syspref = $fake_syspref_default;
    }
}
$fake_syspref or $fake_syspref = $fake_syspref_default;
$C4::Dates::prefformat = $fake_syspref;    # So Dates doesn't have to ask the DB anything.

print <<EndOfDiag;

In order to run without DB access, this test will substitute
'$fake_syspref' as your default date format.  Export
environmental variable KOHA_TEST_DATE_FORMAT to override this
default, or pass the value as an argument to this test script.

NOTE: we test for the system handling dd=00 and 00 for TIME
      values, but you should not see any warnings.

EndOfDiag

# Testing Legacy Functions: format_date and format_date_in_iso
ok( $syspref = C4::Dates->new->format(), "Your system preference is: $syspref" );
foreach ( @{ $thash{'iso'} } ) {
    if (isBadDate($_,'iso')==1) {
        warning_like { $val = format_date($_); } qr/Illegal date/,
            "format_date('$_'): Warning as expected";
    }
    else {
        ok( $val = format_date($_), "format_date('$_'): $val" );
    }
}
foreach ( @{ $thash{$syspref} } ) {
    if (isBadDate($_,$syspref)==1) {
        warning_like { $val = format_date_in_iso($_); } qr/Illegal date/,
            "format_date_in_iso('$_'): Warning as expected";
    }
    else {
        ok( $val = format_date_in_iso($_), "format_date_in_iso('$_'): $val" );
    }
}
ok( $today0 = C4::Dates->today(), "(default) CLASS ->today : $today0" );
#diag "Testing " . scalar(@formats) . " formats.\nTesting no input (defaults):";
foreach (@formats) {
    my $pre = sprintf '(%-6s)', $_;
    ok( $date = C4::Dates->new(), "$pre Date Creation   : new()" );
    ok( $_ eq ( $format = $date->format($_) ), "$pre format($_)      : " . ( $format || 'FAILED' ) );
    ok( $format = $date->visual(), "$pre visual()        : " . ( $format || 'FAILED' ) );
    ok( $today  = $date->output(), "$pre output()        : " . ( $today  || 'FAILED' ) );
    ok( $today  = $date->today(),  "$pre object->today   : " . ( $today  || 'FAILED' ) );
}

#diag "Testing with valid inputs:";
foreach $format (@formats) {
    my $pre = sprintf '(%-6s)', $format;
    foreach my $testval ( @{ $thash{$format} } ) {
        if (isBadDate($testval,$format)==1) {
            warning_like { $date = C4::Dates->new( $testval, $format ) }
                qr/Illegal date/,
                "$pre Date Creation   : new('$testval','$format') -- Warning as expected.";
        }
        else {
            ok( $date = C4::Dates->new( $testval, $format ), "$pre Date Creation   : new('$testval','$format')" );
        }
        ok( $re = $date->regexp, "$pre has regexp()" );
        ok( $testval =~ /^$re$/, "$pre has regexp() match $testval" );
        ok( $val = $date->output(), describe( "$pre output()", $val ) );
      SKIP: {
            skip( "special case with explicit regexp('syspref') because $format isn't $syspref", 1 ) unless ( $format eq $syspref );
            my $re_syspref = C4::Dates->regexp('syspref');
            ok( $testval =~ /^$re_syspref$/, "$pre has regexp('syspref') match $testval" );
        }
        foreach ( grep { !/$format/ } @formats ) {
            ok( $today = $date->output($_), describe( sprintf( "$pre output(%8s)", "'$_'" ), $today ) );
        }
        ok( $today = $date->today(), describe( "$pre object->today", $today ) );

        # ok($today == ($today = C4::Dates->today()), "$pre CLASS ->today   : $today" );
        ok( $val = $date->output(), describe( "$pre output()", $val ) );

        # ok($format eq ($format = $date->format()),  "$pre format()        : $format" );
    }
}

#diag "Testing object independence from class";
my $in1  = '12/25/1952';                       # us
my $in2  = '13/01/2001';                       # metric
my $d1   = C4::Dates->new( $in1, 'us' );
my $d2   = C4::Dates->new( $in2, 'metric' );
my $out1 = $d1->output('iso');
my $out2 = $d2->output('iso');
ok( $out1 ne $out2, "subsequent constructors get different dataspace ($out1 != $out2)" );
