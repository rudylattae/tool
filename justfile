@_default:
  just --justfile {{source_file()}} --list --unsorted

# Install tools
mod install

# alias for install
mod in 'install.just'

# List available tools
[linux]
list:
  #!/usr/bin/env sh
  ls index

# Install tools
[linux]
i +tools:
  #!/usr/bin/env bash
  IFS=','
  read -ra tools <<< {{tools}}
  for i in "${tools[@]}"; do
    just -f index/$i install-$i 
  done

# Install tools
[windows]
@i +tools:
  echo "Installing {{tools}}"