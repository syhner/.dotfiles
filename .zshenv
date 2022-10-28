echo 'Hello from .zshenv'

# Set variables
export HOMEBREW_CASK_OPTS="--no-quarantine" # Don't quarantine casks installed with Homebrew

# Declare functions
# Returns exit code: 0 - command exists, 1 - command does not exist
function exists() {
  command -v $1 >/dev/null 2>&1
}