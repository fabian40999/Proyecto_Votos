<?php
$host = "localhost";
$db = "academia_stem";
$user = "root";
$pass = "";
$charset = "utf8";

try {
    $pdo = new PDO(
        "mysql:host=$host;dbname=$db;charset=$charset",
        $user,
        $pass
    );
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
} catch (PDOException $e) {
    die("❌ Error de conexión: " . $e->getMessage());
}
?>