
@_default:
  just --justfile {{source_file()}} --list --unsorted

# Clipboard manager + super power
[windows]
[group("clipboard")]
@ditto:
  winget install Ditto.Ditto


# Duckdb. Fast, portable analytics database 
[linux]
[group("database"), group('data')]
@duckdb: unzip
  curl --fail --location --progress-bar --output duckdb_cli-linux-amd64.zip https://github.com/duckdb/duckdb/releases/download/v1.2.0/duckdb_cli-linux-amd64.zip && unzip duckdb_cli-linux-amd64.zip && mv duckdb ~/bin && rm duckdb_cli-linux-amd64.zip

# Duckdb. Fast, portable analytics database 
[macos]
[group("database"), group('data')]
@duckdb:
  curl --fail --location --progress-bar --output duckdb_cli-osx-universal.zip https://github.com/duckdb/duckdb/releases/download/v1.2.0/duckdb_cli-osx-universal.zip && unzip duckdb_cli-osx-universal.zip

# Duckdb. Fast, portable analytics database 
[windows]
[group("database"), group('data')]
@duckdb:
  winget install DuckDB.cli


# Unified cli for project tasks
[unix]
[group("command runner")]
@just install_dir="~/bin":
  curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to {{install_dir}}


# Notepad++ text editor
[windows]
[group("text")]
@notepadplusplus:
  winget install Notepad++.Notepad++


# Rust programming language
[unix]
[group("toochain"), group("rust")]
@rustup:
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Rust programming language
[windows]
[group("toochain"), group("rust")]
@rustup:
  winget install Rustlang.Rustup


# Customizable shell prompt
[unix]
[group("shell")]
@starship:
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"


# Multi-model database
[unix]
[group("database")]
@surreal:
  curl --proto '=https' --tlsv1.2 -sSf https://install.surrealdb.com | sh

# Multi-model database
[windows]
[group("database")]
@surreal:
  iwr https://windows.surrealdb.com -useb | iex


# Cheatsheets for console commands
[linux]
[group("shell")]
@tldr:
  echo "Not yet implimented"

# Cheatsheets for console commands
[macos]
[group("shell")]
@tldr:
  brew install tlrc

# Cheatsheets for console commands
[windows]
[group("shell")]
@tldr:
  winget install tldr-pages.tlrc


# Unzip. Tool to zip (compress) files
[unix]
[group("data")]
@unzip:
  sudo apt install unzip


# Python package and project manager
[unix]
[group("python"), group("package manager")]
@uv:
  curl -LsSf https://astral.sh/uv/install.sh | sh

# Python package and project manager
[windows]
[group("python"), group("package manager")]
@uv:
  powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"


# Code and text editor
[windows]
[group("code"), group("text")]
@vscode:
  winget install Microsoft.VisualStudioCode


# Zip. Tool to unzip (decompress) files
[unix]
[group("data")]
@zip:
  sudo apt install zip