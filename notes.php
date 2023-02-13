<?php
$name = "stalin thomas";
#query Execute
 echo $this->last_query;
 exit;
# Admit Card sample Query

$sql = "SELECT kd.*,ted.*,t.tier_name, t.tier_id , CONCAT(kd.present_address,', ',kd.present_district,', ',kd.present_state,', ',substring(kd.present_pincode,1,6)) as candidate_address FROM cgle_2019_kyas kd JOIN cgle_2019_tier ted ON kd.reg_no = ted.reg_no and trim(kd.exam_code) = trim(ted.exam_code) JOIN tier_master t ON ted.tier_id = cast(t.tier_id as char(255)) WHERE kd.dob = '31-12-1991' AND kd.reg_no = '10000863847' AND ted.tier_id = '1'";






?>

SQL HINTS:


select * from cgle_2019_tier where ac_printed = '1'

select * from sscsr_db_table_tier_master

select * from sscsr_db_table_master


SELECT tm.*,kd.*,ted.*,t.tier_name, t.tier_id , CONCAT(kd.present_address,', ',kd.present_district,', ',kd.present_state,', ',substring(kd.present_pincode,1,6)) as candidate_address FROM cgle_2019_kyas kd 
JOIN cgle_2019_tier ted ON kd.reg_no = ted.reg_no and trim(kd.exam_code) = trim(ted.exam_code) 
JOIN tier_master t ON ted.tier_id = cast(t.tier_id as char(255))
JOIN sscsr_db_table_tier_master tm on cast(ted.exam_code as char(255)) = tm.exam_code 
WHERE kd.dob = '25-06-1993' AND kd.reg_no = '10000863847' AND ted.tier_id = '1' and tm.tier_id = '1'


SELECT tm.*,kd.*,ted.*,t.tier_name, t.tier_id , CONCAT(kd.present_address,', ',kd.present_district,', ',kd.present_state,', ',substring(kd.present_pincode,1,6)) as candidate_address FROM cgle_2019_kyas kd 
JOIN cgle_2019_tier ted ON kd.reg_no = ted.reg_no and trim(kd.exam_code) = trim(ted.exam_code) 
JOIN tier_master t ON ted.tier_id = cast(t.tier_id as char(255))
JOIN sscsr_db_table_tier_master tm on cast(ted.exam_code as char(255)) = tm.exam_code 
WHERE kd.dob = '25-06-1993' AND kd.reg_no = '10000863847' AND ted.tier_id = '1' and tm.tier_id = '1'



SELECT date1::date - INTEGER '3' AS yesterday_date FROM cgle_2019_tier where tier_id = '1' order by id asc limit 1

SELECT tm.*,kd.*,ted.*,t.tier_name, t.tier_id , CONCAT(kd.present_address,', ',kd.present_district,', ',kd.present_state,', ',substring(kd.present_pincode,1,6)) as candidate_address FROM cgle_2019_kyas kd 
JOIN cgle_2019_tier ted ON kd.reg_no = ted.reg_no and trim(kd.exam_code) = trim(ted.exam_code) 
JOIN tier_master t ON ted.tier_id = cast(t.tier_id as char(255))
JOIN sscsr_db_table_tier_master tm on cast(ted.exam_code as char(255)) = tm.exam_code 
WHERE kd.dob = '25-06-1993' AND kd.reg_no = '10000863847' AND ted.tier_id = '1' and tm.tier_id = '1'


select * from cgle_2019_kyas where reg_no = '10000863847'

db_changes on 12feb23 at 2 o clock:

go to 
category_name   selection_post_order  show_in_selection_posts
Notice2             1                           1
CBE                 2                           1
Skill Test          3                           1                # Add this value in this table
DV                  4                           1
Nominations         5                           1

SELECT * FROM mstcategory







13feb2023<?php
Crontab:



mervinthomas-3:cron apple$ php status_update.php 
SELECT date1::date - INTEGER '2' as statusupdateddate FROM cgle_2019_tier where tier_id = '1' order by id asc limit 1PHP Fatal error:  Uncaught PDOException: SQLSTATE[22008]: Datetime field overflow: 7 ERROR:  date/time field value out of range: "15.02.2023"
HINT:  Perhaps you need a different "datestyle" setting. in /Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron/status_update.php:30
Stack trace:
#0 /Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron/status_update.php(30): PDOStatement->execute()
#1 {main}
  thrown in /Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron/status_update.php on line 30

