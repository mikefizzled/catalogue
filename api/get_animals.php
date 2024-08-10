<?php
// Connect to your database (replace with your actual credentials)
$host = 'localhost';
$user = 'root';
$pass = '';
$dbname = 'catalogue';

$conn = new mysqli($host, $user, $pass, $dbname);
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}

$family = $_GET["family_id"] ?? null;
$order = $_GET["order_id"] ?? null;
$current_page = isset($_GET['page']) ? intval($_GET['page']) : 1;

$cards_per_page = 12;


if ($family) {
    // Binding to avoid potential sql injections using the GET
    $stmt = $conn->prepare("SELECT animal_id, common_name, thumbnail FROM animals WHERE family_id = ? ORDER BY common_name");
    $stmt->bind_param("s", $family);
} else if($order){
    $stmt = $conn->prepare("SELECT animal_id, common_name, thumbnail FROM animals WHERE order_id = ? ORDER BY common_name");
    $stmt->bind_param("s", $order);
} else {
    // Query to retrieve animal names and picture URLs
    $stmt = $conn->prepare("SELECT animal_id, common_name, thumbnail FROM animals ORDER BY common_name");
}
$stmt->execute();
$result = $stmt->get_result();
$data = array();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
} else {
    // Handle no results (e.g., log an error)
    // You can customize the response message here
    $data[] = array("message" => "No results found");
}

$conn->close();

echo json_encode($data);

// Close the database connection

?>
