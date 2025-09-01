<?php
session_start(); 

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
require "conexion.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email = trim($_POST["email"]);
    $password = trim($_POST["password"]);

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode(["status" => "error", "msg" => "Correo inválido."]);
        exit;
    }

    if (strlen($password) < 8) {
        echo json_encode(["status" => "error", "msg" => "La contraseña debe tener al menos 8 caracteres."]);
        exit;
    }

    $hashPassword = password_hash($password, PASSWORD_DEFAULT);

    try {
        $stmt = $pdo->prepare("INSERT INTO usuarios (correo, contrasena) VALUES (:email, :password)");
        $stmt->execute(["email" => $email, "password" => $hashPassword]);

        $_SESSION['user_id'] = $pdo->lastInsertId();
        // -------------------------

        echo json_encode(["status" => "ok", "msg" => "Registro exitoso."]);
    } catch (PDOException $e) {
        if ($e->getCode() == 23000) { 
            echo json_encode(["status" => "error", "msg" => "El correo ya está registrado."]);
        } else {
            echo json_encode(["status" => "error", "msg" => "Error en el registro."]);
        }
    }
}
?>