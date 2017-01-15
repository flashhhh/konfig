function fish_right_prompt
    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l blue (set_color -o blue)
    set -l normal (set_color normal)

    set -l delim "$yellow:"
    set -l cwd $cyan(pwd)
    set -l hostname $blue(hostname -f)
    set -l whoami $blue(whoami)

    echo -n -s "$whoami$yellow@$hostname$delim$cwd"
end
