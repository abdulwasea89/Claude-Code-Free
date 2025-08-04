#!/usr/bin/env bash
set -e

# Colors for output
GREEN="\033[0;32m"
CYAN="\033[0;36m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
RESET="\033[0m"

echo -e "${CYAN}🚀 Claude Code Installer (Linux / macOS / WSL)${RESET}"
echo ""

# Detect OS
OS="$(uname -s)"
echo -e "${CYAN}🔍 Detected OS:${RESET} $OS"

# Node installation functions
install_node_macos() {
  echo -e "${YELLOW}📦 Installing Node.js 18 using Homebrew...${RESET}"
  if ! command -v brew &> /dev/null; then
    echo -e "${RED}❌ Homebrew not found.${RESET} Please install Homebrew first: https://brew.sh/"
    exit 1
  fi
  brew install node@18
}

install_node_linux() {
  echo -e "${YELLOW}📦 Installing Node.js 18 and required packages...${RESET}"
  curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt update
  sudo apt install -y nodejs git curl
}

install_node_windows() {
  echo -e "${RED}⚠️  Windows detected. Please run the Windows PowerShell script instead: setup_env_windows.ps1${RESET}"
  exit 1
}

# Choose installation method based on OS
case "$OS" in
  "Darwin") install_node_macos ;;
  "Linux") install_node_linux ;;
  MINGW*|MSYS*|CYGWIN*) install_node_windows ;;
  *)
    echo -e "${RED}❌ Unsupported OS: $OS${RESET}"
    exit 1
    ;;
esac

# Install Claude Code CLI
echo -e "${YELLOW}📥 Installing Claude Code CLI globally...${RESET}"
npm install -g @anthropic-ai/claude-code

# Prompt for API key and base URL
echo ""
echo -e "${CYAN}🔐 Configuration${RESET}"
read -rp "🔑 Enter your API Key (Anthropic or OpenRouter): " API_KEY
read -rp "🌐 Enter API Base URL [default: https://openrouter.ai/api/v1]: " BASE_URL
BASE_URL="${BASE_URL:-https://openrouter.ai/api/v1}"

# Save environment variables
ENV_FILE="$HOME/.claude_env_vars"
cat <<EOF > "$ENV_FILE"
export ANTHROPIC_API_KEY="${API_KEY}"
export ANTHROPIC_BASE_URL="${BASE_URL}"
export ANTHROPIC_MODEL="openrouter/anthropic/claude-3.7-sonnet"
EOF

# Final instructions
echo ""
echo -e "${GREEN}✅ Configuration saved to:${RESET} $ENV_FILE"
echo -e "${YELLOW}👉 Add this line to your shell config (~/.bashrc or ~/.zshrc):${RESET}"
echo -e "   ${CYAN}source $ENV_FILE${RESET}"
echo ""
echo -e "${GREEN}🎉 All set! You can now run:${RESET} claude"
