#!/usr/bin/env bash

set -p


cd "$(dirname "${BASH_SOURCE[0]}")" || exit

vim -Nu vimrc +'Vader! *' +'qall!' 2>&1 \
    | sed -E 's/\x1b\[[0-9~;]*[a-zA-Z]//g' | sed -n '/^Starting Vader/,$p'
