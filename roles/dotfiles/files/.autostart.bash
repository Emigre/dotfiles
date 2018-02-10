# Creates files and folders for an Autotools project
function autostart() {
  local use_the_force=false
  local use_autoscan=false
  for i in "$@" ; do
    if [[ $i == "-f" || $i == "--force" ]]; then
      echo "! Warning: Using force flag, will write in non-empty folders"
      use_the_force=true
      break
    fi
  done
  for i in "$@" ; do
    if [[ $i == "-s" || $i == "--autoscan" ]]; then
      use_autoscan=true
      break
    fi
  done
  if [[ "$(ls -A .)" && "$use_the_force" == false ]]; then
    echo "✗ Error: Stopping execution, the folder is not empty"
  else
    echo "- Creating project files and folders"
    mkdir -p src test
    touch AUTHORS ChangeLog NEWS README
    if [ -z "$(ls -A ./src)" ]; then
      echo '#include <iostream>

int main() {
  std::cout << "Hello, World!" << std::endl;
}' > ./src/main.cpp
      echo "· An example main.cpp file has been created"
    fi
    if [[ ! -f "./configure.ac" ]]; then
      echo 'AC_PREREQ([2.69])
AC_INIT([FULL-PACKAGE-NAME], 1.0)
AM_INIT_AUTOMAKE

AC_CONFIG_SRCDIR([src/main.cpp])
AC_CONFIG_FILES([Makefile src/Makefile])

AC_PROG_CXX
AC_PROG_CC

AC_OUTPUT' > configure.ac
      echo "· An example configure.ac file has been created"
    fi
    if [[ ! -f "./Makefile.am" ]]; then
      echo 'SUBDIRS = src' > Makefile.am
      if [[ ! -f "./src/Makefile.am" ]]; then
        echo 'bin_PROGRAMS = program_name
program_name_CXXFLAGS = -Wall -g -std=c++14
program_name_SOURCES = main.cpp' > ./src/Makefile.am
        echo "· Several example Makefile.am files have been created"
      else
        echo "· An example Makefile.am has been created"
      fi
    fi
    if [[ ! -f "./.gitignore" ]]; then
      echo '.deps
/autom4te.cache/
/config/
Makefile
Makefile.in
aclocal.m4
autoscan.log
build
compile
config.h
config.h.in
config.log
config.status
configure
configure.scan
depcomp
dist
install-sh
m4
missing
*.a
*.dylib
*.o
*.so*' > .gitignore
      echo "· An example .gitignore file has been created"
    fi
    if [ "$use_autoscan" == true ]; then
      echo "- Executing autoscan"
      autoscan
    fi
    echo "✓ Done"
  fi
}
