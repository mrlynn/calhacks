#!/bin/sh
if [ -z $1 ]; then
    echo "No args"
else
    CLUSTER=$1
fi
if [ -z ${CLUSTER} ]; then 
   echo Enter the name of your Atlas cluster: \c
   read cluster
else
   echo "Using ${CLUSTER} as MongoDB Atlas target cluster for import.\n"
fi

#mongoimport --host Cluster0-shard-0/cluster0-shard-00-00-w19nh.mongodb.net:27017,cluster0-shard-00-01-w19nh.mongodb.net:27017,cluster0-shard-00-02-w19nh.mongodb.net:27017 --ssl --username admin --password Password123 --authenticationDatabase admin --db calhacks --collection contacts --type csv --file contacts.csv --headerline
#mongoimport --host  --ssl --username admin --password Password123 --authenticationDatabase admin --db calhacks --collection contacts --type csv --file contacts.csv --headerline
