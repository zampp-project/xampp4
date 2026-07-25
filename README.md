# IMPORTANT PUBLICATION AND PROJECT NOTICE

> [!IMPORTANT]
> **ZAMPP is an independent software project and distribution. It is not XAMPP, is not an official XAMPP release, and is not affiliated
> with, endorsed by, sponsored by, or maintained by Apache Friends.**
>
> ZAMPP is developed, packaged, maintained, and distributed independently under the ZAMPP project name. Any references to XAMPP, Apache Friends, or
> original upstream component names are provided only where necessary for historical context, compatibility, inherited file naming, or identification
> of third-party software components.
>
> Official ZAMPP releases, updates, documentation, support information, and PHP add-ons are provided only through official ZAMPP project channels and
> designated ZAMPP release pages.
>
> **Do not represent ZAMPP packages as official XAMPP or Apache Friends releases.**
>
> Users seeking support for ZAMPP should use ZAMPP support resources. Apache Friends and the XAMPP project are not responsible for
> ZAMPP builds, modifications, packaging, updates, support, or compatibility.

---
# ZAMPP 4.0.4 Modernized

**ZAMPP 4.0.4 Modernized** is a Windows-focused ZAMPP package with a refreshed dashboard, improved first-run setup, and PHP version management built into the ZAMPP Control Panel.

This project keeps the familiar ZAMPP layout while adding modern usability improvements, including a PHP version dropdown, optional PHP add-on support, cleaner release packaging, and a better first-run experience.

> **Important:** This is an independent modernized ZAMPP package and is **not** an official Apache Friends release.

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

**Current release:** ZAMPP 4.0.4 Modernized with PHP 8.5.8

Download the main ZAMPP ZIP from the release assets, extract it to a clean folder, and run `ZAMPP-control.exe` as Administrator.

Do **not** install over an existing ZAMPP folder.

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
- PHP 8.5.8 default bundled version
- Modernized ZAMPP dashboard
- Updated setup/start/stop scripts
- PHP version dropdown in the ZAMPP Control Panel
- Optional PHP version add-on support
- Windows unblock helper script

---

## First Run Instructions

1. Download the main ZAMPP ZIP from GitHub Releases.
2. Extract it to a clean folder.

   Recommended examples:

   ```text
   D:\\ZAMPP
   D:\\ZAMPP
   D:\\ZAMPP
```

3. Do **not** extract over an existing ZAMPP folder.
4. Right-click `ZAMPP-control.exe`.
5. Choose **Run as administrator**.
6. Allow the first-run setup to complete.
7. Use the PHP version dropdown if needed.
8. Start Apache, MySQL, or any other services you want to use.

On first run, the setup process prepares the active PHP folder and required ZAMPP configuration files.

---

## PHP Version Setup

PHP 8.5.8 is included as the default bundled PHP version.

It is stored in:

```text
php_versions/8.5.8/
```

The active `php/` folder is created automatically on first run and populated/activated by `setup_ZAMPP.bat` / `ZAMPP-control.exe` using the selected PHP version from the control panel PHP version dropdown.

Do **not** manually create or place files inside the `php/` folder before first run.

Default bundled PHP version:

```text
PHP 8.5.8
```

---

## PHP Version Dropdown

The ZAMPP Control Panel includes a PHP version dropdown.

Use this dropdown to select the PHP version you want ZAMPP to use. When a PHP version is selected and applied, the control panel activates that version into the active `php/` folder.

After optional PHP add-ons are installed, those versions should also appear in the dropdown.

---

## Optional PHP Add-ons

Additional PHP versions are available as separate add-on ZIP downloads through GitHub Releases.

These add-ons allow you to add more PHP versions without downloading the full ZAMPP package again.

### Available PHP Add-ons

| PHP Version | Add-on ZIP | Purpose |
|---|---|---|
| PHP 7.3.33 | `php-7.3.33-addon.zip` | Legacy project compatibility |
| PHP 7.4.33 | `php-7.4.33-addon.zip` | Legacy project compatibility |
| PHP 8.2.12 | `php-8.2.12-addon.zip` | PHP 8.2.12 testing/support |
| PHP 8.2.31 | `php-8.2.31-addon.zip` | PHP 8.2.31 testing/support |
| PHP 8.4.20 | `php-8.4.20-addon.zip` | PHP 8.4.20 testing/support |
| PHP 8.4.22 | `php-8.4.22-addon.zip` | PHP 8.4.22 testing/support |
| PHP 8.5.4  | `php-8.5.4-addon.zip`  | PHP 8.5.4 testing/support |
| PHP 8.5.5  | `php-8.5.5-addon.zip`  | PHP 8.5.5 testing/support |
| PHP 8.5.6  | `php-8.5.6-addon.zip`  | PHP 8.5.6 testing/support |
| PHP 8.5.7  | `php-8.5.7-addon.zip`  | PHP 8.5.7 testing/support |
| PHP 8.5.8  | `php-8.5.8-addon.zip`  | PHP 8.5.8 testing/support |



