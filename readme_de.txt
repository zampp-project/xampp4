###### ApacheFriends ZAMPP Version 8.5.8 ######

Wichtig! PHP in diesem Paket benÃ¶tigt die Microsoft Visual C++ 2019 Redistributable Erweiterung von
http://www.microsoft.com/en-us/download/. Bitte stellen Sie sicher das die VC++ 2019
Runtime Bibliothek auf Ihrem System installiert ist.

  + Apache 2.4.67
  + MariaDB 11.8.6
  + PHP 8.5.8 (VS16 X86 64bit thread safe) + PEAR
  + phpMyAdmin 5.2.3
  + OpenSSL 3.6.1
  + ADOdb 518a
  + Mercury Mail Transport System v4.63 (not included in the portable version)
  + FileZilla FTP Server 0.9.41 (not included in the portable version)
  + Webalizer 2.23-04 (not included in the portable version)
  + Strawberry Perl 5.32.1.1 Portable
  + Tomcat 8.5.96
  + XAMPP Control Panel Version 4.0.3.
  + XAMPP mailToDisk 1.0 (schreibt verdendete Mails Ã¼ber PHP auf die Festplatte unter <xampp>\mailoutput. In der php.ini als Mail Default aktiviert.)

---------------------------------------------------------------

* System-Voraussetzungen:

  + 64 MB RAM (EMPFOHLEN)
  + 750 MB freier Speicherplatz
  + Windows 7, Windows 8, Windows 10

* ACHTUNG!!!!

Wenn ihr Probleme mit der mysql Verbindung via php bzw. phpMyAdmin (pber die mysqlnd API) habt dann schaut bitte unbedingt hier:
http://localhost/xampp/index.php


* SCHNELLINSTALLATION:

[HINWEIS: Auf die obersten Hirachie eines beliebigen Laufwerks bzw. auf dem WechseldatentrÃ¤ger des USB-Sticks entpacken => E:\ oder W:\. Es entsteht E:\xampp oder W:\xampp. FÃ¼r den USB-Stick nicht die "setup_xampp.bat" nutzen, um ihn auch transportabel nutzen zu kÃ¶nnen!]

Schritt 1: Das Setup mit der Datei "setup_xampp.bat" im XAMPP-Verzeichnis starten. Bemerkung: XAMPP macht selbst keine EintrÃ¤ge in die Windows Registry und setzt auch keine Systemvariablen.

Schritt 2: Starten Sie den Apache2 mit PHP5.x mit dem Control Panel (xampp-control.exe) oder wahlweise mit => \xampp\apache_start.bat.
Stoppen Sie den Apache2 mit PHP5.x mit dem Control Panel (xampp-control.exe) oder wahlweise mit => \xampp\apache_stop.bat.

Schritt 3: Starten Sie MySQL mit dem Control Panel (xampp-control.exe) oder wahlweise mit => \xampp\mysql_start.bat.
Stoppen Sie MySQL mit dem Control Panel (xampp-control.exe) oder wahlweise mit => \xampp\mysql_stop.bat.

Schritt 4: Ã–ffne deinen Browser und gebe http://127.0.0.1 oder http://localhost ein. Danach gelangst du zu den zahlreichen ApacheFriends-Beispielen auf Ihrem lokalen Server.

Schritt 5: Das Root-Verzeichnis (Hauptdokumente) fÃ¼r HTTP (oft HTML) ist => D:\\xampp\htdocs. PHP kann die Endungen  *.php, *.phtml haben, *.shtml fÃ¼r SSI, *.cgi fÃ¼r CGI (z. B.: Perl).

Schritt 6: XAMPP DEINSTALLIEREN?
Einfach das "XAMPP"-Verzeichnis lÃ¶schen. Vorher aber alle Server stoppen
bzw. als Dienste deinstallieren.

---------------------------------------------------------------

* PHP MAIL FUNCTION:

Es gibt drei Arten die PHP Mail function testweise zu benutzen.

1) Mit XAMPP mailToDisk wird jede Email die Ã¼ber die Mail Funktion von PHP versendet wird nach <xampp>\mailoutput geschrieben. MailToDisk ist Standard und Bedarf keine Ã„nderung in der php.ini. MailToDisk keinesfalls produktiv einsetzen!
2) Mit fakemail (sendmail.exe) werden alle Mails versendet mit PHP mail() in ein von ihnen definiertes externes Postfach geschickt. Zuvor mÃ¼ssen sie ihr Postfach in der <xampp>\sendmail\sendmail.ini konfigurieren und auch die sendmail.exe in der php.ini aktivieren.
3) Sie bnutzen einen eigenen SMTP Server wie der im XAMPP integrierte Mercury Mail Server oder einen externen SMTP Server (wie IIS). Hierzu kommentieren sie in der php.ini alle sendmail_path Zeilen aus und kommentieren dafÃ¼r die Zeilen -> SMTP = localhost und -> smtp_port = 25 mit ihren Daten ein.

