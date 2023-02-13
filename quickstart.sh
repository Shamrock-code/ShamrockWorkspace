# setup the compilers
sh setup_compilers.sh

# clone shamrock
git clone git@github.com:tdavidcl/Shamrock.git

source exports.sh

cd Shamrock



Buildtool="ninja"
if ! type ninja > /dev/null; then
    Buildtool="make"
fi

echo "current build system : ${Buildtool}"


# run shamrock buildbot