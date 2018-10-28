#!/bin/sh
mongoimport --host Cluster0-shard-0/cluster0-shard-00-00-olu2e.mongodb.net:27017,cluster0-shard-00-01-olu2e.mongodb.net:27017,cluster0-shard-00-02-olu2e.mongodb.net:27017 --ssl --username admin --password Password123 --authenticationDatabase admin --db calhacks --collection contacts --type csv --file contacts.csv --headerline
