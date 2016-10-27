#!/bin/bash
yum -y -q check-update

# Download and add the MySQL repository, then update.
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum -y -q update

# Install MySQL and start service
yum install -y mysql-server
systemctl start mysqld
