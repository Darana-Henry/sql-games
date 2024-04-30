select * from crime_scene_report
where date = '20180115'
and city = 'SQL City'
and type = 'murder'

-- date	type	description	city
-- 20180115	murder	Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".	SQL City

select * from person 
where name like '%Annabel%' 
and address_street_name = 'Franklin Ave'

-- id	name	license_id	address_number	address_street_name	ssn
-- 16371	Annabel Miller	490173	103	Franklin Ave	318771143

select * from person 
where address_street_name = 'Northwestern Dr' 
order by address_number desc
limit 1

/* id	name	license_id	address_number	address_street_name	ssn
14887	Morty Schapiro	118009	4919	Northwestern Dr	111564949 */

select * from interview 
where person_id in (14887, 16371)

-- person_id	transcript
-- 14887	I heard a gunshot and then saw a man run out. 
-- He had a "Get Fit Now Gym" bag. 
-- The membership number on the bag started with "48Z". 
-- Only gold members have those bags. 
-- The man got into a car with a plate that included "H42W".
-- 16371	I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

select * from get_fit_now_check_in
where membership_id like '48Z%'

select * from drivers_license
where plate_number like '%H42W%'

select * from get_fit_now_member gtnm
join get_fit_now_check_in gfnci
on gtnm.id = gfnci.membership_id
join person p
on gtnm.person_id = p.id
join drivers_license dl
on p.license_id = dl.id
where gfnci.membership_id like '48Z%'
and dl.plate_number like '%H42W%'
and gfnci.check_in_date = '20180109'

-- id	person_id	name	membership_start_date	membership_status	membership_id	check_in_date	check_in_time	check_out_time	id	name	license_id	address_number	address_street_name	ssn	id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model
-- 48Z55	67318	Jeremy Bowers	20160101	gold	48Z55	20180109	1530	1700	67318	Jeremy Bowers	423327	530	Washington Pl, Apt 3A	871539279	423327	30	70	brown	brown	male	0H42W2	Chevrolet	Spark LS


insert into solution values (1, 'Jeremy Bowers');     
select value from solution;

-- value
-- Congrats, you found the murderer! But wait, there's more... 
-- If you think you're up for a challenge, try querying the interview transcript of the murderer to find the real villain behind this crime. 
-- If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries. 
-- Use this same INSERT statement with your new suspect to check your answer.

select * from interview 
where person_id = '67318'

-- person_id	transcript
-- 67318	I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
-- She has red hair and she drives a Tesla Model S. 
-- I know that she attended the SQL Symphony Concert 3 times in December 2017.

select * from drivers_license
where hair_color = 'red'
and gender = 'female'
and car_make = 'Tesla'
and car_model = 'Model S'
and height between 65 and 67

-- id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model
-- 202298	68	66	green	red	female	500123	Tesla	Model S
-- 291182	65	66	blue	red	female	08CM64	Tesla	Model S
-- 918773	48	65	black	red	female	917UU3	Tesla	Model S

select * from person p
join drivers_license dl
on dl.id = p.license_id
join facebook_event_checkin fec
on p.id = fec.person_id
where dl.hair_color = 'red'
and dl.gender = 'female'
and dl.car_make = 'Tesla'
and dl.car_model = 'Model S'
and dl.height between 65 and 67
and fec.event_name = 'SQL Symphony Concert'
and fec.date like '201712%'

-- id	name	license_id	address_number	address_street_name	ssn	id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model	person_id	event_id	event_name	date
-- 99716	Miranda Priestly	202298	1883	Golden Ave	987756388	202298	68	66	green	red	female	500123	Tesla	Model S	99716	1143	SQL Symphony Concert	20171206
-- 99716	Miranda Priestly	202298	1883	Golden Ave	987756388	202298	68	66	green	red	female	500123	Tesla	Model S	99716	1143	SQL Symphony Concert	20171212
-- 99716	Miranda Priestly	202298	1883	Golden Ave	987756388	202298	68	66	green	red	female	500123	Tesla	Model S	99716	1143	SQL Symphony Concert	20171229

insert into solution values (1, 'Miranda Priestly');     
select value from solution;

-- value
-- Congrats, you found the brains behind the murder! 
-- Everyone in SQL City hails you as the greatest SQL detective of all time. 
-- Time to break out the champagne!