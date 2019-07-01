#!/bin/bash
# GET ALL USER INPUT
tput setaf 2; echo "Domain Name (eg. example.com)?"
read DOMAIN
tput setaf 2; echo "Username (eg. database name)?"
read USERNAME
tput setaf 2; echo "Updating Ubuntu 18..."
sleep 2;
tput sgr0
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update

tput setaf 2; echo "Installing Nginx..."
sleep 2;
tput sgr0
sudo apt-get install nginx zip unzip pwgen -y

tput setaf 2; echo "Setting Up NGINX..."
sleep 2;
tput sgr0
cd /etc/nginx/sites-available/

sudo wget -qO "$DOMAIN" https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/sites-available/example.com.conf
sudo sed -i -e "s/example.com/$DOMAIN/" "$DOMAIN"
sudo sed -i -e "s/www.example.com/www.$DOMAIN/" "$DOMAIN"
sudo ln -s /etc/nginx/sites-available/"$DOMAIN" /etc/nginx/sites-enabled/
sudo mkdir /etc/nginx/limelemp
cd /etc/nginx/limelemp
sudo wget -q https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/limelemp/general.conf
sudo wget -q https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/limelemp/php_fastcgi.conf
tput setaf 2; echo "Setting up SSL"
sleep 2;
tput sgr0
sudo mkdir /etc/nginx/ssl
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt
sudo openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048
cd /etc/nginx/
sudo mv nginx.conf nginx.conf.backup
sudo wget -qO nginx.conf https://raw.githubusercontent.com/Gordon55M/LimeSurvey/master/nginx.conf
sudo mkdir -p /var/www/"$DOMAIN"/public
cd /var/www/"$DOMAIN/public"
cd ~

tput setaf 2; echo "Downloading LimeSurvey 3.17.6+190624 (06/24/19)...."
sleep 2;
tput sgr0
sudo wget -q https://github.com/LimeSurvey/LimeSurvey/archive/3.17.6+190624.zip
sudo unzip 3.17.6+190624.zip
shopt -s dotglob
sudo mv LimeSurvey-3.17.6-190624/* /var/www/"$DOMAIN"/public/
sudo rm -rf LimeSurvey-3.17.6-190624
sudo rm -rf 3.17.6+190624.zip

tput setaf 2; echo "Nginx server installation completed.."
sleep 2;
tput sgr0
cd ~
sudo chown www-data:www-data -R /var/www/"$DOMAIN"/public
sudo systemctl restart nginx.service

tput setaf 2; echo "Installing PHP-7.3 and Other Modules"
sleep 2;
tput sgr0
sudo apt install php7.3 php7.3-fpm -y
sudo apt-get -y install php7.3-intl php7.3-curl php7.3-gd php7.3-imap php7.3-readline php7.3-common php7.3-recode php7.3-mysql php7.3-cli php7.3-curl php7.3-mbstring php7.3-bcmath php7.3-mysql php7.3-opcache php7.3-zip php7.3-xml php-memcached php-imagick php-memcache memcached graphviz php-pear php-xdebug php-msgpack  php7.3-soap
tput setaf 2; echo "Php.ini Updates"
sleep 2;
tput sgr0
sudo sed -i "s/post_max_size = .*/post_max_size = 500M/" /etc/php/7.3/fpm/php.ini
sudo sed -i "s/memory_limit = .*/memory_limit = 256M/" /etc/php/7.3/fpm/php.ini
sudo sed -i "s/upload_max_filesize = .*/upload_max_filesize = 100M/" /etc/php/7.3/fpm/php.ini
sudo sed -i "s/max_execution_time = .*/max_execution_time = 180/" /etc/php/7.3/fpm/php.ini
sudo sed -i "s/;max_input_vars = .*/max_input_vars = 5000/" /etc/php/7.3/fpm/php.ini
sudo sed -i "s/max_input_time = .*/max_input_time = 1000/" /etc/php/7.3/fpm/php.ini
sudo systemctl restart php7.3-fpm.service

tput setaf 2; echo "Instaling MariaDB and Creating Password"
sleep 2;
tput sgr0
sudo apt install mariadb-server mariadb-client php7.3-mysql -y
sudo systemctl restart php7.3-fpm.service
sudo mysql_secure_installation
PASS=`pwgen -s 14 1`

sudo mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE $USERNAME;
CREATE USER '$USERNAME'@'localhost' IDENTIFIED BY '$PASS';
GRANT ALL PRIVILEGES ON $USERNAME.* TO '$USERNAME'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo
echo
tput setaf 2; echo "LimeSurvey Install and Admin Info"
echo "--------------------------------"
echo "Website:    https://www.$DOMAIN"
echo "Admin:      https://www.$DOMAIN/admin"
echo "Installer:  https://www.$DOMAIN/index.php?r=installer/welcome"
echo
tput setaf 4; echo "Database Name:   $USERNAME"
tput setaf 4; echo "Database Username:   $USERNAME"
tput setaf 4; echo "Database Password:   $PASS"
echo "--------------------------------"
tput sgr0
echo
echo
tput setaf 3;  echo "Installation & configuration succesfully finished."
echo
echo "twitter: gpmcconnell"
echo "Forked from https://github.com/bajpangosh/High-Traffic-wordpress-server-configuration"
echo "Twitter @bajpangosh"
tput sgr0
