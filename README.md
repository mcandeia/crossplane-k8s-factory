# infra-desired-state

# Run book

## Install pre-requisites

1. Azure CLI
2. Crossplane CLI
3. Kubectl
4. minikube
5. helm

## Generate credentials

1. az login
2. cd credentials/
3. ./credentials.sh

Copy the output to aks-factory/values.yaml field `azureSP` 

## Bootstrap

1. Run ./run.sh
2. Wait for aks-provisioning (~1minute)
3. run
```shell
az aks get-credentials \
--resource-group mme1-aks-crossplane-rg \
--name mme1-aks-crossplane
```
4. Wait 1 minute

## Control plane desired state

Deploy new services using https://github.com/mcandeia/control-plane-desired-state