#!/bin/bash
set -euo pipefail
USAGE=$(cat <<-END
    Usage: ./deploy.sh [OPTIONS], eg. ./deploy.sh --local --vim
    Creates ~/.zshrc and ~/.tmux.conf with location
    specific config

    OPTIONS:
        --local                 deploy local config only, only common aliases are sourced
        --vim                   deploy very simple vimrc config 
END
)

export DOT_DIR=$(dirname $(realpath $0))

LOC="remote"
VIM="false"
while (( "$#" )); do
    case "$1" in
        -h|--help)
            echo "xq$USAGE" && exit 1 ;;
        --local)
            LOC="local" && shift ;;
        --vim)
            VIM="true" && shift ;;
        --) # end argument parsing
            shift && break ;;
        -*|--*=) # unsupported flags
            echo "Error: Unsupported flag $1" >&2 && exit 1 ;;
    esac
done



# Tmux setup
echo "source $DOT_DIR/config/tmux.conf" > $HOME/.tmux.conf

base_config=$(cat <<-END
[include]
    path = $DOT_DIR/config/gitconf/git.config
END
)
echo "$base_config" > $HOME/.gitconfig


# Vimrc
if [[ $VIM == "true" ]]; then
    echo "deploying .vimrc"
    echo "source $DOT_DIR/config/vimrc" > $HOME/.vimrc
fi

# prepend the sourcing of zshrc to the file, so that we don't delete it every time 
if ! grep -q "source $DOT_DIR/config/zshrc.sh" $HOME/.zshrc; then
    echo "source $DOT_DIR/config/zshrc.sh" | cat - $HOME/.zshrc > temp && mv temp $HOME/.zshrc
fi

# drop me into zsh shell by default
echo 'if [[ $- == *i* ]];then exec zsh;fi' > $HOME/.bashrc


zsh
