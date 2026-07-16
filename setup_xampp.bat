@echo off
setlocal EnableExtensions EnableDelayedExpansion

REM Always run from the folder where this batch file lives.
cd /d "%~dp0"

set NO_PAUSE=0
set SFX_MODE=0

:ParseArgs
if "%~1"=="" goto ArgsDone
if /I "%~1"=="sfx" set SFX_MODE=1
if /I "%~1"=="--no-pause" set NO_PAUSE=1
shift
goto ParseArgs

:ArgsDone
if "%SFX_MODE%"=="1" (
    if exist "xampp\" cd /d "xampp"
)

set DEFAULT_PHP_VERSION=8.5.8
set PHP_ACTIVE_DIR=php
set PHP_VERSION_DIR=php_versions\%DEFAULT_PHP_VERSION%
set SETUP_MARKER=install\.xampp_setup_complete
set SETUP_LOG=install\setup_xampp.log
set CONFIG_PHP=install\install.php

if not exist install mkdir install

echo ################################# START XAMPP SETUP CHECK #################################
echo [XAMPP]: Current folder: %CD%
echo [XAMPP]: Checking active PHP folder...

if not exist "%PHP_VERSION_DIR%\php.exe" (
  echo:
  echo [ERROR]: Default PHP version not found: %PHP_VERSION_DIR%
  echo [ERROR]: Missing file: %PHP_VERSION_DIR%\php.exe
  echo:
  goto Fail
)

if exist "%PHP_ACTIVE_DIR%\php.exe" (
  echo [XAMPP]: Active PHP folder already exists.
  goto PhpReady
)

if exist "%PHP_ACTIVE_DIR%" (
  echo [XAMPP]: Empty or invalid php folder found. Removing it...
  rmdir "%PHP_ACTIVE_DIR%" 2>nul
  if exist "%PHP_ACTIVE_DIR%" (
    echo:
    echo [ERROR]: Could not remove existing php folder.
    echo [ERROR]: If php is a real non-empty folder, rename or remove it manually, then run setup_xampp.bat again.
    echo:
    goto Fail
  )
)

echo [XAMPP]: Creating PHP junction...
mklink /J "%PHP_ACTIVE_DIR%" "%PHP_VERSION_DIR%"
if %ERRORLEVEL% GTR 0 (
  echo:
  echo [ERROR]: Failed to create PHP junction.
  echo [ERROR]: Could not link %PHP_ACTIVE_DIR% to %PHP_VERSION_DIR%
  echo:
  goto Fail
)

if not exist "%PHP_ACTIVE_DIR%\php.exe" (
  echo:
  echo [ERROR]: PHP junction was created, but php\php.exe is still missing.
  echo:
  goto Fail
)

:PhpReady
echo [XAMPP]: Active PHP is ready.
echo ################################# END XAMPP SETUP CHECK ###################################
echo:

echo ################################# START XAMPP TEST SECTION #################################
echo [XAMPP]: Testing php.exe without php.ini...
php\php.exe -n -d output_buffering=0 --version
if %ERRORLEVEL% GTR 0 (
  echo:
  echo [ERROR]: Test php.exe failed.
  echo [ERROR]: Windows may have blocked PHP, or the required Microsoft Visual C++ runtime is missing.
  echo:
  goto Fail
)
echo [XAMPP]: php.exe -n test passed.
echo ################################# END XAMPP TEST SECTION ###################################
echo:

call :WritePathFixScript
if errorlevel 1 goto Fail

echo [XAMPP]: Repairing Apache/PHP paths for current folder...
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "install\_xampp_path_fix.ps1"
if %ERRORLEVEL% GTR 0 (
  echo:
  echo [ERROR]: Path repair failed.
  echo:
  goto Fail
)

if not exist "%CONFIG_PHP%" (
  echo:
  echo [ERROR]: Missing %CONFIG_PHP%.
  echo [ERROR]: XAMPP setup files are incomplete.
  echo:
  goto Fail
)

echo [XAMPP]: Running %CONFIG_PHP%...
php\php.exe -n -d output_buffering=0 "%CONFIG_PHP%"
if %ERRORLEVEL% GTR 0 (
  echo:
  echo [ERROR]: XAMPP setup failed while running %CONFIG_PHP%.
  echo [ERROR]: Setup complete marker was not created.
  echo:
  goto Fail
)

