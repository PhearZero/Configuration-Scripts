#!/bin/bash
apt-get -y update

# install the LAMP stack
apt-get -y install apache2 php5 php5-mysql  

# write some PHP
echo \<center\>\<h1\>My Demo App\</h1\>\<br/\>\</center\> > /var/www/html/phpinfo.php
echo \<\?php phpinfo\(\)\; \?\> >> /var/www/html/phpinfo.php

# Pull over CHI Project Assets
cd /var/www/html/
wget -rkpN -e robots=off http://dev.cgicenterforhealth.org

# restart Apache
apachectl restart
