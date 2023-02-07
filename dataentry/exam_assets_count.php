<?php
require_once ("functions.php");
require_once ("config/db.php");
if( isset( $_SERVER['HTTP_X_REQUESTED_WITH'] ) && ( $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest' ) )
{

$year = $_POST['year'];


$results = getKyasAllTableCountByYear($year);
echo json_encode($results);
}
else{
    header("Location: index.php"); 
	exit();
}

