#!/bin/bash
set -e

# Build the docker image, and tag it with the ansible version.
# if the env var PUSH_IMAGE has a non-empty value, also push it

docker build . -t kpericak/ansible-docker:latest
version=$(docker run kpericak/ansible-docker:latest ansible --version | head -n 1 | awk '{print $2}')
docker tag kpericak/ansible-docker:latest kpericak/ansible-docker:$version

if [[ "$PUSH_IMAGE" != "" ]]; then
  docker push kpericak/ansible-docker:latest
  docker push kpericak/ansible-docker:$version
fi

