## Installation

### Step 1
Clone the repo
```bash
git clone git@github.com:er537/dotfiles.git ~/git/dotfiles
```

### Step 2
Install dependencies (e.g. oh-my-zsh and related plugins), you can specify options to install specific programs: tmux, zsh, note that your dev-vm will already have tmux and zsh installed so you don't need to provide any options in this case, but you may need to provide these if you are installing locally. 

Installation on a mac machine requires homebrew so install this [from here](https://brew.sh/) first if you haven't already.

```bash
# Install just the dependencies (If already have tmux or zsh)
./install.sh
# Install dependencies + tmux & zsh (if local or on linux without tmux or zsh)
./install.sh --tmux --zsh
```

### Step 3
Deploy (e.g. source aliases for .zshrc, apply oh-my-zsh settings etc..)
```bash
# Deploy on linux
./deploy.sh   
```

### Step 4
This set of dotfiles uses the powerlevel10k theme for zsh, this makes your terminal look better and adds lots of useful features, e.g. env indicators, git status etc. This repo comes with a preconfigured powerlevel10k theme in [`./config/p10k.zsh`](./config/p10k.zsh) but you can reconfigure this by running `p10k configure` which will launch an interactive window. 
