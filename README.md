rstudio-init
============

Quickly install R, rstudio-server, Mercurial and Git on a fresh AWS Ubuntu server.  This has been tested with the 
Ubuntu Server 13.04 AMI.

Usage
-----

    $ wget https://raw.github.com/mjr5749/rstudio-init/master/rstudio-init.sh
    $ chmod u+x rstudio-init.sh
    $ sudo ./rstudio-init.sh

As part of the installation, you will be prompted to set the password for the rstudio user.  You will use this password 
later to log into the rstudio-server web UI.  The remainder of the setup can run unattended.

Accessing RStudio Server Over an SSH Tunnel
-------------------------------------------

RStudio server will run on port 8787 by default.  Connect to your server via ssh with a port tunneling argument:

    ssh -i aws-key.pem ubuntu@hostname.amazonaws.com -L 8787:localhost:8787
    
You should now be able to log in to RStudio Server at [http://localhost:8787](http://localhost:8787).
