#!/bin/bash

set -e

docker build --tag tomek/flutter:$1 \
             --tag tomek/flutter:latest \
             --build-arg flutter_version=$1 ./