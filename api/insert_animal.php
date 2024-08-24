<?php

$host = 'localhost';
$user = 'root';
$pass = '';
$dbname = 'catalogue';

$conn = new mysqli($host, $user, $pass, $dbname);
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $common_name = $_POST['common_name'];
    $scientific_name = $_POST['scientific_name'];
    $class_id = $_POST['class_id'];
    $order_id = $_POST['order_id'];
    $family_id = $_POST['family_id'];
    $genus_id = $_POST['genus_id'];
    $thumbnail = $_POST['thumbnail'];

    $sql = "INSERT INTO animals (common_name, scientific_name, class_id, order_id, family_id, genus_id, thumbnail) 
            VALUES ('$common_name', '$scientific_name', '$class_id', '$order_id', '$family_id', '$genus_id', '$thumbnail')";
            
    if ($conn->query($sql) === TRUE) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'error' => $conn->error]);
    }

    $conn->close();

}
?>