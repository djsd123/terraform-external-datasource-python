#!/usr/bin/env bash

function error_exit() {
  echo "$1" 1>&2
  exit 1
}

function check_dependencies() {
  test -f $(which jq) || error_exit "jq not found"
  test -f $(which curl) || error_exit "curl not found"
}

function parse_input() {
  # jq reads from stdin so we don't have to set up any inputs, but let's validate the outputs
  eval "$(jq -r '@sh "export REPO_NAME=\(.repo_name) USER_NAME=\(.user_name)"')"
  if [[ -z "${REPO_NAME}" ]]; then export REPO_NAME=none; fi
  if [[ -z "${USER_NAME}" ]]; then export USER_NAME=none; fi
}

function fetch_data() {
  # The External provider requires that the json returned only contain strings for both keys and values
  # Walk the returned JSON object and convert any non-string to a string
  curl "https://api.github.com/users/${USER_NAME}/repos" | jq -r --arg name "$REPO_NAME" \
    '.[] | select(.name == $name) | walk(if type != "string" then tostring else . end)'
}

check_dependencies
parse_input
fetch_data
