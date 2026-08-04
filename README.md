# IMPORTANT PUBLICATION AND PROJECT NOTICE

> [!IMPORTANT]
> **ZAMPP is an independent software project and distribution. It is not XAMPP, is not an official XAMPP release, and is not affiliated with, endorsed by, sponsored by, or maintained by Apache Friends.**
>
> ZAMPP is developed, packaged, maintained, and distributed independently under the ZAMPP project name. Any references to XAMPP, Apache Friends, or original upstream component names are provided only where necessary for historical context, compatibility, inherited file naming, or identification of third-party software components.
>
> Official ZAMPP releases, updates, documentation, support information, and PHP add-ons are provided only through official ZAMPP project channels and designated ZAMPP release pages.
>
> **Do not represent ZAMPP packages as official XAMPP or Apache Friends releases.**
>
> Users seeking support for ZAMPP should use ZAMPP support resources. Apache Friends and the XAMPP project are not responsible for ZAMPP builds, modifications, packaging, updates, support, or compatibility.

---

# ZAMPP 4.0.5 Modernized

**ZAMPP 4.0.5 Modernized** is a Windows-focused ZAMPP package with a refreshed dashboard, improved first-run setup, safer MariaDB shutdown handling, and PHP version management built into the ZAMPP Control Panel.

This project keeps the familiar ZAMPP layout while adding modern usability improvements, including a PHP version dropdown, optional PHP add-on support, cleaner release packaging, improved release sterilization, updated dashboard documentation, and a better first-run experience.

> [!IMPORTANT]
> This is an independent modernized ZAMPP package and is **not** an official Apache Friends release.

---

## Focus for This Release

This project focuses on:

- `README.md`
- Release descriptions
- Main ZAMPP release ZIP files
- Optional PHP add-on ZIP files
- ZAMPP Control Panel source and updates
- Updated dashboard documentation
- First-run setup and path portability
- MariaDB shutdown safety
- Release cleanup and sterilization

The main repository contains the project files, while regular users should download the ready-to-use ZIP files from **GitHub Releases**.

---

## Latest Release

The latest public release is available from the **GitHub Releases** page.

**Current release:** ZAMPP 4.0.5 Modernized with PHP 8.5.8

Download the main ZAMPP ZIP from the release assets, extract it to a clean folder, and run `zampp_control.exe` as Administrator.

> [!WARNING]
> Do **not** install over an existing ZAMPP folder.
>
> Always extract the release into a new, clean directory.

---

## Included Components

This release includes:

- Apache 2.4.68
- MariaDB 12.3.2
- phpMyAdmin 5.2.3
- MercuryMail
- FileZilla FTP Server
- Tomcat
- Perl
- PHP 8.5.8 as the default bundled PHP version
- ZAMPP Control Panel 4.0.5
- Modernized ZAMPP dashboard
- Updated setup, start, and stop scripts
- PHP version dropdown in the ZAMPP Control Panel
- Optional PHP version add-on support
- Windows unblock helper script
- Graceful MariaDB shutdown support
- Optional MariaDB shutdown credential-file support
- Updated MariaDB shutdown documentation
- Updated phpMyAdmin `controluser` and `pma` documentation
- Updated ZAMPP favicon and branding

---

## ZAMPP 4.0.5 Release Highlights

ZAMPP 4.0.5 is a maintenance, data-integrity, packaging, documentation, and control-panel usability release.

This release includes:

- Corrected MariaDB shutdown error reporting
- Graceful MariaDB shutdown in standalone mode
- Removal of forced `mysqld.exe` termination from the normal Stop action
- Improved preservation of recent MariaDB account changes
- Improved preservation of MariaDB password changes
- Improved preservation of MariaDB privilege changes
- Improved preservation of database and transaction changes
- Optional secure MariaDB shutdown credential-file support
- Added `mysql_shutdown.cnf.example`
- Added dedicated `zampp_shutdown` account documentation
- Added MariaDB `GRANT SHUTDOWN` documentation
- Added phpMyAdmin `controluser` and `pma` documentation
- Corrected PHP version selector labeling
- Improved first-run setup
- Improved PHP version activation
- Improved release cleanup
- Improved path normalization
- Corrected Apache forward-slash path handling
- Sanitized MariaDB release state
- Updated local dashboard
- Updated dashboard favicon
- Updated ZAMPP branding and project notices
- Updated optional PHP add-on support

---

## First-Run Instructions

1. Download the main ZAMPP ZIP from GitHub Releases.
2. Extract it to a clean folder.

Recommended examples:

```text
C:\ZAMPP
D:\ZAMPP
F:\ZAMPP
```

