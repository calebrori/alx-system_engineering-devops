# puppet manifest to replace a line in a file on a server

exec { 'fix the php extension issue':
#replace line that contains "phpp" with "php"
  command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path    => '/usr/local/bin/:/bin/'
}
