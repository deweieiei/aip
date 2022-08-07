<?php
header('Content-Type: text/html; charset=UTF-8');
       $connect = new mysqli("localhost","root","","data"); 
       $connect->set_charset("utf8mb4");
       $connect->character_set_name();

       
       if(!$connect){
              echo "noooooooo";
       }
?>
