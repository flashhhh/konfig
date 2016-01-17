abbr _gs="git status"
abbr _ga="git add -A"
abbr _rt="run tmux"

if [ -d ~/konfig ]
    set -x KONFIG_DIR ~/konfig
end
if [ -d /tmp/konfig ]
    set -x KONFIG_DIR /tmp/konfig
end
