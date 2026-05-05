-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 05, 2026 alle 10:23
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cortinovis_gym`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi`
--

CREATE TABLE `corsi` (
  `id_corso` int(11) NOT NULL,
  `nome_corso` varchar(100) NOT NULL,
  `livello_difficolta` enum('Principiante','Intermedio','Avanzato') DEFAULT NULL,
  `durata_minuti` int(11) DEFAULT 60,
  `id_istruttore` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `corsi`
--

INSERT INTO `corsi` (`id_corso`, `nome_corso`, `livello_difficolta`, `durata_minuti`, `id_istruttore`) VALUES
(1, 'Power Lifting', 'Avanzato', 90, 1),
(2, 'Hatha Yoga', 'Principiante', 60, 2),
(3, 'WOD Intensity', 'Avanzato', 45, 3),
(4, 'Zumba Dance', 'Intermedio', 50, 4),
(5, 'Corso Nuoto Adulti', 'Intermedio', 60, 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `iscrizioni_corsi`
--

CREATE TABLE `iscrizioni_corsi` (
  `id_iscrizione` int(11) NOT NULL,
  `id_corso` int(11) DEFAULT NULL,
  `id_membro` int(11) DEFAULT NULL,
  `data_iscrizione` date NOT NULL,
  `orario_preferito` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `iscrizioni_corsi`
--

INSERT INTO `iscrizioni_corsi` (`id_iscrizione`, `id_corso`, `id_membro`, `data_iscrizione`, `orario_preferito`) VALUES
(1, 1, 1, '2024-01-10', '18:30:00'),
(2, 2, 2, '2024-01-11', '10:00:00'),
(3, 3, 3, '2024-01-12', '19:00:00'),
(4, 4, 4, '2024-01-15', '17:30:00'),
(5, 5, 5, '2024-01-20', '08:00:00'),
(6, 1, 5, '2024-01-21', '18:30:00'),
(7, 2, 4, '2024-01-22', '09:00:00'),
(8, 3, 1, '2024-01-23', '19:00:00'),
(9, 5, 2, '2024-01-24', '07:30:00'),
(10, 4, 3, '2024-01-25', '17:30:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `istruttori`
--

CREATE TABLE `istruttori` (
  `id_istruttore` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `specializzazione` varchar(100) DEFAULT NULL,
  `certificazione` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `istruttori`
--

INSERT INTO `istruttori` (`id_istruttore`, `nome`, `cognome`, `specializzazione`, `certificazione`) VALUES
(1, 'Alessandro', 'Ferri', 'Bodybuilding', 'IFBB Pro'),
(2, 'Sara', 'Lombardi', 'Yoga e Pilates', 'RYT 500'),
(3, 'Roberto', 'Santi', 'Crossfit', 'L-2 Trainer'),
(4, 'Valentina', 'Rinaldi', 'Zumba e Cardio', 'ZIN Official'),
(5, 'Fabio', 'Mancini', 'Nuoto e Triathlon', 'FIN Secondo Livello');

-- --------------------------------------------------------

--
-- Struttura della tabella `membri`
--

CREATE TABLE `membri` (
  `id_membro` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `data_nascita` date DEFAULT NULL,
  `tipo_abbonamento` varchar(50) DEFAULT NULL,
  `stato_pagamento` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `membri`
--

INSERT INTO `membri` (`id_membro`, `nome`, `cognome`, `data_nascita`, `tipo_abbonamento`, `stato_pagamento`) VALUES
(1, 'Giorgio', 'Moretti', '1995-04-12', 'Annuale', 1),
(2, 'Alice', 'Donati', '1990-08-25', 'Mensile', 1),
(3, 'Stefano', 'Ricci', '1988-12-02', 'Trimestrale', 0),
(4, 'Lucia', 'Parodi', '2001-01-30', 'Mensile', 1),
(5, 'Davide', 'Galli', '1993-06-15', 'Annuale', 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `corsi`
--
ALTER TABLE `corsi`
  ADD PRIMARY KEY (`id_corso`),
  ADD KEY `id_istruttore` (`id_istruttore`);

--
-- Indici per le tabelle `iscrizioni_corsi`
--
ALTER TABLE `iscrizioni_corsi`
  ADD PRIMARY KEY (`id_iscrizione`),
  ADD KEY `id_corso` (`id_corso`),
  ADD KEY `id_membro` (`id_membro`);

--
-- Indici per le tabelle `istruttori`
--
ALTER TABLE `istruttori`
  ADD PRIMARY KEY (`id_istruttore`);

--
-- Indici per le tabelle `membri`
--
ALTER TABLE `membri`
  ADD PRIMARY KEY (`id_membro`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `corsi`
--
ALTER TABLE `corsi`
  MODIFY `id_corso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `iscrizioni_corsi`
--
ALTER TABLE `iscrizioni_corsi`
  MODIFY `id_iscrizione` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `istruttori`
--
ALTER TABLE `istruttori`
  MODIFY `id_istruttore` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `membri`
--
ALTER TABLE `membri`
  MODIFY `id_membro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `corsi`
--
ALTER TABLE `corsi`
  ADD CONSTRAINT `corsi_ibfk_1` FOREIGN KEY (`id_istruttore`) REFERENCES `istruttori` (`id_istruttore`) ON DELETE SET NULL;

--
-- Limiti per la tabella `iscrizioni_corsi`
--
ALTER TABLE `iscrizioni_corsi`
  ADD CONSTRAINT `iscrizioni_corsi_ibfk_1` FOREIGN KEY (`id_corso`) REFERENCES `corsi` (`id_corso`) ON DELETE CASCADE,
  ADD CONSTRAINT `iscrizioni_corsi_ibfk_2` FOREIGN KEY (`id_membro`) REFERENCES `membri` (`id_membro`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
