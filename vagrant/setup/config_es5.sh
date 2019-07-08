export ESHOST="elasticsearch"

echo Update index referesh interval to 10s
curl -s -XPUT 'http://localhost:9200/_all/_settings?preserve_existing=true' -d '{
"index.refresh_interval" : "15"
}'

echo Clear down events
curl -s -XDELETE "http://$ESHOST:9200/events"
echo Create events
curl -s -XPUT "http://$ESHOST:9200/events"

echo Clear down alerts
# Clear down
curl -s -XDELETE "http://$ESHOST:9200/alerts"
echo Create Alerts
# Create an index called alerts
curl -s -XPUT "http://$ESHOST:9200/alerts"
# Create a type mapping called alert
curl -s -XPUT "http://$ESHOST:9200/alerts/alert/_mapping" -d ' 
{ 
   "alert":{ 
      "date_detection": false,
      "properties":{ 
         "id":{ 
            "index":true,
            "type":"keyword", 
            "store":true
         }, 
         "AlertMetadata":{
           "properties":{
             "MatchedSubscriptions":{
               "type":"keyword",
               "index":true
             },
             "Expires":{
               "type":"date"
             },
             "Effective":{
               "type":"date"
             }
           }
         },
         "AlertBody":{
           "properties":{
             "info":{
               "properties":{
                 "parameter":{
                   "properties":{
                     "value":{
                       "type":"text"
                     }
                   }
                 },
                 "area":{
                   "properties":{
                     "cc_polys" : {
                       "type": "geo_shape",
                       "tree": "quadtree",
                       "precision": "250m"
                     }
                   }
                 },
                 "effective":{
                   "type":"date"
                 },
                 "expires":{
                   "type":"date"
                 }
               }
             },
             "identifier": {
               "type":"keyword",
               "index":true
             }
           }
         },
         "evtTimestamp":{
           "type":"date"
         }
      }
   } 
}' 

echo Clear down subscriptions
curl -s -XDELETE "http://$ESHOST:9200/alertssubscriptions"
echo Create subscriptions
curl -s -XPUT "http://$ESHOST:9200/alertssubscriptions"
curl -s -XPUT "http://$ESHOST:9200/alertssubscriptions/alertsubscription/_mapping" -d ' 
{ 
   "alertsubscription":{ 
      "properties":{ 
         "id":{ 
            "index":true,
            "type":"keyword", 
            "store":true
         }, 
         "subshape": {
            "type": "geo_shape",
            "tree": "quadtree",
            "precision": "250m"
         }
      }
   } 
}'

echo Clear down gaz
curl -s -XDELETE "http://$ESHOST:9200/gazetteer"
echo Create gaz
curl -s -XPUT "http://$ESHOST:9200/gazetteer"
curl -s -XPUT "http://$ESHOST:9200/gazetteer/gazentry/_mapping" -d ' 
{ 
   "gazentry":{ 
      "properties":{ 
         "id":{ 
            "index":true,
            "type":"keyword", 
            "store":true
         }, 
         "subshape": {
            "type": "geo_shape",
            "tree": "quadtree",
            "precision": "250m"
         }
      }
   } 
}'
echo CAP ES Setup script completed
