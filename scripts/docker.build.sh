#!/bin/bash

set -e

SOURCE_DIR=$(pwd)
TARGET_DIR=/home/ubuntu/kb54_zmk_config

docker run -it\
  -v $SOURCE_DIR:$TARGET_DIR \
  --entrypoint "/bin/bash" \
  -e HOME_DIR=$TARGET_DIR \
  zmkfirmware/zmk-build-arm:stable "$TARGET_DIR/scripts/build.sh"
