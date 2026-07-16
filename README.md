# IMPORTANT PUBLICATION AND PROJECT NOTICE

> [!IMPORTANT]
> **ZAMPP is an independent software project and distribution. It is not XAMPP, is not an official XAMPP release, and is not affiliated with, endorsed by, sponsored by, or maintained by Apache Friends.**
>
> ZAMPP is developed, packaged, maintained, and distributed independently under the ZAMPP project name. References to XAMPP, Apache Friends, or original upstream component names are retained only where necessary for historical context, compatibility, inherited file naming, or identification of third-party software components.
>
> Official ZAMPP releases, updates, documentation, support information, and PHP add-ons are provided only through official ZAMPP project channels and designated ZAMPP release pages.
>
> **Do not represent ZAMPP packages as official XAMPP or Apache Friends releases.**
>
> Users seeking support for ZAMPP should use ZAMPP support resources. Apache Friends and the XAMPP project are not responsible for ZAMPP builds, modifications, packaging, updates, support, or compatibility.

---

# ZAMPP 4.0.3

**ZAMPP 4.0.3** is a Windows-focused local development environment that includes Apache, MariaDB, PHP, Perl, phpMyAdmin, and additional development services together with the ZAMPP Control Panel.

This release improves the local development experience with an updated dashboard, improved first-run setup, selectable PHP versions, optional PHP add-ons, updated runtime components, and cleaner release packaging.

---

## Latest Release

The latest public release is available from the **GitHub Releases** page.

**Current release:** ZAMPP 4.0.3 with PHP 8.5.8

Main release package:

```text
xampp-modernized-4.0.3-windows.zip
```

Download the main ZIP from the release assets, extract it to a clean folder, and run:

```text
zampp_control.exe
```

Do **not** install over an existing ZAMPP folder.

---

## Included Components

ZAMPP 4.0.3 includes:

- Apache 2.4.68
- MariaDB 12.3.2
- PHP 8.5.8
- phpMyAdmin 5.2.3
- ZAMPP Control Panel 4.0.3
- Perl
- MercuryMail
- FileZilla FTP
- Tomcat
- Modernized ZAMPP dashboard
- Updated first-run setup
- PHP version selector
- Optional PHP add-on support
- Windows unblock helper

---

## First Run Instructions

1. Download the main ZAMPP ZIP from GitHub Releases.
2. Extract it to a clean folder.

Recommended examples:

```text
C:\ZAMPP
D:\ZAMPP
C:\Development\ZAMPP
```

3. Do **not** extract over an existing ZAMPP folder.
4. Right-click `zampp_control.exe`.
5. Choose **Run as administrator**.
6. Allow the first-run setup to complete.
7. Use the PHP version selector if you need a different installed PHP version.
8. Start Apache, MariaDB, or any other services you want to use.

On first run, the ZAMPP Control Panel uses the existing `setup_xampp.bat` compatibility setup process to prepare the active PHP path and required configuration files.

---

## PHP Version Management

PHP 8.5.8 is included as the default bundled PHP version.

It is stored in:

```text
php_versions\8.5.8\
```

The active PHP path is:

```text
php\
```

