<?php

#Les informations de connexion:
$servername = "localhost";
$username = "root";
$password = "123";


//Connexion à la base de données:
try {
  $cnx = new PDO("mysql:host=$servername;dbname=Banque", $username, $password);
  $cnx->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  echo "Connected successfully !!";

} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}
?>
