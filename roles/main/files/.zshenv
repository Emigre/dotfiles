# load order:
# 1. zsh as login shell (before tmux is loaded)
#     .zshenv
#     .zshprofile
#     .zshrc
# 1. zsh (when tmux is loaded)
#     .zshenv
#     .zshrc

# tmux uses /bin/sh to run zsh, this avoids double sourcing
# of .zshenv, but also sets SHELL as /bin/sh
# so the value has to be set to /bin/zsh here as a default
export SHELL='/bin/zsh'

# check if TMUX is not set to load env vars
# only before loading tmux
if ! [ -n "$TMUX" ]; then
  export PATH="$PATH:$HOME/.local/bin"
  export EDITOR='nvim'
  export NAVI_PATH="$HOME/cheats"

  # Utility scripts
  export PATH="$PATH:$HOME/scripts"

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
  export PATH="$PATH:$ANDROID_HOME/emulator"
  export PATH="$PATH:$ANDROID_HOME/tools"
  export PATH="$PATH:$ANDROID_HOME/tools/bin"
  export PATH="$PATH:$ANDROID_HOME/platform-tools"

  # JavaScript
  export PATH="$PATH:$HOME/.node/bin"
  export PATH="$PATH:$HOME/.yarn/bin"

  # Python
  export PIP_CONFIG_FILE="$HOME/.pip_conf"

  # Ruby
  export PATH="$PATH:$HOME/.rvm/bin"

  # PostgreSQL
  export PGDATA='/usr/local/var/postgres'

  # MongoDB
  export PATH="$PATH:/usr/local/opt/mongodb-community@3.6/bin"

  # Kubernetes
  export KUBECONFIG="$HOME/.kube/wd-audio-platform-admin-dev.kubeconfig"

  # AWS
  export AWS_SDK_LOAD_CONFIG="true"
  # export AWS_DEFAULT_PROFILE=...

  # Terraform
  # export AWS_PROFILE=...
fi
