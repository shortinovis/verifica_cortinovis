<?php

require_once 'db.php';
require_once 'inserimento.php';
require_once 'visualizzazione.php';


if (isset($_POST['nuovo_iscritto'])) {
    ::create($conn, $_POST['t'], $_POST[''], $_POST[''], $_POST['']);
}

if (isset($_POST['visualizzare_corsi'])) {
    ::create($conn, $_POST['l'], $_POST['utente']);
}




$ = $conn->query("SELECT * FROM A");
$ = $conn->query("SELECT * FROM ");
$u = $conn->query("SELECT * FROM ");

$prestiti = null;

if (isset($_GET['utente_id'])) {
    $ = ::getByUtente($conn, $_GET['utente_id']);
}

?>