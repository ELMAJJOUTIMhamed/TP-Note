<!DOCTYPE html>
<html>
<head>
    <title>Client List</title>
    <style>
        .details {
            display: none;
        }
    </style>
</head>
<body>

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
