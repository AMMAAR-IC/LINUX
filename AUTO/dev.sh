#!/bin/sh

. "$HOME/auto/config.sh"
. "$HOME/auto/utils.sh"

cd "$WORKDIR" || exit 1

run $EDITOR .
run git status
