# Profiles

Here are my profiles for Bash, Vim, Tmux and interactive Python shell.

## Bash

```
bash/
├── .bash_aliases
├── .bash_profile
├── .bash_tweaks
└── .bashrc
```

## Vim

```
vim/
├── .vim
│   ├── bundle
│   │   └── tabular
│   │       └── after
│   │           └── plugin
│   │               └── my_tabular_commands.vim
│   ├── ftdetect
│   └── keymap
│       └── russian-jcukenmac.vim
└── .vimrc
```

## Installation

1. Clone this repo. Use a branch suitable for your OS:

    ```
    git clone https://github.com/mshkrebtan/profiles.git -b macOS
    ```

2. Launch the `install.sh` shell script. It will create all the necessary symlinks in your `home` directory.

    ```
    sh ./install.sh
    ```

3. Add the following lines to your `~/.bashrc`:

    ```
    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi

    if [ -f ~/.bash_tweaks ]; then
        . ~/.bash_tweaks
    fi
    ```
