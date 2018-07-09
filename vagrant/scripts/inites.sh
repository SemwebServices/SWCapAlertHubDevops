#!/bin/sh

export status=`curl -I http://elasticsearch:9200/alerts 2>/dev/null | head -n 1 | cut -d$' ' -f2`

