#!/bin/bash

echo "welcome to owncloud installation ☁️ ☁️ ☁️
this installation is for ec2 ubuntu 22.04 amazon instance 💻 💻 💻" 


echo "updating your system 🔄 🔄 🔄 🔄"

sudo apt update -y

echo "installing the neccessary dependencies (mysql and apache) 💾💾💾💾"

sudo apt install apache2 -y
sudo apt install mysql-server -y
sudo apt install unzip -y
echo "installing php version 7.* 💾💾💾💾💾"
echo "adding repository and updating the system  📁 📁 📁 📁 📁"
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update -y

sudo apt install -y php7.4 php7.4-{opcache,gd,curl,mysqlnd,intl,json,ldap,mbstring,mysqlnd,xml,zip}

echo "starting and enabling apache and mysql 🚀🚀🚀🚀🚀"
sudo systemctl start apache2 && sudo systemctl enable apache2
sudo systemctl start mysql && sudo systemctl enable mysql

echo "creating a database 📁 📁 📁 📁 📁"
echo "what passwrd do you want for your database 🔐 🔐 🔐 🔐"
read -s sec_db_pwd
mysql -u root -e "CREATE DATABASE IF NOT EXISTS owncloud; \
GRANT ALL PRIVILEGES ON owncloud.* \
  TO owncloud@localhost \
  IDENTIFIED BY '${sec_db_pwd}'";

echo "installing own cloud 💾💾💾💾"
wget https://download.owncloud.com/server/stable/owncloud-complete-latest.zip
sudo unzip -q owncloud-complete-latest.zip -d /var/www/
echo "making directories and configering permisions ⚙️ ⚙️ ⚙️ ⚙️ "

sudo mkdir -p /var/www/owncloud/data
sudo chown -R www-data:www-data /var/www/owncloud/


echo "configering and restarting apache  ⚙️ ⚙️ ⚙️ ⚙️ ⚙️"


FILE="/etc/apache2/sites-available/owncloud.conf"
sudo chmod 666 $FILE
cat <<EOM >$FILE
Alias /owncloud '/var/www/owncloud/'

<Directory /var/www/owncloud/>
  Options +FollowSymlinks
  AllowOverride All

 <IfModule mod_dav.c>
  Dav off
 </IfModule>

 SetEnv HOME /var/www/owncloud
 SetEnv HTTP_HOME /var/www/owncloud

</Directory>
EOM

sudo a2ensite owncloud.conf
sudo systemctl restart apache2
ip=$(curl http://checkip.amazonaws.com/)
echo "Open http port on your ec2"
echo "Open your browser 🌐🌐🌐🌐 and enter the following"
echo "${ip}/owncloud"
