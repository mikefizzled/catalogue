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

// working on the assumption that entries are only added to the database when they will be used
// alternate solution could include select distinct and joining the photos table

$sql = 'SELECT location_id, location_name, latitude, longitude, area_caption, image FROM locations';

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