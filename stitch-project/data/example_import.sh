#!/bin/sh
# Example
CLUSTER=mikescluster-shard-0/mikescluster-shard-00-00-er7tu.mongodb.net:27017,mikescluster-shard-00-01-er7tu.mongodb.net:27017,mikescluster-shard-00-02-er7tu.mongodb.net:27017
DATABASE=calhacks
COLLECTION=contacts
USER=admin
PASSWORD=Password123

mongoimport --host ${CLUSTER} --ssl --username ${USER} --password ${PASSWORD} --authenticationDatabase admin --db ${DATABASE} --collection ${COLLECTION} --type csv --file contacts.csv --headerline
