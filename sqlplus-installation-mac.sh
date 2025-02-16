#!/bin/bash
## Easy script to install sqlplus on mac AARCH64. For the Mac chips.
## Script by: 3553R

echo "Download the required packages"
wget http://download.oracle.com/otn_software/linux/instantclient/1926000/instantclient-basic-linux.arm64-19.26.0.0.0dbru.zip
wget http://download.oracle.com/otn_software/linux/instantclient/1926000/instantclient-sqlplus-linux.arm64-19.26.0.0.0dbru.zip
wget http://download.oracle.com/otn_software/linux/instantclient/1926000/instantclient-sdk-linux.arm64-19.26.0.0.0dbru.zip

echo "Make the directory /opt/oracle"
sudo mkdir -p /opt/oracle

echo "Unzip the packages in /opt/oracle"
sudo unzip -d /opt/oracle instantclient-basic-linux.arm64-19.26.0.0.0dbru.zip
sudo unzip -d /opt/oracle instantclient-sqlplus-linux.arm64-19.26.0.0.0dbru.zip 
sudo unzip -d /opt/oracle instantclient-sdk-linux.arm64-19.26.0.0.0dbru.zip

cd /opt/oracle/instantclient_19_26 && find . -type f | sort

echo "Add the variables in PATH, etc"
export PATH=$PATH:/opt/oracle/instantclient_19_26                                                                                                                               
export SQLPATH=/opt/oracle/instantclient_19_26                                                                                                                                                   
export TNS_ADMIN=/opt/oracle/instantclient_19_26 
export LD_LIBRARY_PATH=/opt/oracle/instantclient_19_26                                                                                                                           
export ORACLE_HOME=/opt/oracle/instantclient_19_26    

echo "Test if it works" 
sqlplus -V
