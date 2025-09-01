<?php
session_start();
require "conexion.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $correo = trim($_POST['email']);
    $contrasena = trim($_POST['password']);

    $sql = "SELECT * FROM usuarios WHERE correo=? AND contrasena=?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $correo, $contrasena);
    $stmt->execute();
    $resultado = $stmt->get_result();

    if ($resultado->num_rows === 1) {
        $_SESSION['usuario'] = $correo;

        header("Location: indexAcademia.html");
        exit();
    } else {
        echo "<script>alert('Correo o contraseña incorrectos'); window.location.href='login.html';</script>";
    }

    $stmt->close();
}
$conn->close();
?>
