Buildtool="ninja"
if ! type ninja > /dev/null; then
    Buildtool="make"
fi

echo "current build system : ${Buildtool}"

cd Shamrock


python3 buildbot/configure.py --gen "${Buildtool}" --tests --build release \
    --outdir build_config/dpcpp_cuda_release --cxxpath sycl_compilers/dpcpp --compiler dpcpp --profile cuda

python3 buildbot/configure.py --gen "${Buildtool}" --tests --build debug \
    --outdir build_config/dpcpp_cuda_debug --cxxpath sycl_compilers/dpcpp --compiler dpcpp --profile cuda

python3 buildbot/configure.py --gen "${Buildtool}" --tests --build release \
    --outdir build_config/dpcpp_cudai32_release --cxxpath sycl_compilers/dpcpp --compiler dpcpp --profile cuda-index32bit

python3 buildbot/configure.py --gen "${Buildtool}" --tests --build debug \
    --outdir build_config/dpcpp_cudai32_debug --cxxpath sycl_compilers/dpcpp --compiler dpcpp --profile cuda-index32bit

python3 buildbot/configure.py --gen "${Buildtool}" --tests --build release \
    --outdir build_config/opensycl_omp_release --cxxpath sycl_compilers/opensycl --compiler opensycl --profile omp

python3 buildbot/configure.py --gen "${Buildtool}" --tests --build debug \
    --outdir build_config/opensycl_omp_debug --cxxpath sycl_compilers/opensycl --compiler opensycl --profile omp

python3 buildbot/configure.py --gen "${Buildtool}" --tests --build debug \
    --outdir build_config/opensycl_omp_asan_debug --cxxpath sycl_compilers/opensycl --compiler opensycl --profile omp_sanitizer

python3 buildbot/configure.py --gen "${Buildtool}" --tests --build release \
    --outdir build_config/opensycl_generic_release --cxxpath sycl_compilers/opensycl --compiler opensycl --profile generic

python3 buildbot/configure.py --gen "${Buildtool}" --tests --build debug \
    --outdir build_config/opensycl_generic_debug --cxxpath sycl_compilers/opensycl --compiler opensycl --profile generic







ln -sf build_config/dpcpp_cuda_release build