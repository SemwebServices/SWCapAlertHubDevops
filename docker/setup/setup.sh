#!/bin/bash

echo This is the CAP Setup Script

echo run curl
curl -I http://elasticsearch:9200/alerts

echo Checking for presence of alerts index
status=`curl -I http://elasticsearch:9200/alerts 2>/dev/null | head -n 1 | cut -d$' ' -f2`

echo status : \"$status\"
n=0
while (( n < 60  )) && [ -z "$status" ]
do
    echo ES not yet responding.. loop n=$n
    status=`curl -I http://elasticsearch:9200/alerts 2>/dev/null | head -n 1 | cut -d$' ' -f2`
    n=$((n+1))
    sleep 10
done

if [ "$status" = '404' ]; then 
  echo Alerts index not present
  sh ./config_es7.sh
  echo Config_es script completed - check for presence of alerts
  curl -I http://elasticsearch:9200/alerts
else
  echo "Alerts index detected (Status=$status)"
fi;

echo All done - exit
exit 0
