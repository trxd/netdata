#!/bin/sh

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/tags" | # Get latest release from GitHub api
    grep '"name":' |                                     # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/' |                       # Pluck JSON value
    head -n1
}

get_latest_release "$@"
