#!/bin/bash

run_composer() {
  echo -e

  declare -a FILE_PATHS=("docker-compose.yml" "docker-compose.yaml" "docker-compose.yml" "compose.yml" "compose.yaml")

  file_exists=0

  for path in "${FILE_PATHS[@]}"; do
    if [ -f "$path" ]; then
      file_exists=1

      if grep -q "composer:" "$path"; then
        tput setaf 2
        tput bold
        echo "[i] Composer service found in $path"
        tput sgr0

        docker compose run composer "$1"
      fi
    fi
  done

  if [ "$file_exists" -eq 0 ]; then
    tput setaf 3
    tput bold
    echo -e "[!] No file matching the pattern (docker-)?compose.ya?ml found. Using default image from docker hub\n"
    tput sgr0

    composer_default_vendor="$(whoami)"

    host_composer_home="${COMPOSER_HOME:-$HOME/.composer}"
    container_composer_home='/usr/tmp'

    workdir="/$(basename "$PWD")"

    user="$(id -u)"
    group="$(id -g)"

    docker run --rm --interactive --tty \
      --env COMPOSER_HOME="$container_composer_home" \
      --env COMPOSER_DEFAULT_VENDOR="$composer_default_vendor" \
      --volume "$PWD":"$workdir" \
      --volume "$host_composer_home":"$container_composer_home" \
      --workdir "$workdir" \
      --user "$user:$group" \
      composer "$1"
  fi
}

alias composer='run_composer'
