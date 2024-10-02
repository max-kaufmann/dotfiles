git clone git@github.com:AI-Safety-Institute/agent_framework.git
git clone git@github.com:AI-Safety-Institute/inspect_ai.git
git clone git@github.com:AI-Safety-Institute/AS-Evals.git

sudo groupadd docker
sudo usermod -aG docker ubuntu
newgrp docker

cd /home/ubuntu/agent_framework; poetry install
