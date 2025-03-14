#!/usr/bin/env bash

# check if .env file exists
FILE=".env"
if [ -f "$FILE" ]; then
	echo "Found file: '${FILE}'. Will configure environment variables."
  set -o allexport; source .env; set +o allexport
fi

set -eo pipefail

# ./ctl.sh cargo:run (run your app while developing)
function cargo:run {
  cargo run
}

# ./ctl.sh cargo:build:dev (build your app with dev profile)
function cargo:build:dev {
  cargo build
}

# ./ctl.sh cargo:build:release (build your app with release profile)
function cargo:build:release {
  cargo build --release
}

# ./ctl.sh nix:vscode (open vscode from inside nix flake dev shell with rust)
function nix:vscode {
  nix develop --command code .
}

function help {
  printf "%s <task> [args]\n\nTasks:\n" "${0}"

  # sometimes compgen is not available. then you just will not get a list of available commands.
  compgen -A function | grep -v "^_" | cat -n

  printf "\nExtended help:\n  Each task has comments for general usage\n"
}

# details about this script: https://www.juliusunscripted.com/posts/bash-script-with-env-file-variables-and-commands/
TIMEFORMAT=$'\nTask completed in %3lR'
time "${@:-help}"
