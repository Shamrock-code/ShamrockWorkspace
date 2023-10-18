
cd AdaptiveCpp
cmake -DCMAKE_INSTALL_PREFIX=../../sycl_compilers/acpp -DWITH_CUDA_BACKEND=ON -DCUDAToolkit_LIBRARY_ROOT=/usr -B build . 

cd build
make -j install
cd ../..
