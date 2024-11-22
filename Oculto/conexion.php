<?php

$host_name = "sql205.infinityfree.com";
$username = "if0_37758289";
$password = "yHtrfdHJn1HlDU";
$db_name = "if0_37758289_resenas_db";

$conn = new mysqli($host_name, $username, $password, $db_name);

$conn->set_charset("utf8mb4");

if ($conn->connect_error){
    die("Conexion fallida: " . $conn->connect_error);

}



?>