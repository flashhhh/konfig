function fish_greeting
    set -l yellow (set_color -o yellow)
    set -l normal (set_color -o normal)

    set -l whoami $yellow(whoami)$normal
    set -l hostname $yellow(hostname -f)$normal

    echo "Hi, $whoami, you are at $hostname"
end
