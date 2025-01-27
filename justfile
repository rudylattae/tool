@_default:
  just --justfile {{source_file()}} --list --unsorted

# Install tools
mod install
