CONFIG_DIR=$(dirname $(realpath ${(%):-%x}))
DOT_DIR=$CONFIG_DIR/../

ZSH_DISABLE_COMPFIX=true
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH=$HOME/.oh-my-zsh

export PATH="$HOME/bin:$PATH"

plugins=(zsh-autosuggestions zsh-syntax-highlighting zsh-completions history-substring-search copypath copyfile sudo dirhistory history)

source $ZSH/oh-my-zsh.sh
source $CONFIG_DIR/aliases.sh
source $CONFIG_DIR/p10k.zsh
source $CONFIG_DIR/extras.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ellenar/google-cloud-sdk/path.zsh.inc' ]; then . '/home/ellenar/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ellenar/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/ellenar/google-cloud-sdk/completion.zsh.inc'; fi
