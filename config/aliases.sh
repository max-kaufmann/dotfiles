# -------------------------------------------------------------------
# work
# -------------------------------------------------------------------
alias work="cd ~/git/work"
alias sum="cd ~/git/work/summit-science"
alias audit="cd ~/git/work/audit"

# -------------------------------------------------------------------
# personal
# -------------------------------------------------------------------
alias me="cd ~/git/personal"
alias cdg="cd ~/git"
alias zrc="cd $DOT_DIR/zsh"
alias dot="cd $DOT_DIR"
alias jp="jupyter lab"

# -------------------------------------------------------------------
# general
# -------------------------------------------------------------------

alias cl="clear"

# file and directories
alias cp='cp -i'
alias mv='mv -i'

# find/read files
alias h='head'
alias t='tail'
alias rl="readlink -f"
fd() {
  find . -type d -name "*$1*"
}

ff() {
  find . -type f -name "*$1*"
}


# storage
alias du='du -kh' # file space
alias df='df -kTh' # disk space
alias usage='du -sh * 2>/dev/null | sort -rh'
alias dus='du -sckx * | sort -nr'
#
#-------------------------------------------------------------
# cd
#-------------------------------------------------------------

alias c='cd'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias /='cd /'


#-------------------------------------------------------------
# git
#-------------------------------------------------------------

alias gc="git commit -m"
alias gp="git push"
alias guc="git add -u; gc"

alias glog='git log --oneline --reverse --decorate'

gucp() {
    git add -u
    git commit -m "$1"

    # Attempt to push and capture the output and exit status
    output=$(git push 2>&1)
    push_status=$?

    if [ $push_status -eq 0 ]; then
        # Push succeeded
        echo "$output"
    else
        # Check if the failure is due to no upstream branch
        if echo "$output" | grep -q 'has no upstream branch'; then
            # Set the upstream branch and push again
            git push --set-upstream origin "$(git rev-parse --abbrev-ref HEAD)"
        else
            # Push failed for another reason
            echo "$output"
            return $push_status
        fi
    fi
}

alias gf="git fetch"
alias gl="git pull"

alias gr="git rebase"
alias grm="git rebase master"
alias grc="git rebase --continue"
alias grs="git rebase --skip"
alias gra="git rebase --abort"

alias gm="git merge"
alias gmm="git merge master"
alias gmc="git merge --continue"
alias gms="git merge --skip"
alias gma="git merge --abort"

alias gco="git checkout"
alias gcb="git checkout -b"
alias gcm="git checkout master"

alias grhard="git fetch origin && git reset --hard"

alias gst="git stash"
alias gstp="git stash pop"
alias gstc="git stash clear"

alias gpp='git push --set-upstream origin $(git_current_branch)'

#-------------------------------------------------------------
# tmux
#-------------------------------------------------------------

alias ta="tmux attach"
alias taa="tmux attach -t"
alias tad="tmux attach -d -t"
alias td="tmux detach"
alias ts="tmux new-session -s"
alias tl="tmux list-sessions"
alias tkill="tmux kill-server"
alias tdel="tmux kill-session -t"

#-------------------------------------------------------------
# ls
#-------------------------------------------------------------

alias l="ls -CF --color=auto"
alias ll="ls -l --group-directories-first"
alias la='ls -Al'         # show hidden files
alias lx='ls -lXB'        # sort by extension
alias lk='ls -lSr'        # sort by size, biggest last
alias lc='ls -ltcr'       # sort by and show change time, most recent last
alias lu='ls -ltur'       # sort by and show access time, most recent last
alias lt='ls -ltr'        # sort by date, most recent last
alias lm='ls -al |more'   # pipe through 'more'
alias lr='ls -lR'         # recursive ls
alias tree='tree -Csu'    # nice alternative to 'recursive ls'


# -------------------------------------------------------------------
# Tensorboard
# -------------------------------------------------------------------

alias tb="singularity exec $TENSOR_BOARD_SIF tensorboard --host=$HOST_IP_ADDR --reload_multifile true --logdir=."
tblink () {
  # Creates simlinks from specified folders to ~/tb/x where x is an incrmenting number
  # and luanches tensorboard
  # example: `tblink ./lm/20210824 ./lm/20210824_ablation ./lm/20210825_updated_data`
  if [ "$#" -eq 0 ]; then
    logdir=$(pwd)
  else
  # setup tensorboard directory
    tbdir="$HOME/tb"
    if [ -d "$tbdir" ]; then
      last="$(printf '%s\n' $tbdir/* | sed 's/.*\///' | sort -g -r | head -n 1)"
      new=$((last+1))
      echo "last folder $last, new folder $new"
      logdir="$tbdir/$new"
    else
      logdir="$tbdir/0"
    fi
    # softlink into tensorboard directory
    for linkdir in "$@"; do
      linkdir=$(rl $linkdir)
      if [ ! -d $linkdir ]; then
          echo "linkdir $linkdir does not exist"
          return
      fi
      echo "linkdir: $linkdir"
      mkdir -p $logdir
      ln -s $linkdir $logdir
    done
  fi
  echo "logdir: $logdir"
  singularity exec "$TENSOR_BOARD_SIF" tensorboard --host=$HOST_IP_ADDR --reload_multifile true --logdir=$logdir
}
tbadd() {
  # Add experiment folder to existing tensorboard directory (see tblink)
  # example: `tbadd ./lm/20210825 25` will symlink ./lm/20210824 to ~/tb/25
  if [ "$#" -eq 2 ]; then
    tbdir="$HOME/tb"
    linkdir=$(rl $1)
    logdir=$tbdir/$2
    ln -s $linkdir $logdir
    echo "linkdir: $linkdir"
    echo "logdir: $logdir"
  else
    echo "tbadd <exp_dir> <tb number>"
  fi
}


# -------------------------------------------------------------------
# Poetry 
# -------------------------------------------------------------------

alias ppython="poetry run python"
# Define the pythond function
pythond() {
    # Attempt to get the top-level directory of the Git repository
    git_root=$(git rev-parse --show-toplevel 2>/dev/null)

    # Check if the command was successful
    if [ $? -ne 0 ]; then
        echo "Error: This command must be run inside a Git repository."
        return 1
    fi

    # Get the current working directory
    current_dir=$(pwd -P)

    # Compare the current directory with the Git root directory
    if [ "$git_root" != "$current_dir" ]; then
        echo "Error: Please run this command from the top-level directory of your Git repository. Otherwise VSCode can't locate the files you are debugging."
        return 1
    fi

    # Run the original command
    python -m debugpy --listen 5678 --wait-for-client "$@"
}

