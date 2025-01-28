@_default:
  just --justfile {{source_file()}} --list --unsorted

# Install tools
mod install

# alias for install
mod in 'install.just'
