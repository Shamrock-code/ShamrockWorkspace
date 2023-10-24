
cd AdaptiveCpp
cmake -DCMAKE_INSTALL_PREFIX=../../sycl_compilers/acpp -B build . 

cd build
make -j install
cd ../..
