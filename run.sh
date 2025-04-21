#!/bin/bash
# This script deletes any Docker container and image related to "jomhantar"
# It first checks for any container whose name contains "jomhantar"
# Then, it checks for any image with repository "jomhantar"

# Find container IDs (or names) matching "jomhantar"
container_ids=$(docker ps -a --filter "name=jomhantar" -q)

if [ -n "$container_ids" ]; then
    echo "Found container(s) matching 'jomhantar':"
    docker ps -a --filter "name=jomhantar"
    echo "Deleting container(s)..."
    # Force remove containers even if running
    docker rm -f $container_ids
else
    echo "No container matching 'jomhantar' found."
fi

# Find image IDs matching repository "jomhantar"
image_ids=$(docker images jomhantar -q)

if [ -n "$image_ids" ]; then
    echo "Found image(s) with repository 'jomhantar':"
    docker images jomhantar
    echo "Deleting image(s)..."
    # Force remove images
    docker rmi -f $image_ids
else
    echo "No image with repository 'jomhantar' found."
fi

echo "Cleanup complete."

docker build -t jomhantar:latest .
docker run -d -p 5000:5000