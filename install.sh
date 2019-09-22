#!/bin/bash

# If set, bash allows patterns which match no files
# to expand to a null string, rather than themselves.
shopt -s nullglob
set -o errexit
set -o nounset
#set -o verbose
#set -o xtrace

readonly ERR_FILE="$PWD"/LOG_ERR
touch ERR_FILE
log_err() {
    echo "[ERROR] $@" >> ERR_FILE
}

# Icon themes
download_icon_themes() {
    local LA_CAPITANE_REPO="git@github.com:keeferrourke/la-capitaine-icon-theme.git"
    cd ~
    mkdir -p ".icons"
    cd ".icons"
    git clone "$LA_CAPITANE_REPO" || log_err "Can't clone la capitane icon theme"
}


main() {
    echo "[Downloading icon themes]"
    (download_icon_themes)

    echo "end."
}

main
