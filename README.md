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

# ZAMPP 4.0.4

**ZAMPP 4.0.4** is a Windows-focused local development environment that includes Apache, MariaDB, PHP, Perl, phpMyAdmin, and additional development services together with the ZAMPP Control Panel.

This release adds graceful MariaDB shutdown handling, removes forced `mysqld.exe` termination from the normal Stop action, improves preservation of recent MariaDB account and database changes, restores Windows taskbar and notification-area behavior, adds service-control safeguards, updates first-run setup and PHP version selection, refreshes the local dashboard, improves release cleanup and path normalization, sanitizes the packaged MariaDB state, updates ZAMPP branding and project notices, and expands optional PHP add-on support.

---

## Latest Release

The latest public release is available from the **GitHub Releases** page.

**Current release:** ZAMPP 4.0.4 with PHP 8.5.8

Main release package:

```text
xampp-modernized-4.0.4-windows.zip
```

Download the main ZIP from the release assets, extract it to a clean folder, and run:

```text
zampp_control.exe
```

Do **not** install over an existing ZAMPP folder.

---

## What Is New in ZAMPP 4.0.4

ZAMPP 4.0.4 includes control-panel fixes, safer MariaDB shutdown handling, restored Windows notification-area behavior, service-control safeguards, updated setup components, refreshed branding, release cleanup improvements, and expanded PHP add-on support.

### ZAMPP Control Panel 4.0.4

* Updated the ZAMPP Control Panel to version 4.0.4.
* Improved and reinstated Windows taskbar and notification-area behavior.
* Restored minimize-to-notification-area support.
* Restored tray-icon double-click behavior.
* Restored tray-icon **Show/Hide** behavior.
* Corrected ZAMPP taskbar icons.
* Corrected ZAMPP notification-area icons.
* Unified main-window, taskbar, and tray-icon branding.
* Disabled the Apache **Svc** control while Apache is running.
* Disabled the MySQL **Svc** control while MariaDB is running.
* Automatically restores the Apache **Svc** control after Apache stops.
* Automatically restores the MySQL **Svc** control after MariaDB stops.

### MariaDB Shutdown and Data Preservation

* Added graceful MariaDB shutdown in standalone mode.
* Removed forced `mysqld.exe` termination from the normal **Stop** action.
* Improved preservation of recent MariaDB account changes.
* Improved preservation of recent MariaDB password changes.
* Improved preservation of recent MariaDB privilege changes.
* Improved preservation of recent MariaDB database changes.
* Added optional secure MariaDB shutdown credential-file support.
* Sanitized the MariaDB release state before packaging.

### Setup, PHP, and Dashboard Updates

* Updated first-run setup.
* Updated PHP version selector support.
* Updated the local ZAMPP dashboard.
* Added optional PHP add-ons for multiple PHP branches.

### Packaging, Paths, and Branding

* Improved release cleanup.
* Improved path normalization.
* Updated ZAMPP branding.
* Updated ZAMPP project notices.
* Updated independent-project disclosures.

---

## Included Components

ZAMPP 4.0.4 includes:

* Apache 2.4.68
* MariaDB 12.3.2
* PHP 8.5.8
* phpMyAdmin 5.2.3
* ZAMPP Control Panel 4.0.4
* Perl
* MercuryMail
* FileZilla FTP
* Tomcat
* Modernized ZAMPP dashboard
* Updated first-run setup
* PHP version selector
* Optional PHP add-on support
* Windows unblock helper

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

> [!NOTE]
> The inherited `setup_xampp.bat` filename is retained for compatibility. Its presence does not mean that ZAMPP is an official XAMPP or Apache Friends distribution.

---

## MariaDB Shutdown Behavior

ZAMPP 4.0.4 improves how MariaDB is stopped from the ZAMPP Control Panel.

The normal **Stop** action now uses graceful MariaDB shutdown handling in standalone mode.

The normal Stop action no longer forcibly terminates:

```text
mysqld.exe
```

This change improves preservation of recent MariaDB changes, including:

* User accounts
* Password changes
* Privilege changes
* Database changes
* Table changes
* Recently committed configuration updates

Forced process termination is not part of the normal MariaDB Stop action.

If MariaDB does not stop normally, investigate the MariaDB log and running process state before manually terminating `mysqld.exe`.

---

## Optional Secure MariaDB Shutdown Credentials

ZAMPP 4.0.4 supports optional secure MariaDB shutdown credential-file handling.

This can be used when MariaDB requires authenticated administrative access to complete a graceful shutdown.

The credential file should:

* Be stored locally.
* Be readable only by the intended Windows account.
* Not be committed to GitHub.
* Not be included in public release archives.
* Not be stored in a publicly accessible web directory.
* Use the minimum privileges required for shutdown.
* Be removed or rotated when no longer needed.



---

## Windows Taskbar and Notification-Area Behavior

