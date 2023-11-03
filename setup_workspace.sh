#!/usr/bin/env bash

# This script sets up the workspace for the coder user

# install docker
if [ ! -x "$(command -v docker)" ]; then
  curl -fsSL https://get.docker.com -o get-docker.sh
  sh get-docker.sh
  usermod -aG docker "${CODER_USERNAME}"
fi

# install oh-my-zsh
if [ ! -d "/home/${CODER_USERNAME}/.oh-my-zsh" ]; then
  apt-get update && apt-get install -y zsh
  curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o install.sh
  sh install.sh --unattended
  rm install.sh
  git clone https://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.oh-my-zsh/custom/themes/powerlevel10k
  echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >>! /root/.zshrc
  rm -rf /home/"${CODER_USERNAME}"/.oh-my-zsh
  cp -R /root/.oh-my-zsh /home/"${CODER_USERNAME}"/.oh-my-zsh
  cp /root/.zshrc /home/"${CODER_USERNAME}"/.zshrc
  chsh -s /usr/bin/zsh root
  chsh -s /usr/bin/zsh "${CODER_USERNAME}"
  sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' /home/"${CODER_USERNAME}"/.zshrc
  sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' /home/"${CODER_USERNAME}"/.zshrc
  chown "${CODER_USERNAME}":"${CODER_USERNAME}" /home/"${CODER_USERNAME}"
  chown -R "${CODER_USERNAME}":"${CODER_USERNAME}" /home/"${CODER_USERNAME}"/.oh-my-zsh
  chown "${CODER_USERNAME}":"${CODER_USERNAME}" /home/"${CODER_USERNAME}"/.zshrc
fi


# install nvm
if [ ! -d "/home/${CODER_USERNAME}/.nvm" ]; then
  su - "${CODER_USERNAME}" -c "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash"
  su - "${CODER_USERNAME}" -c "source .zshrc && nvm install --lts"
  su - "${CODER_USERNAME}" -c "source .zshrc && npm install -g yarn"
fi

# install rust
if [ ! -d "/home/${CODER_USERNAME}/.cargo" ]; then
  su - "${CODER_USERNAME}" -c "curl https://sh.rustup.rs -sSf | sh -s -- -y"
fi

# install chezmoi
if [ ! -x "$(command -v chezmoi)" ]; then
  snap install chezmoi --classic
fi
