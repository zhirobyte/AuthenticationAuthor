
<?php

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require "vendor/autoload.php";

class Email extends Connection
{
    public static function SendMail($to, $name, $subject, $message)
    {

        $mail = new PHPMailer(true);
        $mail->SMTPDebug = 0;
        $mail->isSMTP();
        $mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;

        //ganti dengan email dan password yang akan di gunakan sebagai email pengirim
        $mail->Username = 'zhirosec@gmail.com';
        $mail->Password = 'faizthunder13+';
        $mail->SMTPSecure = 'ssl';
        $mail->Port = 465;

        //ganti dengan email yg akan di gunakan sebagai email pengirim
        $mail->setFrom('zhirosec@gmail.com', 'Admin Company');
        $mail->addAddress($_POST['email'], $_POST['name']);
        $mail->isHTML(true);

        if (!$mail->send()) {
            echo  "<script> alert('Selamat Registrasi Gagal');</script>";
        }
    }
}
