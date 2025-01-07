@_default:
  just --justfile {{source_file()}} --list --unsorted

[unix]
@install:
  echo "❌ Not supported on Unix"

[windows]
@install:
  winget install Ditto.Ditto

alias in := install

[unix]
@uninstall:
  echo "❌ Not supported on Unix"

[windows]
@uninstall:
  winget uninstall Ditto.Ditto

alias un := uninstall    

