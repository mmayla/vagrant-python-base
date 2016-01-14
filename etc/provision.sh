#!/bin/bash

GLOBAL_CONFIGURATIONS_DIR=/vagrant/etc/configurations

# Install essential packages from Apt
apt-get update -y
# Python dev packages
apt-get install -y build-essential python python3-dev 
# Install python-setuptools manually
wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py -O - | python3.4
rm /home/vagrant/setuptools*
# Dependencies for image processing with Pillow (drop-in replacement for PIL)
# supporting: jpeg, tiff, png, freetype, littlecms
apt-get install -y libjpeg-dev libtiff-dev zlib1g-dev libfreetype6-dev liblcms2-dev
# Git
apt-get install -y git

## Major ##

# Postgresql
if ! command -v psql; then
    apt-get install -y postgresql libpq-dev
    # Create vagrant pgsql superuser
    su - postgres -c "createuser -s vagrant"
fi

# virtualenv global setup
if ! command -v pip; then
    easy_install -U pip
fi
if [[ ! -f /usr/local/bin/virtualenv ]]; then
    pip3.4 install virtualenv virtualenvwrapper stevedore virtualenv-clone
fi

# bash environment global setup
cp -p $GLOBAL_CONFIGURATIONS_DIR/bashrc /home/vagrant/.bashrc

# To start_project script from any directory
cp -p $GLOBAL_CONFIGURATIONS_DIR/start_project.sh /usr/local/bin/

# Node.js
if ! command -v npm; then
    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
    apt-get install -y nodejs
fi

## Minor ##

# bower
if ! command -v bower; then
    npm install -g bower
fi

# SASS
if ! command -v node-sass; then
    npm install -g node-sass
fi

# gulp
if ! command -v gulp; then
    npm install -g gulp
fi

# requirejs
if ! command -v r.js; then
    npm install -g requirejs
fi

# browserify
if ! command -v browserify; then
    npm install -g browserify
fi

# nodemon
if ! command -v nodemon; then
    npm install -g nodemon
fi

# modernizr
if ! command -v modernizr; then
    npm install -g modernizr
fi

# karma
if ! command -v karma; then
    npm install -g karma
fi

# Static Server
if ! command -v static-server; then
    npm install -g static-server 
fi

# Angular Translate
if ! command -v angular-translate; then
    npm install -g angular-translate
fi

# Cleanup
apt-get clean

echo "Zeroing free space to improve compression."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
