## Quick Start
 

### Step 1 (iTerm and keyboard shortcuts)
#### Use ctrl-a to move to start if line, ctrl-e to move to end and alt-arrow to move around in iTerm:
Go to iTerm2 (in the menu bar) > Settings... > Profiles > Keys (not Preferences... > Keys)
On current versions (3.14+) you then switch to the Key Mappings tab
Press Presets... dropdown button.
Select Natural Text Editing

#### Copy everything you highlight (no need for ctrl-c) to clipboard:
Edit -> Copy mode

#### Remap caps lock to ctrl
Caps lock is a waste of a key - remap it to something useful
Mac->System Setting->Keyboard->Keyboard Shortcuts->Modifier Keys->Change caps lock to control


### Step 2 (Use these dotfiles)
Clone the repo
```bash
git clone git@github.com:er537/dotfiles.git ~/git/dotfiles
```

### Step 3
Install dependencies (e.g. oh-my-zsh and related plugins), you can specify options to install specific programs: tmux, zsh, note that your dev-vm will already have tmux and zsh installed so you don't need to provide any options in this case, but you may need to provide these if you are installing locally. 

```bash
# Install just the dependencies (If already have tmux or zsh)
./install.sh
# Install dependencies + tmux & zsh (if local or on linux without tmux or zsh)
./install.sh --tmux --zsh
```
### Step 4
Update ./config/gitconfig/gitconfig.personal and gitconfig.work to have your own git username and email

### Step 5
Deploy (e.g. source aliases for .zshrc, apply oh-my-zsh settings etc..)
```bash
# Deploy on linux
./deploy.sh   
```

### Step 6 (Optional)
This set of dotfiles uses the powerlevel10k theme for zsh, this makes your terminal look better and adds lots of useful features, e.g. env indicators, git status etc. This repo comes with a preconfigured powerlevel10k theme in [`./config/p10k.zsh`](./config/p10k.zsh) but you can reconfigure this by running `p10k configure` which will launch an interactive window. 