echo [XAMPP]: Rechecking Apache/PHP paths after install.php...
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "install\_xampp_path_fix.ps1"
if %ERRORLEVEL% GTR 0 (
  echo:
  echo [ERROR]: Path repair failed after install.php.
  echo:
  goto Fail
)

echo [XAMPP]: Testing normal php.exe with repaired php.ini...
php\php.exe --version
if %ERRORLEVEL% GTR 0 (
  echo:
  echo [ERROR]: php\php.exe could not run after php.ini path repair.
  echo [ERROR]: Run php\php.exe --version manually for details.
  echo:
  goto Fail
)

if exist apache\bin\httpd.exe (
  echo [XAMPP]: Testing Apache configuration...
  apache\bin\httpd.exe -t
  if %ERRORLEVEL% GTR 0 (
    echo:
    echo [ERROR]: Apache configuration test failed after path repair.
    echo [ERROR]: Run apache\bin\httpd.exe -t manually for details.
    echo:
    goto Fail
  )
)

echo XAMPP setup completed on %DATE% %TIME% > "%SETUP_MARKER%"
echo [XAMPP]: Setup complete marker created: %SETUP_MARKER%
if exist "install\_xampp_path_fix.ps1" del /f /q "install\_xampp_path_fix.ps1" >nul 2>nul
goto EndSuccess