3. Do **not** extract over an existing ZAMPP folder.
4. Right-click:

```text
zampp_control.exe
```

5. Choose **Run as administrator**.
6. Allow the first-run setup to complete.
7. Confirm that the control panel reports:

```text
First-run setup completed successfully.
```

8. Start Apache.
9. Start MySQL/MariaDB.
10. Open the local ZAMPP dashboard.
11. Use the PHP version dropdown if another installed PHP version is needed.

On first run, the setup process:

- Detects the real installation path
- Rewrites portable configuration paths
- Creates the active `php\` junction
- Activates the selected PHP version
- Updates Apache PHP configuration
- Creates first-run completion state
- Prepares the local ZAMPP environment

---

## Verified First-Run Operation

The final ZAMPP 4.0.5 release candidate completed the following validation successfully:

- First-run setup completed successfully
- Installation paths were rewritten to the actual test folder
- PHP 8.5.8 activated successfully
- Apache started successfully
- MariaDB started successfully
- MariaDB completed a clean administrative shutdown
- Apache stopped successfully
- The ZAMPP Control Panel completed initialization normally

Validated control-panel output included:

```text
First-run setup completed successfully.
Active PHP version is now 8.5.8
Status change detected: running
MySQL shutdown request completed successfully.
Status change detected: stopped
```

---

## PHP Version Setup

PHP 8.5.8 is included as the default bundled PHP version.

It is stored in:

```text
php_versions\8.5.8\
```

The active PHP directory is:

```text
php\
```

The active `php\` directory is created automatically during first run from the selected PHP version under:

```text
php_versions\
```

Do **not** manually create, populate, or replace files inside the active `php\` directory before first run.

Default bundled PHP version:

```text
PHP 8.5.8
```

---

## PHP Version Dropdown

The ZAMPP Control Panel includes a PHP version dropdown labeled:

```text
PHP Version:
```

Use this dropdown to select the PHP version you want ZAMPP to use.

When a PHP version is selected, the control panel:

1. Validates the selected version folder.
2. Stops incompatible running services when required.
3. Updates the active `php\` junction.
4. Updates Apache PHP configuration.
5. Records the selected version.
6. Reports the active version in the control-panel status area.

After optional PHP add-ons are installed, those versions should appear in the dropdown automatically.

---

## Optional PHP Add-ons

Additional PHP versions are available as separate add-on ZIP downloads through GitHub Releases.

These add-ons allow users to install additional PHP versions without downloading the full ZAMPP package again.

### Available PHP Add-ons

| PHP Version | Add-on ZIP | Purpose |
|---|---|---|
| PHP 7.3.33 | `php-7.3.33-addon.zip` | Legacy project compatibility |
| PHP 7.4.33 | `php-7.4.33-addon.zip` | Legacy project compatibility |
| PHP 8.2.12 | `php-8.2.12-addon.zip` | PHP 8.2 testing and support |
| PHP 8.2.31 | `php-8.2.31-addon.zip` | Updated PHP 8.2 testing and support |
| PHP 8.4.20 | `php-8.4.20-addon.zip` | PHP 8.4 testing and support |
| PHP 8.4.22 | `php-8.4.22-addon.zip` | Updated PHP 8.4 testing and support |
| PHP 8.4.24 | `php-8.4.24-addon.zip` | Current PHP 8.4 testing and support |
| PHP 8.5.4 | `php-8.5.4-addon.zip` | PHP 8.5 testing and support |
| PHP 8.5.5 | `php-8.5.5-addon.zip` | PHP 8.5 testing and support |
| PHP 8.5.6 | `php-8.5.6-addon.zip` | PHP 8.5 testing and support |
| PHP 8.5.7 | `php-8.5.7-addon.zip` | PHP 8.5 testing and support |
| PHP 8.5.8 | `php-8.5.8-addon.zip` | Bundled-version replacement or testing |
| PHP 8.5.9 | `php-8.5.9-addon.zip` | Updated PHP 8.5 testing and support |

PHP 8.5.8 is already bundled with the main package.

You only need to download a PHP add-on when you want to add another PHP version.

---

## Installing Optional PHP Versions

To install an optional PHP version:

1. Stop all running services from the ZAMPP Control Panel.
2. Quit and close `zampp_control.exe`.
3. Download the PHP version add-on ZIP from GitHub Releases.
4. Extract the version folder into:

```text
ZAMPP\php_versions\
```

5. Confirm that `php.exe` is directly inside the version folder.
6. Start `zampp_control.exe` again as Administrator.
7. Use the PHP version dropdown to select the new PHP version.
8. Allow the control panel to activate the selected version.
9. Start Apache and any other required services.

Correct final path example:

```text
ZAMPP\php_versions\8.4.24\php.exe
```

Incorrect path example:

```text
ZAMPP\php_versions\php-8.4.24-addon\8.4.24\php.exe
```

If the extracted path matches the incorrect example, move the version folder so `php.exe` is directly inside:

```text
ZAMPP\php_versions\8.4.24\
```

---

## Graceful MariaDB Shutdown

ZAMPP Control Panel 4.0.5 uses MariaDB's administrative shutdown mechanism when MariaDB is running in standalone mode.

This allows MariaDB to:

- Flush pending database changes
- Close storage engines correctly
- Preserve recent database changes
- Preserve account and password changes
- Preserve privilege-table updates
- Finish transaction-log processing
- Stop without forced process termination

If the graceful shutdown request fails, the control panel reports the failure and leaves MariaDB running.

The normal Stop action does not automatically force-terminate:

```text
mysqld.exe
```

When MariaDB is installed as a Windows service, ZAMPP uses the Windows Service Control Manager.

---

## Corrected MariaDB Shutdown Error Reporting

Earlier shutdown handling could display a misleading message such as:

```text
Unable to stop MySQL cleanly, return code: 1 - Incorrect function.
```

The `mysqladmin` application exit code was being interpreted as though it were a Windows system error code.

ZAMPP Control Panel 4.0.5 now reports the administrative shutdown failure directly and provides guidance when MariaDB shutdown credentials are missing or invalid.

Example:

```text
Unable to stop MySQL cleanly. mysqladmin returned exit code 1.
Check mysql_shutdown.cnf and the MariaDB log.
```

The control panel does not automatically force-terminate MariaDB when the graceful shutdown request fails.

---

## MariaDB Shutdown Credentials

Fresh local installations can continue using the bundled passwordless local `root` configuration.

Users who protect the MariaDB `root` account must configure shutdown credentials so the ZAMPP Control Panel can continue to stop MariaDB cleanly.

ZAMPP includes:

```text
mysql\bin\mysql_shutdown.cnf.example
```

To configure shutdown credentials:

1. Copy:

```text
mysql_shutdown.cnf.example
```

2. Rename the copied file to:

```text
mysql_shutdown.cnf
```

3. Enter the appropriate local MariaDB credentials.

Example:

```ini
[client]
user=zampp_shutdown
password=REPLACE_WITH_SECURE_PASSWORD
host=localhost
protocol=tcp
```

The completed file must be stored at:

```text
mysql\bin\mysql_shutdown.cnf
```

> [!WARNING]
> Never commit, upload, publish, distribute, or include `mysql_shutdown.cnf` in a public release.
>
> The file may contain a private MariaDB username and password.

The public ZAMPP package includes only:

```text
mysql_shutdown.cnf.example
```

---

## Recommended Dedicated Shutdown Account

Instead of storing the MariaDB `root` credentials, users may create a dedicated local account with only the `SHUTDOWN` privilege.

Example:

```sql
CREATE USER 'zampp_shutdown'@'localhost'
IDENTIFIED BY 'REPLACE_WITH_SECURE_PASSWORD';

