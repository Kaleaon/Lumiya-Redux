#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "==> Setting up Lumiya-Redux developer environment..."
cd "${REPO_ROOT}"

# If git core.hooksPath is set to /dev/null or similar, unset it locally/globally so pre-commit can manage .git/hooks
if git config --get core.hooksPath &>/dev/null; then
    echo "--> Clearing core.hooksPath override..."
    git config --unset-all core.hooksPath 2>/dev/null || git config --global --unset-all core.hooksPath 2>/dev/null || true
fi

# Ensure pre-commit is installed
if ! command -v pre-commit &> /dev/null; then
    echo "--> Installing pre-commit..."
    if command -v pip3 &> /dev/null; then
        pip3 install --quiet --break-system-packages pre-commit 2>/dev/null || pip3 install --quiet pre-commit
    elif command -v pip &> /dev/null; then
        pip install --quiet pre-commit
    else
        echo "ERROR: Neither pip nor pip3 found. Please install Python and pip first."
        exit 1
    fi
fi

echo "--> Installing pre-commit hooks into .git/hooks/..."
pre-commit install

if [ -f "${REPO_ROOT}/.git/hooks/pre-commit" ]; then
    chmod +x "${REPO_ROOT}/.git/hooks/pre-commit"
    echo "==> Success! Git pre-commit hooks successfully installed and ready."
else
    echo "ERROR: Failed to install pre-commit hook into .git/hooks/."
    exit 1
fi
