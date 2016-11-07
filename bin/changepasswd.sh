#!/bin/bash 
exec > /dev/null 2>&1

read TOKEN
mv $SPLUNK_HOME/etc/passwd $SPLUNK_HOME/etc/passwd.bak
#using 6.5 on Ubuntu 16.04LTS, this line copied /etc/passwd from my local machine to splunk $SPLUNK_HOME/etc/passwd
#cp ./etc/passwd $SPLUNK_HOME/etc/passw
#changed it to this to get it working:
cp $SPLUNK_HOME/etc/apps/splunk-password-app/etc/passwd $SPLUNK_HOME/etc/passwd
curl -k -H "Authorization: Splunk $TOKEN" https://localhost:8089/services/admin/auth-services/_reload -X POST
