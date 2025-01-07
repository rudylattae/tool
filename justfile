mod_content := '
@_default:
  just --justfile {{{{source_file()}} --list --unsorted"
  
[unix]
@install:
  # do it
'

@_default:
  just --justfile {{source_file()}} --list --unsorted

# Scaffold a modfile for tool 
[unix]
init name description:
  #!/usr/bin/env sh
  mod_file="{{name}}.just"
  mod_reference="mod {{name}}"
  mod_content_1="@_default:"
  mod_content_2="just --justfile {{{{source_file()}} --list --unsorted"
  if [ ! -f $mod_file ]; then
    echo "@_default:
    just --justfile {{{{source_file()}} --list --unsorted

  [unix]
  @install:
  
  [windows]
  @install:

  alias in := install

  [unix]
  @uninstall:

  [windows]
  @uninstall:

  alias un := uninstall    
  " > $mod_file
  else
    echo "Mod file already exists: $mod_file" 
  fi
  if ! grep -q "^$mod_reference\$" ./justfile; then
    echo "
  # {{description}}
  $mod_reference" >> ./justfile 
  fi

# Visual Studio Code
[group("text"), group("ide")]
mod vscode

# Shell prompt
[group("shell")]
mod starship

# Notepad ++ text editor
[group("text")]
mod notepadplus

# Unified cli for project tasks
mod just

# Multi-modle database
mod surreal

# Clipboard manager
mod ditto
