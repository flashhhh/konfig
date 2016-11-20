#!/bin/bash
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for dir in $(ls -A "$DIR/home"); do
    if [ -d "$HOME/$dir" ]; then
        ls -A "$DIR/home/$dir" | xargs -I "%" ln -sfFh "$DIR/home/$dir/%" "$HOME/$dir/%"
    else
        ln -sfFh "$DIR/home/$dir" "$HOME/$dir"
    fi
done

echo OK
