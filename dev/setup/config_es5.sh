export ESHOST="elasticsearch"

echo Update index referesh interval to 10s
curl -s -XPUT 'http://localhost:9200/_all/_settings?preserve_existing=true' -d '{
"index.refresh_interval" : "10"
}'

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
      "properties":{ 
         "id":{ 
            "include_in_all":"false", 
            "index":"not_analyzed", 
            "type":"text", 
            "store":"yes" 
         }, 
         "AlertMetadata":{
           "properties":{
             "MatchedSubscriptions":{
               "type":"string",
               "index":"not_analyzed"
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
                       "precision": "100m"
                     }
                   }
                 }
               }
             },
             "identifier": {
               "type":"string",
               "index":"not_analyzed"
             }
           }
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
            "include_in_all":"false", 
            "index":"not_analyzed", 
            "type":"text", 
            "store":"yes" 
         }, 
         "subshape": {
            "type": "geo_shape",
            "tree": "quadtree",
            "precision": "100m"
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
            "include_in_all":"false", 
            "index":"not_analyzed", 
            "type":"text", 
            "store":"yes" 
         }, 
         "subshape": {
            "type": "geo_shape",
            "tree": "quadtree",
            "precision": "100m"
         }
      }
   } 
}'
echo CAP ES Setup script completed
