#!/bin/bash

SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[0]}")"
SOURCE_DIR="$(realpath "${SCRIPT_DIR}/../")"
CONTAINER_NAME=kb54_firmware_build
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

rm -rf "$SOURCE_DIR/../zephyr/.git"
# Clean up all untracked files
git clean -ffdx
