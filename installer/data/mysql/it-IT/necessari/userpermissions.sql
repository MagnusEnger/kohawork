INSERT INTO permissions (module_bit, code, description) VALUES
   ( 1, 'circulate_remaining_permissions', 'Permessi rimanenti per la circolazione'),
   ( 1, 'override_renewals', 'Sblocca i rinnovi bloccati'),
   ( 1, 'overdues_report', 'Esegui report per prestiti scaduti'),
   ( 1, 'force_checkout', 'Sblocca il prestito'),
   ( 1, 'manage_restrictions', 'Gestisci restrizioni per utenti'),
   ( 3, 'parameters_remaining_permissions', 'Permessi rimanenti'),
   ( 3, 'manage_circ_rules', 'Gestisci regole circolazione'),
   ( 6, 'place_holds', 'Fai prenotazioni per gli utenti'),
   ( 6, 'modify_holds_priority', 'Modifica priorità prenotazioni'),
   ( 9, 'edit_catalogue', 'Cataloga (crea/modifica dati bibliografici e di copia)'),
   ( 9, 'fast_cataloging', 'Catalogazione veloce'),
   ( 9, 'edit_items', 'Crea/modifica copie'),
   ( 9, 'edit_items_restricted', 'Limit item modification to subfields defined in the SubfieldsToAllowForRestrictedEditing preference (please note that edit_item is still required)'),
   ( 9, 'delete_all_items', 'Delete all items at once'),
   (10, 'writeoff', 'Cancellare multe e tariffe'),
   (10, 'remaining_permissions', 'Permessi rimanenti per gestione multe e costi'),
   (11, 'vendors_manage', 'Crea/modifica fornitori'),
   (11, 'contracts_manage', 'Crea/modifica contratti'),
   (11, 'period_manage', 'Gestisci scadenze budgets'),
   (11, 'budget_manage', 'Crea/modifica budgets'),
   (11, 'budget_modify', 'Modifica budget (non li crea ma modifica gli esistenti)'),
   (11, 'planning_manage', 'Intervieni sulla pianificazione dei budgets'),
   (11, 'order_manage', 'Gestisci ordini e raccoglitori'),
   (11, 'order_manage_all', 'Gestisci ordini e raccoglitori, indipendentemente dalle restrizioni su di loro'),
   (11, 'group_manage', 'Gestisci ordini e ordini d\'acquisto'),
   (11, 'order_receive', 'Gestisci arrivi'),
   (11, 'budget_add_del', 'Aggiungi e cancella budgets (senza modificarli)'),
   (11, 'budget_manage_all', 'Gestisci tutti i budgets'),
   (13, 'edit_news', 'Scrivi le news per l\'OPAC e per l\'interfaccia staff'),
   (13, 'label_creator', 'Crea etichette da stampare e barcodes dal catalogo e dai dati degli utenti'),
   (13, 'edit_calendar', 'Definisci i giorni di chiusura della biblioteca'),
   (13, 'moderate_comments', 'Modera i commenti degli utenti'),
   (13, 'edit_notices', 'Definisci le notifiche'),
   (13, 'edit_notice_status_triggers', 'Imposta il messaggio o lo stato delle notifiche per le copie in ritardo'),
   (13, 'edit_quotes', 'Modifica suggerimenti/citazioni per la feature corrispondente'),
   (13, 'view_system_logs', 'Scorri i log di sistema'),
   (13, 'inventory', 'Lavora sugli inventari (stocktaking) del tuo catalogo'),
   (13, 'stage_marc_import', 'Opera sui Record MARC presenti nella zona di lavoro'),
   (13, 'manage_staged_marc', 'Gestisci i record MARC in lavorazione, inclusi il completare e il cancellare gli import'),
   (13, 'export_catalog', 'Esporta i dati bibliografici e di copia'),
   (13, 'import_patrons', 'Importa i dati utente'),
   (13, 'edit_patrons', 'Modifica utenti via batch'),
   (13, 'delete_anonymize_patrons', 'Cancella i vecchi prestiti e rendi anonimo lo storico della circolazione (canella in lettura lo storico utenti prestito)'),
   (13, 'batch_upload_patron_images', 'Aggiorna le foto utente in modalità batch o al momento'),
   (13, 'schedule_tasks', 'Schedula i task'),
   (13, 'items_batchmod', 'Abilita alla modifica batch delle copie'),
   (13, 'items_batchmod_restricted', 'Limit batch item modification to subfields defined in the SubfieldsToAllowForRestrictedBatchmod preference (please note that items_batchmod is still required)'),
   (13, 'items_batchdel', 'Abilita alla cancellazione via batch delle copie'),
   (13, 'manage_csv_profiles', 'Gestisci i profili CSV di export'),
   (13, 'moderate_tags', 'Modera i tag inseriti dagli utenti'),
   (13, 'rotating_collections', 'Gestisci le collezioni circolanti (rotating collections)'),
   (13, 'upload_local_cover_images', 'Carica copertine in locale'),
   (13, 'manage_patron_lists', 'Aggiungi, modifica e cancella le liste utenti e i loro contenuti'),
   (13, 'records_batchmod', 'Perform batch modification of records (biblios or authorities)'),
   (13, 'marc_modification_templates', 'Gestisci le modifiche sulle griglie di catalogazione MARC'),
   (13, 'records_batchdel', 'Perform batch deletion of records (bibliographic or authority)'),
   (15, 'check_expiration', 'Controlla la scadenza di una risora in continuazione'),
   (15, 'claim_serials', 'Richiedi i fascicoli non arrivati'),
   (15, 'create_subscription', 'Crea un nuovo abbonamento'),
   (15, 'delete_subscription', 'Cancella un abbonamento esistente'),
   (15, 'edit_subscription', 'Modifica un abbonamento esistente'),
   (15, 'receive_serials', 'Ricevi fascicoli'),
   (15, 'renew_subscription', 'Rinnova un abbonamento'),
   (15, 'routing', 'Crea/Manipola liste di distribuzione dei fascicoli ( routing list)'),
   (15, 'superserials', 'Gestisci gli abbonamenti per ogni biblioteca(only applies when IndependantBranches is used)'),
   (16, 'execute_reports', 'Esegui reports SQL'),
   (16, 'create_reports', 'Crea reports SQL'),
   (18, 'manage_courses', 'Aggiungi, modifica e cancella i corsi'),
   (18, 'add_reserves', 'Aggiungi corsi riservati'),
   (18, 'delete_reserves', 'Cancella corsi riservati'),
   (19, 'manage', 'Gestisci plugins ( installa / disinstalla )'),
   (19, 'tool', 'Usa i plugins di tipo strumento'),
   (19, 'report', 'Usa i plugins di tipo report'),
   (19, 'configure', 'Configura i plugins'),
   (20, 'delete_public_lists', 'Delete public lists')
;