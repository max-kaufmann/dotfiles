set -euo pipefail
# Install debians in $HOME/bin/
MY_BIN=$HOME/bin
mkdir -p $MY_BIN

# Git delta
if [ -f "$MY_BIN/git-delta_0.17.0_amd64.deb*" ]; then
	rm "$MY_BIN/git-delta_0.17.0_amd64.deb*"
fi
wget -P $MY_BIN/ "https://github.com/dandavison/delta/releases/download/0.17.0/git-delta_0.17.0_amd64.deb"
dpkg --install "git-delta_0.17.0_amd64.deb"

