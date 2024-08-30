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
$class = $_GET["class_id"] ?? null;
$family = $_GET["family_id"] ?? null;
$order = $_GET["order_id"] ?? null;
$current_page = isset($_GET['page']) ? intval($_GET['page']) : 1;

$cards_per_page = 12;

$query = "SELECT animal_id, common_name, thumbnail FROM animals";
$params = [];
$types = "";

// Associative array to store conditions
$conditions = [];

// 0 is value for 'all' therefore will not be added to check
if ($family) {
    $conditions['family_id'] = $family;
    $types .= "s";
}
if ($order) {
    $conditions['order_id'] = $order;
    $types .= "s";
}
if ($class) {
    $conditions['class_id'] = $class;
    $types .= "s";
}

// Append conditions to the query
if (!empty($conditions)) {
    $query .= " WHERE " . implode(" AND ", array_map(function($key) {
        return "$key = ?";
    }, array_keys($conditions)));
}
// Append order by to maintain the required SQL ordering
$query .= " ORDER BY common_name";

$stmt = $conn->prepare($query);
if (!empty($conditions)) {
    $stmt->bind_param($types, ...array_values($conditions));
}

if ($stmt->execute()) {
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $data = $result->fetch_all(MYSQLI_ASSOC);
    } else {
        $data = array("message" => "No results found");
    }
} else {
    $data = array("message" => "Query execution failed: " . $stmt->error);
}

$stmt->close();
$conn->close();

echo json_encode($data);
?>
