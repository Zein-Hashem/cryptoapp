<?php
include 'connect.php';
$jsonData = file_get_contents('php://input');
$data = json_decode($jsonData, true);
if ($data !== null) {
    $username =  mysqli_real_escape_string($conn,$data['usr']);
    $email = mysqli_real_escape_string($conn,$data['email']);
    $pass = mysqli_real_escape_string($conn, md5($data['pass']));


$sql = mysqli_query($conn,"INSERT INTO `users` (`username`, `email`, `password`) VALUES ('$username', '$email', '$pass')");
 if($sql){
    echo "Registration was Successfull";
 }else{
    echo "Registartion failed";
 }
}else {
    http_response_code(400);
    echo "Invalid JSON data";
}
?>