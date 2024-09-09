<?php

$host = 'localhost';
$user = 'root';
$pass = '';
$dbname = 'catalogue';

$conn = new mysqli($host, $user, $pass, $dbname);
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}

$animal = $_GET["animal_id"];

$stmt = $conn->prepare("SELECT c.description, c.filename, cl.list_name
FROM animals AS a
INNER JOIN conservation AS c ON a.conservation_id = c.id
INNER JOIN conservation_list AS cl ON c.list_id = cl.list_id
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
    $data[] = array("error" => "No results found");
}


echo json_encode($data[0]);
$conn->close();
?>
