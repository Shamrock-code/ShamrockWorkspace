
cd intel_llvm

INSTALL_PATH=$(pwd)/../../sycl_compilers/intel_llvm

INSTALL_PATH=$(realpath ${INSTALL_PATH})

CMAKE_INSTALL_="-DCMAKE_INSTALL_PREFIX=${INSTALL_PATH}"

if ! type nvcc > /dev/null; then
    echo "CUDA=false"

    python3 buildbot/configure.py \
            --llvm-external-projects compiler-rt \
            --enable-plugin native_cpu \
            --cmake-opt=${CMAKE_INSTALL_}

else
    echo "CUDA=true"
    
    python3 buildbot/configure.py \
            --llvm-external-projects compiler-rt \
            --enable-plugin native_cpu \
	    --cuda \
            --cmake-opt=${CMAKE_INSTALL_}

fi

cd build
ninja all\
    lib/all\
    tools/libdevice/libsycldevice\
    install

cd ../..
