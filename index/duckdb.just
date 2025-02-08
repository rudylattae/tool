import 'unzip.just'
command := "duckdb"


[linux]
[no-cd]
install-duckdb: ensure-unzip
  #!/usr/bin/env bash
  if command -v {{command}} &> /dev/null; then
    echo "{{command}} exists: $(which {{command}})"
  else
    curl --fail --location --progress-bar --output duckdb_cli-linux-amd64.zip https://github.com/duckdb/duckdb/releases/download/v1.2.0/duckdb_cli-linux-amd64.zip && unzip duckdb_cli-linux-amd64.zip && mv duckdb ~/bin && rm duckdb_cli-linux-amd64.zip
  fi
 
[macos]
[no-cd]
@install-duckdb: ensure-unzip
  curl --fail --location --progress-bar --output duckdb_cli-osx-universal.zip https://github.com/duckdb/duckdb/releases/download/v1.2.0/duckdb_cli-osx-universal.zip && unzip duckdb_cli-osx-universal.zip

[windows]
[no-cd]
@install-duckdb:
  winget install DuckDB.cli