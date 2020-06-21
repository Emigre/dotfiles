# check if TMUX is not set to load env vars
# this ensures that this is run only before loading tmux
# I prefer not to put this in .zprofile as the env vars
# are supposed to be in .zshenv
if ! [ -n "$TMUX" ]; then
  # tmux uses /bin/sh to run zsh, this avoids double sourcing
  # of .zshenv, but also sets SHELL as /bin/sh
  # so the value has to be set to /bin/zsh here as a default
  export SHELL='/bin/zsh'
  export EDITOR='/usr/local/bin/nvim'

  export PATH="$PATH:$HOME/.local/bin"

  # LaTeX
  export PATH="$PATH:/Library/Tex/textbin"

  # C++
  export OF_ROOT="$HOME/code/cpp/openFrameworks"

  # Java
  export JAVA_HOME='/Library/Java/JavaVirtualMachines/openjdk-11.0.2.jdk/Contents/Home'
  export PATH="$PATH:$JAVA_HOME/bin"
  export GRADLE_USER_HOME="$HOME/.gradle"
  export MAVEN_OPTS="-Xms256m -Xmx512m"
  export M2_HOME='/usr/local/Cellar/maven/3.5.4/libexec'
  export M2="$M2_HOME/bin"
  export PATH="$PATH:$M2"
  export JDK_HOME=${JAVA_HOME}
  # export PATH="$PATH:$ANDROID_HOME/emulator"
  # export PATH="$PATH:$ANDROID_HOME/tools"
  # export PATH="$PATH:$ANDROID_HOME/tools/bin"
  # export PATH="$PATH:$ANDROID_HOME/platform-tools"

  # JavaScript
  export PATH="$PATH:$HOME/.node/bin"
  export PATH="$PATH:$HOME/.yarn/bin"

  # Python
  export PIP_CONFIG_FILE="$HOME/.pip_conf"

  # Ruby
  export PATH="$PATH:$HOME/.rvm/bin"

  # Swift
  export SOURCEKIT_TOOLCHAIN_PATH='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/'

  # Haskell
  export PATH="/usr/local/opt/ghc@8.6/bin:$PATH"
  # For compilers to find ghc@8.6 you may need to set:
  #  export LDFLAGS="-L/usr/local/opt/ghc@8.6/lib"

  # AWS
  export AWS_SDK_LOAD_CONFIG="true"
  # export AWS_DEFAULT_PROFILE=...

  # Terraform
  # export AWS_PROFILE=...
fi
