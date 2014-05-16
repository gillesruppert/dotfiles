# load the dot files directory from the .dotfiles file
if [ -f $HOME/.dotfiles_dir ]; then
  DOT_FILES=`cat $HOME/.dotfiles_dir`
else
  echo "NO .dotfiles_dir SPECIFYING THE DOTFILES DIRECTORY!\nExiting..."
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi

unset color_prompt force_color_prompt

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Customisations
export TERM=xterm-256color

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# completion files
COMPLETION=`brew --prefix`/etc/bash_completion.d 
if [ -d $COMPLETION ]; then
  COMP_FILES=$COMPLETION/*
  for comp_file in $COMP_FILES; do
   . $comp_file
  done
fi

eval "$(hub alias -s)"

# homebrew completion
if [ -f `brew --prefix`/Library/Contributions/brew_bash_completion.sh ]; then
  . `brew --prefix`/Library/Contributions/brew_bash_completion.sh
fi

BASH_CONFIGS=$DOT_FILES/bash/*
for f in $BASH_CONFIGS; do
  if [[ -f $f ]]; then # make sure that we are dealing with a file
    . $f
  fi
done

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# project specific aliases. Not in repo
PROJECTS=$DOT_FILES/bash/projects/*
for f in $PROJECTS; do
  . $f
done

export PATH=$PATH:/Applications/MAMP/Library/bin

export NODE_PATH=/usr/local/lib/node_modules/:$NODE_PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### for Android debugging
export PATH="$HOME/dev/lib/adt-bundle/sdk/build-tools:$HOME/dev/lib/adt-bundle/sdk/tools:$HOME/dev/lib/adt-bundle/sdk/platform-tools:$PATH"

### set higher ulimit to avoid issues with watch:
ulimit -n 2560

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home"

alias vim="mvim -v"
