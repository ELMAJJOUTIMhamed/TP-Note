<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>eBanque - Client List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .navbar {
            background-color: #3498db;
            color: #fff;
            text-align: center;
            padding: 10px;
        }

        h2 {
            color: #333;
            margin-top: 20px;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            margin-bottom: 10px;
            padding: 10px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .client-link {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }

        .details {
            display: none;
            margin-top: 10px;
            padding: 10px;
            background-color: #ecf0f1;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<div class="navbar">
    <h1>eBanque - Clients Details</h1>
</div>

<h2>Client List</h2>

<?php 
require_once('Clients.php');
require_once('DO.php');

// Appeler la fonction pour récupérer la liste des utilisateurs
$listeClients = recupererListeUtilisateurs();

// Vérifier si la liste n'est pas vide
if (!empty($listeClients)): ?>
    <ul>
        <?php foreach ($listeClients as $client): ?>
            <li>
                <a href="#" class="client-link" data-id="<?php echo $client->id_client; ?>">
                    <?php echo $client->prenom . " " . $client->nom; ?>
                </a>
                <div class="details" id="details-<?php echo $client->id_client; ?>">
                    <p><strong>ID:</strong> <?php echo $client->id_client; ?></p>
                    <p><strong>Phone:</strong> <?php echo $client->tel; ?></p>
                    <p><strong>Email:</strong> <?php echo $client->adresse_email; ?></p>
                </div>
            </li>
        <?php endforeach; ?>
    </ul>
<?php else: ?>
    <p>Aucun client trouvé.</p>
<?php endif; ?>

<script>
    // Ajouter un gestionnaire d'événements de clic sur chaque lien client
    document.querySelectorAll('.client-link').forEach(function(link) {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            var clientId = this.getAttribute('data-id');
            var detailsDiv = document.getElementById('details-' + clientId);
            
            // Masquer tous les détails
            document.querySelectorAll('.details').forEach(function(details) {
                details.style.display = 'none';
            });

            // Afficher les détails du client actuel
            detailsDiv.style.display = 'block';
        });
    });
</script>

</body>
</html>