Fatal error: Uncaught PDOException: SQLSTATE[22008]: Datetime field overflow: 7 ERROR:  date/time field value out of range: "15.02.2023"
HINT:  Perhaps you need a different "datestyle" setting. in /Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron/status_update.php:30
Stack trace:
#0 /Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron/status_update.php(30): PDOStatement->execute()
#1 {main}
  thrown in /Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron/status_update.php on line 30
mervinthomas-3:cron apple$ php status_update.php 
SELECT date1::date - INTEGER '2' as statusupdateddate FROM cgle_2019_tier where tier_id = '1' order by id asc limit 1 the update has to be donemervinthomas-3:cron apple$ php status_update.php 
SELECT date1::date - INTEGER '2' as statusupdateddate FROM cgle_2019_tier where tier_id = '1' order by id asc limit 1Updating the status of sscsr_db_table_tier_master#cgle_2019_tier_1
mervinthomas-3:cron apple$ php status_update.php 
mervinthomas-3:cron apple$ php status_update.php 
mervinthomas-3:cron apple$ php status_update.php 

Updating the status of sscsr_db_table_tier_master#cgle_2019_tier_1
mervinthomas-3:cron apple$ php status_update.php 
mervinthomas-3:cron apple$ pwd
/Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron
mervinthomas-3:cron apple$ crontab -e
crontab: no crontab for apple - using an empty one
crontab: installing new crontab
mervinthomas-3:cron apple$ crontab -l
0 0 * * * php /Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron/status_update.php
mervinthomas-3:cron apple$ crontab -e
crontab: installing new crontab
mervinthomas-3:cron apple$ php /Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron/status_update.php
mervinthomas-3:cron apple$ php /Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron/status_update.php
Starting with query select  
em.exam_name,
dtm.no_of_days,
dbm.table_exam_year,
dbm.table_type, 
dbm.table_name,
dbm.table_exam_short_name,
dtm.tier_id as tier_id,
dtm.updated_on as updated_on,
dtm.stop_status as stop_status,
tm.tier_name as tier_name,
dtm.id as tier_master_id,
dtm.status as dtmstatus  
from exam_master em 
join sscsr_db_table_master dbm on em.exam_short_name = dbm.table_exam_short_name
join sscsr_db_table_tier_master dtm on dbm.table_name = dtm.table_name
join tier_master tm on cast(dtm.tier_id as char(255)) =  cast(tm.tier_id as char(255)) 
where dtm.stop_status = '0' AND dtm.status = '0' order by dbm.table_exam_year desc,dtm.tier_id asc 
mervinthomas-3:cron apple$ php /Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron/status_update.php
process started at 2023-02-13 18:32:13
Starting with query select  
em.exam_name,
dtm.no_of_days,
dbm.table_exam_year,
dbm.table_type, 
dbm.table_name,
dbm.table_exam_short_name,
dtm.tier_id as tier_id,
dtm.updated_on as updated_on,
dtm.stop_status as stop_status,
tm.tier_name as tier_name,
dtm.id as tier_master_id,
dtm.status as dtmstatus  
from exam_master em 
join sscsr_db_table_master dbm on em.exam_short_name = dbm.table_exam_short_name
join sscsr_db_table_tier_master dtm on dbm.table_name = dtm.table_name
join tier_master tm on cast(dtm.tier_id as char(255)) =  cast(tm.tier_id as char(255)) 
where dtm.stop_status = '0' AND dtm.status = '0' order by dbm.table_exam_year desc,dtm.tier_id asc 
mervinthomas-3:cron apple$ php /Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron/status_update.php
process started at 2023-02-13 23:02:55
Starting with query select  
em.exam_name,
dtm.no_of_days,
dbm.table_exam_year,
dbm.table_type, 
dbm.table_name,
dbm.table_exam_short_name,
dtm.tier_id as tier_id,
dtm.updated_on as updated_on,
dtm.stop_status as stop_status,
tm.tier_name as tier_name,
dtm.id as tier_master_id,
dtm.status as dtmstatus  
from exam_master em 
join sscsr_db_table_master dbm on em.exam_short_name = dbm.table_exam_short_name
join sscsr_db_table_tier_master dtm on dbm.table_name = dtm.table_name
join tier_master tm on cast(dtm.tier_id as char(255)) =  cast(tm.tier_id as char(255)) 
where dtm.stop_status = '0' AND dtm.status = '0' order by dbm.table_exam_year desc,dtm.tier_id asc 
mervinthomas-3:cron apple$ cd /tmp
mervinthomas-3:tmp apple$ ls
3o4LdEi7xYyngr45									com.apple.launchd.2r34KJOinT
Sublime Text.4cff18d2bab96a93366319a9e0fa060d.1f3870be274f6c49b3e31a0c6728957f.sock	com.apple.launchd.UeJYkGIMhk
anydesk											com.google.Keystone
boost_interprocess
mervinthomas-3:tmp apple$ crontab -e
crontab: installing new crontab
mervinthomas-3:tmp apple$ ls
3o4LdEi7xYyngr45									com.apple.launchd.2r34KJOinT
Sublime Text.4cff18d2bab96a93366319a9e0fa060d.1f3870be274f6c49b3e31a0c6728957f.sock	com.apple.launchd.UeJYkGIMhk
anydesk											com.google.Keystone
boost_interprocess
mervinthomas-3:tmp apple$ ls
3o4LdEi7xYyngr45									com.apple.launchd.2r34KJOinT
Sublime Text.4cff18d2bab96a93366319a9e0fa060d.1f3870be274f6c49b3e31a0c6728957f.sock	com.apple.launchd.UeJYkGIMhk
anydesk											com.google.Keystone
boost_interprocess
mervinthomas-3:tmp apple$ ls
3o4LdEi7xYyngr45									com.apple.launchd.2r34KJOinT
Sublime Text.4cff18d2bab96a93366319a9e0fa060d.1f3870be274f6c49b3e31a0c6728957f.sock	com.apple.launchd.UeJYkGIMhk
anydesk											com.google.Keystone
boost_interprocess									sscsr_status_update.log
mervinthomas-3:tmp apple$ tail sscsr_status_update.log -f
==> sscsr_status_update.log <==
from exam_master em 
join sscsr_db_table_master dbm on em.exam_short_name = dbm.table_exam_short_name
join sscsr_db_table_tier_master dtm on dbm.table_name = dtm.table_name
join tier_master tm on cast(dtm.tier_id as char(255)) =  cast(tm.tier_id as char(255)) 
where dtm.stop_status = '0' AND dtm.status = '0' order by dbm.table_exam_year desc,dtm.tier_id asc 

