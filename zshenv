echo 'Hello from .zshenv'

# Returns exit code: 0 - command exists, 1 - command does not exist
function exists() {
  command -v $1 >/dev/null 2>&1
}