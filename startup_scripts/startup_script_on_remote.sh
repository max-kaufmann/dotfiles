

#!/bin/bash

cd /home/ubuntu

#######################################################
# Setup GitHub (enables cloning private repositories) #
#######################################################

# To use this first create your GitHub SSH key and add it to your GitHub account (including configuring SSO to AISI org).
# 1Password can help you do it (make sure you've set this extension up already in Chrome). Then store your GitHub secret
# like this:
# 
# cat << EOF >> ~/.ssh/id_ed25519 <your private key> EOF
# 
# Then add to secrets manager:
# 
# aws secretsmanager create-secret \
#     --name /personal/alan/github \
#     --secret-string "$(cat ~/.ssh/id_ed25519)" \
#     --tags Key=owner,Value=$OKTA_PRINCIPAL


# Setup username and email
git config --global user.name "Alan Cooney"
git config --global user.email "176403005+alan-cooney-dsit@users.noreply.github.com"

# Get GitHub SSH key
aws secretsmanager get-secret-value --secret-id /personal/Maximillian.Kaufmann/github-key --query SecretString --output text > ~/.ssh/id_rsa
chmod  400 ~/.ssh/id_rsa
export GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=accept-new"

git clone git@github.com:AI-Safety-Institute/agent_framework.git
git clone git@github.com:AI-Safety-Institute/inspect_ai.git
git clone git@github.com:AI-Safety-Institute/AS-Evals.git
git clone git@github.com:AI-Safety-Institute/dotfiles.git
cd dotfiles; ./install.sh --zsh; ./install.sh --all


sudo groupadd docker
sudo usermod -aG docker ubuntu
newgrp docker
######################
# Clone repositories #
######################


################
# Add API keys #
################
