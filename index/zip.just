[unix]
[no-cd]
@install-zip:
  sudo apt install zip

[unix]
[no-cd]
check-zip:
  #!/usr/bin/env bash
  command -v zip &> /dev/null

[unix]
[no-cd]
ensure-zip:
  #!/usr/bin/env bash
  if ! command -v zip &> /dev/null; then
    echo "zip not found, installing"
    just -f {{source_file()}} install-zip
  fi