#!/bin/bash

# Colors for pretty printing
NC='\033[0m'
RED='\033[0;31m'
LRED='\033[1;31m'
GREEN='\033[0;32m'
LGREEN='\033[1;32m'

# Script to start Django project
# Or create it then start it if not exist

if [ "$#" -ne 1 ]; then
    echo "Invalid number of arguments, please enter the name of the project"
    exit 255
fi

# To make virtualenvwrapper visible
source `which virtualenvwrapper.sh`

PROJECT_NAME=$1
DB_NAME=$PROJECT_NAME
VIRTUALENV_NAME=$PROJECT_NAME

PROJECT_DIR=/vagrant/projects/$PROJECT_NAME
VIRTUALENV_DIR=/home/vagrant/.virtualenvs/$PROJECT_NAME

TEMPLATES_DIR=/vagrant/etc/templates
REQUIREMENT_FILE_TEMPLATE_PATH=$TEMPLATES_DIR/requirements.txt
GITIGNORE_FILE_TEMPLATE_PATH=$TEMPLATES_DIR/template.gitignore

# create database
createdb $DB_NAME &> /dev/null
if [ $? -eq 0 ]; then
    echo -e "${LGREEN}The database '$DB_NAME' has been created successfully${NC}"
else
    echo -e "${LRED}The database '$DB_NAME' exist${NC}"
fi

# deactivate environment
echo -e "${LGREEN}Deactivating '$PROJECT_NAME' environment...${NC}"
deactivate &> /dev/null

# virtualenv setup for project
count=$(workon | grep "^$PROJECT_NAME$" | wc -l)
mkdir $PROJECT_DIR/ &> /dev/null
if [ $count -eq 1 ]; then
    echo -e "${LRED}'$PROJECT_NAME' virtualenv exist. ${LGREEN}Activate...${NC}"
else
    echo -e "${LRED}'$PROJECT_NAME' virtualenv Not exist. ${LGREEN}Create...${NC}"
    /usr/local/bin/virtualenv $VIRTUALENV_DIR --python=/usr/bin/python3.4 &> /dev/null
    cp -p $REQUIREMENT_FILE_TEMPLATE_PATH $PROJECT_DIR
    cp -p $GITIGNORE_FILE_TEMPLATE_PATH $PROJECT_DIR/.gitignore
fi
cd $PROJECT_DIR
workon $PROJECT_NAME
