#!/bin/bash

SOURCE_DIR=$(pwd)
TARGET_DIR=/home/ubuntu
docker build -t zmklocal:latest --build-arg ZEPHYR_VERSION=3.5.0 --build-arg ARCHITECTURE=arm --build-arg ZEPHYR_SDK_VERSION=0.16.3 .  
docker run -v $SOURCE_DIR:$TARGET_DIR -it zmklocal:latest /bin/bash                                                                                        
