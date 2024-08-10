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


$stmt = $conn->prepare("SELECT ai.filename, ai.caption, l.location_name, l.location_city, ai.date_taken, a.common_name
FROM animal_images AS ai 
INNER JOIN animals AS a ON ai.animal_id = a.animal_id
INNER JOIN locations AS l on ai.location_id = l.location_id
WHERE ai.animal_id = ? ");
$stmt->bind_param("i", $animal);

$stmt->execute();
$result = $stmt->get_result();
$data = array();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
  } else {
    echo "0 results";
  }


echo json_encode($data);
$conn->close();

// Close the database connection

?>
