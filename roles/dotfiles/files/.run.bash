# makes, executes and watches sources from inside the build folder
function run() {
  local binary_name=""
  local cmake_path="."
  if [ $# -eq 0 ]; then
    if [[ `basename "$PWD"` == 'build' ]]; then
      cmake_path='..'
    fi
    if [[ -f "$cmake_path/CMakeLists.txt" ]]; then
      binary_name=`grep -o -m 1 "set(APP_NAME \(\w\+\))" $cmake_path/CMakeLists.txt | sed -E "s/.*\(APP_NAME ([^']+)\).*/\\1/"`
    fi
  else
    binary_name=$@
  fi
  if [[ $binary_name == "" ]]; then
    echo "✗ Error: No binary name provided"
    return
  fi
  if [[ ! `basename "$PWD"` == 'build' ]]; then
    if [ -d build ]; then
      cd build
    else
      echo "✗ Error: No build folder"
      return
    fi
  fi
  ag -l . .. | entr -c -d -s "make && ./$binary_name"
}

