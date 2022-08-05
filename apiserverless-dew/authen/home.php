<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");    
header("Access-Control-Allow-Headers: Access-Control-Allow-Origin, Accept");
      include 'classconectdatabase.php';
        $sql = "SELECT * FROM post";
        $result = $connect->query($sql);
        if($result->num_rows > 0 ){
          while ($row = mysqli_fetch_array($result)){
            $json = array($row);
            echo json_encode($json);
        }
        }else{
            echo"ไม่ได้";
        }
    ?>
