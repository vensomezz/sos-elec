-- SOS Elec : nettoyage des statuts enregistrés avec des guillemets parasites
-- (ex. 'pending' stocké sous la forme "'pending'" par l'ancienne version de l'app).
-- À exécuter une seule fois dans Supabase > SQL Editor.

update service_requests
set status = btrim(status, ' ''"')
where status ~ '^[ ''"]|[ ''"]$';

update service_requests
set final_payment_status = btrim(final_payment_status, ' ''"')
where final_payment_status ~ '^[ ''"]|[ ''"]$';

-- Harmonisation des anciens statuts écrits avec des majuscules ou des espaces
update service_requests set status = 'completed'              where status in ('Completed');
update service_requests set status = 'accepted'               where status in ('Accepted');
update service_requests set status = 'refused'                where status in ('Refused');
update service_requests set status = 'in_progress'            where status in ('In progress');
update service_requests set status = 'electrician_on_his_way' where status in ('on the way');

-- Rôles utilisateurs
update users set role = btrim(role, ' ''"') where role ~ '^[ ''"]|[ ''"]$';
-- Les électriciens créés par l'admin avaient le rôle "approved" au lieu de "electrician"
update users set role = 'electrician' where role = 'approved';