ACHTUNG: Wenn sie im Installationspfad Leerzeichen verwenden (wie c:\program files\xampp), wird mailToDisk und fakemail (sendmail.exe) u.U. nicht funktionieren. In diesem Fall den <xampp>\mailtodisk bzw. <xampp>\sendmail in ein Vereichnis ohne Leerzeichen kopieren und den neuen Pfad entsprechend in der php.ini aktualisieren.

---------------------------------------------------------------

* PASSWÃ–RTER:

1) MySQL:

   Benutzer: root
   Passwort:
   (also kein Passwort!)

2) FileZilla FTP:

   [ Sie mÃ¼ssen erst einen neuen Benutzer Ã¼ber das User FileZilla Interface erstellen. ]

3) Mercury:

   Postmaster: Postmaster (postmaster@localhost)
   Administrator: Admin (admin@localhost)

   TestUser: newuser
   Passwort: wampp

4) WEBDAV:

   Benutzer: xampp-dav-unsecure
   Password: ppmax2011

---------------------------------------------------------------

* NUR FÃœR NT-SYSTEME! (NT4 | Windows 2000 | Windows XP | Windows 2003):

- \xampp\apache\apache_installservice.bat
  ===> Installiert den Apache 2 als Dienst

- \xampp\apache\apache_uninstallservice.bat
  ===> Deinstalliert den Apache 2 als Dienst

- \xampp\mysql\mysql_installservice.bat
  ===> Installiert MySQL als Dienst

- \xampp\mysql\mysql_uninstallservice.bat
  ===> Deinstalliert MySQL als Dienst

==> Nach allen De- / Installationen der Dienste, System unbedingt neustarten!

---------------------------------------------------------------

* DAS THEMA SICHERHEIT:

Wie schon an anderer Stelle erwÃ¤hnt ist XAMPP nicht fÃ¼r den Produktionseinsatz gedacht, sondern nur fÃ¼r Entwickler in Entwicklungsumgebungen. Das hat zur Folge, dass XAMPP absichtlich nicht restriktiv sondern im Gegenteil sehr offen vorkonfiguriert ist. FÃ¼r einen Entwickler ist das ideal, da er so keine Grenzen vom System vorgeschrieben bekommt.
FÃ¼r einen Produktionseinsatz ist das allerdings Ã¼berhaupt nicht geeignet!
Hier eine Liste, der Dinge, die an XAMPP absichtlich (!) unsicher sind:

- Der MySQL-Administrator (root) hat kein Passwort.
- Der MySQL-Daemon ist Ã¼bers Netzwerk erreichbar.
- phpMyAdmin ist Ã¼ber das Netzwerk erreichbar.
- In dem XAMPP-Demo-Seiten (die man unter http://localhost/ findet) gibt es den Punkt "Sicherheitscheck".
  Dort kann man sich den aktuellen Sicherheitszustand seiner XAMPP-Installation anzeigen lassen.

---------------------------------------------------------------

* MYSQL-Hinweise:

(1) Um den MySQL-Daemon zu starten bitte Doppelklick auf \xampp\mysql_start.bat.
Der MySQL Server startet dann im Konsolen-Modus. Das dazu gehÃ¶rige Konsolenfenster muss offen bleiben (!!) Zum Stop bitte die mysql_stop.bat benutzen!

(2) Wer MySQL als Dienst unter NT / 2000 / XP benutzen mÃ¶chte, muss unbedingt (!) vorher die "my" bzw."my.ini unter C:\ (also C:\my.ini) implementieren. Danach die "mysql_installservice.bat" im Ordner "mysql" aktivieren. Dienste funktionieren generell NICHT unter Windows Home-Versionen.

(3) Der MySQL-Server startet ohne Passwort fÃ¼r MySQl-Administrator "root".
FÃ¼r eine Zugriff in PHP sÃ¤he das also aus:

	mysql_connect("localhost", "root", "");

Ein Passwort fÃ¼r "root" kÃ¶nnt ihr Ã¼ber den MySQL-Admin in der Eingabeaufforderung
setzen. Z. B.:

	D:\\xampp\mysql\bin\mysqladmin.exe -u root -p geheim

Wichtig: Nach dem Einsetzen eines neuen Passwortes fÃ¼r Root muss auch phpMyAdmin informiert werden! Das geschieht Ã¼ber die Datei "config.inc.php"; zu finden als D:\\xampp\phpmyadmin\config.inc.php. Dort also folgenden
Zeilen editieren:

	$cfg['Servers'][$i]['user']            = 'root';   // MySQL User
	$cfg['Servers'][$i]['auth_type']       = 'http';   // HTTP-Authentifzierung

So wird zuerst das "root"-Passwort vom MySQL-Server abgefragt, bevor phpMyAdmin zugreifen darf.

---------------------------------------------------------------

		Have a lot of fun! | Viel SpaÃŸ! | Bonne Chance!
