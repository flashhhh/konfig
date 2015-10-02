## Description
This is the collection of my configuration files for the set of my preferred applications. I've created this repository to track the history of them and as a backup.
Also, I use my config at remote machines using [sshrc](https://github.com/Russell91/sshrc).

NOTE: it's not a tool, it's more the way I fight with reality. I would like to introduce this solution as a tool, but it would really hard and time-consuming.

## Local usage
To use these configuration files locally, I keep this repository at my ~/konfig and I use symbolic links to proper directories and files at ~/.bashrc, ~/.vim/, ~/.vimrc, etc. That simple.

## Remote usage
I use `vim`, `vifm` and `fish` for a long time, so I was always wondered how to use all these stuff remotely with my configs.
When I started my attempts to figure out the way there was a few requirements:

1. use the same configs remotely as I use locally;
2. if I do push new stuff to this repository, I want to see changes at the remote server at the next session;
3. my configs shouldn't affect at any way the other users of this programms (also .bashrc, fish config shouldn't be changed);
4. the solution should be simple: created and forgot
5. it shouldn't require more than 8 hours per year to examine, create and maintain the solution; :)
6. I shouldn't do any actions at the remote side to "prepare" it except the programms installation.

So, I've come with this solution (all this magic is described in `bash` at `sshrc/.sshrc`):

1. go to the server using `sshrc` to perform the custom bash script (actually, `sshrc` is quite simple and just uses the `ssh -t` argument in the proper way);
2. download this repository or update if exists;
3. create a new temporary HOME directory (or use the existing one) and copy all my configs to it;
4. set the $HOME variable to the new directory;
5. launch `fish` if is installed;

Yeah, using the different $HOME dir is not a quite good idea, but it's really hard to run `fish` and `vim` fully isolated. Also, I copy `~/.ssh` from the original $HOME.

## How can I use it?

If you like my solution, you can simply use this repository as a prototype after reading `sshrc/.sshrc`.
If you want to create a tool from it, feel free to contribute at any way.

Please, leave your feedback via email or at reddit!

