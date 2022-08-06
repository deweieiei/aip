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

 
      
$sql = "SELECT * FROM  postdb ";
$result = $connect->query($sql);


if($result->num_rows > 0 ){
while ($row = mysqli_fetch_array($result)){


 
  $json = array("item" => $row, );
  
  echo json_encode($json);

}
}
?>