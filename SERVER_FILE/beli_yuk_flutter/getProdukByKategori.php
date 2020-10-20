<?php
include 'koneksi.php';
$id = $_POST['id'];
$hasil = $connect->query("select * from tb_produk WHERE idKategori=$id ");
$result = array();
while ($dapatData = $hasil->fetch_assoc()){
$result[] = $dapatData;
}
echo json_encode($result);
?>