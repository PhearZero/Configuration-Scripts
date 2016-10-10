#!/bin/bash
apt-get -y update

# install the LAMP stack
apt-get -y install apache2 php5 php5-mysql mysql-client

# write some PHP
echo \<center\>\<h1\>My Demo App\</h1\>\<br/\>\</center\> > /var/www/html/phpinfo.php
echo \<\?php phpinfo\(\)\; \?\> >> /var/www/html/phpinfo.php

# Configure Cron to grab the latest default home page
cat >> /var/spool/cron/root << EOD
* * * * * curl -k https://cgilampdemo.blob.core.windows.net/html/index.html > /var/www/html/index.html
EOD

# Grab CHI Project Assets
#wget -rkpN -e robots=off http://dev.cgicenterforhealth.org

# restart Apache
apachectl restart
