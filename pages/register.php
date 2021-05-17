<?php
require_once('./class/class.User.php');

if (isset($_POST['btnSubmit'])) {
    $inputemail = $_POST["email"];
    $objUser = new User();
    $objUser->ValidateEmail($inputemail);

    if ($objUser->hasil) {
        echo "<script>alert('Email sudah terdaftar'); </script>";
    } else {
        $objUser->email = $_POST["email"];
        $password = $_POST['password'];
        $objUser->password = password_hash($password, PASSWORD_DEFAULT);
        $objUser->name = $_POST["name"];
        $objUser->role = 'employee';
        $objUser->AddUser();


        if ($objUser->hasil) {
            require_once('./class/class.Mail.php');
            $message = file_get_contents('templateemail.html');
            $header = "Registrasi berhasil";
            $body =
                '<span style="font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #57697e;">Selamat <b>' . $objUser->name . '</b>, anda telah terdaftar pada sistem company online ESQ Business School.<br>
    Berikut ini informasi account anda:<br>
    </span>
    <span style="font-family: Arial, Helvetica, sans-serif; fontsize: 15px; color: #57697e;">
        Username : ' . $objUser->email . '<br>
        Password : ' . $password . '
    </span>';

            $footer = 'Silakan login untuk mengakses sistem';
            $message = str_replace("#header#", $header, $message);
            $message = str_replace("#body#", $body, $message);
            $message = str_replace("#footer#", $footer, $message);
            Email::SendMail($objUser->email, $objUser->name, 'Registrasi berhasil', $message);
            echo "<script> alert('Registrasi berhasil'); </script>";
            echo '<script> window.location="index.php?p=login"; </script>';
        }
    }
}
?>
<div class="container">
    <div class="col-md-6">
        <h4 class="title"><span class="text"><strong>Register Email</strong></span>
        </h4>
        <form action="" method="post">
            <table class="table" border="0">
                <tr>
                    <td>Email</td>
                    <td>:</td>

                    <td><input type="email" class="form-control" name="email" id="email" required>
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>:</td>

                    <td><input type="password" class="form-control" name="password" id="password" required>
                    </td>
                </tr>
                <tr>
                    <td>Nama</td>
                    <td>:</td>

                    <td><input type="text" class="form-control" id="name" name="name" required>
                    </td>
                </tr>

                <td colspan="2"></td>
                <td><input type="submit" class="btn btn-success" value="Register" name="btnSubmit">
                    <a href="index.php" class="btn btn-warning">Cancel</a>
                </td>
                </tr>
            </table>
        </form>
    </div>
</div>