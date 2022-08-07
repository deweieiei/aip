<?php
        include 'classconectdatabase.php';
        $user_id = $_POST['id'];
        $user_line = $_POST['line'];
        $user_numphon = $_POST['numphon'];
        $user_facebook = $_POST['facebook'];
        $user_address = $_POST['address'];

        // $user_id = '21';
        // $user_line = '1234';
        // $user_numphon =  '999999';
        // $user_facebook = '8888888';
        // $user_address = 'address';

        $response = $connect->query("UPDATE `datauser` SET `line` = '$user_line', `numphon` = '$user_numphon', 
        `facebook` = '$user_facebook', `address` = '$user_address' WHERE `datauser`.`id` = '$user_id';");
        if($response){
            $json = array("status" => "ok","item" => $row,);
            echo json_encode($json);
            }else{
            $json = array("status" => "unsuccessful",);
             echo json_encode($json);
          }

?>