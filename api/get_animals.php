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

// Query to retrieve animal names and picture URLs
$sql = 'SELECT animal_id, common_name, thumbnail FROM animals ORDER BY common_name';
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
/*
// Display animals in Bootstrap divs
echo '<div class="container">';
while ($row = $result->fetch_assoc()) {
    echo '<div class="animal-card d-flex">';
    echo '<h3>' . $row['common_name'] . '</h3>';
    echo '<img class="img-fluid thumbnail" src="thumbnails/' . $row['thumbnail'] . '" alt="' . $row['common_name'] . '">';
    echo '</div>';
}
echo '</div>';
*/
// Close the database connection
$conn->close();
?>
