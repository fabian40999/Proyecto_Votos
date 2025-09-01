<?php
require "conexion.php";
session_start();

if (!isset($_SESSION['user_id'])) {
    echo json_encode(["status" => "error", "msg" => "Debes iniciar sesión para votar."]);
    exit;
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $usuario_id = $_SESSION['user_id'];
    $institucion_votada = trim($_POST["institucion"]);

    $stmt = $pdo->prepare("SELECT voto_realizado FROM usuarios WHERE id = :usuario_id");
    $stmt->execute(['usuario_id' => $usuario_id]);
    $voto_realizado = $stmt->fetchColumn();

    if ($voto_realizado) {
        echo json_encode(["status" => "error", "msg" => "Ya has votado. Solo se permite un voto por usuario."]);
        exit;
    }

    $stmt = $pdo->prepare("UPDATE usuarios SET voto_realizado = 1, institucion_votada = :institucion WHERE id = :usuario_id");
    try {
        $stmt->execute(['institucion' => $institucion_votada, 'usuario_id' => $usuario_id]);

        $conteo_votos = obtenerConteoVotos($pdo);

        echo json_encode(["status" => "ok", "msg" => "¡Voto registrado con éxito!", "votos" => $conteo_votos]);
    } catch (PDOException $e) {
        echo json_encode(["status" => "error", "msg" => "Error al registrar tu voto."]);
    }
}

function obtenerConteoVotos($pdo) {
    $votos = [];
    $instituciones = ['ITCJ', 'TEC', 'URN', 'UACJ', 'UACH'];
    
    foreach ($instituciones as $inst) {
        $stmt = $pdo->prepare("SELECT COUNT(*) FROM usuarios WHERE institucion_votada = :institucion");
        $stmt->execute(['institucion' => $inst]);
        $votos[$inst] = $stmt->fetchColumn();
    }
    return $votos;
}
?>