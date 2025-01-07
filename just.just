@_default:
  just --justfile {{source_file()}} --list

[unix]
@install install_dir="~/bin":
  curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to {{install_dir}}

[windows]
@install:

alias in := install

[unix]
@uninstall:

[windows]
@uninstall:

alias un := uninstall    

