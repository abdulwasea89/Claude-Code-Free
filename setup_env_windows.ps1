Write-Output "`n🧠 Claude Code Installer for Windows (PowerShell)`n"

# Check Node
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Output "Installing Node.js..."
    Start-Process "https://nodejs.org/dist/v18.20.2/node-v18.20.2-x64.msi"
    Read-Host "Please install Node.js and press ENTER to continue"
}

Write-Output "📦 Installing Claude Code CLI..."
npm install -g @anthropic-ai/claude-code

$envFile = "$HOME\claude_env_vars.ps1"
$apiKey = Read-Host "Enter your OpenRouter or Anthropic API key"
$baseUrl = Read-Host "Enter API base URL (default: https://openrouter.ai/api/v1)"
if ($baseUrl -eq "") { $baseUrl = "https://openrouter.ai/api/v1" }

@"
`$env:ANTHROPIC_API_KEY = '$apiKey'
`$env:ANTHROPIC_BASE_URL = '$baseUrl'
`$env:ANTHROPIC_MODEL = 'openrouter/anthropic/claude-3.7-sonnet'
"@ | Out-File -Encoding ASCII $envFile

Write-Output "`n✅ Saved environment to $envFile"
Write-Output "👉 Run this command in future sessions to load your config:"
Write-Output "  . $envFile"
Write-Output "`n✅ Done! Try running 'claude' now."
