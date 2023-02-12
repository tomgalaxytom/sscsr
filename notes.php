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
