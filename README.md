# Claude-Code-Free
Get Claude Code Free and Also Star it 


# 🤖 Claude Code CLI – Universal Installer (macOS, Linux, Windows)

This project installs and configures **Claude Code** — Anthropic’s command-line AI coding assistant — with support for **OpenRouter.ai** or **Anthropic API access**. It runs on:

- ✅ macOS
- ✅ Linux (Debian/Ubuntu tested)
- ✅ Windows (via PowerShell, Git Bash, or WSL)

---

## 🚀 What This Does

- Installs **Node.js 18+** if not present
- Installs **Claude Code CLI** globally via `npm`
- Configures your **Anthropic** or **OpenRouter** API access
- Sets environment variables automatically for future sessions

---

## 📦 Files Included

| File                      | Purpose                                           |
|---------------------------|---------------------------------------------------|
| `setup_claude_code.sh`    | Shell installer for macOS, Linux, Git Bash, WSL  |
| `setup_env_windows.ps1`   | PowerShell installer for native Windows          |
| `README.md`               | You're reading it! Full documentation            |

---

## 🧰 Prerequisites

| Requirement       | macOS / Linux | Windows |
|------------------|---------------|---------|
| Node.js 18+      | ✅ (installed by script) | ⚠️ Must approve Node installer manually |
| Git              | ✅             | ⚠️ Required for Git Bash/WSL |
| curl             | ✅             | ✅ |
| API Key          | ✅ (Anthropic or OpenRouter) | ✅ |

---

## 💻 Installation Instructions

### 🔸 macOS / Linux / WSL

```bash
chmod +x setup_claude_code.sh
./setup_claude_code.sh
