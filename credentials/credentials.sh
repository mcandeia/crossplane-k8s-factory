#!/bin/bash

az ad sp create-for-rbac --sdk-auth --role Owner > azure_sp_credentials.json

AZURE_CLIENT_ID=$(cat azure_sp_credentials.json | grep -oP "clientId.*" | cut -d ":" -f 2 | sed -e 's/"//gi' | sed -e 's/,//gi' | tr -d ' ')


az ad app permission add --id ${AZURE_CLIENT_ID} \
   --api 00000002-0000-0000-c000-000000000000 \
   --api-permissions 1cda74f2-2616-4834-b122-5cb1b07f8a59=Role \ 78c8a3c8-a07e-4b9e-af1b-b5ccab50a175=Role

az ad app permission grant --id ${AZURE_CLIENT_ID} --api 00000002-0000-0000-c000-000000000000 --expires never

az ad app permission admin-consent --id "${AZURE_CLIENT_ID}"

BASE64ENCODED_AZURE_ACCOUNT_CREDS=$(base64 azure_sp_credentials.json | tr -d "\n")

echo $BASE64ENCODED_AZURE_ACCOUNT_CREDS
