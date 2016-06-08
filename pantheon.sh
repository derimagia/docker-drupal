#!/usr/bin/env bash

# Default Values for terminus

DOCKER_HOME=${0%/*}
APP_DIRECTORY=$DOCKER_HOME/app

git -C $APP_DIRECTORY pull || git clone -- `terminus site connection-info --field=git_url` $APP_DIRECTORY

terminus site pipe @docker
