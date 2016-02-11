#!/bin/bash

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
parentdir="$(dirname "$scriptdir")"

docker build -t pauljdehmer/ozwcp:latest $parentdir
docker run --device=/dev/ttyUSB0:/dev/ttyUSB0 --net=host --name=pauljdehmer-ozwcp -d pauljdehmer/ozwcp