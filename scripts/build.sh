#!/bin/bash

SCRIPTS_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ROOT_DIR="${SCRIPTS_DIR}/.."
BUILD_DIR="${ROOT_DIR}/build"
THREADS_NUM=$(($(nproc) * 2))

echo "What type of build do you want to build?"
echo "1. Debug"
echo "2. Release"
read -p "Choose an option (1 or 2): " CHOICE_VAR

case $CHOICE_VAR in
1)
    echo "Debug selected."
    BUILD_DIR="${ROOT_DIR}/build_debug"
    cmake -S "${ROOT_DIR}" -B "${BUILD_DIR}" -DCMAKE_BUILD_TYPE=Debug
    ;;
2)
    echo "Release selected."
    BUILD_DIR="${ROOT_DIR}/build_release"
    cmake -S "${ROOT_DIR}" -B "${BUILD_DIR}" -DCMAKE_BUILD_TYPE=Release
    ;;
*)
    echo "Wrong choice. Choose 1 or 2."
    exit 1
    ;;
esac

cd ${BUILD_DIR}
make install -j$THREADS_NUM

exit $?
