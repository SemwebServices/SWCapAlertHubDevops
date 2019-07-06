# Clear down
curl -XDELETE 'http://localhost:9200/alerts'
# Create an index called alerts
curl -XPUT 'http://localhost:9200/alerts'
# Create a type mapping called alert
curl -XPUT 'http://localhost:9200/alerts/alert/_mapping' -d ' 
{ 
   "alert":{ 
      "date_detection": false,
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
	       "type":"string",
	       "index":"not_analyzed"
             },
             "sent":{
               "type":"date"
             }
           }
         }
      }
   } 
}' 
curl -XDELETE 'http://localhost:9200/alertssubscriptions'
curl -XPUT 'http://localhost:9200/alertssubscriptions'
curl -XPUT 'http://localhost:9200/alertssubscriptions/alertsubscription/_mapping' -d ' 
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
curl -XDELETE 'http://localhost:9200/gazetteer'
curl -XPUT 'http://localhost:9200/gazetteer'
curl -XPUT 'http://localhost:9200/gazetteer/gazentry/_mapping' -d ' 
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

