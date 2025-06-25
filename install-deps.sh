#!/bin/bash

set -eux

pushd $(dirname $(realpath $0))

install_velox_deps() {
    pushd ./velox
    ./scripts/setup-ubuntu.sh
    popd
}

install_apt() {
    sudo apt update && sudo apt install -y libbenchmark-dev libgflags-dev
}

mkdir -p $PWD/deps-download
mkdir -p $PWD/deps-install

export DEPENDENCY_DIR=$PWD/deps-download
export INSTALL_PREFIX=$PWD/deps-install

install_velox_deps
install_apt

popd