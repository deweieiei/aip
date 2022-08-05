<?php
        require 'classconectdatabase.php';

    

        $sql = "SELECT * FROM `datauser` ";
        $query = mysqli_query($connect,$sql);
        $result = array ();
        while($row = mysqli_fetch_assoc($query)){
            $result[] = $row;
        }
        echo json_encode($result);
        
?>