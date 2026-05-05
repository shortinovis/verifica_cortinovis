<?php require_once 'controller.php'; ?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>palestra cortinovis</title>
</head>
<body>

    <h1>palestra cortinovis</h1>

    <h2>Inserisci iscritto</h2>
    <form method="POST">
        id_membro: <input type="text" name="id" required><br><br>
        nome: <input type="text" name="nome" required><br><br>
        cognome: <input type="text" name="cognome" required><br><br>
        data_nascita: <input type="date" name="nascita" required><br><br>
        tipo_abbonamento: <input type="text" name="abbonamento" required><br><br>
        stato_pagamento: <input type="number" name="status" required><br><br>

        Istruttore:
        <select name="istruttore">
            <?php foreach($istruttori as $a) { ?>
                <option value="<?php echo $a['i']; ?>">
                    <?php echo $a['nome'] . " " . $a['cognome']; ?>
                </option>
            <?php } ?>
        </select><br><br>

        <button type="submit" name="nuovo_iscritto">Aggiungi</button>
    </form>

    <hr>

    
    <h2>Visualizza corsi</h2>
    <form method="GET">
        <select name="istruttore">
            <?php foreach($istruttori as $u) { ?>
                if($u)
                <option value="<?php echo $u['id_utente']; ?>">
                    <?php echo $u['nome'] . " " . $u['cognome']; ?>
                </option>
            <?php } ?>
        </select>

        <button type="submit">Visualizza</button>
    </form>

    <br><br>

    <?php if($prestiti != null) { ?>
        <table border="1">
            <tr>
                <th>Libro</th>
                <th>Stato</th>
                <th>Azione</th>
            </tr>

            <?php foreach($prestiti as $p) { ?>
                <tr>
                    <td><?php echo $p['titolo']; ?></td>
                    <td><?php echo $p['restituito'] ? "Restituito" : "In prestito"; ?></td>
                    <td>
                        <?php if(!$p['restituito']) { ?>
                            <a href="?utente_id=<?php echo $_GET['utente_id']; ?>&restituisci=<?php echo $p['id_prestito']; ?>">
                                Restituisci
                            </a>
                        <?php } ?>
                    </td>
                </tr>
            <?php } ?>
        </table>
    <?php } ?>

</body>
</html>