aws secretsmanager get-secret-value --secret-id /personal/Maximillian.Kaufmann/ssh --query SecretString --output text > ~/.ssh/id_rsa
chmod  400 ~/.ssh/id_rsa

# clone repositories
export GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=accept-new"
git clone git@github.com:AI-Safety-Institute/dotfiles.git
cd dotfiles
git checkout -b max_dotfiles
source ./startup_scripts/ec2_install.sh
