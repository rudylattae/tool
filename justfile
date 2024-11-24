@_default:
  just --justfile {{source_file()}} --list

# Create modfile for tool and 
[unix]
@init name description:
  #!/usr/bin/env sh
  mod_file="{{name}}.just"
  mod_reference="mod {{name}}"
  initial_content="@_default:\n  just --justfile {{source_file()}} --list\n"
  if [ ! -f $mod_file ]; then
    printf $initial_content > $mod_file
  else
    echo "Mod file already exists: $mod_file" 
  fi
  if ! grep -q "^$mod_reference\$" ./justfile; then
    printf "\n{{description}}" >> ./justfile
    echo $mod_reference >> ./justfile 
  fi