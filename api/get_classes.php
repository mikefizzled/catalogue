<?php
// api/orders/get
require_once '../api/common/db.php';
require_once '../api/common/functions.php';


$order = $GET_['order'] ?? 'class.class_common_name';

$sql = "SELECT DISTINCT class.class_id, class.class_common_name, class.class_name
FROM animals
INNER JOIN class ON animals.class_id = class.class_id
ORDER BY $order;";

$results = executeQuery($sql);
jsonResponse($results);

?>
