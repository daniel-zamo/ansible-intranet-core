<?php
// Ya no hay secretos aquí. Leemos del entorno del contenedor.
// Si no existen (por error), usamos valores vacíos o lanzamos error.
$servername = getenv('DB_HOST') ?: 'localhost'; 
$username = getenv('DB_USER');
$password = getenv('DB_PASSWORD');
$dbname = getenv('DB_NAME');

// Validación básica de entorno
if (!$username || !$password) {
    die("❌ Error de Configuración: No se encontraron variables de entorno para la DB.");
}

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("❌ Fallo de conexión: " . $conn->connect_error);
}
echo "✅ Conectado exitosamente a la base de datos '$dbname' en '$servername'.";
?>
