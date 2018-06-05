function fish_right_prompt
    set -l last_status $status
    [ $last_status = 0 ]; and set -l last_status ""

    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l blue (set_color -o blue)
    set -l normal (set_color normal)
    set -l red (set_color red)

    set -l delim "$yellow:"
    set -l pwd (basename (pwd))
    set -l cwd "$cyan$pwd"
    set -l hostname $blue(hostname -f)
    set -l whoami $blue(whoami)

    #echo -n -s "$red$last_status $whoami$yellow@$hostname$delim$cwd"
    #set -l ms ms
    #echo $cyan$CMD_DURATION$ms
end