GRANT SHUTDOWN ON *.* TO 'zampp_shutdown'@'localhost';

FLUSH PRIVILEGES;
```

Recommended role separation:

```text
root
  Full MariaDB administration

zampp_shutdown
  ZAMPP Control Panel graceful shutdown only

pma / controluser
  Optional phpMyAdmin configuration storage only
```

The optional phpMyAdmin `pma` account should not be reused as the ZAMPP shutdown account.

---

## phpMyAdmin `controluser` and `pma`

The phpMyAdmin `controluser` is an optional MariaDB account used for advanced phpMyAdmin configuration-storage features.

These features may include:

- Bookmarks
- Relation metadata
- Saved searches
- User preferences
- Configuration storage

The `controluser` is not required for normal phpMyAdmin login.

ZAMPP 4.0.5 does not require a `pma` account by default.

The `pma` account is not used by the ZAMPP Control Panel to stop MariaDB and should not be granted `SHUTDOWN` simply to reuse it for another purpose.

Applications using Doctrine or another database abstraction layer should use their own dedicated application database account.

---

## Dashboard Documentation

The local ZAMPP dashboard includes documentation for:

- `mysql_shutdown.cnf`
- The dedicated `zampp_shutdown` account
- MariaDB `GRANT SHUTDOWN`
- phpMyAdmin `controluser`
- The optional `pma` account
- Password rotation
- Privilege verification
- Account removal
- Role separation
- Failed-shutdown troubleshooting

The dashboard also includes updated ZAMPP favicon and branding assets.

---

## Windows File Blocking

Windows may block files downloaded from GitHub because they originated from the internet.

If ZAMPP does not start correctly, or if Windows blocks scripts or executables, run the included unblock helper from the extracted ZAMPP folder.

Open PowerShell as Administrator and run:

```powershell
Set-Location "C:\path\to\ZAMPP"

