#!/bin/sh

# Get local docker container list.
containers=`docker ps -a --format "{{.Names}}"`

# Check if the container exists.
checkExists() {
  for container in ${containers}; do
    if [ ${container} = ${1} ]; then
      return 0
    fi
  done
  return 1
}


# Build and up
if ! checkExists "nexttest-app" -o ! checkExists "nexttest-rdb" -o ! checkExists "nexttest-nosql"; then
  docker-compose -f docker-compose.dev.yml up --build
else
  # Container start.
  docker-compose -f docker-compose.dev.yml up
fi