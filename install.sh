#!/bin/bash

sudo mkdir -p /var/www/html/site1
sudo mkdir -p /var/www/html/site2
sudo cp html/index.html /var/www/html/site1/
sudo cp html/index.html /var/www/html/site2/


sudo cp conf/site1.com.conf /etc/apache2/sites-available/
sudo cp conf/site1ssl.com.conf /etc/apahce2/sites-available/

ip=sudo ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/'


#echo "$ip:443" >> /etc/apache2/ports.conf
#echo "$ip:80" >> /etc/apache2/ports.conf

sudo systemctl start apache2
sudo a2enmod ssl
sudo a2ensite site1.com.conf
sudo systemctl reload apache2
sudo a2ensite site1ssl.com.conf 
sudo systemctl reload apache2

