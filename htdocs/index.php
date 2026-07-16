<?php
if (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') {
    $uri = 'https://';
} else {
    $uri = 'http://';
}

$uri .= $_SERVER['HTTP_HOST'];

header('Location: ' . $uri . '/dashboard/');
exit;
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>ZAMPP</title>
</head>
<body>
    <p>Something is wrong with the ZAMPP installation.  :-(</p>
</body>
</html>