powershell.exe -NoProfile -ExecutionPolicy Bypass `
  -File ".\unblock_ZAMPP.ps1"
```

Example:

```powershell
Set-Location "D:\ZAMPP"

powershell.exe -NoProfile -ExecutionPolicy Bypass `
  -File ".\unblock_ZAMPP.ps1"
```

After the unblock process finishes, run `zampp_control.exe` as Administrator again.

---

## Recommended Install Location

Recommended install locations:

```text
C:\ZAMPP
D:\ZAMPP
F:\ZAMPP
```

Avoid protected Windows folders:

```text
C:\Program Files\ZAMPP
C:\Windows\ZAMPP
```

Protected Windows folders may cause permission, junction, configuration, service, or log-writing issues.

For best results:

- Use a short installation path
- Avoid deeply nested folders
- Avoid special characters in the directory name
- Do not install over an existing ZAMPP directory

---

## Upgrading From an Earlier Release

Before upgrading:

1. Stop Apache, MariaDB, and all other services.
2. Exit the ZAMPP Control Panel.
3. Back up your websites and application files.
4. Export or back up your databases.
5. Back up custom Apache, PHP, MariaDB, and phpMyAdmin configuration.
6. Extract ZAMPP 4.0.5 into a new folder.
7. Complete first-run setup.
8. Verify Apache and MariaDB startup.
9. Restore projects and databases selectively.
10. Reapply reviewed configuration changes manually.

Do not overwrite an existing ZAMPP installation with the 4.0.5 ZIP.

---

## Repository vs. Release Downloads

The repository contains project files, documentation, and development resources.

For normal users, the recommended download is the main ZIP package from **GitHub Releases**.

Use release assets to download:

- Main ZAMPP package ZIP
- Optional PHP version add-ons
- Release notes
- Checksums
- Future maintenance updates

Do not download individual files manually unless you are modifying or contributing to the project.

---

## Important Notes

- This package is intended for Windows.
- Run `zampp_control.exe` as Administrator.
- Stop all running services and close `zampp_control.exe` before adding or switching PHP versions.
- Do not install over an existing ZAMPP folder.
- Extract to a clean folder before first use.
- Do not manually create or place files in the active `php\` folder before first run.
- The active `php\` folder is created automatically from the selected version inside `php_versions\`.
- Optional PHP versions must be installed into `php_versions\`.
- If Windows blocks files, use `unblock_ZAMPP.ps1` before running the control panel.
- PHP 8.5.8 is already included with the main package.
- PHP add-ons are only needed when another PHP version is required.
- When extracting a PHP add-on, make sure `php.exe` is directly inside the version folder.
- For best results, avoid deeply nested paths and protected system folders.
- Users who change the MariaDB `root` password should configure `mysql_shutdown.cnf` or create a dedicated `zampp_shutdown` account.
- Never include private credential files in a public release.

---

## Project Goals

The goal of this project is to provide a cleaner, safer, and more flexible ZAMPP experience for Windows users.

Main goals:

- Modernize the default ZAMPP dashboard
- Improve first-run setup
- Keep the familiar ZAMPP folder layout
- Add PHP version switching support
- Keep PHP add-ons separate from the main package
- Reduce release size by making extra PHP versions optional
- Improve MariaDB shutdown safety
- Improve release cleanup and path portability
- Provide ready-to-use release ZIPs for users who do not want to clone the repository
- Maintain independent ZAMPP branding and documentation

---

## Security Notes

> [!WARNING]
> Never commit or publicly distribute:
>
> - MariaDB usernames or passwords
> - `mysql_shutdown.cnf`
> - Shutdown credential files
> - Private keys
> - Local `.env` files
> - API tokens
> - Local database backups containing private data
> - Test logs or machine-specific paths

The public release includes only:

```text
mysql_shutdown.cnf.example
```

The real credential file must be created locally by the user.

---

## License

This project is released under the GPL-3.0 license.

Third-party software included with ZAMPP remains subject to the licenses of its respective projects and contributors.

---

## Disclaimer

ZAMPP is an independent modernized Windows local development package.

It is not affiliated with, endorsed by, sponsored by, or maintained by Apache Friends.

Apache, MariaDB, PHP, phpMyAdmin, Perl, FileZilla, Tomcat, MercuryMail, and other included components remain the property of their respective projects and contributors. Their inclusion does not imply sponsorship, endorsement, or affiliation.


   
