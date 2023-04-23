#
# SHLVL
#
# Show current shell level

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_SHLVL_SHOW="${SPACESHIP_SHLVL_SHOW=true}"
SPACESHIP_SHLVL_PREFIX="${SPACESHIP_SHLVL_PREFIX="at "}"
SPACESHIP_SHLVL_SYMBOL="${SPACESHIP_SHLVL_SYMBOL="🐚 "}"
SPACESHIP_SHLVL_COLOR="${SPACESHIP_SHLVL_COLOR="blue"}"
SPACESHIP_SHLVL_SUFFIX="${SPACESHIP_SHLVL_SUFFIX=" "}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show shell level
spaceship_shlvl() {
  [[ $SPACESHIP_SHLVL_SHOW == false ]] && return
  [[ $SHLVL == 1 ]] && return

  # Display shell level section
  spaceship::section::v4 \
    --color "$SPACESHIP_SHLVL_COLOR" \
    --prefix "$SPACESHIP_SHLVL_PREFIX" \
    --symbol "$SPACESHIP_SHLVL_SYMBOL" \
    "$SHLVL" \
    --suffix "$SPACESHIP_SHLVL_SUFFIX"
}
