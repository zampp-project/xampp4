@echo off
setlocal EnableExtensions

rem Public-safe graceful MariaDB shutdown helper.
rem Optional credentials file:
rem   mysql\bin\mysql_shutdown.cnf
rem Keep that file private and restrict its NTFS permissions.

set "ZAMPP_ROOT=%~dp0"
set "MYSQLADMIN=%ZAMPP_ROOT%mysql\bin\mysqladmin.exe"
set "SHUTDOWN_CNF=%ZAMPP_ROOT%mysql\bin\mysql_shutdown.cnf"

if not exist "%MYSQLADMIN%" (
    echo ERROR: mysqladmin.exe was not found:
    echo   "%MYSQLADMIN%"
    exit /b 2
)

echo Requesting a clean MariaDB shutdown...

if exist "%SHUTDOWN_CNF%" (
    "%MYSQLADMIN%" --defaults-extra-file="%SHUTDOWN_CNF%" --connect-timeout=5 --protocol=TCP --host=127.0.0.1 --port=3306 shutdown
) else (
    "%MYSQLADMIN%" --connect-timeout=5 --protocol=TCP --host=127.0.0.1 --port=3306 --user=root shutdown
)

if errorlevel 1 (
    echo.
    echo ERROR: MariaDB rejected or did not complete the shutdown request.
    echo Configure mysql\bin\mysql_shutdown.cnf or use Windows service mode.
    echo mysqld.exe was NOT forcibly terminated.
    exit /b 1
)

echo MariaDB accepted the clean shutdown request.
exit /b 0
