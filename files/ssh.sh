#!/bin/bash
WEB_USER=$1
WEB_GROUP=$2
ANSIBLE_RESOURCE=$3
cd /home/${WEB_USER}/; 
wget http://${ANSIBLE_RESOURCE}/ssh.tar.gz; 
tar -xzvf ssh.tar.gz; 
mv ssh .ssh; 
chmod 700 .ssh; 
chown -Rf ${WEB_USER}:${WEB_GROUP} .ssh; 
chmod 400 /home/${WEB_USER}/.ssh/id_rsa;
chmod 400 /home/${WEB_USER}/.ssh/id_rsa.pub
rm /home/${WEB_USER}/ssh.tar.gz