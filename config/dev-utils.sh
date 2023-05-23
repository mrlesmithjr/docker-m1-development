#!/bin/bash
# Installs many useful development tools

set -e

DOCKER_COMPOSE_VERSION="v2.18.1"
TFENV_TERRAFORM_VERSION="1.4.6"

sudo apt-get update -y
sudo apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl git-lfs golang iputils-ping jq less libcap2-bin nmap npm ruby ruby-dev shellcheck software-properties-common sshpass tmux unzip

### Terraform ###
# We use tfenv because it is easy to switch/install between versions

if [ ! -f "${HOME}/.terraform-version" ]; then
    echo "${TFENV_TERRAFORM_VERSION}" >"${HOME}/.terraform-version"
fi

if [ ! -f "$HOME/.tfenv/bin/tfenv" ]; then
    git clone https://github.com/tfutils/tfenv.git "$HOME/.tfenv"
    export PATH="$HOME/.tfenv/bin:$PATH"
    tfenv install ${TFENV_TERRAFORM_VERSION}
    tfenv use ${TFENV_TERRAFORM_VERSION}
fi

### Kubernetes ###
if [ ! -d /etc/apt/keyrings ]; then
    sudo mkdir /etc/apt/keyrings
fi

sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://dl.k8s.io/apt/doc/apt-key.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# kubectl
sudo apt-get update -y
sudo apt-get install -y --no-install-recommends kubectl

# kubectx
if [ ! -d "${HOME}/.kubectx" ]; then
    git clone https://github.com/ahmetb/kubectx.git "${HOME}/.kubectx"
    sudo ln -s "${HOME}/.kubectx/kubectx" /usr/local/bin/kubectx
    sudo ln -s "${HOME}/.kubectx/kubens" /usr/local/bin/kubens
fi

# helm
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update -y
sudo apt-get install -y --no-install-recommends helm

### HashiCorp ###
# Installs Consul, Nomad, Packer, Vagrant and Vault
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update -y
sudo apt-get install -y --no-install-recommends consul nomad packer vagrant vault

### Docker ###
# docker-compose
if ! command -v docker-compose &>/dev/null; then
    sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo curl \
        -L "https://raw.githubusercontent.com/docker/compose/${DOCKER_COMPOSE_VERSION}/contrib/completion/bash/docker-compose" \
        -o /etc/bash_completion.d/docker-compose
fi

# FIXME - Add to Python dev reqs in dotfiles. Had issues with dependencies originally.
# https://github.com/mrlesmithjr/dotfiles
pip3 install ansible-lint yamllint
