. ~/Dropbox/settings/dotfiles/bash/env
. ~/Dropbox/settings/dotfiles/bash/config
. ~/Dropbox/settings/dotfiles/bash/aliases
if [ -f /opt/local/etc/bash_completion ]; then
	. /opt/local/etc/bash_completion
else
	. ~/Dropbox/settings/dotfiles/git-completion.bash
fi

