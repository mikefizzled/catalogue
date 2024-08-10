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

$order = $_GET["order_id"] ?? null;
$class = $_GET["class_id"] ?? null;

if ($order) {
    $sql = "SELECT DISTINCT animal_order.order_id, animal_order.order_name
    FROM animals
    INNER JOIN animal_order ON animals.order_id = animal_order.order_id
    WHERE animals.order_id = '$order'
    ORDER BY animal_order.order_name;"; 
}
else if($class){
    $sql = "SELECT DISTINCT animal_order.order_id, animal_order.order_name
    FROM animals
    INNER JOIN animal_order ON animals.order_id = animal_order.order_id
    WHERE animals.class_id = '$class'
    ORDER BY animal_order.order_name;"; 
}
else{
$sql = 'SELECT DISTINCT animal_order.order_id, animal_order.order_name
FROM animals
INNER JOIN animal_order ON animals.order_id = animal_order.order_id
ORDER BY animal_order.order_name;';
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
