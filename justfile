@_default:
  just --justfile {{source_file()}} --list --unsorted

# Install tools
mod install

# alias for install
mod in 'install.just'

# List available tools
[linux]
[no-cd]
list:
  #!/usr/bin/env sh
  for file in {{source_dir()}}/index/*; do
    echo "$(basename "$file" .${file##*.})"
  done

# List available tools
[windows]
[no-cd]
@list:
  Get-ChildItem -Path "{{source_dir()}}/index" -File | ForEach-Object { [System.IO.Path]::GetFileNameWithoutExtension($_.Name) }

alias ls := list

# Check if a tool exists
[linux]
[no-cd]
check +tools:
  #!/usr/bin/env bash
  IFS=','
  read -ra tools <<< {{tools}}
  for i in "${tools[@]}"; do
    if ! just -f {{source_dir()}}/index/$i.just check-$i
      echo "not found"
    fi
  done

# Install tools
[linux]
[no-cd]
i +tools:
  #!/usr/bin/env bash
  IFS=','
  read -ra tools <<< {{tools}}
  for i in "${tools[@]}"; do
    just -f {{source_dir()}}/index/$i.just install-$i 
  done

# Install tools
[windows]
i +tools:
  #!pwsh.exe
  $tools="{{tools}}"
  $tools.split(' ') | ForEach-Object {
    Write-Host "`nInstalling $_..."
    just -f {{source_dir()}}/index/$_.just install-$_
  }