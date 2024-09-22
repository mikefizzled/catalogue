<?php
// api/orders/get
require_once '../api/common/db.php';
require_once '../api/common/functions.php';


$order = $_GET['order'] ?? 'class.class_common_name';
$type = $_GET['type'] ?? 'default';


function defaultSql($order){
  return "SELECT DISTINCT class.class_id, class.class_common_name, class.class_name
          FROM animals
          INNER JOIN class ON animals.class_id = class.class_id
          ORDER BY $order;";
}
function all($order){
  return "SELECT *
          FROM class
          ORDER BY $order;";
}

switch($type){
  case 'crud':
    $sql = all($order);
    break;
  default:
    $sql = defaultSql($order);
    break;
}

$results = executeQuery($sql);
jsonResponse($results);

?>
