@_default:
  just --justfile {{source_file()}} --list --unsorted

[unix]
@install:
  curl -LsSf https://astral.sh/uv/install.sh | sh

[windows]
@install:
  winget install astral-sh.uv

alias in := install

[unix]
@uninstall:

[windows]
@uninstall:

alias un := uninstall    

