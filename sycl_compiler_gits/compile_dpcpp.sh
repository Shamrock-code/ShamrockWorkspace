
cd dpcpp

if ! type nvcc > /dev/null; then
    echo "CUDA=false"
    python3 buildbot/configure.py --enable-esimd-emulator --llvm-external-projects compiler-rt --cmake-opt="-DCMAKE_INSTALL_PREFIX=../../../sycl_compilers/dpcpp"
else
    echo "CUDA=true"
    python3 buildbot/configure.py --enable-esimd-emulator --llvm-external-projects compiler-rt --cuda --cmake-opt="-DCMAKE_INSTALL_PREFIX=../../../sycl_compilers/dpcpp"
fi

cd build
ninja all\
    lib/all\
    tools/libdevice/libsycldevice\
    install

cd ../..
