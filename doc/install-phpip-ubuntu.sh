#!/bin/bash
echo "
********************************
Updating Ubuntu
********************************"
# add-apt-repository universe
apt update
apt -y upgrade
echo "
********************************
Installing Apache, MySQL, PHP
********************************"
apt -y install lamp-server^ php-simplexml php-mbstring unzip git-core composer
# sed -i "s/^#application\/x-httpd-php/application\/x-httpd-php/" /etc/mime.types
echo "CREATE DATABASE phpip DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; CREATE USER phpip@localhost IDENTIFIED BY 'phpip'; GRANT ALL PRIVILEGES ON phpip.* TO phpip@localhost; SET GLOBAL log_bin_trust_function_creators = 1;" | mysql
a2enmod rewrite
echo "127.0.0.1    phpip.local" >> /etc/hosts
echo "
********************************
Getting phpIP from GitHub
********************************"
cd /var/www/html
git clone https://github.com/wilcodan/phpip.git phpip
cd phpip
composer install
cp .env.example .env
php artisan key:generate
php artisan config:clear
cp doc/phpip.conf /etc/apache2/sites-enabled/
sudo chmod -R g+rw storage
sudo chmod -R g+rw bootstrap/cache
sudo chgrp -R www-data storage
sudo chgrp -R www-data bootstrap/cache
service apache2 reload
echo "
********************************
Installing database
********************************"
php artisan migrate --seed
echo "
********************************
Install finished. If you want to populate the database with sample data run
php artisan db:seed --class=SampleSeeder
Go to http://phpip.local and login with the credentials phpipuser:changeme
********************************"
