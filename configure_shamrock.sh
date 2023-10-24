Buildtool="ninja"
if ! type ninja > /dev/null; then
    Buildtool="make"
fi

echo "current build system : ${Buildtool}"

python3 Shamrock/buildbot/configure.py --gen "${Buildtool}" --tests --build release \
    --builddir Shamrock/build_config/intel_llvm_cuda_release --cxxpath sycl_compilers/intel_llvm --compiler intel_llvm --profile cuda
    
python3 Shamrock/buildbot/configure.py --gen "${Buildtool}" --tests --build debug \
    --builddir Shamrock/build_config/intel_llvm_cuda_debug --cxxpath sycl_compilers/intel_llvm --compiler intel_llvm --profile cuda

python3 Shamrock/buildbot/configure.py --gen "${Buildtool}" --tests --build release \
    --builddir Shamrock/build_config/acpp_omp_release --cxxpath sycl_compilers/acpp --compiler acpp --profile omp
    
python3 Shamrock/buildbot/configure.py --gen "${Buildtool}" --tests --build debug \
    --builddir Shamrock/build_config/acpp_omp_debug --cxxpath sycl_compilers/acpp --compiler acpp --profile omp
    
python3 Shamrock/buildbot/configure.py --gen "${Buildtool}" --tests --build asan \
    --builddir Shamrock/build_config/acpp_omp_asan --cxxpath sycl_compilers/acpp --compiler acpp --profile omp

python3 Shamrock/buildbot/configure.py --gen "${Buildtool}" --tests --build release \
    --builddir Shamrock/build_config/acpp_cuda_sm70_release --cxxpath sycl_compilers/acpp --compiler acpp --profile cuda-sm70

python3 Shamrock/buildbot/configure.py --gen "${Buildtool}" --tests --build release \
    --builddir Shamrock/build_config/acpp_generic_release --cxxpath sycl_compilers/acpp --compiler acpp --profile generic
    


cd Shamrock
ln -sf build_config/intel_llvm_cuda_release build
