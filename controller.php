<?php

require_once 'db.php';
require_once 'inserimento.php';
require_once 'visualizzazione.php';


if (isset($_POST['nuovo_iscritto'])) {
    iscrizioni_corsi::create($conn, $_POST['id_iscrizione'], $_POST['id_corso'], $_POST['id_memebro'], $_POST['data_iscrizione'], $_POST['orario_preferito']);
}

if (isset($_POST['visualizzare_corsi'])) {
    ::create($conn, $_GET['id_corso'], $_GET['nome_corso'], $_GET['livello_difficoltà'], $_GET['durata_minuti'], $_GET['id_istruttore']);
}




$ = $conn->query("SELECT * FROM A");
$ = $conn->query("SELECT * FROM ");
$u = $conn->query("SELECT * FROM ");

$prestiti = null;

if (isset($_GET['utente_id'])) {
    $ = ::getByUtente($conn, $_GET['utente_id']);
}

?>