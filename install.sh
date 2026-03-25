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
  awscli \
  azure-cli \
  bacon \
  bacon-ls \
  bandit \
  basedpyright \
  bash-language-server \
  fd \
  fzf \
  gcloud-cli \
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
  lazygit \
  lua-language-server \
  luarocks \
  man-db \
  mermaid-cli \
  neovim \
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
  tmux \
  tmuxinator \
  tree-sitter \
  tree-sitter-cli \
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
# Dotfiles part end
EOF
  fi
fi
