<?php
header('Content-Type: text/html; charset=UTF-8');
       $connect = new mysqli("localhost","root","","data"); 

       
       if(!$connect){
              echo "noooooooo";
       }
?>
