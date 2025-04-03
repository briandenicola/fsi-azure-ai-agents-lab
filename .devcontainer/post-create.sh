#!/bin/bash

# this runs at Codespace creation - not part of pre-build

echo "$(date)    post-create start" >> ~/status

# Install envsubst 
curl -Lso envsubst https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-Linux-x86_64
sudo install envsubst /usr/local/bin
rm -rf ./envsubst

# Install Task
sudo sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin

# Install ipykernel
cd /workspaces/fsi-azure-ai-agents-lab/
python -m venv venv
python -m ipykernel install --user --name=venv
pip install basemap==1.4.1
pip install -r requirements.txt
python -m ipykernel install --user --name=venv
echo "$(date)    post-create complete" >> ~/status