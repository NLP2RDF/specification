# sync run

cd example

pandoc -f markdown -t html david_lynch_dune_quoteid_124.txt > david_lynch_dune_quoteid_124.html 
curl --data-urlencode input@david_lynch_dune_quoteid_124.txt --data-urlencode p="http://persistence.uni-leipzig.org/nlp2rdf/specification/example/david_lynch_dune_quoteid_124#" -d f=text  "http://nlp2rdf.lod2.eu/nif-ws.php" >  david_lynch_dune_quoteid_124.ttl
rapper -i turtle david_lynch_dune_quoteid_124.ttl -o rdfxml > david_lynch_dune_quoteid_124.rdf
# because we are not aware of a good json-ld implementation
curl --data-urlencode content@david_lynch_dune_quoteid_124.ttl http://rdf-translator.appspot.com/convert/n3/json-ld/content > david_lynch_dune_quoteid_124.json

cd ..


rsync -rav * nlp2rdf@www.uni-leipzig.de:/data/homewww/nlp2rdf/webdir/specification 
