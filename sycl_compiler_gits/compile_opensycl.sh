
cd opensycl
cmake -DCMAKE_INSTALL_PREFIX=../../sycl_compilers/opensycl -B build . 
make -j install
cd ..