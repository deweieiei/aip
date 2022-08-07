<?php
 include 'classconectdatabase.php';
 $user_id = $_POST['id'];
//  $user_id = '14';


 $sql = "SELECT * FROM datauser WHERE id = '$user_id'";
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


//   $sql = "SELECT * FROM postdb WHERE id = '$user_id'";
//  $result = $connect->query($sql);

//  if($result->num_rows > 0 ){
//     while ($row = mysqli_fetch_array($result)){
   
//    $json = array("status" => "Ok", "item" => $row, );
//       echo json_encode($json);
//   }
//   }else{
//       $json = array("status" => "nodata",);
//       echo json_encode($json);
//   }
?>