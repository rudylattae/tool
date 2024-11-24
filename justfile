@_default:
  just --justfile {{source_file()}} --list

# Create modfile for tool and 
[unix]
init name description:
  #!/usr/bin/env sh
  mod_file="{{name}}.just"
  mod_reference="mod {{name}}"
  mod_content_1="@_default:"
  mod_content_2="just --justfile {{{{source_file()}} --list"
  if [ ! -f $mod_file ]; then
    echo $mod_content_1 > $mod_file
    echo "  $mod_content_2" >> $mod_file
  else
    echo "Mod file already exists: $mod_file" 
  fi
  if ! grep -q "^$mod_reference\$" ./justfile; then
    printf "\n\n# {{description}}\n" >> ./justfile
    echo $mod_reference >> ./justfile 
  fi


# Visual Studio Code
mod vscode


# Notepad ++ text editor
mod notepadplus
