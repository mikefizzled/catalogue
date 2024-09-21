<?php
// api/orders/get
require_once '../api/common/db.php';
require_once '../api/common/functions.php';

$type = $_GET["type"] ?? 'default';
$id = $_GET["id"] ?? null;
$sort_by = $_GET["sort_by"] ?? 'genus_name';
$order = $_GET["order"] ?? 'asc';

function getFamilySql($family, $sort_by, $order){
  return "SELECT DISTINCT genus.genus_id, genus.genus_name
          FROM animals
          INNER JOIN genus ON animals.genus_id = genus.genus_id
          WHERE animals.family_id = '$family'
          ORDER BY $sort_by $order;";
}

function getCrudSql($sort_by, $order){
  return "SELECT genus.genus_id, genus.genus_name, family.family_name
          FROM genus
          INNER JOIN family ON genus.family_id = family.family_id
          ORDER BY $sort_by $order;";
}


switch ($type) {
  case 'crud':
      $sql = getCrudSql($sort_by, $order);
      break;
  case 'family':
      $sql = getFamilySql($id, $sort_by, $order);
      break;
  default:
      $sql = getDefaultSql($sort_by, $order);
      break;
}

$results = executeQuery($sql);
jsonResponse($results);

?>
