#-------------------------------------------------------------
# zsh extra settings
#-------------------------------------------------------------

setopt NO_BEEP
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt EXTENDED_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt completealiases
setopt always_to_end
setopt list_ambiguous
export HISTSIZE=100000 # big big history
export HISTFILESIZE=100000 # big big history
unsetopt hup
unsetopt list_beep
skip_global_compinit=1
zstyle ':completion:*' hosts off
 
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
 

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# ls after every cd
function chpwd() {
 emulate -L zsh
 ls
}


# git add ci and push
function git_prepare() {
   if [ -n "$BUFFER" ]; then
	BUFFER="git add -u && git commit -m \"$BUFFER\" "
   fi

   if [ -z "$BUFFER" ]; then
	BUFFER="git add -u && git commit -v "
   fi
		
   zle accept-line
}
zle -N git_prepare
bindkey -r "^G"
bindkey "^G" git_prepare

export PATH=$PATH:/home/ubuntu/.local/bin

export OKTA_PRINCIPAL=Maximillian.Kaufmann
export INSPECT_TELEMETRY=aisitools.telemetry.send_telemetry
export INSPECT_API_KEY_OVERRIDE=aisitools.api_key.override_api_key

# Proxies
export OPENAI_BASE_URL=https://openai-proxy.i.apps.ai-safety-institute.org.uk/v1
export ANTHROPIC_BASE_URL=https://anthropic-proxy.i.apps.ai-safety-institute.org.uk

# OPENAI_API_KEY=aws-secretsmanager://arn:aws:secretsmanager:eu-west-2:257469545531:secret:/aisi/autonomous-systems/openai-api-key-WFCPRs
# OPENAI_API_KEY=aws-secretsmanager://arn:aws:secretsmanager:eu-west-2:257469545531:secret:/aisi/chembio/openai-api-key-O5ud2z
# OPENAI_API_KEY=aws-secretsmanager://arn:aws:secretsmanager:eu-west-2:257469545531:secret:/aisi/cyber/openai-api-key-wSM2vE
# OPENAI_API_KEY=aws-secretsmanager://arn:aws:secretsmanager:eu-west-2:257469545531:secret:/aisi/predictive-evals/openai-api-key-L5484B
# OPENAI_API_KEY=aws-secretsmanager://arn:aws:secretsmanager:eu-west-2:257469545531:secret:/aisi/safeguards/openai-api-key-5w3oug
# OPENAI_API_KEY=aws-secretsmanager://arn:aws:secretsmanager:eu-west-2:257469545531:secret:/aisi/societal-impacts/openai-api-key-4MDsTO
export OPENAI_API_KEY=aws-secretsmanager://arn:aws:secretsmanager:eu-west-2:257469545531:secret:/aisi/platform/openai-api-key-IDb4dv

# this is a shared key which will be rotated soon, once we have proxy-only keys per workstream
export ANTHROPIC_API_KEY=aws-secretsmanager://arn:aws:secretsmanager:eu-west-2:257469545531:secret:/aisi/shared/anthropic-api-key-utPKYR

export EXPERIMENT_OUTPUT_DIRECTORY="$(git rev-parse --show-toplevel)/experiment_outputs/"

export INSPECT_LOG_FORMAT=eval
