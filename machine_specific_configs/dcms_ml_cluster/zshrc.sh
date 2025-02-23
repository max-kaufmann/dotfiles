export LD_LIBRARY_PATH=/pkgs/cuda-12.4/lib64:/pkgs/cudnn-12-v8.9.2/lib64:$LD_LIBRARY_PATH
export PIP_CACHE_DIR=/mfs1/u/max/.cache/pip
export PATH=$PATH:/mfs1/u/max/.conda/opt/quarto/bin
export PATH=/pkgs/cuda-12.4/bin/:$PATH
export PATH=/mfs1/u/max/.conda/base_python/bin:$PATH

alias trm='\rm'
export UV_CACHE_DIR="mfs1/u/max/.cache/uv/"
mkdir -p /tmp/${USER}_runtime
export XDG_RUNTIME_DIR=/tmp/${USER}_runtime

