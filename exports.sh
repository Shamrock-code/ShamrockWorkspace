export DPCPP_HOME=$(pwd)/sycl_compilers/dpcpp/
export PATH=$DPCPP_HOME/bin:$PATH
export LD_LIBRARY_PATH=$DPCPP_HOME/lib:$LD_LIBRARY_PATH

export OPENSYCL_HOME=$(pwd)/sycl_compilers/opensycl/
export PATH=$OPENSYCL/bin:$PATH
export LD_LIBRARY_PATH=$OPENSYCL/lib:$LD_LIBRARY_PATH