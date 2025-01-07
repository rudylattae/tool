@_default:
  just --justfile {{source_file()}} --list

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

