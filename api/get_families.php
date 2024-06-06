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

                                    
$sql = 'SELECT DISTINCT family.family_id, family.family_name, family.common_name
FROM animals
INNER JOIN family ON animals.family_id = family.family_id
ORDER BY family.family_name;';
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
