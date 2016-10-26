#!/bin/bash
yum -y update

# install the LAMP stack
yum -y install httpd php php-mysql

# write some PHP
echo \<center\>\<h1\>My Demo App\</h1\>\<br/\>\</center\> > /var/www/html/phpinfo.php
echo \<\?php phpinfo\(\)\; \?\> >> /var/www/html/phpinfo.php

# Configure Cron to grab the latest default home page
cat >> /var/spool/cron/root << EOD
* * * * * curl -k https://cgilampdemo.blob.core.windows.net/html/index.html > /var/www/html/index.html
EOD

# Restart Cron service
service crond restart

# Grab CHI Project Assets
#wget -rkpN -e robots=off http://dev.cgicenterforhealth.org

# restart Apache
service httpd start