PHP 8.5.8 is already bundled with the main package. You only need to download a PHP add-on if you want to add another PHP version.

---

## Installing Optional PHP Versions

To install an optional PHP version:

1. Stop all running services from the ZAMPP Control Panel.
2. Quit/close `ZAMPP-control.exe`.
3. Download the PHP version add-on ZIP you want from GitHub Releases.
4. Extract the version folder into:

   ```text
   ZAMPP/php_versions/
   ```

5. Start `ZAMPP-control.exe` again as Administrator.
6. Use the PHP version dropdown in the control panel to select the new PHP version.
7. Apply/activate the selected PHP version if prompted.
8. Start the services you need again.

Correct final path example:

```text
ZAMPP/php_versions/8.4.20/php.exe
```

Wrong path example:

```text
ZAMPP/php_versions/php-8.4.20-addon/8.4.20/php.exe
```

If your extracted path looks like the wrong example, move the version folder so `php.exe` is directly inside the version folder.

---

## Windows File Blocking

Windows may block files downloaded from GitHub because they came from the internet.

If ZAMPP does not start correctly, or if Windows blocks scripts/executables, run the included unblock helper from the extracted ZAMPP folder.

Open PowerShell as Administrator and run:

```powershell
cd "C:\path\to\ZAMPP"
powershell.exe -ExecutionPolicy Bypass -File ".\unblock_ZAMPP.ps1"
```

Example:

```powershell
cd "D:\\ZAMPP"
powershell.exe -ExecutionPolicy Bypass -File ".\unblock_ZAMPP.ps1"
```

After the unblock process finishes, run `ZAMPP-control.exe` as Administrator again.

---

## Recommended Install Location

Recommended install locations:

```text
D:\\ZAMPP
D:\\ZAMPP
D:\\ZAMPP
```

Avoid protected Windows folders:

```text
C:\Program Files\ZAMPP
C:\Windows\ZAMPP
```

Protected Windows folders may cause permission issues unless everything is run with Administrator permissions.

---

## Repository vs Release Downloads

The repository contains the project files.

For normal users, the recommended download is the main ZIP package from **GitHub Releases**.

Use the release assets to download:

- Main ZAMPP package ZIP
- Optional PHP version add-ons
- Future updates

Do not download individual files manually unless you are modifying or contributing to the project.

---

## Important Notes

- This package is intended for Windows.
- Run `ZAMPP-control.exe` as Administrator.
- Stop all running services and close `ZAMPP-control.exe` before adding or switching PHP versions.
- Do not install over an existing ZAMPP folder.
- Extract to a clean folder before first use.
- Do not manually create or place files in the `php/` folder before first run.
- The `php/` folder is created automatically from the selected version inside `php_versions/`.
- Optional PHP versions must be installed into `php_versions/`.
- If Windows blocks files, use `unblock_ZAMPP.ps1` before running the control panel.
- PHP 8.5.8 is already included with the main package.
- PHP add-ons are only needed if you want to add another PHP version.
- When extracting a PHP add-on, make sure `php.exe` is directly inside the version folder.
- For best results, avoid deeply nested paths or protected system folders.

---

## Project Goals

The goal of this project is to provide a cleaner and more flexible ZAMPP experience for Windows users.

Main goals:

- Modernize the default ZAMPP dashboard.
- Improve first-run setup.
- Keep the familiar ZAMPP folder layout.
- Add PHP version switching support.
- Keep PHP add-ons separate from the main package.
- Reduce release size by making extra PHP versions optional.
- Provide ready-to-use release ZIPs for users who do not want to clone the repository.

---

## License

This project is released under the GPL-3.0 license.

---

## Disclaimer

This project is an independent modernized ZAMPP package.

It is not affiliated with, endorsed by, or maintained by Apache Friends.

   
