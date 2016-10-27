#!/bin/bash
#yum -y -q check-update
#yum -y -q update
while getopts ":p:" o; do
    case "${o}" in
        p)
            p=${OPTARG}
            ;;
        *)
            exit;
            ;;
    esac
done

# Download and add the MySQL repository, then update.
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm

# Install MySQL and start service
yum install -y mysql-server

# Start MySQL Server
systemctl start mysqld

# Secure MySQL

/usr/bin/mysql_secure_installation <<EOF

y
$p
$p
y
y
y
y
EOF

