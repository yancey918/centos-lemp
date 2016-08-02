##
echo '###Fast build the develop environment Centos6 : lnmp+mariadb10'
##
PASSWORD="P@ssw0rd"

WEB_ROOT="/var/www/html/"
#exit

#install mariadb10 lnmp

docker pull imagine10255/centos6-mariadb

docker pull imagine10255/centos6-lnmp-php56

docker run --name mariadb -d -p 3306:3306 -it imagine10255/centos6-mariadb

docker run --name centos-lnmp -d -p 80:80 --link mariadb -it imagine10255/centos6-lnmp-php56

echo "###Use follow information###"
echo "==========================================================================";
WEB_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' centos-lnmp);
echo "Your WEB IP is $WEB_IP , You can use CMD> ssh root@$WEB_IP with password ( $PASSWORD )";
echo "===========================================================================";
DB_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' mariadb);
echo "Your DB IP is $DB_IP , You can use CDM> mysql -uroot -p$PASSWORD -h $DB_IP";
echo "===========================================================================";
