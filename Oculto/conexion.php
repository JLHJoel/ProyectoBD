<?php

$host_name = "localhost"; //Aqui agrega el hostname de infinityfree
$username = "root";   //el username de la DB de infinityfree
$password = "1234"; //el password de la DB de infinityfree
$db_name = "resenas_db"; //el nombre de la BD de infinityfree

$conn = new mysqli($host_name, $username, $password, $db_name);

$conn->set_charset("utf8mb4");

if ($conn->connect_error){
    die("Conexion fallida: " . $conn->connect_error);

}



?>