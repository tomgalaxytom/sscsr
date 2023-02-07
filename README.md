# sscsr
Staff Selection Commission Projects 

# Data Entry Folder Changes

# functions.php

# change  local path Variable

$GLOBALS['local_path'] 


# Site 

# functions.php

Change Variable Path

$GLOBALS['local_path'] =  $base_url ."/rd/security_audit/dataentry/ftp/";

$GLOBALS['pdf_header_image_server_path'] = $base_url ."/rd/security_audit/site/exam_assets/";

//$GLOBALS['local_path'] =  "C:\\xampp\htdocs\\rd\\\security_audit\\dataentry\\ftp//";

$GLOBALS['local_instructions_path'] = "C:\\xampp\htdocs\\rd\\\security_audit\\dataentry\\important_instructions\\";
//$GLOBALS['local_instructions_path'] = "C:\\xampp\htdocs\\rd\\\security_audit\\dataentry\\important_instructions\\";

$local_bulk_mail = "http://localhost/rd/\security_audit/dataentry/bulkemail";


# PdfHelper.php

$base_url =  "http://" . $_SERVER['SERVER_NAME'];
$local_path =  $base_url ."/rd/security_audit/site/";
$photo_path =  $local_path."exam_assets/photo_not_exists.png";

# PdfHelperDMEExam.php

$base_url =  "http://" . $_SERVER['SERVER_NAME'];
$local_path =  $base_url ."/rd/security_audit/site/";
$photo_path =  $local_path."exam_assets/photo_not_exists.png";


# PdfHelperDVExam.php

$base_url =  "http://" . $_SERVER['SERVER_NAME'];
$local_path =  $base_url ."/rd/security_audit/site/";
$photo_path =  $local_path."exam_assets/photo_not_exists.png";

# PdfHelperPETExam.php

$base_url =  "http://" . $_SERVER['SERVER_NAME'];
$local_path =  $base_url ."/rd/security_audit/site/";
$photo_path =  $local_path."exam_assets/photo_not_exists.png";


# PdfHelperSkillTestExam.php

$base_url =  "http://" . $_SERVER['SERVER_NAME'];
$local_path =  $base_url ."/rd/security_audit/site/";
$photo_path =  $local_path."exam_assets/photo_not_exists.png";


