<?php
    require 'classconectdatabase.php';
    $username = $_POST['username'];
    $password = $_POST['password'];
    $salt = 'fluttercerateproject';
    $user_password = hash_hmac ('md5',$password,$salt);
    $sql = "SELECT * FROM datauser WHERE username = '".$username."' AND password = '".$user_password."' ";
    $result = mysqli_query($connect,$sql);
    $count = mysqli_num_rows($result);
    $resultt = array();
    if($count == 1){
        while($row=mysqli_fetch_assoc($result)){
            $resultt[]=$row;
        }
        echo json_encode($resultt);
    }else{
        
        echo json_encode("miss");
    }



?>