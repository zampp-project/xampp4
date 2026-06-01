# XAMPP 4.0.1 Modernized

**XAMPP 4.0.1 Modernized** is a Windows-focused XAMPP package with a refreshed dashboard, improved first-run setup, and PHP version management built into the XAMPP Control Panel.

This project keeps the familiar XAMPP layout while adding modern usability improvements, including a PHP version dropdown, optional PHP add-on support, cleaner release packaging, and a better first-run experience.

> **Important:** This is an independent modernized XAMPP package and is **not** an official Apache Friends release.


---

## Focus for This Release

For now, this project focuses on:

- `README.md`
- Release description
- Release ZIP files
- Optional PHP add-on ZIPs

The main repository contains the project files, while regular users should download the ready-to-use ZIP files from **GitHub Releases**.

---

## Latest Release

The latest public release is available from the **GitHub Releases** page.

**Current release:** XAMPP 4.0.1 Modernized with PHP 8.5.6 bundled by default.

Download the main XAMPP ZIP from the release assets, extract it to a clean folder, and run:

```text
xampp_control.exe
```

as Administrator.

Do **not** install over an existing XAMPP folder.

---

## Included Components

This release includes:

- Apache
- MySQL / MariaDB
- phpMyAdmin
- MercuryMail
- FileZilla FTP
- Tomcat
- Perl
- PHP 8.5.6 as the default bundled PHP version
- Modernized XAMPP dashboard
- Runtime Overview dashboard card
- Installed PHP versions dashboard display
- Updated setup/start/stop scripts
- PHP version dropdown in the XAMPP Control Panel
- Optional PHP version add-on support
- Internal first-run setup
- Manual `setup_xampp.bat` fallback
- Windows unblock helper script

---

## Dashboard Runtime Overview

The modernized dashboard includes a **Runtime Overview** panel that shows the active local stack.

The dashboard can display:

- Apache version
- Apache cURL runtime
- phpMyAdmin version
- Active PHP version
- PHP cURL runtime
- MySQL cURL runtime
- MariaDB version
- Installed PHP versions detected from the `php_versions` folder

Current Versions:

```text
Apache                  2.4.67
Apache cURL runtime     8.20.0
phpMyAdmin              5.2.3
PHP                     8.5.6
PHP cURL                8.20.0
MySQL cURL runtime      8.19.0
MariaDB                 12.3.2-MariaDB
Installed PHP versions  8.5.6
```

The active PHP version is marked automatically.

---

## First Run Instructions

1. Download the main XAMPP ZIP from GitHub Releases.
2. Extract it to a clean folder.

   Recommended examples:

   ```text
   C:\xampp
   D:\xampp
   F:\xampp-modernized
   ```

3. Do **not** extract over an existing XAMPP folder.
4. Right-click:

   ```text
   xampp_control.exe
   ```

5. Choose **Run as administrator**.
6. Allow the first-run setup to complete.
7. Use the PHP version dropdown if needed.
8. Start Apache, MySQL/MariaDB, or any other services you want to use.

On first run, `xampp_control.exe` prepares the local folder automatically.

The first-run setup:

- Detects the actual folder where XAMPP was extracted
- Creates the active `php/` folder
- Creates the Apache PHP active configuration
- Repairs Apache paths for the current folder
- Repairs PHP configuration paths
- Rebuilds a portable MySQL/MariaDB `my.ini`
- Creates required runtime folders
- Validates Apache configuration before completing setup

The package can be extracted to different drives or folder names. The setup process is designed to adapt to the actual location.

---

## Important First-Run Notes

Before first run, the release ZIP should **not** contain generated runtime state such as:

```text
php/
install/.xampp_setup_complete
install/setup_xampp.log
install/install.sys
apache/conf/extra/php-active.conf
xampp-control.ini
xampp-control.log
```

These files and folders are created automatically when `xampp_control.exe` runs for the first time.

Do not manually create or edit the `php/` folder before first run.

---

## PHP Version Setup

PHP 8.5.5 is included as the default bundled PHP version.

It is stored in:

```text
php_versions/8.5.5/
```

The active PHP folder is:

```text
php/
```

The active `php/` folder is created automatically on first run by `xampp_control.exe`.

The manual fallback script:

```text
setup_xampp.bat
```

can also prepare the active PHP folder if needed.

Default bundled PHP version:

```text
PHP 8.5.5
```

---

## PHP Version Dropdown

The XAMPP Control Panel includes a PHP version dropdown.

Use this dropdown to select the PHP version you want XAMPP to use.

When a PHP version is selected, the Control Panel activates that version into the active `php/` folder and updates the Apache PHP configuration.

After optional PHP add-ons are installed, those versions should also appear in the dropdown.

---

## Optional PHP Add-ons

Additional PHP versions are available as separate add-on ZIP downloads through GitHub Releases.

These add-ons allow you to add more PHP versions without downloading the full XAMPP package again.

### Available PHP Add-ons

| PHP Version | Add-on ZIP | Purpose |
|---|---|---|
| PHP 7.3.33 | `php-7.3.33-addon.zip` | Legacy project compatibility |
| PHP 7.4.33 | `php-7.4.33-addon.zip` | Legacy project compatibility |
| PHP 8.2.12 | `php-8.2.12-addon.zip` | PHP 8.2 testing/support |
| PHP 8.4.20 | `php-8.4.20-addon.zip` | PHP 8.4 testing/support |
| PHP 8.5.4 | `php-8.5.4-addon.zip` | Compatibility/testing with PHP 8.5.4 |
| PHP 8.5.5 | `php-8.5.5-addon.zip` | Compatibility/testing with PHP 8.5.5 |
| PHP 8.5.6 | `php-8.5.6-addon.zip` | Compatibility/testing with PHP 8.5.6 |

