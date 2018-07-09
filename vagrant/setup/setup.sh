#!/bin/sh

echo This is the CAP Setup Script

echo sleep 10 - Just because the ES container has started, does not mean ES is up and running yet
sleep 10


echo run curl
curl -I http://elasticsearch:9200/alerts

echo Get HTTP resonse code for accessing alerts index
export status=`curl -I http://elasticsearch:9200/alerts 2>/dev/null | head -n 1 | cut -d$' ' -f2`

echo status : -$status-

echo All done - exit
exit 0
