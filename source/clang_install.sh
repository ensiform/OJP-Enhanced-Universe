#!/bin/sh

set -ex

cd build_clang
cmake --install .
cd ..

cd build_clang32
cmake --install .
cd ..

cd $HOME/Games/ete/etf
zip "mp_bin.pk3" cgame.mp.x86_64.so ui.mp.x86_64.so platforms.json
cd $HOME/Projects/etf/code
