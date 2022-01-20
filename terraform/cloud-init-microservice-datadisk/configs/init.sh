#!/bin/bash

set -e

DOCKER_LOGIN=${docker_login}
AZURE_IDENTITY_LOGIN=${azure_identity_login}
AZURE_USER_IDENTITY_ID=${azure_user_identity_id}
ACR_LOGIN=${acr_login}

MOUNT_PATH=${mount_path}

{

  mkdir -p $MOUNT_PATH

  export DOCKER_CLIENT_TIMEOUT=120
  export COMPOSE_HTTP_TIMEOUT=120

  if [[ "$AZURE_IDENTITY_LOGIN" == "true" ]] && [[ "$AZURE_USER_IDENTITY_ID" != "null" ]]
  then
    echo "INFO: Azure CLI User Identity login."
    az login --identity -u "$AZURE_USER_IDENTITY_ID"
  else
    echo "INFO: Azure CLI System Identity login."
    az login --identity
  fi

  if [[ "$ACR_LOGIN" == "true" ]]
  then
    echo "INFO: Azure ACR login."
    az acr login --name "${login_server}"
  elif [[ "$DOCKER_LOGIN" == "true" ]]
  then
    echo "INFO: Using docker login."
    docker login "${login_server}" -u "${username}" -p "${password}"
  fi

  echo "INFO: Executing docker-compose."
  docker-compose -f "${docker_compose_file_path}" up -d
  echo "INFO: Executing of docker-compose is complete."

}|| {

  echo "INFO: Execution is failed."
  exit 1
}