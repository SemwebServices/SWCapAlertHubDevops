export ESHOST="elasticsearch"

echo Update index referesh interval to 10s
curl -s -XPUT 'http://localhost:9200/_all/_settings?preserve_existing=true' -d '{
"index.refresh_interval" : "10"
}'

# Clear down
curl -XDELETE "http://$ESHOST:9200/alerts"
# Create an index called alerts
curl -XPUT "http://$ESHOST:9200/alerts"
# Create a type mapping called alert
curl -XPUT "http://$ESHOST:9200/alerts/alert/_mapping" -d ' 
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
curl -XDELETE "http://$ESHOST:9200/alertssubscriptions"
curl -XPUT "http://$ESHOST:9200/alertssubscriptions"
curl -XPUT "http://$ESHOST:9200/alertssubscriptions/alertsubscription/_mapping" -d ' 
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
curl -XDELETE "http://$ESHOST:9200/gazetteer"
curl -XPUT "http://$ESHOST:9200/gazetteer"
curl -XPUT "http://$ESHOST:9200/gazetteer/gazentry/_mapping" -d ' 
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

