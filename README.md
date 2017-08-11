## Description
This is a collection of my configuration files for the set of my preferred applications. I've created this repository to track the history of them and as a backup.
Also, I use my config at remote machines using [sshrc](https://github.com/Russell91/sshrc).

NOTE: it's not a tool, it's more the way I fight with reality. I would like to introduce this solution as a tool, but it would really hard and time-consuming.

UPDATE: after some research I have figured out that people have great time with "dotfiles"-like repositories paired with tools like [homesick](https://github.com/technicalpickles/homesick) or [homeshick](https://github.com/andsens/homeshick). This repository could basically be structured that way, but I enjoy having my own implementation and the sshrc integration is also very important for me.

## Local usage
To use these configuration files locally, I keep this repository at my ~/.konfig and I use symbolic links pointing to proper directories and files at ~/.bashrc, ~/.vim/, ~/.vimrc, etc. That simple. apply_konfig.sh is a dead-simple script to do that.

## Remote usage
I've been using `vim`, `tmux` and `fish` for a long time, so I was always wondering how to use all of these remotely with my configs.
When I started my attempts to figure out the way there was a few requirements:

1. Use the same configs remotely as I use locally
2. If I do push new stuff to this repository, I want to see changes at the remote server at the next session
3. My configs shouldn't affect at any way the other users of this programms globally
4. The solution should be simple: created and forgot
5. It shouldn't require more than 8 hours per year to examine, create and maintain the solution :)
6. I shouldn't do any actions at the remote side to "prepare" it except the programms installation

So, I've come to this solution eventually (all this magic is described in `bash` at `sshrc/.sshrc`):

1. Go to the server using `sshrc` to perform the custom bash script (actually, `sshrc` is quite simple and just uses the `ssh -t` argument the proper way)
2. Download this repository or update if exists
3. Run `apply_konfig.sh` to create the symbolic links
4. Switch to Fish shell if it is installed

It also might be a good idea to run all that stuff isolated with Docker, but it creates a ton of other challenges.

## How can I use it?

If you like my solution, you can simply use this repository as a prototype after reading `sshrc/.sshrc`.
If you want to create a tool from it, feel free to contribute in any way.

Please, leave your feedback!

