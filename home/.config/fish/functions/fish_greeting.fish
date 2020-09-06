function fish_greeting
    set -l yellow (set_color -o yellow)
    set -l normal (set_color -o normal)

    set -l whoami_colored $yellow(whoami)$normal
    set -l hostname_colored $yellow(hostname -f)$normal

    echo "Hi, $whoami_colored, you are at $hostname_colored"
end
