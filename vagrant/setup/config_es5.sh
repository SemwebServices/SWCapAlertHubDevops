# Clear down
# curl -XDELETE 'http://$ESHOST:9200/alerts'
# Create an index called alerts

echo Setting up alerts

export ESHOST="elasticsearch"

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
         "cc_polys" : {
           "type": "geo_shape",
           "tree": "quadtree",
           "precision": "100m"
         },
         "AlertMetadata":{
	   "type":"nested",
	   "properties":{
	     "MatchedSubscriptions":{
	       "type":"string",
	       "index":"not_analyzed"
             }
           }
         },
         "AlertBody":{
           "type":"nested",
           "properties":{
             "info":{
               "type":"nested",
               "properties":{
                 "parameter":{
                   "type":"nested",
                   "properties":{
                     "value":{
                       "type":"text"
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
echo Setting up alertsubscriptions
# curl -XDELETE 'http://$ESHOST:9200/alertssubscriptions'
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
echo Setting up gaz
# curl -XDELETE 'http://$ESHOST:9200/gazetteer'
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

echo All done
