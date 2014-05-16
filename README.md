There is no place like home
===========================

Collection of my . files. This has only been really tested on OSX, although it
should work with maybe some tweeting on Linux distros.

- customised .bashrc
- bash\_aliases
- env
- config that sets up the prompt just the way I like it
- base .jshintrc settings
- .gitignore\_global
- etc

## Installation
```bash
make install
```

This will backup any files that are in the home directory and that would be
overwritten by the script into the `DOTFILES\_BACKUP`.

Just follow the directions on screen.

## Add another config
To add another config, just move the config from the `$HOME` to the ./config.d/
directory. Make sure you remove the leading `.`, i.e. `~/.bashrc` will be 
`./config.d/bashrc`
