<?php
// api/class/update_class.php

require_once $_SERVER['DOCUMENT_ROOT'].'/catalogue/api/common/db.php';
require_once $_SERVER['DOCUMENT_ROOT'].'/catalogue/api/common/functions.php';

$common = $_POST["class-name"] ?? null;
$scientific = $_POST["scientific-name"] ?? null;

try {
    $sql = "INSERT INTO class (class_common_name, class_name) VALUES (?, ?)";
    executeQuery($sql, [$common, $scientific]);
    jsonResponse(['status' => 'success', 'message' => 'Record inserted successfully']);
} catch (PDOException $e) {
    if ($e->getCode() == 23000) { // Integrity constraint violation
        jsonResponse(['status' => 'error', 'message' => 'Record already exists']);
    } else {
        throw $e; // Re-throw the exception if it's not a duplicate error
    }
}
?>
