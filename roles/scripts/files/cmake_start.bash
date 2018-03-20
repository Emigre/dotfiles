# Creates files and folders for a CMake project
function cmake_start() {
  local use_the_force=false
  for i in "$@" ; do
    if [[ $i == "-f" || $i == "--force" ]]; then
      echo "! Warning: Using force flag, will write in non-empty folders"
      use_the_force=true
      break
    fi
  done
  if [[ "$(ls -A .)" && "$use_the_force" == false ]]; then
    echo "✗ Error: Stopping execution, the folder is not empty"
  else
    echo "- Creating project files and folders"
    mkdir -p src test
    touch LICENSE README.md
    if [ -z "$(ls -A ./src)" ]; then
      echo '#include <iostream>

int main() {
  std::cout << "Hello, World!" << std::endl;
}' > ./src/main.cpp
      echo "· An example main.cpp file has been created"
    fi
    if [[ ! -f "./CMakeLists.txt" ]]; then
      echo 'cmake_minimum_required(VERSION 3.3)
set(APP_NAME myApp)
project(${APP_NAME})
set (${APP_NAME}_VERSION_MAJOR 1)
set (${APP_NAME}_VERSION_MINOR 0)

set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -g -std=c++14")

set (SOURCE_FILES
    src/main.cpp)

add_executable(${APP_NAME} ${SOURCE_FILES})' > CMakeLists.txt
      echo "· An example CMakeLists.txt file has been created"
    fi
    if [[ ! -f "./.gitignore" ]]; then
      echo 'build*/' > .gitignore
      echo "· An example .gitignore file has been created"
    fi
    if [ "$use_autoscan" == true ]; then
      echo "- Executing autoscan"
      autoscan
    fi
    echo "✓ Done"
  fi

}
