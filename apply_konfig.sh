#!/bin/bash
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for dir in $(ls -A "$DIR/home"); do
    if [ -d "$HOME/$dir" ] && ! [ -L "$HOME/$dir" ]; then
        for subdir in $(ls -A "$DIR/home/$dir"); do
            rm -f "$HOME/$dir/$subdir"
            ln -s "$DIR/home/$dir/$subdir" "$HOME/$dir/$subdir"
        done
    else
        rm -f "$HOME/$dir"
        ln -s "$DIR/home/$dir" "$HOME/$dir"
    fi
done

echo OK
