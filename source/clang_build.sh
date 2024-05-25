#!/bin/sh

set -ex

mkdir -p build_clang
cd build_clang
if [ -e "CMakeCache.txt" ]; then
  rm -R ./*
fi
export CC="clang"
export CXX="clang++"
cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/home/jd/Games/jka" ..
#mold -run cmake --build . --config Release --parallel
cmake --build . --config Release --parallel
cd ..

#mkdir -p build_clang32
#cd build_clang32
#if [ -e "CMakeCache.txt" ]; then
#  rm -R ./*
#fi
#export CC="clang"
#export CXX="clang++"
#cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE="~/Projects/etf/code/cmake/toolchains/linux-i686.cmake" -DCMAKE_INSTALL_PREFIX="/home/jd/Games/ete" ..
#mold -run cmake --build . --config Release --parallel
##cmake --build . --config Release --parallel
#cd ..
