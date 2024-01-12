#!/bin/bash

container_name="db-mysql"
mysql_root_password="root"

# Ensure Docker is installed and running
if ! systemctl is-active docker.service; then
    	echo "Docker is not running. Starting Docker..."
    	sudo systemctl start docker
fi

# Pull the MySQL Docker image if it's not already present
if ! docker image inspect mysql:latest > /dev/null 2>&1; then
    	echo "Pulling MySQL Docker image..."
    	docker pull mysql:latest
fi

# Create a directory for data persistence (replace with your desired path)
mkdir -p /var/lib/mysql

# Start the MySQL container in detached mode
docker run -d \
	--name "$container_name" \
    	-e MYSQL_ROOT_PASSWORD="$mysql_root_password" \
    	-p 3306:3306 \
    	-v /var/lib/mysql:/var/lib/mysql \
	mysql:latest

echo "MySQL container started successfully!"
