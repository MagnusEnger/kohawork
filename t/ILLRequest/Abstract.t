#!/usr/bin/perl

# This file is part of Koha.
#
# Koha is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# Koha is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Koha; if not, see <http://www.gnu.org/licenses>.

use Modern::Perl;

use Test::More;
use Test::Warn;
use Data::Dump qw( dump );

BEGIN {
    use_ok('Koha::ILLRequest::Abstract');
}

# new
my $abstract = Koha::ILLRequest::Abstract->new();
isa_ok($abstract, 'Koha::ILLRequest::Abstract');

# build

# checkAvailability



# getPrices
#isa_ok($abstract->getPrices, 'XML::LibXML::Document');
#diag(dump($abstract->getPrices));

done_testing;