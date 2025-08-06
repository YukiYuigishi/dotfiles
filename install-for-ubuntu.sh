#!/usr/bin/env bash
#
# install-for-ubuntu.sh
#
# This script automates the setup of a development environment on a new Ubuntu system.
# It installs essential packages, builds Neovim from source, installs Golang,
# and sets up dotfiles by creating symbolic links.

# --- Strict Mode ---
# Exit immediately if a command exits with a non-zero status.
# Treat unset variables as an error when substituting.
# Pipestatus is non-zero if any command in a pipeline fails.
# Exit on error inside any functions or subshells.
set -Eeuo pipefail

# --- Helper Functions ---

# Print a message to stderr.
# Usage: msg "Doing something..."
msg() {
  echo -e "[INFO] ${1}" >&2
}

# Check if a command exists.
# Usage: command_exists "git"
command_exists() {
  command -v "$1" &>/dev/null
}

# --- Main Functions ---

# Detect the operating system and package manager.
# Currently, it only supports Debian-based distributions (apt).
detect_os_and_pm() {
  if command_exists "apt-get"; then
    PM="sudo apt-get"
  else
    echo "This script currently only supports Debian-based systems (using apt-get)." >&2
    exit 1
  fi
}

# Install required packages using the detected package manager.
install_dependencies() {
  msg "Updating package list and upgrading existing packages..."
  ${PM} update && ${PM} upgrade -y

  msg "Installing base packages..."
  ${PM} install -y \
    vim gcc g++ clang tmux git ripgrep bat exa fish

  msg "Installing Neovim build prerequisites..."
  ${PM} install -y \
    ninja-build gettext cmake unzip curl
}

# Install the latest version of Golang.
install_golang() {
  msg "Installing Golang..."
  local GO_VERSION
  local ARCH
  local DOWNLOAD_URL

  GO_VERSION=$(curl -s "https://go.dev/VERSION?m=text" | head -n 1)
  ARCH=$(uname -m)

  case "$ARCH" in
    x86_64) ARCH="amd64" ;;
    aarch64) ARCH="arm64" ;;
    *)
      echo "Unsupported architecture: $ARCH" >&2
      exit 1
      ;;
  esac

  DOWNLOAD_URL="https://go.dev/dl/${GO_VERSION}.linux-${ARCH}.tar.gz"
  local GO_TARBALL="/tmp/go.tar.gz"

  msg "Downloading Go from ${DOWNLOAD_URL}"
  if command_exists "wget"; then
    wget -q -O "${GO_TARBALL}" "${DOWNLOAD_URL}"
  elif command_exists "curl"; then
    curl -s -o "${GO_TARBALL}" "${DOWNLOAD_URL}"
  else
    echo "Either wget or curl is required to download Golang." >&2
    exit 1
  fi

  msg "Installing Go..."
  sudo rm -rf /usr/local/go
  sudo tar -C /usr/local -xzf "${GO_TARBALL}"
  rm "${GO_TARBALL}"
  msg "Golang installation complete."
}

# Clone the dotfiles repository if it doesn't exist.
clone_dotfiles() {
  local DOTFILES_DIR="${HOME}/.dotfiles"
  if [ ! -d "${DOTFILES_DIR}" ]; then
    msg "Cloning dotfiles repository..."
    git clone https://github.com/YukiYuigishi/dotfiles.git "${DOTFILES_DIR}"
  else
    msg "Dotfiles repository already exists. Skipping clone."
  fi
}


# Build and install Neovim from source.
install_neovim() {
  msg "Installing Neovim from source..."
  local NVIM_DIR="/tmp/neovim"

  if [ -d "${NVIM_DIR}" ]; then
    msg "Neovim source directory already exists. Removing it."
    rm -rf "${NVIM_DIR}"
  fi

  git clone -b stable --depth=1 https://github.com/neovim/neovim.git "${NVIM_DIR}"
  cd "${NVIM_DIR}"

  msg "Building Neovim..."
  make CMAKE_BUILD_TYPE=Release -j"$(nproc)"
  msg "Installing Neovim..."
  sudo make install
  cd - > /dev/null # Return to the previous directory quietly
  rm -rf "${NVIM_DIR}"
  msg "Neovim installation complete."
}

# Create symbolic links for dotfiles.
link_dotfiles() {
  msg "Creating symbolic links for dotfiles..."
  local DOTFILES_DIR="${HOME}/.dotfiles"
  local CONFIG_DIR="${HOME}/.config"

  mkdir -p "${CONFIG_DIR}"

  # List of dotfiles/directories to link
  local targets=(
    "code"
    "git"
    "i3"
    "i3status"
    "ideavim"
    "nvim"
    "zsh"
  )

  for target in "${targets[@]}"; do
    local source_path="${DOTFILES_DIR}/${target}"
    local link_path="${CONFIG_DIR}/${target}"
    if [ -e "${source_path}" ]; then
      msg "Linking ${target} to ${CONFIG_DIR}"
      # -s: symbolic, -n: no-dereference, -f: force
      ln -snf "${source_path}" "${link_path}"
    else
      echo "Source not found, skipping: ${source_path}" >&2
    fi
  done
}

# Run post-installation steps.
post_install_steps() {
  msg "Running post-installation steps for Neovim..."
  # Check if nvim exists and is executable
  if ! command_exists "nvim"; then
      echo "Neovim command 'nvim' not found. Skipping post-install steps." >&2
      return
  fi

  # The following commands might be interactive or fail if run non-interactively.
  # Running them headless to set up plugins.
  msg "Setting up Neovim plugins..."
  nvim --headless "+autocmd User PackerComplete quitall" "+PackerSync" "+TSUpdate" "+q" || true
  msg "Neovim setup attempted. Please check for any errors manually."
}


# --- Main Execution ---
main() {
  # Ask for sudo password upfront
  msg "This script requires sudo access to install packages."
  sudo -v
  # Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

  detect_os_and_pm
  install_dependencies
  install_golang
  clone_dotfiles
  install_neovim
  link_dotfiles
  post_install_steps

  msg "Installation finished successfully!"
  msg "Please restart your shell or source your shell configuration file."
}

# Run the main function
main
