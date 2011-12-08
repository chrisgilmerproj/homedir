#! /bin/bash

echo "CREATE DATABASE $1 DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;" | mysql -uroot -p
echo Creating DB $1
echo "grant all privileges on $1.* to $2@localhost ;" | mysql -uroot -p
echo Granting DB Privilege to $2 on $1
