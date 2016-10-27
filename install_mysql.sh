#!/bin/bash
sudo yum -y update

# Download and add the MySQL repository, then update.
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
sudo yum -y update

# Install MySQL and start service
sudo yum install -y mysql-server
sudo systemctl start mysqld
