#!/usr/bin/env bash

echo "================================="
echo " Preparing environment for D8 CLI.  "
echo "================================="

#export CLI_USER_ID="543182540"
#export CLI_USER_GROUP="543162881"
_DOCKER_UID=$(id -u docker)
if [[ -n "$CLI_USER_ID" ]] && [[ "${_DOCKER_UID}" -ne "$CLI_USER_ID" ]] && [[ $UID -eq "0" ]]; then

  echo "|Updating Docker user UID to ${CLI_USER_ID} and group GID to ${CLI_USER_GROUP}"

  usermod --uid ${CLI_USER_ID} docker
  groupmod -g ${CLI_USER_GROUP} users

fi

# Execute passed CMD arguments
exec "$@"