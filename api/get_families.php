<?php
// api/orders/get
require_once '../api/common/db.php';
require_once '../api/common/functions.php';

$order_id = $_GET["order_id"] ?? null;
$class_id = $_GET["class_id"] ?? null;
$type = $_GET["type"] ?? 'default';
$sort_by = $_GET["sort_by"] ?? 'family.family_name';
$order = $_GET["order"] ?? 'asc';

/*
if ($class) {
    $sql = "SELECT DISTINCT family.family_id, family.family_name, family.common_name
    FROM animals
    INNER JOIN family ON animals.family_id = family.family_id
    WHERE animals.class_id = '$class'
    ORDER BY family.family_name;"; 
}
else if($order){
  $sql = "SELECT DISTINCT family.family_id, family.family_name, family.common_name
  FROM animals
  INNER JOIN family ON animals.family_id = family.family_id
  WHERE animals.order_id = '$order'
  ORDER BY family.family_name;"; 
}
else{
  $sql = 'SELECT DISTINCT family.family_id, family.family_name, family.common_name
  FROM animals
  INNER JOIN family ON animals.family_id = family.family_id
  ORDER BY family.family_name;';
}*/

function getCrudSql($sort_by, $order) {
  return "SELECT family.family_id, family.family_name, family.common_name, animal_order.order_name
          FROM family
          INNER JOIN animal_order ON animal_order.order_id = family.order_id
          ORDER BY $sort_by $order;";
}

function getFamiliesByOrder($order_id, $sort_by, $order) {
  return "SELECT DISTINCT animal_order.order_id, animal_order.order_name
          FROM animals
          INNER JOIN animal_order ON animals.order_id = animal_order.order_id
          WHERE animals.class_id = '$order_id'
          ORDER BY $sort_by $order;";
}
function getFamiliesByClass($class_id, $sort_by, $order) {
  return "SELECT DISTINCT animal_order.order_id, animal_order.order_name
          FROM animals
          INNER JOIN animal_order ON animals.order_id = animal_order.order_id
          WHERE animals.class_id = '$class_id'
          ORDER BY $sort_by $order;";
}

function getDefaultSql($sort_by, $order) {
  return "SELECT DISTINCT family.family_id, family.family_name, family.common_name
          FROM animals
          INNER JOIN family ON animals.family_id = family.family_id
          ORDER BY $sort_by $order;";
}


switch ($type) {
  case 'crud':
      $sql = getCrudSql($sort_by, $order);
      break;
  case 'order':
      $sql = getFamiliesByOrder($order_id, $sort_by, $order);
      break;
  case 'class':
      $sql = getFamiliesByClass($class_id, $sort_by, $order);
      break;
  default:
      $sql = getDefaultSql($sort_by, $order);
      break;
}

$results = executeQuery($sql);
jsonResponse($results);
?>
