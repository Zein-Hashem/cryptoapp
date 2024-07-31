<?php 
    include 'connect.php';
    $jsonData = file_get_contents('php://input');
    $data = json_decode($jsonData, true);
    if($data !== null){
        $email = mysqli_real_escape_string($conn, $data['email']);
        $password = mysqli_real_escape_string($conn, md5($data['pass']));
        $sql2 = mysqli_query($conn, "SELECT * FROM `users` WHERE email = '$email' AND `password` = '$password'");
        if(mysqli_num_rows($sql2)>0){
            $emparray = array();
            while($row = mysqli_fetch_assoc($sql2))
                $emparray[] = $row;
         
           echo(json_encode($emparray));
           mysqli_free_result($sql2);
           mysqli_close($conn);
        }

    }else{
        http_response_code(400);
        echo "Invalid JSON data";
    }
?>
