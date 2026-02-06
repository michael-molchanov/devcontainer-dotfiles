#!/bin/bash -xeu

yes | sudo unminimize
sudo apt-get install man-db

/bin/bash -c "set +x; $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
test -d /etc/profile.d/brew.sh || echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" | sudo tee /etc/profile.d/brew.sh

brew tap hashicorp/tap
brew install \
  hashicorp/tap/terraform \
  hashicorp/tap/terraform-ls \
  hashicorp/tap/packer \
  ansible \
  ansible-creator \
  ansible-lint \
  ast-grep \
  bacon \
  bacon-ls \
  bandit \
  basedpyright \
  bash-language-server \
  fd \
  fzf \
  gitlab-ci-local \
  go \
  graphviz \
  helm \
  helmfile \
  imagemagick \
  jq \
  k9s \
  kubectx \
  kubernetes-cli \
  lua-language-server \
  luarocks \
  man-db \
  mermaid-cli \
  node \
  numpy \
  openjdk \
  pipx \
  prettier \
  pyright \
  python \
  ripgrep \
  ruby \
  ruff \
  rust \
  rust-analyzer \
  rustup \
  shellcheck \
  shfmt \
  typescript \
  uv \
  virtualenv \
  virtualenvwrapper \
  yarn \
  yq

gem install rubocop ruby-lsp

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

cp -fR nvim "${XDG_CONFIG_HOME:-$HOME/.config}"/
cp -fR lazygit "${XDG_CONFIG_HOME:-$HOME/.config}"/
