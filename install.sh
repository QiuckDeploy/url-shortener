#!/bin/bash

if [ ! -d /data ]; then
	echo "Make sure dir /data exists and this user has read/write access !"
	exit 1;
fi

mkdir -p /data/us/redis
mkdir -p /data/us/mysql/data
mkdir -p /data/us/web/config
mkdir -p /data/us/web/logs

docker pull redis:5
docker pull mysql:5.7
docker pull quickdeploy/url-shortener:0.2

./swarm_start_redis.sh

./swarm_start_mysql.sh

./swarm_start_web.sh

echo "Please wait until services started"

echo "Use 'docker service ps us-' to see the status"

echo "After started, visit http://127.0.0.1/install.php` to setup the system"