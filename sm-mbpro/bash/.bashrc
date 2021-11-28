#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTCONTROL=ignoreboth
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

export EDITOR=/usr/bin/nano
export LANG=en_US
export PATH=~/bin:/usr/local/sbin:~/Library/Python/3.7/bin:$PATH
export PATH=/usr/local/opt/libpq/bin:$PATH

cyan='\[\033[01;36m\]'
blue='\[\033[01;34m\]'
reset='\[\033[0m\]'

PS1="$cyan\u@\h$reset:$blue\W$reset\$ "		# type of quotations matter!

#PS1='\[\033[01;36m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '

# enable color support of ls
#eval "$(dircolors -b)"	# not working on macOS

#source ~/.bash_aliases

# archey
#fortune -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n | lolcat --seed 0 --spread 1.0

# hack to keep a bash open when starting it with a command
[[ $startup_cmd ]] && { declare +x $startup_cmd; eval "$startup_cmd"; }

# Path to the bash it configuration
export BASH_IT="/Users/szmktk/.bash-it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
#export BASH_IT_THEME='my-nwinkler'
export BASH_IT_THEME='my-brainy'
#export BASH_IT_THEME='brainy'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source "$BASH_IT"/bash_it.sh

source ~/.bash_aliases

# source git completions that are missing
[ -f /usr/local/etc/bash_completion.d/git-completion.bash ] && . /usr/local/etc/bash_completion.d/git-completion.bash

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/szmktk/Downloads/node_modules/tabtab/.completions/serverless.bash ] && . /Users/szmktk/Downloads/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/szmktk/Downloads/node_modules/tabtab/.completions/sls.bash ] && . /Users/szmktk/Downloads/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/szmktk/Downloads/node_modules/tabtab/.completions/slss.bash ] && . /Users/szmktk/Downloads/node_modules/tabtab/.completions/slss.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

launchctl setenv JAVA_HOME `/usr/libexec/java_home`
