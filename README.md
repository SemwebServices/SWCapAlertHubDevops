

Current AWS Setup


Devops scripts for the semweb cap filtered alert hub


This work has been kindly supported by UCAR Subaward SUBAWD001770

# For developers

The script vagrant/docker-compose-dev-setup.yml is there to give you the infrastructure you need to run
the feefFacade and CAPCollator in a dev environment.

Start it with 

    cd vagrant
    docker-compose -f ./docker-compose-dev-setup.yml up


To take down the image and clean up entirely

    docker-compose -f ./docker-compose-dev-setup.yml down -v

All the scripts are predicated on having a pgsql user with the following kind of setup::

CREATE USER fiaadmin with CREATEDB CREATEUSER password 'your_local_fiaadmin_password_here';


truncate -s 0 /var/lib/docker/containers/*/*-json.log

curl -H 'Content-Type: application/json' -X POST "https://www.alert-hub.org/es/alerts/_search" -d '{ "query":{ "bool": { "must": { "match_all": {} }, "filter": { "geo_shape": { "subshape": { "shape": { "type" : "polygon", "coordinates" : [ [ [-176,11],[-61,11],[-61,73],[-176,73],[-176,11] ] ] }, "relation": "within" } } } } } }'

curl -H 'Content-Type: application/json' -X POST "https://www.alert-hub.org/es/alerts/_search" -d '{ "query":{ "bool": { "must": { "match_all": {} }, "filter": { "geo_shape": { "AlertBody.info.area.cc_polys": { "shape": { "type" : "polygon", "coordinates" : [ [ [-176,11],[-61,11],[-61,73],[-176,73],[-176,11] ] ] }, "relation": "within" } } } } } }'
