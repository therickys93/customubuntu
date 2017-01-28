#!/bin/bash

apt-get clean
apt-get update
apt-get install software-properties-common unzip curl git vim openssh-client build-essential wget tmux apache2 -y

apt-get clean
apt-get update

sudo wget https://services.gradle.org/distributions/gradle-2.3-all.zip
unzip -qq gradle-2.3-all.zip -d /usr/local && rm -f gradle-2.3-all.zip
ln -fs /usr/local/gradle-2.3/bin/gradle /usr/bin
echo 'export PATH=$PATH:/usr/local/gradle-2.3/bin' >> $HOME/.bashrc

echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
DEBIAN_FRONTEND=noninteractive add-apt-repository -y ppa:webupd8team/java
apt-get update
apt-get install -y oracle-java8-installer
update-alternatives --set java /usr/lib/jvm/java-8-oracle/jre/bin/java
update-alternatives --set javac /usr/lib/jvm/java-8-oracle/bin/javac
update-alternatives --set javaws /usr/lib/jvm/java-8-oracle/jre/bin/javaws
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-oracle' >> $HOME/.bashrc
echo 'export PATH=$PATH:/usr/lib/jvm/java-8-oracle/jre/bin' >> $HOME/.bashrc

apt-get clean
DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:ondrej/php
apt-get update
apt-get install php7.0 php7.0-dev -y --force-yes
apt-get install php7.0-fpm php7.0-cli php7.0-curl php7.0-gd php7.0-intl php7.0-mysql -y --force-yes
curl -s http://getcomposer.org/installer | php
chmod +x composer.phar
mv composer.phar /usr/bin/composer

DEBIAN_FRONTEND=noninteractive add-apt-repository universe
apt-get clean
apt-get update

curl -sL https://deb.nodesource.com/setup_4.x | bash -
apt-get install nodejs -y
npm install -g mocha