PHP 8.5.6 is already bundled with the main package. You only need to download a PHP add-on if you want to add another PHP version.

> PHP 8.5.6 is available as an optional add-on. The main XAMPP 4.0.1 package still bundles PHP 8.5.6 by default.

PHP 8.5.6 was added as:

```text
php-8.5.6-addon.zip
```

on 05/30/2026.

As newer PHP versions are released, they may be added as optional add-ons. PHP 8.5.6 remains the bundled stack version for the main XAMPP 4.0.1 package.

---

## Installing Optional PHP Versions

To install an optional PHP version:

1. Stop all running services from the XAMPP Control Panel.
2. Quit/close:

   ```text
   xampp_control.exe
   ```

3. Download the PHP version add-on ZIP you want from GitHub Releases.
4. Extract the add-on ZIP into your XAMPP root folder, or manually place the version folder inside:

   ```text
   xampp/php_versions/
   ```

5. Start `xampp_control.exe` again as Administrator.
6. Use the PHP version dropdown in the Control Panel to select the new PHP version.
7. Apply/activate the selected PHP version if prompted.
8. Start the services you need again.

Correct final path example:

```text
xampp/php_versions/8.5.6/php.exe
```

Another correct example:

```text
xampp/php_versions/8.4.20/php.exe
```

Wrong path example:

```text
xampp/php_versions/php-8.5.6-addon/8.5.6/php.exe
```

If your extracted path looks like the wrong example, move the version folder so `php.exe` is directly inside the version folder.

---

## Windows File Blocking

Windows may block files downloaded from GitHub because they came from the internet.

If XAMPP does not start correctly, or if Windows blocks scripts or executables, run the included unblock helper from the extracted XAMPP folder.

Open PowerShell as Administrator and run:

```powershell
cd "C:\path\to\xampp"
powershell.exe -ExecutionPolicy Bypass -File ".\unblock_xampp.ps1"
```

Example:

```powershell
cd "D:\xampp"
powershell.exe -ExecutionPolicy Bypass -File ".\unblock_xampp.ps1"
```

After the unblock process finishes, run:

```text
xampp_control.exe
```

as Administrator again.

---

## Recommended Install Location

Recommended install locations:

```text
C:\xampp
D:\xampp
F:\xampp-modernized
```

Custom folder names are supported.

Examples:

```text
D:\xampp4
F:\test-public
F:\xampp-modernized-4.0.0-windows
C:\Users\YourName\Desktop\xampp-test
```

Avoid protected Windows folders:

```text
C:\Program Files\xampp
C:\Windows\xampp
```

Protected Windows folders may cause permission issues unless everything is run with Administrator permissions.

---

## Repository vs Release Downloads

The repository contains the project files.

For normal users, the recommended download is the main ZIP package from **GitHub Releases**.

Use the release assets to download:

- Main XAMPP package ZIP
- Optional PHP version add-ons
- Future updates

Do not download individual files manually unless you are modifying or contributing to the project.

---

## Main Package Download

Download the main package from the release assets:

```text
xampp-modernized-4.0.1-windows.zip
```

The main package includes:

```text
php_versions/8.5.6/
```

Additional PHP versions are separate optional downloads.

---

## Manual Setup Fallback

The Control Panel performs first-run setup automatically.

The included fallback script:

```text
setup_xampp.bat
```

is provided for manual recovery or advanced users.

Most users should run:

```text
xampp_control.exe
```

as Administrator and allow first-run setup to complete automatically.

---

## Important Notes

- This package is intended for Windows.
- Run `xampp_control.exe` as Administrator.
- Stop all running services and close `xampp_control.exe` before adding or switching PHP versions.
- Do not install over an existing XAMPP folder.
- Extract to a clean folder before first use.
- Do not manually create or place files in the `php/` folder before first run.
- The `php/` folder is created automatically from the selected version inside `php_versions/`.
- Optional PHP versions must be installed into `php_versions/`.
- If Windows blocks files, use `unblock_xampp.ps1` before running the Control Panel.
- PHP 8.5.5 is already included with the main package.
- PHP add-ons are only needed if you want to add another PHP version.
- When extracting a PHP add-on, make sure `php.exe` is directly inside the version folder.
- For best results, avoid protected system folders.

---

## Troubleshooting

### Apache fails to start

Run this from the XAMPP root folder:

```powershell
.\apache\bin\httpd.exe -t
```

If Apache reports a configuration error, check that first-run setup completed successfully.

### MySQL/MariaDB fails to start

Run this from the XAMPP root folder:

```powershell
.\mysql\bin\mysqld.exe --defaults-file=".\mysql\bin\my.ini" --console
```

If the console reports a path error, close the Control Panel and rerun first-run setup or use `setup_xampp.bat` as Administrator.

### PHP version does not appear in the dropdown

Confirm the PHP version folder exists here:

```text
php_versions/<version>/php.exe
```

Example:

```text
php_versions/8.5.6/php.exe
```

If the add-on extracted into an extra nested folder, move the version folder directly under `php_versions/`.

---

## Project Goals

The goal of this project is to provide a cleaner and more flexible XAMPP experience for Windows users.

Main goals:

- Modernize the default XAMPP dashboard.
- Improve first-run setup.
- Keep the familiar XAMPP folder layout.
- Add PHP version switching support.
- Keep PHP add-ons separate from the main package.
- Reduce release size by making extra PHP versions optional.
- Provide ready-to-use release ZIPs for users who do not want to clone the repository.
- Support portable extraction to different drives and folder names.

---

## License

This project is released under the GPL-3.0 license.

---

## Disclaimer

This project is an independent modernized XAMPP package.

It is not affiliated with, endorsed by, or maintained by Apache Friends.
