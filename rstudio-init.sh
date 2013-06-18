#!/bin/bash

# http://serverfault.com/questions/227190/how-do-i-ask-apt-get-to-skip-any-interactive-post-install-configuration-steps
export DEBIAN_FRONTEND=noninteractive

# Create a user, home directory and set password
# This will be used to login to rstudio-server and the home directory
# will contain the rstudio workspace.
echo "Creating 'rstudio' user..."
useradd rstudio
mkdir /home/rstudio
passwd rstudio
chmod -R 0777 /home/rstudio

# Install DVCS tools
apt-get --assume-yes install git
apt-get --assume-yes install mercurial

# Ubuntu Packages for R
# http://cran.r-project.org/bin/linux/ubuntu/README.html

# Add CRAN mirror for r-base
sh -c 'echo "deb http://cran.rstudio.org/bin/linux/ubuntu raring/" >> /etc/apt/sources.list'

# Add GPG key for R packages
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

# Update files to use CRAN mirror
apt-get --assume-yes update

# Install latest version of R
apt-get --assume-yes install r-base

echo "Checking R version..."
R --version

# Install in order to use RCurl & XML
aptitude --assume-yes install libcurl4-openssl-dev
apt-get --assume-yes install libxml2-dev

# http://www.rstudio.com/ide/download/server
apt-get --assume-yes install gdebi-core
apt-get --assume-yes install libapparmor1  # Required only for Ubuntu, not Debian
wget http://download2.rstudio.org/rstudio-server-0.97.551-amd64.deb
gdebi --non-interactive rstudio-server-0.97.551-amd64.deb
