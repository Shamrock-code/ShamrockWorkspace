
cd intel_llvm

if ! type nvcc > /dev/null; then
    echo "CUDA=false"

    python3 buildbot/configure.py \
            --llvm-external-projects compiler-rt \
            --enable-plugin native_cpu \
            --cmake-opt="-DCMAKE_INSTALL_PREFIX=../../dpcpp_compiler"

else
    echo "CUDA=true"
    
    python3 buildbot/configure.py \
            --llvm-external-projects compiler-rt \
            --enable-plugin native_cpu \
	    --cuda \
            --cmake-opt="-DCMAKE_INSTALL_PREFIX=../../dpcpp_compiler"

fi

cd build
ninja all\
    lib/all\
    tools/libdevice/libsycldevice\
    install

cd ../..
