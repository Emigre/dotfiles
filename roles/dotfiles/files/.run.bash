# makes, executes and watches sources from inside the build folder
function run() {
  if [ $# -eq 0 ]; then
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
  ag -l . .. | entr -c -d -s "make && ./$@"
}

