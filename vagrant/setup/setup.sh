#!/bin/sh

echo This is the CAP Setup Script

run curl

curl -I http://elasticsearch:9200/alerts 2>/dev/null | head -n 1 | cut -d$' ' -f2

export status=`curl -I http://elasticsearch:9200/alerts 2>/dev/null | head -n 1 | cut -d$' ' -f2`

exit 0
