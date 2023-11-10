<?php
$servername = "localhost";
$username = "root";
$password = "123";
$dbname = "Banque";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Fetch all clients
    $stmt = $conn->query("SELECT * FROM Clients");
    $clients = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Fetch client details by ID
    if (isset($_GET['id_client'])) {
        $id_client = $_GET['id_client'];
        $stmt = $conn->prepare("SELECT * FROM Clients WHERE id_client = ?");
        $stmt->execute([$id_client]);
        $client_details = $stmt->fetch(PDO::FETCH_ASSOC);
    }
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Client List</title>
</head>
<body>

<h2>Client List</h2>
<ul>
    <?php foreach ($clients as $client): ?>
        <li><a href="?id_client=<?php echo $client['id_client']; ?>"><?php echo $client['prenom'] . " " . $client['nom']; ?></a></li>
    <?php endforeach; ?>
</ul>

<?php if (isset($client_details)): ?>
    <h2>Client Details</h2>
    <p><strong>ID:</strong> <?php echo $client_details['id_client']; ?></p>
    <p><strong>Name:</strong> <?php echo $client_details['prenom'] . " " . $client_details['nom_client']; ?></p>
    <p><strong>Date of Birth:</strong> <?php echo $client_details['nom']; ?></p>
    <p><strong>Address:</strong> <?php echo $client_details['tel']; ?></p>
    <p><strong>Email:</strong> <?php echo $client_details['adresse_email']; ?></p>
<?php endif; ?>

</body>
</html>










