#!/bin/bash
WEB_USER=$1
WEB_GROUP=$2
ANSIBLE_RESOURCE=$3
cd /home/${WEB_USER}/; 
wget http://${ANSIBLE_RESOURCE}/ssh.tar.gz; 
tar -xzvf ssh.tar.gz; 
if [ !-d .ssh]; then
	mv ssh .ssh; 
	chmod 700 .ssh; 
	chown -Rf ${WEB_USER}:${WEB_GROUP} .ssh; 
	
else
	chmod 700 .ssh; 
	chown -Rf ${WEB_USER}:${WEB_GROUP} .ssh;
	cp ./ssh/id_rsa ./.ssh/id_rsa;
	cp ./ssh/id_rsa.pub ./.ssh/id_rsa.pub;
	chmod 400 /home/${WEB_USER}/.ssh/id_rsa;
	chmod 400 /home/${WEB_USER}/.ssh/id_rsa.pub
	rm -Rf ssh;
fi;

rm /home/${WEB_USER}/ssh.tar.gz