The active `php\` path is created and managed automatically by the ZAMPP Control Panel. It points to the selected version stored under `php_versions\`.

Do **not** manually create or populate the active `php\` path before first run.

Default bundled PHP version:

```text
PHP 8.5.8
```

---

## PHP Version Selector

The ZAMPP Control Panel includes a PHP version selector.

Use the selector to choose from the PHP versions installed under:

```text
php_versions\
```

When a PHP version is selected and activated, the ZAMPP Control Panel updates the active `php\` path to use that version.

Installed optional PHP add-ons should automatically appear in the selector after the control panel is restarted.

---

## Optional PHP Add-ons

Additional PHP versions are available as separate add-on ZIP downloads through GitHub Releases.

These add-ons allow you to install additional PHP versions without downloading the complete ZAMPP package again.

### Available PHP Add-ons

| PHP Version | Add-on ZIP | Purpose |
|---|---|---|
| PHP 7.3.33 | `php-7.3.33-addon.zip` | Legacy project compatibility |
| PHP 7.4.33 | `php-7.4.33-addon.zip` | Legacy project compatibility |
| PHP 8.2.12 | `php-8.2.12-addon.zip` | PHP 8.2.12 compatibility and testing |
| PHP 8.2.31 | `php-8.2.31-addon.zip` | PHP 8.2.31 compatibility and testing |
| PHP 8.3.31 | `php-8.3.31-addon.zip` | PHP 8.3.31 compatibility and testing |
| PHP 8.4.20 | `php-8.4.20-addon.zip` | PHP 8.4.20 compatibility and testing |
| PHP 8.4.22 | `php-8.4.22-addon.zip` | PHP 8.4.22 compatibility and testing |
| PHP 8.5.4 | `php-8.5.4-addon.zip` | PHP 8.5.4 compatibility and testing |
| PHP 8.5.5 | `php-8.5.5-addon.zip` | PHP 8.5.5 compatibility and testing |
| PHP 8.5.6 | `php-8.5.6-addon.zip` | PHP 8.5.6 compatibility and testing |
| PHP 8.5.7 | `php-8.5.7-addon.zip` | PHP 8.5.7 compatibility and testing |
| PHP 8.5.8 | `php-8.5.8-addon.zip` | PHP 8.5.8 reinstall/reference package |

PHP 8.5.8 is already bundled with the main ZAMPP 4.0.3 package. The separate PHP 8.5.8 add-on is provided for users who need to restore or reinstall that version without downloading the complete ZAMPP package again.

---

## Installing Optional PHP Versions

To install an optional PHP version:

1. Stop all running services from the ZAMPP Control Panel.
2. Close `zampp_control.exe`.
3. Download the PHP add-on ZIP you want from GitHub Releases.
4. Extract the version folder into:

```text
ZAMPP\php_versions\
```

5. Start `zampp_control.exe` again as Administrator.
6. Select the newly installed PHP version from the control panel.
7. Activate the selected PHP version if prompted.
8. Start the services you need.

Correct final path example:

```text
ZAMPP\php_versions\8.4.20\php.exe
```

Wrong path example:

```text
ZAMPP\php_versions\php-8.4.20-addon\8.4.20\php.exe
```

If the extracted path matches the wrong example, move the version folder so `php.exe` is directly inside the version-specific folder.

---

## Windows File Blocking

Windows may block files downloaded from GitHub because they originated from the internet.

If ZAMPP does not start correctly, or if Windows blocks scripts or executables, run the included unblock helper from the extracted ZAMPP folder.

Open PowerShell as Administrator and run:

```powershell
cd "C:\path\to\ZAMPP"
powershell.exe -ExecutionPolicy Bypass -File ".\unblock_ZAMPP.ps1"
```

Example:

```powershell
cd "D:\ZAMPP"
powershell.exe -ExecutionPolicy Bypass -File ".\unblock_ZAMPP.ps1"
```

After the unblock process finishes, run `zampp_control.exe` as Administrator again.

---

## Recommended Install Locations

Recommended examples:

```text
C:\ZAMPP
D:\ZAMPP
C:\Development\ZAMPP
```

Avoid protected Windows locations such as:

```text
C:\Program Files\ZAMPP
C:\Windows\ZAMPP
```

Protected Windows folders may introduce permission issues.

---

## Repository vs Release Downloads

The repository contains the ZAMPP project source tree and project files.

For normal users, the recommended installation method is to download the packaged release assets from **GitHub Releases**.

Use the release assets for:

- the main ZAMPP package
- optional PHP add-ons
- future packaged updates

Do not download individual repository files manually unless you are reviewing, modifying, or contributing to the project source.

---

## Important Notes

- ZAMPP 4.0.3 is intended for Windows.
- Run `zampp_control.exe` as Administrator when required for service management or first-run setup.
- Stop running services before switching PHP versions.
- Close `zampp_control.exe` before manually adding PHP add-on folders.
- Do not install over an existing ZAMPP folder.
- Extract each release into a clean folder.
- Do not manually create or populate the active `php\` path before first run.
- The active `php\` path is managed automatically from the selected version under `php_versions\`.
- Optional PHP versions must be installed under `php_versions\`.
- PHP 8.5.8 is already included with the main package.
- The PHP 8.5.8 add-on is provided as a reinstall/reference package.
- When extracting a PHP add-on, make sure `php.exe` is directly inside the version folder.
- If Windows blocks downloaded files, use `unblock_ZAMPP.ps1`.
- For best results, avoid deeply nested installation paths and protected Windows system folders.

---

## Project Goals

The goal of ZAMPP is to provide a cleaner, more flexible, and independently maintained local development environment for Windows.

Current project goals include:

- Maintain a modern ZAMPP dashboard.
- Improve first-run setup and local runtime initialization.
- Preserve a familiar Windows local-development folder structure where compatibility requires it.
- Provide built-in PHP version switching.
- Keep additional PHP versions available as optional add-ons.
- Reduce unnecessary release size by keeping extra PHP versions separate.
- Provide ready-to-use release packages for users who do not want to clone the repository.
- Maintain clear separation between ZAMPP and the upstream XAMPP/Apache Friends project.

---

## License

This project is released under the GPL-3.0 license.

Individual bundled components remain subject to their respective licenses.

---

## Disclaimer

ZAMPP is an independent software project and distribution.

It is not XAMPP, is not an official XAMPP release, and is not affiliated with, endorsed by, sponsored by, or maintained by Apache Friends.
   
