#!/usr/bin/env bash

set -p


cd "$(dirname "${BASH_SOURCE[0]}")" || exit

vim -Nu vimrc +'Vader! *' +'qall!' 2>&1 \
    | sed -n '/^Starting Vader/,$p'
