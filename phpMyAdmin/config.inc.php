<?php
/*
 * phpMyAdmin configuration for portable local ZAMPP.
 * Basic root login only. No pma controluser / advanced storage required.
 */

$cfg['blowfish_secret'] = 'xampp_local_development_only_change_me_32';

$i = 0;
$i++;

/* Basic local authentication */
$cfg['Servers'][$i]['auth_type'] = 'config';
$cfg['Servers'][$i]['user'] = 'root';
$cfg['Servers'][$i]['password'] = '';
$cfg['Servers'][$i]['extension'] = 'mysqli';
$cfg['Servers'][$i]['AllowNoPassword'] = true;
$cfg['Lang'] = '';

/* Bind to localhost IPv4 over TCP */
$cfg['Servers'][$i]['host'] = '127.0.0.1';
$cfg['Servers'][$i]['connect_type'] = 'tcp';

/*
 * Portable ZAMPP default:
 * Do not use phpMyAdmin advanced configuration storage by default.
 * This avoids requiring a pma@localhost control user or phpmyadmin database.
 */
$cfg['PmaNoRelation_DisableWarning'] = true;
$cfg['TempDir'] = __DIR__ . '/tmp';

?>
