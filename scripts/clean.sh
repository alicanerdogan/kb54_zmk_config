#!/bin/bash

rm -rf zephyr/.git
# Clean up all untracked files
git clean -ffdx
