export LD_LIBRARY_PATH=/pkgs/cuda-12.4/lib64:/pkgs/cudnn-12-v8.9.2/lib64:$LD_LIBRARY_PATH
export PIP_CACHE_DIR=/mfs1/u/max/.cache/pip
export PATH=$PATH:/mfs1/u/max/.conda/opt/quarto/bin
export PATH=/pkgs/cuda-12.4/bin/:$PATH
export PATH=/mfs1/u/max/.conda/base_python/bin:$PATH

alias trm='\rm'
export UV_CACHE_DIR="mfs1/u/max/.cache/uv/"
mkdir -p /tmp/${USER}_runtime
export XDG_RUNTIME_DIR=/tmp/${USER}_runtime
export HF_HOME="/mfs1/u/max/.cache/huggingface"

export NVM_DIR="/mfs1/u/max/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

oocr () {
	cd /mfs1/u/max/oocr-influence/
	source ./.venv/bin/activate

}

open-r1 () {
        cd /mfs1/u/max/open-r1/
	source ./.venv/bin/activate
}

dotfiles () {
	cd ~/dotfiles/
}
