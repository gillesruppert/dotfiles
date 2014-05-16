#!/bin/bash
CWD=$(cd $(dirname $0) && pwd)
CONFIG_DIR=$CWD/config.d
BACKUP_DIR=$HOME/DOTFILES_BACKUP
mkdir -p $BACKUP_DIR

cd $CONFIG_DIR
CONFIGS=(*)
cd ../

# back up existing files
function backup_config {
  echo "Backup previous dotfiles to ~/DOTFILES_BACKUP"
  for config in "${CONFIGS[@]}"; do
    conf=$HOME/.$config
    if [ -f $conf ]; then
      mv $conf $BACKUP_DIR/$config
      echo "Backed up: $conf to $BACKUP_DIR/$config"
    fi
  done
}


function link_config {
  echo "Link new configs"
  # link up the files
  for config in "${CONFIGS[@]}"; do
    conf=$HOME/.$config
    ln -s $CWD/config.d/$config $conf
    echo "Linked: $conf"
  done

  ## export the DOTFILES directory for use in .bashrc
  echo $CWD > $HOME/.dotfiles_dir
  echo ''
  echo "Close terminal and open a new one to source the new .bashrc"
}

case $1 in
  backup) backup_config;;
  link) link_config;;
esac


