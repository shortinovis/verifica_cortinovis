<?php

try {
    $conn = new PDO("mysql:host=localhost;dbname=bcortinovis_gym", "root", "");
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    die("Connessione fallita: " . $e->getMessage());
}

?>