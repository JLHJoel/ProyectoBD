<?php
include 'Oculto/conexion.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nombre_calificador = $_POST['nombre_calificador'];
    $id_pelicula = $_POST['id_pelicula'];
    $comentario_calif = $_POST['comentario_calif'];
    $calificacion = $_POST['calificacion'];

    $sql = "INSERT INTO calificacion (nombre_calificador, id_pelicula, comentario_calif, calificacion) 
            VALUES (?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sisi", $nombre_calificador, $id_pelicula, $comentario_calif, $calificacion);

    if ($stmt->execute()) {
        header("Location: index.php");
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>
