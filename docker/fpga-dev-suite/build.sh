#!/usr/bin/env bash

# Paths
ROOT_PATH="../.."
OUT_PATH="$ROOT_PATH/out"

IMAGE_VERSION=$(cat ./version)
IMAGE_NAME="fpga-dev-suite"

# docker build -t "$IMAGE_NAME:$IMAGE_VERSION" \
# 						 -t "$IMAGE_NAME:latest" \
# 						 -o type=tar,dest=$OUT_PATH/$IMAGE_NAME.tar \
#              -f ./fpga-dev-suite.Dockerfile "$ROOT_PATH"

docker build -t "$IMAGE_NAME:$IMAGE_VERSION" \
						 -t "$IMAGE_NAME:latest" \
             -f ./fpga-dev-suite.Dockerfile "$ROOT_PATH" 