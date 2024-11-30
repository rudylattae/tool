@_default:
  just --justfile {{source_file()}} --list


# ==================================
# CLI task runner
[linux]
just op="tldr" install_dir="~/bin":
  #!/usr/bin/env sh
  case "{{op}}" in
    tldr)
      echo "Operations: install (in), upgrade (up), uninstall (un)"
      ;;
    install|in)
      echo "Installing..."
      curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to {{install_dir}}
      ;;
    unpgrade|up)
      echo "Upgrading..."
      rm {{install_dir}}/just
      curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to {{install_dir}}
      ;;
    uninstall|un)
      echo "Uninstalling..."
      rm {{install_dir}}/just
      ;;
    *)
      echo "Invalid option"
      ;;
  esac

# CLI task runner
[windows]
just op="tldr":
  #!pwsh.exe
  $package = "Casey.Just"
  switch("{{op}}") {
    {'tldr' -contains $_} {
      echo "Operations: install (in), upgrade (up), uninstall (un)"
    }
    {'install', 'in' -contains $_} {
      echo "Installing $package..."
      winget install $package
    }
    {'upgrade', 'up' -contains $_} {
      echo "Upgrading $package..."
      winget upgrade $package
    }
    {'uninstall', 'un' -contains $_} {
      echo "Uninstalling $package..."
      winget uninstall $package
    }
  }

# ==================================
# Useful shell prompt
[linux]
starship op="exists":


# Useful shell prompt
[macos]
starship:

# Useful shell prompt
[windows]
starship:


# ==================================
# Visual Studio Code
[linux]
vscode:

# Visual Studio Code
[macos]
vscode:

# Visual Studio Code
[windows]
vscode: