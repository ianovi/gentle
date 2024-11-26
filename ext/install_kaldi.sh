#!/bin/bash

cd kaldi/tools
mkdir python
extras/check_dependencies.sh
extras/install_mkl.sh
extras/install_openblas.sh
make clean
make
cd ../src
./configure --static --static-math=yes --static-fst=yes --use-cuda=no
make -j clean depend
