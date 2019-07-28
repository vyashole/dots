#! /bin/bash
set -euxo pipefail
# install apt packages
sudo apt update
sudo apt -y install python3-dev \
    python3-pip \
    python3-setuptools \
    fortune \
    cowsay \
    curl \
    stow \
    git \
    hub \
    zsh
sudo apt -y install curl git mercurial make binutils bison gcc build-essential cmake

# install pip packages and then pyenv
sudo pip3 install thefuck virtualenvwrapper awscli saws
rm -rf ~/.pyenv && git clone https://github.com/pyenv/pyenv.git ~/.pyenv


# install nvm
rm -rf ~/.nvm && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash


# install codium repo
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee /etc/apt/sources.list.d/69-codium.list
sudo apt update
# install codium
sudo apt -y install codium
# install extensions
cat vscode/.vscode_extensions | xargs -I {} codium --install-extension {}

#  install oh my zsh
rm -rf ~/.oh-my-zsh && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
