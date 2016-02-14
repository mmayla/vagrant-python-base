vagrant-python-base
===================

A Vagrant box based on Ubuntu trusty64, configured for python development.
Things preinstalled beyond the base trusty64 box include:

* postgresql
* virtualenv and virtualenvwrapper
* dependencies for Pillow, a drop-in replacement for the Python Imaging Library PIL
* pip package manager
* git
* Node.js 4.x

Build instructions
------------------
To install locally:

    vagrant up

USAGE
-----
1. vagrant ssh
2. type $source start_project [project_name]
3. the script will create new folder and virtualenv enviornment for your project
4. requirements.txt and .gitignore templates are placed in your project directory "project/[project_name]"
