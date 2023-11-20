# defaultView:Map
SELECT distinct  
?item ?itemLabel ?newterr ?area ?location
WHERE {
  ?item wdt:P31/wdt:P279* wd:Q23442 ;
        wdt:P17 wd:Q17;
        rdfs:label ?itemLabel.
  optional{?item wdt:P131 ?terr .}
  optional{?item wdt:P131/wdt:P131 ?terrcheck .}
  optional{?item wdt:P131/wdt:P131/wdt:P131 ?terrcheck2 .}
  optional{?item wdt:P131/wdt:P131/wdt:P131/wdt:P131  ?terrcheck3 .}
  optional{?item wdt:P2046 ?area .}
  optional{?item wdt:P625 ?location .}
  ?terr rdfs:label ?terrlabel . FILTER(lang(?terrlabel)='en')
  filter(CONTAINS(?itemLabel,"大島")).
  BIND(
     IF(EXISTS{?terr wdt:P31/wdt:P279* wd:Q50337},?terr,
 if(exists{?terrcheck wdt:P31/wdt:P279* wd:Q50337},?terrcheck,
       if(exists{?terrcheck2 wdt:P31/wdt:P279* wd:Q50337},?terrcheck2,
          if(exists{?terrcheck3 wdt:P31/wdt:P279* wd:Q50337},?terrcheck3,
             if(exists{?terrcheck4 wdt:P31/wdt:P279* wd:Q50337},?terrcheck4,
      "test")))))
       as ?newterr ).
 
  SERVICE wikibase:label { bd:serviceParam wikibase:language "[AUTO_LANGUAGE]". }
}