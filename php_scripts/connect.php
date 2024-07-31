<?php
$servername ="fdb1030.awardspace.net";
$username = "4510976_cryptozein";
$password = "7-{XNiJY3hHge5ew";
$dbname = "4510976_cryptozein";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>