ZAMPP 4.0.4 restores and improves Windows taskbar and notification-area integration.

The updated control panel includes:

* Minimize-to-notification-area support
* Restored notification-area icon behavior
* Tray-icon double-click support
* Tray-icon **Show/Hide** support
* Corrected taskbar icons
* Corrected notification-area icons
* Unified branding across the main window, Windows taskbar, and notification area

When minimize-to-notification-area behavior is enabled, minimizing the ZAMPP Control Panel can hide the main window while keeping the control panel accessible from the notification-area icon.

Double-clicking the notification-area icon restores or hides the main window as supported by the active control-panel state.

---

## Service Control Safeguards

The Apache and MySQL **Svc** controls are protected while their corresponding modules are running.

While Apache is running:

```text
Apache Svc
```

is disabled.

While MariaDB is running:

```text
MySQL Svc
```

is disabled.

The controls are automatically restored after the corresponding module stops.

This prevents service-installation or service-removal actions from being triggered while the related module is active.

> [!IMPORTANT]
> Stop the corresponding module before changing its Windows service registration.

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

> [!WARNING]
> Stop all running services before switching PHP versions.

---

## Optional PHP Add-ons

Additional PHP versions are available as separate add-on ZIP downloads through GitHub Releases.

These add-ons allow you to install additional PHP versions without downloading the complete ZAMPP package again.

### Available PHP Add-ons

| PHP Version | Add-on ZIP             | Purpose                               |
| ----------- | ---------------------- | ------------------------------------- |
| PHP 7.3.33  | `php-7.3.33-addon.zip` | Legacy project compatibility          |
| PHP 7.4.33  | `php-7.4.33-addon.zip` | Legacy project compatibility          |
| PHP 8.2.12  | `php-8.2.12-addon.zip` | PHP 8.2.12 compatibility and testing  |
| PHP 8.2.31  | `php-8.2.31-addon.zip` | PHP 8.2.31 compatibility and testing  |
| PHP 8.3.31  | `php-8.3.31-addon.zip` | PHP 8.3.31 compatibility and testing  |
| PHP 8.4.20  | `php-8.4.20-addon.zip` | PHP 8.4.20 compatibility and testing  |
| PHP 8.4.22  | `php-8.4.22-addon.zip` | PHP 8.4.22 compatibility and testing  |
| PHP 8.5.4   | `php-8.5.4-addon.zip`  | PHP 8.5.4 compatibility and testing   |
| PHP 8.5.5   | `php-8.5.5-addon.zip`  | PHP 8.5.5 compatibility and testing   |
| PHP 8.5.6   | `php-8.5.6-addon.zip`  | PHP 8.5.6 compatibility and testing   |
| PHP 8.5.7   | `php-8.5.7-addon.zip`  | PHP 8.5.7 compatibility and testing   |
| PHP 8.5.8   | `php-8.5.8-addon.zip`  | PHP 8.5.8 reinstall/reference package |

PHP 8.5.8 is already bundled with the main ZAMPP 4.0.4 package.

The separate PHP 8.5.8 add-on is provided for users who need to restore or reinstall that version without downloading the complete ZAMPP package again.

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

Correct general structure:

```text
ZAMPP\php_versions\<version>\php.exe
```

---

## Updated First-Run Setup

ZAMPP 4.0.4 includes updates to the first-run setup process.

The first-run setup prepares:

* The active PHP path
* Runtime configuration
* Required local paths
* Control-panel configuration
* Version-selector integration
* Local dashboard paths
* Compatibility configuration files

The setup process also includes improved path normalization to reduce issues caused by:

* Mixed path separators
* Duplicate separators
* Trailing separators
* Relative path fragments
* Incorrect installation-root detection
* Deeply nested extraction paths

For best results, extract ZAMPP to a short and stable local path before first run.

---

## Updated Local Dashboard

ZAMPP 4.0.4 includes an updated local dashboard.

The dashboard has been updated to align with:

* Current ZAMPP branding
* ZAMPP 4.0.4 project notices
* Local development navigation
* Current PHP version handling
* Updated runtime paths
* Independent-project disclosures

The local dashboard is intended for local development use only.

Do not expose the ZAMPP dashboard directly to the public internet.

---

## Release Cleanup and Path Normalization

ZAMPP 4.0.4 includes improved release cleanup and path normalization.

Release cleanup reduces unnecessary development or machine-specific state in the packaged release.

Path normalization improves handling of installation paths and runtime references across:

* First-run setup
* PHP version selection
* Dashboard paths
* Apache configuration
* MariaDB configuration
* Control-panel module paths
* Release extraction locations

Users should still avoid:

* Deeply nested installation paths
* Protected Windows directories
* Installing over an existing ZAMPP directory
* Moving the installation while services are running
* Manually editing generated active-runtime paths

---

## Sanitized MariaDB Release State

The MariaDB state included with the ZAMPP 4.0.4 release has been sanitized for public distribution.

