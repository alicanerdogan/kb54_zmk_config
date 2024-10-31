#!/bin/bash

docker build -t zmklocal:latest --build-arg ZEPHYR_VERSION=3.5.0 --build-arg ARCHITECTURE=arm --build-arg ZEPHYR_SDK_VERSION=0.16.3 .  
