<?php
require_once('Connexion BDD.php');

# Récupération des données
function recupererListeUtilisateurs() {
    global $cnx; // Utilisation de la connexion à la base de données définie dans Connexion BDD.php

    // Vérification de la connexion à la base de données
    if ($cnx) {
        $res = $cnx->query("SELECT id_client, nom, prenom, tel, adresse_email FROM Clients");

        $i = 0;
        $Clients = [];

        // Utilisation d'une boucle foreach pour parcourir les résultats
        foreach ($res as $row) {
            $util = new Clients();
            $util->id_client = $row['id_client'];
            $util->nom = $row['nom'];
            $util->prenom = $row['prenom'];
            $util->tel = $row['tel'];
            $util->adresse_email = $row['adresse_email'];
            $Clients[$i] = $util;
            $i++;
        }

        return $Clients;
    } 
    else {
        echo "Erreur de connexion à la base de données.";
        return null;
    }
}
?>