Release sanitization is intended to prevent development-machine or packaging-state information from being carried into the public release.

Sanitized release state may include cleanup of:

* Temporary files
* Runtime process files
* Stale logs
* Packaging-only state
* Machine-specific state
* Test accounts not intended for release
* Test databases not intended for release
* Temporary credential material
* Stale shutdown or lock files

Users should create their own MariaDB accounts, passwords, privileges, and databases after installation.

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

> [!IMPORTANT]
> Only run the unblock helper included with an official ZAMPP release obtained through an official ZAMPP project channel.

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

For best results:

* Use a short installation path.
* Avoid deeply nested folders.
* Avoid protected Windows system folders.
* Do not use a network-mounted path for the primary installation.
* Do not install over an existing ZAMPP folder.

---

## Repository vs Release Downloads

The repository contains the ZAMPP project source tree and project files.

For normal users, the recommended installation method is to download the packaged release assets from **GitHub Releases**.

Use the release assets for:

* The main ZAMPP package
* Optional PHP add-ons
* Future packaged updates
* Restore or reinstall packages
* Other user-ready distribution files

Do not download individual repository files manually unless you are reviewing, modifying, or contributing to the project source.

> [!NOTE]
> GitHub-generated source-code ZIP and TAR archives may not contain the same prepared structure, generated files, configuration, or packaged runtime components as the official ZAMPP release assets.

---

## Important Notes

* ZAMPP 4.0.4 is intended for Windows.
* Run `zampp_control.exe` as Administrator when required for service management or first-run setup.
* Stop running services before switching PHP versions.
* Close `zampp_control.exe` before manually adding PHP add-on folders.
* Do not install over an existing ZAMPP folder.
* Extract each release into a clean folder.
* Do not manually create or populate the active `php\` path before first run.
* The active `php\` path is managed automatically from the selected version under `php_versions\`.
* Optional PHP versions must be installed under `php_versions\`.
* PHP 8.5.8 is already included with the main package.
* The PHP 8.5.8 add-on is provided as a reinstall/reference package.
* When extracting a PHP add-on, make sure `php.exe` is directly inside the version folder.
* If Windows blocks downloaded files, use `unblock_ZAMPP.ps1`.
* For best results, avoid deeply nested installation paths and protected Windows system folders.
* The normal MariaDB Stop action uses graceful shutdown handling.
* The normal MariaDB Stop action does not forcibly terminate `mysqld.exe`.
* Apache and MySQL **Svc** controls are disabled while their corresponding modules are running.
* Service controls are automatically restored after the corresponding module stops.
* MariaDB shutdown credential files must not be committed to GitHub.
* The ZAMPP dashboard is intended for local development use only.
* Use release assets rather than GitHub-generated source archives for normal installation.
* Inherited XAMPP-related filenames are retained only where required for compatibility.

---

## Project Goals

The goal of ZAMPP is to provide a cleaner, more flexible, and independently maintained local development environment for Windows.

Current project goals include:

* Maintain a modern ZAMPP dashboard.
* Improve first-run setup and local runtime initialization.
* Preserve a familiar Windows local-development folder structure where compatibility requires it.
* Provide built-in PHP version switching.
* Keep additional PHP versions available as optional add-ons.
* Reduce unnecessary release size by keeping extra PHP versions separate.
* Provide ready-to-use release packages for users who do not want to clone the repository.
* Improve graceful MariaDB shutdown handling.
* Protect recent MariaDB account, password, privilege, and database changes.
* Maintain reliable Windows taskbar and notification-area behavior.
* Prevent unsafe service-control changes while modules are running.
* Improve release cleanup and path normalization.
* Sanitize packaged database state before public distribution.
* Maintain clear separation between ZAMPP and the upstream XAMPP and Apache Friends projects.

---

## License

This project is released under the GPL-3.0 license.

Individual bundled components remain subject to their respective licenses.

The inclusion of a third-party component does not transfer ownership of that component to the ZAMPP project and does not replace the component's original license terms.

---

## Support

Support for ZAMPP should be obtained only through official ZAMPP project channels and designated ZAMPP support resources.

Do not request ZAMPP support from Apache Friends or the XAMPP project.

Apache Friends and the XAMPP project are not responsible for:

* ZAMPP installation
* ZAMPP configuration
* ZAMPP compatibility
* ZAMPP modifications
* ZAMPP release packages
* ZAMPP PHP add-ons
* ZAMPP updates
* ZAMPP documentation
* ZAMPP support

---

## Disclaimer

ZAMPP is an independent software project and distribution.

It is not XAMPP, is not an official XAMPP release, and is not affiliated with, endorsed by, sponsored by, distributed by, or maintained by Apache Friends.

References to XAMPP, Apache Friends, inherited filenames, folder structures, or upstream component names are retained only where necessary for historical context, compatibility, inherited file naming, or identification of third-party software components.