Fatal error: Uncaught Error: Call to a member function prepare() on null in /Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron/status_update.php:25
Stack trace:
#0 {main}
  thrown in /Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron/status_update.php on line 25
tail: -f: No such file or directory
mervinthomas-3:tmp apple$ php -v
PHP 7.4.1 (cli) (built: Dec 23 2019 10:21:57) ( NTS )
Copyright (c) The PHP Group
Zend Engine v3.4.0, Copyright (c) Zend Technologies
mervinthomas-3:tmp apple$ locate php

WARNING: The locate database (/var/db/locate.database) does not exist.
To create the database, run the following command:

  sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

Please be aware that the database can take some time to generate; once
the database has been created, this message will no longer appear.

mervinthomas-3:tmp apple$ which php
/Applications/XAMPP/bin/php
mervinthomas-3:tmp apple$ /Applications/XAMPP/bin/php -v
PHP 7.4.1 (cli) (built: Dec 23 2019 10:21:57) ( NTS )
Copyright (c) The PHP Group
Zend Engine v3.4.0, Copyright (c) Zend Technologies
mervinthomas-3:tmp apple$ crontab -e
crontab: installing new crontab
mervinthomas-3:tmp apple$ sudo crontab -e
Password:
crontab: no crontab for root - using an empty one
crontab: no changes made to crontab
mervinthomas-3:tmp apple$ crontab -l
#0 0 * * * php /Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron/status_update.php >> /tmp/sscsr_status_update.log
*/2 * * * * /Applications/XAMPP/bin/php /Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron/status_update.php >> /tmp/sscsr_status_update.log
mervinthomas-3:tmp apple$ sudo crontab -e
crontab: no crontab for root - using an empty one
crontab: installing new crontab
mervinthomas-3:tmp apple$ crontab -e
crontab: installing new crontab
mervinthomas-3:tmp apple$ sudo su
sh-3.2# crontab -l
#0 0 * * * php /Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron/status_update.php >> /tmp/sscsr_status_update.log
*/2 * * * * /Applications/XAMPP/bin/php /Applications/XAMPP/xamppfiles/htdocs/projects/sscsr/dataentry/cron/status_update.php >> /tmp/sscsr_status_update.log
sh-3.2# 

