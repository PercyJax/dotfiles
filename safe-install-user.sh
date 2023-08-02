#!/bin/bash

set -euo pipefail
shopt -s expand_aliases

USERCONFIGS="$(find USERHOME -maxdepth 0 -type d | xargs ls -1)"

# Not using --dotfiles because it is currently broken
# https://github.com/aspiers/stow/issues/33
echo "${USERCONFIGS}" | xargs -I '{}' stow -v -d ./USERHOME -t ~/ {}
