#!/bin/bash

###### QGIS, GRASS and SAGA
sudo apt-get update
sudo apt-get install -y qgis saga grass python-qgis qgis-plugin-grass grass-doc

###### PostgresSQL, PostGIS, pgRouting & pgAdmin 3
sudo apt-get update
sudo apt-get install -y postgresql postgresql-contrib postgis postgresql-10-postgis-scripts postgresql-10-pgrouting pgadmin3

###### Setting postgreSQL, edit the files pg_hba.conf & postgresql.conf

sudo nano /etc/postgresql/10/main/postgresql.conf
# or sudo gedit /etc/postgresql/10/main/postgresql.conf
## uncomment the next line
listen_addresses = '*'
# exit and save

sudo nano /etc/postgresql/10/main/pg_hba.conf
# or sudo gedit /etc/postgresql/10/main/pg_hba.conf
## Add new line to open all IP to acces to data base
host     all     all        0.0.0.0/0      md5
# exit and save

# You have to restart the postgresql service to see the configuration changes
service postgresql restart

###### Create database, user & activate extensions

# Create new user (pe: gisadmin) with administrator permissions:
sudo -u postgres psql
postgres= # Add the next SQL sentences
# create new su user
CREATE ROLE gisadmin login PASSWORD 'your_password' SUPERUSER CREATEDB CREATEROLE NOINHERIT;
# Activate the next extensions
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION pgrouting;
\q  # To exit the postgres console, the exit command also works

# Optionally you can leave a new database created
CREATE DATABASE gis_ctbb TEMPLATE postgres OWNER gisadmin;




