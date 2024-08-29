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


$location = $_GET["location_id"] ?? null;

//add id and make into anchor tag
$sql = "SELECT DISTINCT animals.common_name, animals.animal_id 
        FROM animal_images
        INNER JOIN animals ON animal_images.animal_id = animals.animal_id
        WHERE  animal_images.location_id = '$location'
        ORDER BY animals.common_name";

$result = $conn->query($sql);

$data = array();

if ($result) {
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $data[] = $row;
        }
    } else {
        echo json_encode(array("message" => "0 results"));
    }
} else {
    echo json_encode(array("error" => $conn->error));
}

header('Content-Type: application/json');
echo json_encode($data);

$conn->close();
?>