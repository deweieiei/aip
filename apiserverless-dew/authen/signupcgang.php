<?php
 include 'classconectdatabase.php';
 $chang_username = $_POST['username'];
 $chang_firstname = $_POST['firstname'];
 $chang_iduser = $_POST['iduser'];
 $chang_birthday = $_POST['birthday'];
 $chang_tradesman = $_POST['tradesman'];
 $chang_province = $_POST['province'];

  

 $response = $connect->query(" INSERT INTO datachang (username, lastname, iduser, birthday, tradesman, province) 
 VALUES  ('".$chang_username."','".$chang_firstname."','".$chang_iduser."','".$chang_birthday."','".$chang_tradesman."','".$chang_province."')");


?>