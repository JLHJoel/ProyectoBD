<?php
// Conexión a la base de datos
include 'Oculto/conexion.php';

// Consulta para obtener todas las películas
$sql_peliculas = "SELECT * FROM peliculas";
$result_peliculas = $conn->query($sql_peliculas);

// Consulta para obtener todas las reseñas
$sql_reseñas = "SELECT calificacion.nombre_calificador, peliculas.nombre_pelicula, calificacion.comentario_calif, calificacion.calificacion 
                FROM calificacion
                JOIN peliculas ON calificacion.id_pelicula = peliculas.id_pelicula";
$result_reseñas = $conn->query($sql_reseñas);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reseñas de Películas Populares</title>
    <link rel="stylesheet" href="CSS/styles.css">
</head>
<body>

    <div class="title-page">
        <h1>Reseñas de Películas Populares</h1>
    </div>

   
    <div class="content">
        <!-- Lista de películas -->
        <div class="left">
            <?php if ($result_peliculas->num_rows > 0): ?>
                <?php while ($pelicula = $result_peliculas->fetch_assoc()): ?>
                    <div class="movie">
                    <!-- Mostrar el icono -->
                        <div class="icon">
                            <img src="<?php echo htmlspecialchars($pelicula['icono']); ?>" alt="Ícono" class="icon-img">
                        </div>
                        <div class="movie-details">
                            <h3><?php echo htmlspecialchars($pelicula['nombre_pelicula']); ?></h3>
                            <p><strong>Duración:</strong> <?php echo htmlspecialchars($pelicula['duracion']); ?></p>
                            <p><strong>Director:</strong> <?php echo htmlspecialchars($pelicula['director_pelicula']); ?></p>
                            <p><strong>Fecha de Estreno:</strong> <?php echo htmlspecialchars($pelicula['fecha_de_estreno']); ?></p>
                            <p><strong>Sinopsis:</strong> <?php echo htmlspecialchars($pelicula['sinopsis_pelicula']); ?></p>
                        </div>
                    </div>
                <?php endwhile; ?>
            <?php else: ?>
                <p>No hay películas disponibles.</p>
            <?php endif; ?>
        </div>

        <!-- Formulario para agregar una nueva reseña -->
        <div class="right">
            <h2>Agregar Nueva Reseña</h2>
            <form action="datos_calificacion.php" method="POST">
                <label for="nombre_calificador">Ingresa tu nombre:</label>
                <input type="text" id="nombre_calificador" name="nombre_calificador" required>

                <label for="id_pelicula">Película:</label>
                <select id="id_pelicula" name="id_pelicula" required>
                <option value="" disabled selected>-Selecciona una película-</option>
                    <?php
                    $result_peliculas->data_seek(0);
                    while ($pelicula = $result_peliculas->fetch_assoc()) {
                        echo "<option value='{$pelicula['id_pelicula']}'>" . htmlspecialchars($pelicula['nombre_pelicula']) . "</option>";
                    }
                    ?>
                </select>

                <label for="comentario_calif">Comentario:</label>
                <textarea id="comentario_calif" name="comentario_calif" rows="4" required></textarea>

                <label for="calificacion">Calificación:</label>
                <select id="calificacion" name="calificacion" required>
                <option value="" disabled selected>-Selecciona una calificación-</option>
                    <?php for ($i = 1; $i <= 10; $i++): ?>
                        <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                    <?php endfor; ?>
                </select>

                <button type="submit">Publicar Reseña</button>
            </form>
        </div>
    </div>

    <!-- Reseñas realizadas -->
    <div class="reviews">
        <h2>Reseñas Realizadas</h2>
        <?php if ($result_reseñas->num_rows > 0): ?>
            <?php while ($reseña = $result_reseñas->fetch_assoc()): ?>
                <div class="review">
                    <h3><?php echo htmlspecialchars($reseña['nombre_pelicula']); ?></h3>
                    <p><strong>Calificador:</strong> <?php echo htmlspecialchars($reseña['nombre_calificador']); ?></p>
                    <p><strong>Comentario:</strong> <?php echo htmlspecialchars($reseña['comentario_calif']); ?></p>
                    <p><strong>Calificación:</strong> <?php echo htmlspecialchars($reseña['calificacion']); ?>/10</p>
                </div>
            <?php endwhile; ?>
        <?php else: ?>
            <p>No hay reseñas realizadas.</p>
        <?php endif; ?>
    </div>
</body>
</html>
