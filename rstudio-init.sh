#!/bin/bash

# http://serverfault.com/questions/227190/how-do-i-ask-apt-get-to-skip-any-interactive-post-install-configuration-steps
export DEBIAN_FRONTEND=noninteractive

# Install DVCS tools
apt-get -y install git
apt-get -y install mercurial

# Create a user, home directory and set password
# This will be used to login to rstudio-server and the home directory
# will contain the rstudio workspace.
useradd rstudio
mkdir /home/rstudio
passwd rstudio
chmod -R 0777 /home/rstudio

# Add CRAN mirror for r-base
sh -c 'echo "deb http://cran.rstudio.org/bin/linux/ubuntu raring/" >> /etc/apt/sources.list'

# Update files to use CRAN mirror
# Don't worry about error message
apt-get -y update

# Install latest version of R
# Install without verification
apt-get -y --force-yes install r-base

# Install in order to use RCurl & XML
aptitude install libcurl4-openssl-dev
apt-get -y install libxml2-dev

# http://www.rstudio.com/ide/download/server
apt-get -y install gdebi-core
apt-get -y install libapparmor1  # Required only for Ubuntu, not Debian
wget http://download2.rstudio.org/rstudio-server-0.97.551-amd64.deb
gdebi rstudio-server-0.97.551-amd64.deb
