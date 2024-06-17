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

$animal = $_GET["animal_id"];


$stmt = $conn->prepare("SELECT a.common_name, a.scientific_name, a.thumbnail, c.class_name, ao.order_name, f.family_name, g.genus_name 
FROM animals AS a 
INNER JOIN class AS c ON a.class_id = c.class_id
INNER JOIN animal_order AS ao ON a.order_id = ao.order_id
INNER JOIN family f ON a.family_id = f.family_id
INNER JOIN genus AS g ON a.genus_id = g.genus_id
WHERE animal_id = ? ");
$stmt->bind_param("s", $animal);

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


echo json_encode($data[0]);
$conn->close();

// Close the database connection

?>
