#!/bin/bash
CWD=$(cd $(dirname $0) && pwd)
BACKUP_DIR=$HOME/DOTFILES_BACKUP
mkdir -p $BACKUP_DIR

# back up existing files
echo "Backup previous dotfiles to ~/DOTFILES_BACKUP\n"

if [ -f $HOME/.bashrc ]; then
  mv $HOME/.bashrc $BACKUP_DIR/bashrc
fi

if [ -f $HOME/.gitconfig ]; then
  mv $HOME/.gitconfig $BACKUP_DIR/gitconfig
fi

if [ -f $HOME/.gitignore ]; then
  mv $HOME/.gitignore $BACKUP_DIR/gitignore
fi

if [ -f $HOME/.jshintrc ]; then
  mv $HOME/.jshintrc $BACKUP_DIR/jshintrc
fi


# set up .bashrc
ln -s $CWD/bashrc $HOME/.bashrc

# set up dot config files
ln -s $CWD/config.d/gitconfig $HOME/.gitconfig
ln -s $CWD/config.d/gitignore $HOME/.gitignore
ln -s $CWD/config.d/jshintrc $HOME/.jshintrc

# export the DOTFILES directory for use in .bashrc
echo $CWD > $HOME/.dotfiles_dir

echo "Close terminal and open a new one to source the new .bashrc"
