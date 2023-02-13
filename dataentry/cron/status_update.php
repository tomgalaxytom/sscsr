<?php
include __DIR__ . '/db.php';
date_default_timezone_set("Asia/Calcutta"); 
$query =  "select  
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
where dtm.stop_status = '0' AND dtm.status = '0' order by dbm.table_exam_year desc,dtm.tier_id asc ";

echo "process started at " . date("Y-m-d H:i:s") . "\n";
echo "Starting with query " . $query . "\n";
$result = $pdo->prepare($query);
    $result->execute();
    // echo '<pre>';
   $records = $result->fetchAll();
    foreach( $records as $record ){
        $sqlExamDate = "SELECT date1::date - INTEGER '$record->no_of_days' as statusupdateddate FROM $record->table_name where tier_id = '$record->tier_id' and date1::date > now() order by id asc limit 1";
       // echo $sqlExamDate;
        $resultExamDate =  $pdo->prepare($sqlExamDate);
        $resultExamDate->execute();
        $recordDate = $resultExamDate->fetch();
        // print_r( $recordDate);
        echo "\n";
        if( date("Y-m-d") == $recordDate->statusupdateddate ){
            // write your logic to update the status
            echo "Updating the status of sscsr_db_table_tier_master#$record->tier_master_id\n";
            $updateQuery = "UPDATE public.sscsr_db_table_tier_master SET  status='1', updated_on = NOW() WHERE id='$record->tier_master_id'";
            $stmt = $pdo->prepare($updateQuery);
			$stmt->execute();
        }
        
    }

?>