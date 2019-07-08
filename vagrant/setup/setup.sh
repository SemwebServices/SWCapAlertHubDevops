#!/bin/sh

echo This is the CAP Setup Script

echo sleep 30 - Just because the ES container has started, does not mean ES is up and running yet
sleep 30
echo Done sleeping.. continue

echo run curl
curl -I http://elasticsearch:9200/alerts

echo Get HTTP resonse code for accessing alerts index
export status=`curl -I http://elasticsearch:9200/alerts 2>/dev/null | head -n 1 | cut -d$' ' -f2`

echo status : -$status-

if [ "$status" -eq '404' ]; then 
  echo Alerts index not present
  sh ./config_es5.sh
  echo Config_es script completed - check for presence of alerts
  curl -I http://elasticsearch:9200/alerts
else
  echo "Alerts index detected"
fi;

echo All done - exit
exit 0
