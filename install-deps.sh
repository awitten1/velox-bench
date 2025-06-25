#!/bin/bash

set -eux

pushd $(dirname $(realpath $0))

install_velox_deps() {
    pushd ./velox
    ./scripts/setup-ubuntu.sh
    popd
}

export DEPENDENCY_DIR=$PWD/deps-download
export INSTALL_PREFIX=$PWD/deps-install
install_velox_deps

popd