# Runs CMake in a build folder
function cmake_build() {
  if [[ ! `basename "$PWD"` == 'build' ]]; then
    mkdir -p build
    cd build
  fi
  cmake -D CMAKE_BUILD_TYPE=Debug ../
}

