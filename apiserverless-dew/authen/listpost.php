<?php
include 'classconectdatabase.php';
 
$sql = "SELECT * FROM postdb ";
 $result = $connect->query($sql);

 if($result->num_rows > 0 ){
    while ($row = mysqli_fetch_array($result)){
   
   $json = array("status" => "Ok", "item" => $row, );
      echo json_encode($json);
  }
  }else{
      $json = array("status" => "nodata",);
      echo json_encode($json);
  }

?>