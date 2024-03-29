typeset -U path
path=(
  $HOME/.cargo/bin
  $GEM_HOME/bin
  $PNPM_HOME
  $JAVA_HOME/bin
  $PYENV_ROOT/bin    # https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv
  $path
  $ANDROID_HOME/emulator                                            # https://reactnative.dev/docs/environment-setup
  $ANDROID_HOME/platform-tools                                      # https://reactnative.dev/docs/environment-setup
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" # https://code.visualstudio.com/docs/setup/mac
  $HOME/bin
)

typeset -U fpath
fpath=(
  "$HOMEBREW_PREFIX/share/zsh/site-functions"
  "$HOMEBREW_PREFIX/share/zsh-completions"
  $fpath
)
