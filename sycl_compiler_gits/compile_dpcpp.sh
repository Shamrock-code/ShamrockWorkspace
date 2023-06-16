
cd dpcpp

if ! type nvcc > /dev/null; then
    echo "CUDA=false"
    python3 buildbot/configure.py --llvm-external-projects compiler-rt --cmake-opt="-DCMAKE_INSTALL_PREFIX=../../../sycl_compilers/dpcpp"
else
    echo "CUDA=true"
    python3 buildbot/configure.py --llvm-external-projects compiler-rt --cuda --cmake-opt="-DCMAKE_INSTALL_PREFIX=../../../sycl_compilers/dpcpp"
fi

cd build
ninja all\
    lib/libsycl-cmath-fp64.o               \
    lib/libsycl-fallback-cstring.spv\
    lib/libsycl-cmath.o                    \
    lib/libsycl-fallback-imf-fp64.o\
    lib/libsycl-complex-fp64.o             \
    lib/libsycl-fallback-imf-fp64.spv\
    lib/libsycl-complex.o                  \
    lib/libsycl-fallback-imf.o\
    lib/libsycl-crt.o                      \
    lib/libsycl-fallback-imf.spv\
    lib/libsycl-fallback-cassert.o         \
    lib/libsycl-imf-fp64.o\
    lib/libsycl-fallback-cassert.spv       \
    lib/libsycl-imf.o\
    lib/libsycl-fallback-cmath-fp64.o      \
    lib/libsycl-itt-compiler-wrappers.o\
    lib/libsycl-fallback-cmath-fp64.spv    \
    lib/libsycl-itt-stubs.o\
    lib/libsycl-fallback-cmath.o           \
    lib/libsycl-itt-user-wrappers.o\
    lib/libsycl-fallback-cmath.spv         \
    lib/libsycl_pi_trace_collector.so\
    lib/libsycl-fallback-complex-fp64.o    \
    lib/libsycl_profiler_collector.so\
    lib/libsycl-fallback-complex-fp64.spv  \
    lib/libsycl_sanitizer_collector.so\
    lib/libsycl-fallback-complex.o         \
    lib/libsycl.so\
    lib/libsycl-fallback-complex.spv       \
    lib/libsycl.so.7\
    lib/libsycl-fallback-cstring.o         \
    lib/libsycl.so.7.0.0-4\
    tools/libdevice/libsycldevice\
    install

cd ../..
