# Unzip. Tool to zip (compress) files
[unix]
[no-cd]
@install-unzip:
  sudo apt install unzip

[unix]
[no-cd]
ensure-unzip:
  #!/usr/bin/env bash
  if ! command -v unzip &> /dev/null; then
    echo "unzip not found, installing"
    just -f {{source_file()}} install-unzip
  fi