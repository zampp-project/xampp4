<?php
// Modern XAMPP Dashboard
// Keeps the existing runtime detection logic and PHP cURL fallback for active-junction installs.

$server = $_SERVER['SERVER_SOFTWARE'] ?? '';

function h($value): string
{
    return htmlspecialchars((string) $value, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
}

function dashboardContains($haystack, $needle): bool
{
    return strpos((string) $haystack, (string) $needle) !== false;
}

function statusClass($value): string
{
    $value = strtolower(trim((string) $value));

    if ($value === '' || $value === 'unknown' || $value === 'missing' || $value === 'unavailable' || $value === 'not connected') {
        return 'status-warn';
    }

    if (dashboardContains($value, 'unavailable') || dashboardContains($value, 'missing') || dashboardContains($value, 'not connected')) {
        return 'status-warn';
    }

    return 'status-ok';
}

// --- Apache ---
$apache = 'Unknown';
if (preg_match('/Apache\/([0-9\.]+)/', $server, $m)) {
    $apache = $m[1];
}

// --- PHP ---
$php = phpversion() ?: 'Unknown';

// --- PHP cURL ---
// Robust detection for Apache module SAPI, with CLI fallback for XAMPP active-junction installs.
$curl = 'Unavailable';

function detectPhpCurlVersion(): string
{
    // 1) Best check: current Apache-loaded PHP process.
    if (extension_loaded('curl') || function_exists('curl_version') || in_array('curl', get_loaded_extensions(), true)) {
        if (function_exists('curl_version')) {
            $cv = @curl_version();
            if (is_array($cv) && !empty($cv['version'])) {
                return (string) $cv['version'];
            }
        }

        $phpCurlVersion = phpversion('curl');
        if (is_string($phpCurlVersion) && $phpCurlVersion !== '') {
            return $phpCurlVersion;
        }

        return 'Enabled';
    }

    // 2) Fallback for XAMPP dashboards: ask the active php\php.exe used by the selector.
    $xamppRoot = dirname($_SERVER['DOCUMENT_ROOT'] ?? __DIR__);
    $phpExe = $xamppRoot . DIRECTORY_SEPARATOR . 'php' . DIRECTORY_SEPARATOR . 'php.exe';

    if (is_file($phpExe) && function_exists('shell_exec')) {
        $cmd = '"' . $phpExe . '" -i 2>NUL';
        $out = @shell_exec($cmd);

        if (is_string($out) && $out !== '') {
            if (preg_match('/cURL Information\s*=>\s*([^\r\n]+)/i', $out, $m)) {
                return trim($m[1]);
            }

            if (preg_match('/cURL support\s*=>\s*enabled/i', $out)) {
                return 'Enabled';
            }
        }
    }

    return 'Unavailable';
}

$curl = detectPhpCurlVersion();

// --- Apache / MySQL cURL runtime ---
$apacheCurlRuntime = 'Unknown';
$mysqlCurlRuntime  = 'Unknown';

$xamppRoot = dirname($_SERVER['DOCUMENT_ROOT'] ?? __DIR__);

function normalizePathForCompare(string $path): string
{
    $real = @realpath($path);
    if (is_string($real) && $real !== '') {
        $path = $real;
    }

    return strtolower(str_replace(['/', '\\'], DIRECTORY_SEPARATOR, rtrim($path, '/\\')));
}

function detectPhpExecutableVersion(string $phpExe): string
{
    if (!is_file($phpExe) || !function_exists('shell_exec')) {
        return '';
    }

    // Use -n so a stale or incompatible php.ini cannot hide an installed version.
    $cmd = '"' . $phpExe . '" -n -r "echo PHP_VERSION;" 2>NUL';
    $out = @shell_exec($cmd);

    if (is_string($out)) {
        $out = trim($out);
        if (preg_match('/^\d+\.\d+\.\d+(?:[A-Za-z0-9._-]*)?$/', $out)) {
            return $out;
        }
    }

    return '';
}

function getInstalledPhpVersions(string $xamppRoot, string $activePhpVersion): array
{
    $versionsDir = $xamppRoot . DIRECTORY_SEPARATOR . 'php_versions';
    $activePhpDir = normalizePathForCompare($xamppRoot . DIRECTORY_SEPARATOR . 'php');
    $versions = [];

    if (!is_dir($versionsDir)) {
        return $versions;
    }

    $items = @scandir($versionsDir);
    if (!is_array($items)) {
        return $versions;
    }

    foreach ($items as $item) {
        if ($item === '.' || $item === '..') {
            continue;
        }

        $dir = $versionsDir . DIRECTORY_SEPARATOR . $item;
        if (!is_dir($dir)) {
            continue;
        }

        $phpExe = $dir . DIRECTORY_SEPARATOR . 'php.exe';
        $detectedVersion = detectPhpExecutableVersion($phpExe);
        $displayVersion = $detectedVersion !== '' ? $detectedVersion : $item;
        $normalizedDir = normalizePathForCompare($dir);

        $isActive = false;
        if ($activePhpVersion !== 'Unknown') {
            $isActive = version_compare($displayVersion, $activePhpVersion, '==') || $displayVersion === $activePhpVersion || $item === $activePhpVersion;
        }

        // Fallback for junction-aware installs if realpath can resolve the active php folder.
        if (!$isActive && $activePhpDir === $normalizedDir) {
            $isActive = true;
        }

        $versions[] = [
            'name' => $item,
            'version' => $displayVersion,
            'active' => $isActive,
            'valid' => is_file($phpExe),
        ];
    }

    usort($versions, static function (array $a, array $b): int {
        return version_compare($b['version'], $a['version']);
    });

    return $versions;
}

$installedPhpVersions = getInstalledPhpVersions($xamppRoot, $php);
$installedPhpCount = count($installedPhpVersions);
$activePhpLabel = $php;
foreach ($installedPhpVersions as $installedPhp) {
    if (!empty($installedPhp['active'])) {
        $activePhpLabel = $installedPhp['version'];
        break;
    }
}

$apacheLibcurl = $xamppRoot . '/apache/bin/libcurl.dll';
$mysqlLibcurl  = $xamppRoot . '/mysql/bin/libcurl.dll';

function getWindowsFileVersion(string $file): string
{
    if (!file_exists($file)) {
        return 'Missing';
    }

    $file = str_replace("'", "''", $file);
    $cmd = 'powershell -NoProfile -Command "(Get-Item \'' . $file . '\').VersionInfo.FileVersion"';
    $out = @shell_exec($cmd);

    if (is_string($out)) {
        $out = trim($out);
        if ($out !== '') {
            return $out;
        }
    }

    return 'Unknown';
}

$apacheCurlRuntime = getWindowsFileVersion($apacheLibcurl);
$mysqlCurlRuntime  = getWindowsFileVersion($mysqlLibcurl);

// --- MySQL / MariaDB ---
$mysql = 'Not connected';
$isMariaDB = false;

if (class_exists('mysqli')) {
    $mysqli = @new mysqli('localhost', 'root', '');
    if ($mysqli && !$mysqli->connect_error) {
        $mysql = $mysqli->server_info;

        if (stripos($mysql, 'mariadb') !== false) {
            $isMariaDB = true;
        }

        $mysqli->close();
    }
} else {
    $mysql = 'mysqli extension unavailable';
}

// --- phpMyAdmin ---
$phpmyadmin = 'Unknown';

$versionFiles = [
    $xamppRoot . '/phpmyadmin/libraries/classes/Version.php',
    $xamppRoot . '/phpMyAdmin/libraries/classes/Version.php'
];

foreach ($versionFiles as $versionFile) {
    if (file_exists($versionFile)) {
        $contents = @file_get_contents($versionFile);

        if ($contents !== false && preg_match("/public const VERSION = '([^']+)'/", $contents, $m)) {
            $phpmyadmin = $m[1];
            break;
        }
    }
}

$cards = [
    ['label' => 'Apache', 'value' => $apache, 'note' => 'Web server', 'class' => 'apache'],
    ['label' => 'Apache cURL runtime', 'value' => $apacheCurlRuntime, 'note' => 'Apache DLL runtime', 'class' => 'runtime'],
    ['label' => 'phpMyAdmin', 'value' => $phpmyadmin, 'note' => 'Database UI', 'class' => 'pma'],
    ['label' => 'PHP', 'value' => $activePhpLabel, 'note' => 'Active PHP version', 'class' => 'php'],
    ['label' => 'PHP cURL', 'value' => $curl, 'note' => 'PHP extension runtime', 'class' => 'curl'],
    ['label' => 'MySQL cURL runtime', 'value' => $mysqlCurlRuntime, 'note' => 'Database DLL runtime', 'class' => 'runtime'],
    ['label' => $isMariaDB ? 'MariaDB' : 'MySQL', 'value' => $mysql, 'note' => 'Database server', 'class' => 'db'],
];
?>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Welcome to XAMPP</title>
  <meta name="description" content="XAMPP is an easy to install Apache distribution containing MariaDB, PHP and Perl.">
  <meta name="keywords" content="xampp, apache, php, perl, mariadb, open source distribution">
  <link href="/dashboard/stylesheets/normalize.css" rel="stylesheet" type="text/css">
  <link href="/dashboard/stylesheets/modern-dashboard.css" rel="stylesheet" type="text/css">
  <link href="/dashboard/images/favicon.png" rel="icon" type="image/png">
</head>
<body>
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

  <main>
    <section class="hero">
      <div class="container hero-grid">
        <div class="hero-copy">
          <p class="eyebrow">Local development stack</p>
          <h1>Welcome to XAMPP 4.0.0 for Windows</h1>
          <p class="lead">
  <strong>XAMPP 4.0.0</strong> is configured for local development with Apache, MariaDB, PHP, and Perl, plus an updated
  control panel that supports selectable PHP versions. The active PHP runtime is managed through a
  dedicated version selector, allowing projects to run against different PHP branches without manually
  editing Apache configuration files.
</p>

<p class="lead">
  This dashboard helps confirm the active runtime, PHP cURL support, database status, and quick access
  to common tools such as phpinfo and phpMyAdmin. It is also designed to verify that the current stack
  was initialized correctly after first-run setup, including the active PHP path, Apache module loading,
  and local development services.
</p>
		  
		  
		  
		  
		  
		  <div class="hero-actions">
            <a class="button primary" href="/dashboard/phpinfo.php" target="_blank" rel="noopener">Open PHPInfo</a>
            <a class="button" href="/phpmyadmin/">Open phpMyAdmin</a>
          </div>
        </div>

        <section class="status-panel" aria-label="Runtime status">
          <div class="panel-heading">
            <div>
              <p class="eyebrow">Runtime overview</p>
              <h2>Active stack</h2>
            </div>
            <span class="pill <?php echo h(statusClass($curl)); ?>">cURL <?php echo strtolower($curl) === 'unavailable' ? 'Unavailable' : 'Ready'; ?></span>
          </div>

          <div class="status-grid">
            <?php foreach ($cards as $card): ?>
              <article class="status-card <?php echo h($card['class']); ?>">
                <div>
                  <span class="label"><?php echo h($card['label']); ?></span>
                  <small><?php echo h($card['note']); ?></small>
                </div>
                <strong class="value <?php echo h(statusClass($card['value'])); ?>"><?php echo h($card['value']); ?></strong>
              </article>
            <?php endforeach; ?>
          </div>

          <div class="status-card php" style="margin-top: 1rem; display: block;">
            <div style="display: flex; justify-content: space-between; gap: 1rem; align-items: flex-start; margin-bottom: .75rem;">
              <div>
                <span class="label">Installed PHP versions</span>
                <small>Detected from php_versions folder</small>
              </div>
              <strong class="value <?php echo $installedPhpCount > 0 ? 'status-ok' : 'status-warn'; ?>"><?php echo h($installedPhpCount); ?></strong>
            </div>

            <?php if ($installedPhpCount > 0): ?>
              <div class="php-version-list" style="display: flex; flex-wrap: wrap; gap: .5rem;">
                <?php foreach ($installedPhpVersions as $installedPhp): ?>
                  <span class="pill <?php echo !empty($installedPhp['active']) ? 'status-ok' : (!empty($installedPhp['valid']) ? '' : 'status-warn'); ?>" title="Folder: php_versions/<?php echo h($installedPhp['name']); ?>">
                    PHP <?php echo h($installedPhp['version']); ?><?php echo !empty($installedPhp['active']) ? ' active' : ''; ?>
                  </span>
                <?php endforeach; ?>
              </div>
            <?php else: ?>
              <p style="margin: 0;">No PHP versions were found in <code>php_versions</code>.</p>
            <?php endif; ?>
          </div>
        </section>
      </div>
    </section>

    <section class="container content-grid">
      <article class="content-card">
        <h2>Getting started</h2>
        <p>You have successfully installed XAMPP on this system. Start building PHP applications, test local sites, or manage databases with phpMyAdmin.</p>
        <div class="quick-links">
          <a href="/dashboard/faq.html">Read FAQs</a>
          <a href="/dashboard/howto.html">View HOW-TO Guides</a>
          <a href="/dashboard/docs/configure-vhosts.html">Configure virtual hosts</a>
        </div>
      </article>

      <article class="content-card warning-card">
        <h2>Development use only</h2>
        <p><strong>XAMPP</strong> is configured for local development convenience. It is not hardened for public-facing production use without additional security changes.</p>
      </article>

      <article class="content-card notice-card">
        <h2>Unofficial update notice</h2>
        <p>This distribution represents a modified release from <strong>XAMPP 8.2.1</strong> and incorporates additional updates, patches, and configuration changes as outlined above. It is an <strong>"Independent Distribution"</strong> and is not affiliated with, endorsed by, or supported by Apache Friends or any associated community forums. This software is provided without any representations or warranties, express or implied. To the maximum extent permitted by applicable law, the distributor disclaims all liability for any damages or losses arising from the installation, use, or performance of this software, including but not limited to data loss, security vulnerabilities, service interruptions, or incompatibilities. By using this software, you acknowledge and accept full responsibility for any risks associated with its use. </p>
      </article>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container footer-grid">
      <p>Copyright &copy; <?php echo date('Y'); ?> <a href="https://zampp.org" target="_blank" rel="noopener">ZAMPP.ORG</a></p>
      <p>XAMPP_Control.exe and local dashboard for Apache + MariaDB + PHP + Perl · <a href="https://zampp.org" target="_blank" rel="noopener">zampp.org</a></p>
    </div>
  </footer>
</body>
</html>
