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

if ($family) {
    $sql = "SELECT DISTINCT genus.genus_id, genus.genus_name
    FROM animals
    INNER JOIN genus ON animals.genus_id = genus.genus_id
    WHERE animals.family_id = '$family'
    ORDER BY genus.genus_name;"; 
}
else{
    $sql = "SELECT genus.genus_id, genus.genus_name
    FROM animals
    INNER JOIN genus ON animals.genus_id = genus.genus_id
    ORDER BY genus.genus_name;"; 
}


$result = $conn->query($sql);

$data = array();

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    $data[] = $row;
  }
} else {
  echo "0 results";
}

echo json_encode($data);

// Close the database connection
$conn->close();
?>
