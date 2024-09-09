<?php

$host = 'localhost';
$user = 'root';
$pass = '';
$dbname = 'catalogue';

$conn = new mysqli($host, $user, $pass, $dbname);
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}

                                    
$sql = 'SELECT DISTINCT class.class_id, class.class_common_name
FROM animals
INNER JOIN class ON animals.class_id = class.class_id
ORDER BY class.class_common_name;';
$result = $conn->query($sql);

$data = array();

if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
    $data[] = $row;
  }
} else {
  echo "0 results";
}

echo json_encode($data);

$conn->close();
?>
