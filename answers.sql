--https://sql-island.informatik.uni-kl.de/

select * from inhabitant

select * from inhabitant where state = 'friendly'

select * from inhabitant where state = 'friendly' and job = 'weaponsmith'

select * from inhabitant where state = 'friendly' and job like '%smith'

select personid from inhabitant where name = 'Stranger'

select gold from inhabitant where personid = '20'

UPDATE item set owner = 20 WHERE  owner is null

select * from item where owner = '20'

select * from inhabitant where state = 'friendly' and (job = 'dealer' OR job = 'merchant')

update item set owner = '15' where (item = 'teapot' OR item = 'ring')

update inhabitant set name = 'Hank' where personid = '20'

select * from inhabitant where job like '%baker%' order by gold desc

select * from inhabitant where job like '%pilot%'

select inhabitant.name from inhabitant join village 
on inhabitant.villageid = village.villageid 
and chief = personid and village.name = 'Onionville'