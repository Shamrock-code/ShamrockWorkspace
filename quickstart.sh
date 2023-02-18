git submodule init
git submodule update

# setup the compilers
sh setup_compilers.sh

# clone shamrock
git clone --recurse-submodules git@github.com:tdavidcl/Shamrock.git

source exports.sh