:WritePathFixScript
> "install\_xampp_path_fix.ps1" echo $ErrorActionPreference = 'Stop'
>> "install\_xampp_path_fix.ps1" echo $Root = (Get-Location).Path.TrimEnd('\')
>> "install\_xampp_path_fix.ps1" echo $RootUnix = $Root -replace '\\','/'
>> "install\_xampp_path_fix.ps1" echo $OldBases = @('D:\\xampp','D:\\xampp')
>> "install\_xampp_path_fix.ps1" echo function Repair-PathText([string]$Text) {
>> "install\_xampp_path_fix.ps1" echo   $Out = $Text
>> "install\_xampp_path_fix.ps1" echo   foreach ($Old in $OldBases) {
>> "install\_xampp_path_fix.ps1" echo     $OldWin = ($Old -replace '/','\').TrimEnd('\')
>> "install\_xampp_path_fix.ps1" echo     $OldUnix = ($OldWin -replace '\\','/')
>> "install\_xampp_path_fix.ps1" echo     $Out = $Out.Replace($OldWin + '\', $Root + '\')
>> "install\_xampp_path_fix.ps1" echo     $Out = $Out.Replace($OldWin + '/', $RootUnix + '/')
>> "install\_xampp_path_fix.ps1" echo     $Out = $Out.Replace($OldUnix + '/', $RootUnix + '/')
>> "install\_xampp_path_fix.ps1" echo     $Out = $Out.Replace($OldUnix + '\', $Root + '\')
>> "install\_xampp_path_fix.ps1" echo     $Out = $Out.Replace('"' + $OldWin + '"', '"' + $Root + '"')
>> "install\_xampp_path_fix.ps1" echo     $Out = $Out.Replace('"' + $OldUnix + '"', '"' + $RootUnix + '"')
>> "install\_xampp_path_fix.ps1" echo   }
>> "install\_xampp_path_fix.ps1" echo   if ($RootUnix.Length -ge 2) { $DrivePrefix = $RootUnix.Substring(0,2); $Out = $Out.Replace($DrivePrefix + $RootUnix, $RootUnix); $Out = $Out.Replace($DrivePrefix + $Root, $Root) }
>> "install\_xampp_path_fix.ps1" echo   return $Out
>> "install\_xampp_path_fix.ps1" echo }
>> "install\_xampp_path_fix.ps1" echo function Set-Directive([string[]]$Lines,[string]$Key,[string]$Value) {
>> "install\_xampp_path_fix.ps1" echo   $Found = $false
>> "install\_xampp_path_fix.ps1" echo   for ($i=0; $i -lt $Lines.Count; $i++) {
>> "install\_xampp_path_fix.ps1" echo     $t = $Lines[$i].Trim()
>> "install\_xampp_path_fix.ps1" echo     if ($t -ne '' -and -not $t.StartsWith(';') -and -not $t.StartsWith('#')) {
>> "install\_xampp_path_fix.ps1" echo       $compact = ($t -replace ' ','').ToLowerInvariant()
>> "install\_xampp_path_fix.ps1" echo       if ($compact.StartsWith(($Key + '=').ToLowerInvariant())) {
>> "install\_xampp_path_fix.ps1" echo         if (-not $Found) { $Lines[$i] = $Key + ' = ' + $Value; $Found = $true } else { $Lines[$i] = '; XAMPP setup disabled duplicate: ' + $Lines[$i] }
>> "install\_xampp_path_fix.ps1" echo       }
>> "install\_xampp_path_fix.ps1" echo     }
>> "install\_xampp_path_fix.ps1" echo   }
>> "install\_xampp_path_fix.ps1" echo   if (-not $Found) { $Lines += ($Key + ' = ' + $Value) }
>> "install\_xampp_path_fix.ps1" echo   return $Lines
>> "install\_xampp_path_fix.ps1" echo }
>> "install\_xampp_path_fix.ps1" echo New-Item -ItemType Directory -Force -Path (Join-Path $Root 'tmp'), (Join-Path $Root 'php\logs'), (Join-Path $Root 'php\extras') ^| Out-Null
>> "install\_xampp_path_fix.ps1" echo $Browscap = Join-Path $Root 'php\extras\browscap.ini'
>> "install\_xampp_path_fix.ps1" echo if (-not (Test-Path $Browscap)) { New-Item -ItemType File -Force -Path $Browscap ^| Out-Null }
>> "install\_xampp_path_fix.ps1" echo $Ini = Join-Path $Root 'php\php.ini'
>> "install\_xampp_path_fix.ps1" echo if (Test-Path $Ini) {
>> "install\_xampp_path_fix.ps1" echo   $Lines = Get-Content -LiteralPath $Ini
>> "install\_xampp_path_fix.ps1" echo   $Lines = Set-Directive $Lines 'include_path' ('".;' + $Root + '\php\PEAR"')
>> "install\_xampp_path_fix.ps1" echo   $Lines = Set-Directive $Lines 'extension_dir' ('"' + $Root + '\php\ext"')
>> "install\_xampp_path_fix.ps1" echo   $Lines = Set-Directive $Lines 'upload_tmp_dir' ('"' + $Root + '\tmp"')
>> "install\_xampp_path_fix.ps1" echo   $Lines = Set-Directive $Lines 'error_log' ('"' + $Root + '\php\logs\php_error_log"')
>> "install\_xampp_path_fix.ps1" echo   $Lines = Set-Directive $Lines 'browscap' ('"' + $Root + '\php\extras\browscap.ini"')
>> "install\_xampp_path_fix.ps1" echo   $Lines = Set-Directive $Lines 'session.save_path' ('"' + $Root + '\tmp"')
>> "install\_xampp_path_fix.ps1" echo   $Lines = Set-Directive $Lines 'curl.cainfo' ('"' + $Root + '\apache\bin\curl-ca-bundle.crt"')
>> "install\_xampp_path_fix.ps1" echo   $Lines = Set-Directive $Lines 'openssl.cafile' ('"' + $Root + '\apache\bin\curl-ca-bundle.crt"')
>> "install\_xampp_path_fix.ps1" echo   Set-Content -LiteralPath $Ini -Value $Lines -Encoding ASCII
>> "install\_xampp_path_fix.ps1" echo }
>> "install\_xampp_path_fix.ps1" echo $ConfRoot = Join-Path $Root 'apache\conf'
>> "install\_xampp_path_fix.ps1" echo if (Test-Path $ConfRoot) { Get-ChildItem -LiteralPath $ConfRoot -Recurse -File -Filter *.conf ^| ForEach-Object { $t = Get-Content -LiteralPath $_.FullName -Raw; $n = Repair-PathText $t; if ($n -ne $t) { Set-Content -LiteralPath $_.FullName -Value $n -Encoding ASCII } } }
>> "install\_xampp_path_fix.ps1" echo $Httpd = Join-Path $ConfRoot 'httpd.conf'
>> "install\_xampp_path_fix.ps1" echo if (Test-Path $Httpd) { $Lines = Get-Content -LiteralPath $Httpd; for ($i=0; $i -lt $Lines.Count; $i++) { $t=$Lines[$i].Trim(); $l=$t.ToLowerInvariant(); if ($t.StartsWith('Define SRVROOT')) { $Lines[$i] = 'Define SRVROOT "' + $RootUnix + '/apache"' } elseif ($t.StartsWith('ServerRoot')) { $Lines[$i] = 'ServerRoot "' + $RootUnix + '/apache"' } elseif ($t.StartsWith('DocumentRoot')) { $Lines[$i] = 'DocumentRoot "' + $RootUnix + '/htdocs"' } elseif ($t.StartsWith('ScriptAlias /cgi-bin/')) { $Lines[$i] = '    ScriptAlias /cgi-bin/ "' + $RootUnix + '/cgi-bin/"' } elseif ($l.StartsWith('<directory') -and $l.Contains('/htdocs')) { $Lines[$i] = '<Directory "' + $RootUnix + '/htdocs">' } elseif ($l.StartsWith('<directory') -and $l.Contains('/cgi-bin')) { $Lines[$i] = '<Directory "' + $RootUnix + '/cgi-bin">' } }; Set-Content -LiteralPath $Httpd -Value $Lines -Encoding ASCII }
>> "install\_xampp_path_fix.ps1" echo $XamppConf = Join-Path $ConfRoot 'extra\httpd-xampp.conf'
>> "install\_xampp_path_fix.ps1" echo if (Test-Path $XamppConf) { $Lines = Get-Content -LiteralPath $XamppConf; for ($i=0; $i -lt $Lines.Count; $i++) { $t=$Lines[$i].Trim(); $l=$t.ToLowerInvariant(); if ($t.StartsWith('SetEnv MIBDIRS')) { $Lines[$i] = '    SetEnv MIBDIRS "' + $RootUnix + '/php/extras/mibs"' } elseif ($t.StartsWith('SetEnv MYSQL_HOME')) { $Lines[$i] = '    SetEnv MYSQL_HOME "' + $RootUnix + '/mysql/bin"' } elseif ($t.StartsWith('SetEnv OPENSSL_CONF')) { $Lines[$i] = '    SetEnv OPENSSL_CONF "' + $RootUnix + '/apache/bin/openssl.cnf"' } elseif ($t.StartsWith('SetEnv PHP_PEAR_SYSCONF_DIR')) { $Lines[$i] = '    SetEnv PHP_PEAR_SYSCONF_DIR "' + $RootUnix + '/php"' } elseif ($t.StartsWith('SetEnv PHPRC')) { $Lines[$i] = '    SetEnv PHPRC "' + $RootUnix + '/php"' } elseif ($t.StartsWith('SetEnv TMP')) { $Lines[$i] = '    SetEnv TMP "' + $RootUnix + '/tmp"' } elseif ($t.StartsWith('Alias /licenses')) { $Lines[$i] = '    Alias /licenses "' + $RootUnix + '/licenses/"' } elseif ($l.StartsWith('alias /phpmyadmin')) { $Lines[$i] = '    Alias /phpmyadmin "' + $RootUnix + '/phpMyAdmin/"' } elseif ($t.StartsWith('Alias /webalizer')) { $Lines[$i] = '    Alias /webalizer "' + $RootUnix + '/webalizer/"' } elseif ($l.StartsWith('<directory') -and $l.Contains('/licenses')) { $Lines[$i] = '    <Directory "' + $RootUnix + '/licenses">' } elseif ($l.StartsWith('<directory') -and $l.Contains('/phpmyadmin')) { $Lines[$i] = '    <Directory "' + $RootUnix + '/phpMyAdmin">' } elseif ($l.StartsWith('<directory') -and $l.Contains('/webalizer')) { $Lines[$i] = '    <Directory "' + $RootUnix + '/webalizer">' } elseif ($l.StartsWith('<directory') -and ($l.Contains('/htdocs') -or $l.Contains('\htdocs') -or $l.Contains('htdocs' + $RootUnix.ToLowerInvariant()))) { $Lines[$i] = '<Directory "' + $RootUnix + '/htdocs/xampp">' } elseif ($l.StartsWith('<directory') -and ($l.Contains('/cgi-bin') -or $l.Contains('\cgi-bin'))) { $Lines[$i] = '<Directory "' + $RootUnix + '/cgi-bin">' } }; Set-Content -LiteralPath $XamppConf -Value $Lines -Encoding ASCII }
>> "install\_xampp_path_fix.ps1" echo $SslConf = Join-Path $ConfRoot 'extra\httpd-ssl.conf'
>> "install\_xampp_path_fix.ps1" echo if (Test-Path $SslConf) { $Lines = Get-Content -LiteralPath $SslConf; $FoundSslCache = $false; for ($i=0; $i -lt $Lines.Count; $i++) { $t=$Lines[$i].Trim(); if ($t -ne '' -and -not $t.StartsWith('#') -and -not $t.StartsWith(';') -and $t.StartsWith('SSLSessionCache')) { if (-not $FoundSslCache) { $Lines[$i] = 'SSLSessionCache "shmcb:' + $RootUnix + '/apache/logs/ssl_scache(512000)"'; $FoundSslCache = $true } else { $Lines[$i] = '# XAMPP setup disabled duplicate: ' + $Lines[$i] } } }; Set-Content -LiteralPath $SslConf -Value $Lines -Encoding ASCII }

>> "install\_xampp_path_fix.ps1" echo $MyIni = Join-Path $Root 'mysql\bin\my.ini'
>> "install\_xampp_path_fix.ps1" echo $MyBin = Split-Path -Parent $MyIni
>> "install\_xampp_path_fix.ps1" echo New-Item -ItemType Directory -Force -Path $MyBin, (Join-Path $Root 'mysql\data'), (Join-Path $Root 'tmp') ^| Out-Null
>> "install\_xampp_path_fix.ps1" echo if (Test-Path $MyIni) { $Bak = $MyIni + '.xampp_setup_bak'; if (-not (Test-Path $Bak)) { Copy-Item -LiteralPath $MyIni -Destination $Bak -Force } }
>> "install\_xampp_path_fix.ps1" echo $MyText = @"
>> "install\_xampp_path_fix.ps1" echo # XAMPP portable MySQL/MariaDB configuration
>> "install\_xampp_path_fix.ps1" echo # Generated by setup_xampp.bat portable repair.
>> "install\_xampp_path_fix.ps1" echo # Root: $Root
>> "install\_xampp_path_fix.ps1" echo.
>> "install\_xampp_path_fix.ps1" echo [client]
>> "install\_xampp_path_fix.ps1" echo port = 3306
>> "install\_xampp_path_fix.ps1" echo socket = "$RootUnix/mysql/mysql.sock"
>> "install\_xampp_path_fix.ps1" echo plugin-dir = "$Root\mysql\lib\plugin"
>> "install\_xampp_path_fix.ps1" echo.
>> "install\_xampp_path_fix.ps1" echo [mysql]
>> "install\_xampp_path_fix.ps1" echo no-auto-rehash
>> "install\_xampp_path_fix.ps1" echo.
>> "install\_xampp_path_fix.ps1" echo [mysqld]
>> "install\_xampp_path_fix.ps1" echo port = 3306
>> "install\_xampp_path_fix.ps1" echo socket = "$RootUnix/mysql/mysql.sock"
>> "install\_xampp_path_fix.ps1" echo basedir = "$RootUnix/mysql"
>> "install\_xampp_path_fix.ps1" echo tmpdir = "$RootUnix/tmp"
>> "install\_xampp_path_fix.ps1" echo datadir = "$RootUnix/mysql/data"
>> "install\_xampp_path_fix.ps1" echo pid_file = "mysql.pid"
>> "install\_xampp_path_fix.ps1" echo log_error = "mysql_error.log"
>> "install\_xampp_path_fix.ps1" echo plugin_dir = "$RootUnix/mysql/lib/plugin/"
>> "install\_xampp_path_fix.ps1" echo key_buffer_size = 16M
>> "install\_xampp_path_fix.ps1" echo max_allowed_packet = 1M
>> "install\_xampp_path_fix.ps1" echo sort_buffer_size = 512K
>> "install\_xampp_path_fix.ps1" echo net_buffer_length = 8K
>> "install\_xampp_path_fix.ps1" echo read_buffer_size = 256K
>> "install\_xampp_path_fix.ps1" echo read_rnd_buffer_size = 512K
>> "install\_xampp_path_fix.ps1" echo myisam_sort_buffer_size = 8M
>> "install\_xampp_path_fix.ps1" echo server-id = 1
>> "install\_xampp_path_fix.ps1" echo innodb_data_home_dir = "$RootUnix/mysql/data"
>> "install\_xampp_path_fix.ps1" echo innodb_data_file_path = ibdata1:10M:autoextend
>> "install\_xampp_path_fix.ps1" echo innodb_log_group_home_dir = "$RootUnix/mysql/data"
>> "install\_xampp_path_fix.ps1" echo innodb_buffer_pool_size = 16M
>> "install\_xampp_path_fix.ps1" echo innodb_log_file_size = 5M
>> "install\_xampp_path_fix.ps1" echo innodb_log_buffer_size = 8M
>> "install\_xampp_path_fix.ps1" echo innodb_flush_log_at_trx_commit = 1
>> "install\_xampp_path_fix.ps1" echo innodb_lock_wait_timeout = 50
>> "install\_xampp_path_fix.ps1" echo sql_mode = NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION
>> "install\_xampp_path_fix.ps1" echo log_bin_trust_function_creators = 1
>> "install\_xampp_path_fix.ps1" echo.
>> "install\_xampp_path_fix.ps1" echo [mysqldump]
>> "install\_xampp_path_fix.ps1" echo quick
>> "install\_xampp_path_fix.ps1" echo max_allowed_packet = 16M
>> "install\_xampp_path_fix.ps1" echo.
>> "install\_xampp_path_fix.ps1" echo [isamchk]
>> "install\_xampp_path_fix.ps1" echo key_buffer = 20M
>> "install\_xampp_path_fix.ps1" echo sort_buffer_size = 20M
>> "install\_xampp_path_fix.ps1" echo read_buffer = 2M
>> "install\_xampp_path_fix.ps1" echo write_buffer = 2M
>> "install\_xampp_path_fix.ps1" echo.
>> "install\_xampp_path_fix.ps1" echo [myisamchk]
>> "install\_xampp_path_fix.ps1" echo key_buffer = 20M
>> "install\_xampp_path_fix.ps1" echo sort_buffer_size = 20M
>> "install\_xampp_path_fix.ps1" echo read_buffer = 2M
>> "install\_xampp_path_fix.ps1" echo write_buffer = 2M
>> "install\_xampp_path_fix.ps1" echo.
>> "install\_xampp_path_fix.ps1" echo [mysqlhotcopy]
>> "install\_xampp_path_fix.ps1" echo interactive-timeout
>> "install\_xampp_path_fix.ps1" echo "@
>> "install\_xampp_path_fix.ps1" echo Set-Content -LiteralPath $MyIni -Value $MyText -Encoding ASCII
>> "install\_xampp_path_fix.ps1" echo $Sys = Join-Path $Root 'install\install.sys'
>> "install\_xampp_path_fix.ps1" echo if (Test-Path $Sys) { $m = Select-String -LiteralPath $Sys -Pattern '^\s*DIR\s*=\s*(.+)$' -ErrorAction SilentlyContinue ^| Select-Object -First 1; if ($m) { $oldDir = $m.Matches[0].Groups[1].Value.Trim().TrimEnd('\'); if ($oldDir -and ($oldDir.ToLowerInvariant() -ne $Root.ToLowerInvariant())) { Remove-Item -LiteralPath $Sys -Force } } }
exit /b 0

:Fail
if exist "install\_xampp_path_fix.ps1" del /f /q "install\_xampp_path_fix.ps1" >nul 2>nul
if "%NO_PAUSE%"=="0" pause
endlocal
exit /b 1

:EndSuccess
if "%NO_PAUSE%"=="0" pause
endlocal
exit /b 0
