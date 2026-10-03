#!/bin/bash
set -e

# Outils nécessaires (venv et unzip ne sont pas toujours présents)
sudo apt-get update -qq
sudo apt-get install -y -qq python3-venv unzip

# Jupyter dans un environnement virtuel
python3 -m venv "$HOME/.venv"
"$HOME/.venv/bin/pip" install --quiet jupyter

# Kernel JJava
JJAVA_VERSION="1.0-a5"   # à vérifier sur github.com/dflib/jjava/releases
curl -fL -o /tmp/jjava.zip \
  "https://github.com/dflib/jjava/releases/download/${JJAVA_VERSION}/jjava-${JJAVA_VERSION}-kernelspec.zip"
unzip -o -q /tmp/jjava.zip -d /tmp/jjava
KDIR=$(dirname "$(find /tmp/jjava -name kernel.json | head -1)")
"$HOME/.venv/bin/jupyter" kernelspec install --user --name=jjava "$KDIR"

# Rendre jupyter accessible dans les terminaux
echo 'export PATH="$HOME/.venv/bin:$PATH"' >> "$HOME/.bashrc"
