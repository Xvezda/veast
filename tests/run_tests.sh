#!/usr/bin/env bash

set -p


cd "$(dirname "${BASH_SOURCE[0]}")" || exit

vim +'verbose execute "Vader! *"' +'qall!' 2>&1 \
    | awk -f vader_filter.awk
