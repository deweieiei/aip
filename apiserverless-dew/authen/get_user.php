<?php
        require 'classconectdatabase.php';

        $id = $_GET['id'];

        $sql = "SELECT * FROM `datauser` WHERE id = '$id'";
        $query = mysqli_query($connect,$sql);
        $result = array ();
        while($row = mysqli_fetch_assoc($query)){
            $result[] = $row;
        }
        echo json_encode($result);
        
?>