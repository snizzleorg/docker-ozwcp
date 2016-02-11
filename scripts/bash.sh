#!/bin/bash

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
parentdir="$(dirname "$scriptdir")"

docker build -t pauljdehmer/ozwcp:latest $parentdir
docker run --net=host --name=pauljdehmer-ozwcp -it pauljdehmer/ozwcp bash