#!/bin/bash

set -e

RESOURCE_GROUP_NAME=${resource_group_name}

# Docker
AZURE_IDENTITY_LOGIN=${azure_identity_login}
AZURE_USER_IDENTITY_ID=${azure_user_identity_id}
DOCKER_LOGIN=${docker_login}
ACR_LOGIN=${acr_login}

# FileShare
FILE_SHARE_SETTINGS=${file_share_settings}
FILE_STORAGE_ACCOUNT_NAME=${file_share_storage_account_name}
FILE_SHARE_NAME=${file_share_name}
FILE_SHARE_MOUNT_PATH=${file_share_mount_path}
FILE_SHARE_GID=${file_share_gid}
FILE_SHARE_UID=${file_share_uid}

SMB_CREDENTIALS_DIR="/etc/smbcredentials"

{

  # Azure identity login
  if [[ "$AZURE_IDENTITY_LOGIN" == "true" ]] && [[ "$AZURE_USER_IDENTITY_ID" != "null" ]]
  then
    echo "INFO: Azure CLI User Identity login."
    az login --identity -u "$AZURE_USER_IDENTITY_ID"
  else
    echo "INFO: Azure CLI System Identity login."
    az login --identity
  fi


  # FileShare Settings
  if [[ "$FILE_SHARE_SETTINGS" == "true" ]] && [[ "$FILE_SHARE_SETTINGS" != "null" ]]
  then

    echo "INFO: Applying Azure File Share settings."

    if [ ! -d "$FILE_SHARE_MOUNT_PATH" ]; then
        mkdir -p "$FILE_SHARE_MOUNT_PATH"
    fi

    chmod g+rwx "$FILE_SHARE_MOUNT_PATH"
    chgrp 0 "$FILE_SHARE_MOUNT_PATH"

    if [ ! -d "$SMB_CREDENTIALS_DIR" ]; then
        sudo mkdir "$SMB_CREDENTIALS_DIR"
    fi

    storageAccountKey=$(az storage account keys list \
        --resource-group "$RESOURCE_GROUP_NAME" \
        --account-name "$FILE_STORAGE_ACCOUNT_NAME" \
        --query "[0].value" | tr -d '"')

    smbCredentialFile="$SMB_CREDENTIALS_DIR/$FILE_STORAGE_ACCOUNT_NAME.cred"

    if [ ! -f "$smbCredentialFile" ]; then
        echo "username=$FILE_STORAGE_ACCOUNT_NAME" | sudo tee "$smbCredentialFile" > /dev/null
        echo "password=$storageAccountKey" | sudo tee -a "$smbCredentialFile" > /dev/null
    else
        echo "The credential file $smbCredentialFile already exists, and was not modified."
    fi

    chmod 600 "$smbCredentialFile"

    # This command assumes you have logged in with az login
    httpEndpoint=$(az storage account show \
        --resource-group "$RESOURCE_GROUP_NAME" \
        --name "$FILE_STORAGE_ACCOUNT_NAME" \
        --query "primaryEndpoints.file" | tr -d '"')

    smbPath=$(echo "$httpEndpoint" | cut -c7-$(expr length "$httpEndpoint"))$FILE_SHARE_NAME

    if [ -z "$(grep "$smbPath"\ "$FILE_SHARE_MOUNT_PATH" /etc/fstab)" ]; then
        echo "$smbPath $FILE_SHARE_MOUNT_PATH cifs nofail,uid=$FILE_SHARE_UID,gid=$FILE_SHARE_GID,vers=3.0,credentials=$smbCredentialFile,serverino,mfsymlinks" | sudo tee -a /etc/fstab > /dev/null
    else
        echo "/etc/fstab was not modified to avoid conflicting entries as this Azure file share was already present. You may want to double check /etc/fstab to ensure the configuration is as desired."
    fi

    mount -a

  fi

  echo "INFO: Applying Azure File Share settings is complete."

  # Azure ACR login
  if [[ "$ACR_LOGIN" == "true" ]]
  then
    echo "INFO: Azure ACR login."
    az acr login --name "${login_server}"
  elif [[ "$DOCKER_LOGIN" == "true" ]]
  then
    echo "INFO: Using docker login."
    docker login "${login_server}" -u "${username}" -p "${password}"
  fi

  # Docker up :)
  echo "INFO: Executing docker-compose."
  docker-compose -f "${docker_compose_file_path}" up -d
  echo "INFO: Executing of docker-compose is complete."

}|| {

  echo "INFO: Execution is failed."
  exit 1
}