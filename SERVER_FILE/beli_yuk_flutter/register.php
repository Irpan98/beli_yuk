<?php   
    require "koneksi.php";
    if ($_SERVER['REQUEST_METHOD'] == "POST") {
        $response = array();
        $email = $_POST['email'];
        $name = $_POST['name'];
        $password = md5($_POST['password']);
        $alamat = $_POST['alamat'];

        
        $cek = "SELECT * FROM tb_user WHERE email='$email'";
        $result = mysqli_fetch_array(mysqli_query($connect, $cek));
        
        if (isset($result)) {
            $response['value'] = 2;
            $response['message'] = "Email telah digunakan";
            echo json_encode($response);
        } else {
            
            $insert = "INSERT INTO tb_user VALUE(
                NULL,
                '$email',
                '$name', 
                '$password',
                '$alamat')";


//             $insert = "INSERT INTO tb_user VALUE(
//     NULL,
//     '$username','$email', '$full_name', '$sex', '$password','$alamat',
// NOW())";
                if (mysqli_query($connect, $insert)) {
                    $response['value'] = 1;
                    $response['message'] = "Berhasil didaftarkan";
                    echo json_encode($response);
                } else {
                    $response['value'] = 0;
                    $response['message'] = "Gagal didaftarkan";
                    echo json_encode($response);
                }
    }
}
?>
