
Devops scripts for the semweb cap filtered alert hub

# For developers

The script vagrant/docker-compose-dev-setup.yml is there to give you the infrastructure you need to run
the feefFacade and CAPCollator in a dev environment.

Start it with 

    cd vagrant
    docker-compose -f ./docker-compose-dev-setup.yml up



All the scripts are predicated on having a pgsql user with the following kind of setup::

CREATE USER fiaadmin with CREATEDB CREATEUSER password 'your_local_fiaadmin_password_here';

