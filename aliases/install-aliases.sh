#!/bin/sh

echo "INPUT YOUR HOME DIRECTORY, EX. /home/<YOUR_USERNAME>/ or /root/"
read HOME_DIR
ALIAS_FILE=$HOME_DIR".docker-shortcuts"

echo "alias docker-delete-images=\"docker rmi -f \$(docker images -q)\"" >> $ALIAS_FILE
echo "alias docker-list-all=\"docker ps -a\"" >> $ALIAS_FILE
echo "alias docker-list-all-slim=\"docker ps -aq\"" >> $ALIAS_FILE
echo "alias docker-restart-all=\"docker restart \$(docker ps -aq)\"" >> $ALIAS_FILE
echo "alias docker-rm-all=\"docker rm \$(docker ps -aq)\"" >> $ALIAS_FILE
echo "alias docker-stop-all=\"docker stop \$(docker ps -aq)\"" >> $ALIAS_FILE
echo "alias docker-volume-list=\"docker volume ls\"" >> $ALIAS_FILE
echo "alias docker-volume-list-slim=\"docker volume ls -q\"" >> $ALIAS_FILE
echo "alias docker-volume-rm-all=\"docker volume rm \$(docker volume ls -q)\"" >> $ALIAS_FILE

echo "if [ -f $ALIAS_FILE ]; then\n. $ALIAS_FILE\nfi" >>  $HOME_DIR".bashrc"

source $ALIAS_FILE
