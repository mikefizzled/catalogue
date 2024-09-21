<?php
// api/orders/get
require_once '../api/common/db.php';
require_once '../api/common/functions.php';

$type = $_GET["type"] ?? 'default';
$id = $_GET["id"] ?? null;
$sort_by = $_GET["sort_by"] ?? 'order_name';
$order = $_GET["order"] ?? 'asc';

function getCrudSql($sort_by, $order) {
    return "SELECT a.order_id, a.order_name, c.class_common_name
            FROM animal_order AS a
            INNER JOIN class AS c ON a.class_id = c.class_id
            ORDER BY $sort_by $order;";
}

function getOrderSql($order_id, $sort_by, $order) {
    return "SELECT DISTINCT animal_order.order_id, animal_order.order_name
            FROM animals
            INNER JOIN animal_order ON animals.order_id = animal_order.order_id
            WHERE animals.order_id = '$order_id'
            ORDER BY $sort_by $order;";
}

function getClassSql($class_id, $sort_by, $order) {
    return "SELECT DISTINCT animal_order.order_id, animal_order.order_name
            FROM animals
            INNER JOIN animal_order ON animals.order_id = animal_order.order_id
            WHERE animals.class_id = '$class_id'
            ORDER BY $sort_by $order;";
}

function getDefaultSql($sort_by, $order) {
    return "SELECT DISTINCT animal_order.order_id, animal_order.order_name
            FROM animals
            INNER JOIN animal_order ON animals.order_id = animal_order.order_id
            ORDER BY $sort_by $order;";
}

switch ($type) {
    case 'crud':
        $sql = getCrudSql($sort_by, $order);
        break;
    case 'order':
        $sql = getOrderSql($id, $sort_by, $order);
        break;
    case 'class':
        $sql = getClassSql($id, $sort_by, $order);
        break;
    default:
        $sql = getDefaultSql($sort_by, $order);
        break;
}

$results = executeQuery($sql);
jsonResponse($results);

?>
