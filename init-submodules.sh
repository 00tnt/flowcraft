#!/usr/bin/env bash
set -euo pipefail

if [ -f ".env" ]; then
  source .env
fi

# Cleanup function to remove git credentials
cleanup() {
  echo "🧹 Cleaning up git configuration..."
  git config --local --unset-all url."https://$GITHUB_ACCESS_TOKEN@github.com/".insteadOf || true
  echo "✅ Cleanup completed"
}

# Trap to ensure cleanup runs on exit (success or failure)
trap cleanup EXIT

echo "🚀 Starting submodule initialization..."

# Check if running in a git repository
echo "🔍 Verifying git repository..."
if ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo "❌ Error: Not a git repository"
  exit 1
fi
echo "✅ Git repository verified"

# Check if .gitmodules exists
echo "📋 Checking for git submodules..."
if [ ! -f ".gitmodules" ]; then
  echo "⚠️  Warning: .gitmodules file not found - no submodules to initialize"
  exit 0
fi
echo "✅ .gitmodules file found"

# Check if .env file exists
echo "📄 Checking for .env file..."
if [ ! -f ".env" ]; then
  echo "❌ Error: .env file not found"
  exit 1
fi
echo "✅ .env file found"

echo "📄 Loading environment variables from .env file..."
source .env

echo "🔍 Validating GITHUB_ACCESS_TOKEN..."
if [ -z "$GITHUB_ACCESS_TOKEN" ]; then
  echo "❌ Error: GITHUB_ACCESS_TOKEN is not set in .env"
  exit 1
fi
echo "✅ GITHUB_ACCESS_TOKEN is set"

# Configure git to use token-based authentication for both SSH and HTTPS URLs
echo "⚙️  Configuring git to use GitHub access token..."

git config --local url."https://$GITHUB_ACCESS_TOKEN@github.com/".insteadOf "https://github.com"
echo "✅ Configured HTTPS URLs to use token"

git config --local url."https://$GITHUB_ACCESS_TOKEN@github.com/".insteadOf "git@github.com:"
echo "✅ Configured SSH URLs to use token (git@github.com: → https://token@github.com/)"

GIT_CONFIG_SET=true
echo "✅ Git configuration completed"

echo "📦 Updating git submodules..."
git submodule update --init --recursive
echo "🎉 Submodule initialization completed successfully!"
