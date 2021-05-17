<?php
require "inc.koneksi.php";
?>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <title>Homepage</title>
    <link rel="icon" href="esq.jpg" type="image/x-icon">

</head>

<body>

    <body style="background-color:#00a2ed;">
        <header>
            <nav class="navbar navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand">Logo Company</a>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </nav>
        </header>
        <main>
            <?php
            $page_dir = 'pages';
            if (!empty($_GET['p'])) {
                $page = scandir($page_dir, 0);
                unset($page[0], $page[1]);
                $p = $_GET['p'];
                if (in_array($p . '.php', $page)) {
                    include($page_dir . '/' . $p . '.php');
                } else {
                    echo 'Halaman tidak ditemukan! :(';
                }
            } else {
                include "./pages/home.php";
            }
            ?>
        </main>
        <footer></footer>

    </body>

</html>