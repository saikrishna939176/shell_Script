#!/bin/bash

set -e

error() {
    echo "Failed at $1: $2"
}

trap 'error ${LINENO} "$BASH_COMMAND"' ERR

install deva -y
echo "is script processding?"