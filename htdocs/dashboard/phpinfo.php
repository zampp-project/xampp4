<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <!-- Always force latest IE rendering engine or request Chrome Frame -->
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Use title if it's in the page YAML frontmatter -->
    <title>Welcome to XAMPP</title>

    <meta name="description" content="XAMPP is an easy to install Apache distribution containing MariaDB, PHP and Perl." />
    <meta name="keywords" content="xampp, apache, php, perl, mariadb, open source distribution" />

    <link href="/dashboard/stylesheets/normalize.css" rel="stylesheet" type="text/css" /><link href="/dashboard/stylesheets/all.css" rel="stylesheet" type="text/css" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/3.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <script src="/dashboard/javascripts/modernizr.js" type="text/javascript"></script>


    <link href="/dashboard/images/favicon.png" rel="icon" type="image/png" />


  </head>



<body class="index">
    <div id="fb-root"></div>
    <script>(function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=277385395761685";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>
    <header class="site-header">
    <div class="container nav-wrap">
      <a class="brand" href="/dashboard/index.php" aria-label="XAMPP Dashboard">
        <img src="/dashboard/images/xampp-logo.svg" alt="XAMPP">
        <span>XAMPP</span>
      </a>
      <nav class="nav-links" aria-label="Dashboard navigation">
        <a href="/dashboard/faq.html">FAQs</a>
        <a href="/dashboard/howto.html">HOW-TO Guides</a>
        <a target="_blank" rel="noopener" href="/dashboard/phpinfo.php">PHPInfo</a>
        <a href="/phpmyadmin/">phpMyAdmin</a>
      </nav>
    </div>
  </header>
<section class="page-hero">
  <div class="container">
    <p class="page-eyebrow">XAMPP 4.0 Dashboard</p>
    <h1 class="page-title">Welcome to XAMPP</h1>
    <p class="page-lead">Dashboard resources and documentation.</p>
  </div>
</section>


    <div class="wrapper">
     
  <div class="row">
    
<?php phpinfo(); ?>



    <footer class="site-footer">
  <div class="container footer-grid">
    <p>Original XAMPP by Apache Friends. Modified distribution by <a href="https://zampp.org" target="_blank" rel="noopener">zampp.org</a>.</p>
    <p>Local dashboard for Apache + MariaDB + PHP + Perl.</p>
  </div>
</footer>

    <!-- JS Libraries -->
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="/dashboard/javascripts/all.js" type="text/javascript"></script>
  </body>
</html>