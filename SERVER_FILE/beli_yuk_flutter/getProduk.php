<?php
include 'koneksi.php';
$hasil = $connect->query("select * from tb_produk");
$result = array();
while ($dapatData = $hasil->fetch_assoc()){
$result[] = $dapatData;
}
echo json_encode($result);
?>