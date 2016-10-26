#!/bin/bash
yum -y update

# Download and add the MySQL repository, then update.
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum -y update

# Install MySQL and start service
yum install -y mysql-server
systemctl start mysqld
