#!/bin/bash
set -ex

ARTIFACT_NAME=$1
if [ -z "$ARTIFACT_NAME" ]; then
  ARTIFACT_NAME=kb54_nrf52840
  echo "No artifact name provided, using default: $ARTIFACT_NAME"
fi

SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[0]}")"
SOURCE_DIR="$(realpath "${SCRIPT_DIR}/../")"
TARGET_DIR=/home/ubuntu/kb54_zmk_config
CONTAINER_NAME=kb54_firmware_build
IMAGE_NAME=zmkfirmware/zmk-build-arm:stable
ARTIFACT_DIR="${TARGET_DIR}/artifacts/${ARTIFACT_NAME}"

if ! [ -x "$(command -v docker)" ]; then
  echo "Error: docker is not installed." >&2
  exit 1
fi

if [ "$(docker ps --all -q -f name=$CONTAINER_NAME)" ]; then
  docker stop $CONTAINER_NAME
  docker rm $CONTAINER_NAME
fi

docker run -it\
  --name $CONTAINER_NAME \
  -v $SOURCE_DIR:$TARGET_DIR \
  --entrypoint "/bin/bash" \
  -e HOME_DIR=$TARGET_DIR \
  -e ARTIFACT_DIR=$ARTIFACT_DIR \
  $IMAGE_NAME "$TARGET_DIR/scripts/build.sh"
