

The Vagrantfile and docker-compose files in this folder should create a working server for you - vagrant
will create a host which runs a number of docker containers running the component parts of the CAP system::

  * postgresql database
  * rabbitmq instance
  * elasticsearch instance
  * apache tomcat container running 2 war apps

The Vagrant config file maps the port numbers from these services onto ports on your local container... You will
likely want to edit these ports for your own use.

open a browser on the server and connect to

http://localhost:15673/


Handy vagrant commands::

VBoxManage list runningvms
VBoxManage list vms
VBoxManage showvminfo UUID




If you should edit the Dockerfiles for rabbit etc, force a rebuild on the docker-compose image with
docker-compose -f ./docker-compose-dev-setup.yml up --force-recreate --build

