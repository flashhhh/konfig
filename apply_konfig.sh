#!/bin/bash
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for dir in $(ls -A "$DIR/home"); do
    echo $dir
    if [ -d "$HOME/$dir" ]; then
        ls -A "$DIR/home/$dir" | xargs -I "%" ln -sfF "$DIR/home/$dir/%" "$HOME/$dir/%"
    else
        ln -sfF "$DIR/home/$dir" "$HOME/$dir"
    fi
done
