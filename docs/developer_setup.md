# Developer Onboarding & Workstation Setup

This document describes how to set up a developer workstation for `Lumiya-Redux` and ensure all automated code quality guardrails (pre-commit hooks, formatting, and linter checks) are properly configured.

## Prerequisites

- **Python:** Python 3.11+
- **JDK:** Java Development Kit 17+
- **Android SDK:** Platforms `android-34`, Build Tools `34.0.0`
- **Git:** 2.25+

## Quick Onboarding

Run the automated onboarding script to prepare your local git repository and install `pre-commit` hooks:

```bash
./scripts/setup_dev_environment.sh
```

The script performs the following:
1. Verifies/installs the `pre-commit` framework.
2. Installs pre-commit hooks into `.git/hooks/pre-commit`.
3. Verifies that local commits will automatically trigger formatting and linting checks.

## Manual Hook Installation

If you prefer to configure hooks manually:

```bash
# 1. Install pre-commit
pip install pre-commit

# 2. Install pre-commit hooks into your git repository
pre-commit install
```

## Running Guardrail Checks

Local git commits automatically execute formatting and linter checks on staged files. You can also run checks manually across all files:

```bash
pre-commit run --all-files
```

### Integrated Tools

- **`black`**: Formats Python code to standard 100-character line width.
- **`ruff`**: Runs fast Python linting checks for errors, unused imports, and style violations.
- **`pre-commit-hooks`**: Strips trailing whitespace, fixes file endings, and checks YAML syntax.

## Continuous Integration Guardrails

All pull requests and pushes to `main`/`master` trigger GitHub Actions workflow checks (`.github/workflows/lint.yml`). The workflow executes `pre-commit run --all-files` in strict mode and rejects pull requests containing unformatted code or linter errors.
