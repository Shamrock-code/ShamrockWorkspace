
cd opensycl
cmake -DCMAKE_INSTALL_PREFIX=../../sycl_compilers/opensycl -B build . 

cd build
make -j install
cd ../..