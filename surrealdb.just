@_default:
  just --justfile {{source_file()}} --list

[unix]
@install:
  curl --proto '=https' --tlsv1.2 -sSf https://install.surrealdb.com | sh

[windows]
@install:
  iwr https://windows.surrealdb.com -useb | iex

alias in := install

[unix]
@uninstall:

[windows]
@uninstall:

alias un := uninstall    

