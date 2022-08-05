<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");    
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
      include 'classconectdatabase.php';
      $user_username = $_POST['username'];
      $user_password_in = $_POST['password'];
      
      $salt = 'fluttercerateproject';
      $user_password = hash_hmac ('md5',$user_password_in,$salt);


      $sql = "SELECT * FROM datauser WHERE username ='".$user_username."' AND password = '".$user_password."'";
      $result = $connect->query($sql);

     if($result->num_rows > 0 ){
      while ($row = mysqli_fetch_array($result)){
       session_start();
    //    $_SESSION['NameUsre'] = "$user_username";
    //    $_SESSION['password'] = "$user_password_in";
       
        $json = array("status" => "get successfull", "message" => "successfull" ,"item" => $row, );
        
        echo json_encode($json);
       
         
    }
    }else{
        $json = array("status" => "unsuccessful", "message" => "data notfound");
        echo json_encode($json);
    }
?>
