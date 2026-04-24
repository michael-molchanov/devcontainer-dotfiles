#!/bin/bash -xeu

if command -v unminimize &> /dev/null; then
    yes | sudo unminimize
fi
sudo apt-get update
sudo apt-get install man-db

/bin/bash -c "set +x; $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -d /etc/profile.d/brew.sh || echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" | sudo tee /etc/profile.d/brew.sh

# Base
brew install \
    ast-grep \
    fd \
    fzf \
    lazygit \
    man-db \
    markdownlint-cli2 \
    markdown-toc \
    mermaid-cli \
    neovim \
    ripgrep \
    tmux \
    tmuxinator \
    tree-sitter \
    tree-sitter-cli \
    yazi

# Json
brew install \
    jless \
    jq \
    jql \
    jq-lsp \
    jqfmt \
    jqp

# Yaml
brew install \
    yaml-language-server \
    yamlfix \
    yamlfmt \
    yamllint \
    yq

# Docker
brew install \
    docker-language-server \
    hadolint

# Bash
brew install \
    bash-language-server \
    shellcheck \
    shfmt

# Lua
brew install \
    lua \
    lua-language-server \
    luajit \
    luarocks \
    stylua

# Java
brew install \
    gradle \
    gradle-completion \
    maven \
    maven-completion \
    openjdk

# Go
brew install \
    delve \
    go \
    gopls

# Python
brew install \
    autopep8 \
    bandit \
    basedpyright \
    black \
    flake8 \
    isort \
    mypy \
    numpy \
    pipx \
    poetry \
    pylint \
    pyright \
    python \
    ruff \
    uv \
    virtualenv \
    virtualenvwrapper

# Node
brew tap oven-sh/bun
brew install \
    bun \
    corepack \
    deno \
    node \
    prettier \
    typescript \
    typescript-language-server

# Ruby
brew install \
    ruby \
    ruby-lsp \
    rubyfmt
gem install rubocop

# Rust
brew install \
    bacon \
    bacon-ls \
    rust \
    rust-analyzer \
    rustup

# IaC
brew tap hashicorp/tap
brew install \
    hashicorp/tap/terraform \
    hashicorp/tap/terraform-ls \
    hashicorp/tap/packer \
    hashicorp/tap/vault \
    ansible \
    ansible-builder \
    ansible-creator \
    ansible-language-server \
    ansible-lint \
    checkov \
    gitlab-ci-local \
    gitlab-ci-lint \
    terragrunt \
    trivy

# Kubernetes
brew install \
    helm \
    helm-ls \
    helmfile \
    k9s \
    kubeconform \
    kubectx \
    kubernetes-cli \
    kustomize

# Cloud CLIs
brew install \
    awscli \
    azure-cli \
    gcloud-cli \
    gh \
    glab

git config --global user.name "${GIT_USER_NAME}"
git config --global user.email "${GIT_USER_EMAIL}"
git config --global user.signingkey "${PUBLIC_SSH_KEY}"
git config --global commit.gpgSign true
git config --global tag.gpgSign true
git config --global push.gpgSign if-asked
git config --global gpg.format ssh
git config --global gpg.ssh.allowedsignersfile "~/.ssh/allowed_signers"

mkdir -p "${HOME}/.ssh"
chmod 700 "${HOME}/.ssh"
echo "${GIT_USER_EMAIL} namespaces=\"git\" ${PUBLIC_SSH_KEY}" >~/.ssh/allowed_signers

cp -fR nvim "${XDG_CONFIG_HOME:-$HOME/.config}/"
cp -fR lazygit "${XDG_CONFIG_HOME:-$HOME/.config}/"
cp -fR tmux "${XDG_CONFIG_HOME:-$HOME/.config}/"
cp -fR tmuxinator "${XDG_CONFIG_HOME:-$HOME/.config}/"

git clone https://github.com/tmux-plugins/tpm "${XDG_CONFIG_HOME:-$HOME/.config}/tmux/plugins/tpm"

# Add dotfiles settings to .bashrc
if [ -f "${HOME}/.bashrc" ]; then
  if ! grep -q "# Dotfiles part start" "${HOME}/.bashrc"; then
    cat >>"${HOME}/.bashrc" <<'EOF'

# Dotfiles part start
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export EDITOR="nvim"
export VISUAL="nvim"
# Dotfiles part end
EOF
  fi
fi
