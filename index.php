<?php
require "dbconnect.php";

if ($conn->connect_error) {
    die("Ошибка: невозможно подключиться: " . $conn->connect_error);
}

echo 'Подключились к базе.<br>';

$result = $conn->query("SELECT * FROM consumers") ;
echo "<h2>Таблица consumers</h2>";
echo 'id'. ' '. 'name'. ' '. 'email'."<br>";
while ($row = $result->fetch()) {
    echo $row['id']. ' '. $row['name']. ' '. $row['delivery_address']. ' '. $row['email']."<br>";

}