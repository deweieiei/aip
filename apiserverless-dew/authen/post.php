<?php 
 include 'classconectdatabase.php';

 $infor = $_POST['infor'];
 $time = $_POST['time'];
 $amunt = $_POST['amount'];
 $phone = $_POST['phone'];
 $line = $_POST['line'];
 $datetime = date('Y-m-d H:i:s');

 



      $post = $connect->query(" INSERT INTO postdb(infor,time,count,phone,line,datetime)
      VALUES('".$infor."','".$time."','".$amunt."','".$phone."','".$line."','".$datetime."')");
      



?>