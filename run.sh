#!/bin/bash

minikube delete && minikube start
sleep 5
kubectl create namespace crossplane-system

helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update

helm install crossplane --namespace crossplane-system crossplane-stable/crossplane

sleep 30

kubectl crossplane install provider crossplane/provider-helm:master
kubectl crossplane install provider crossplane/provider-azure:master

sleep 10

kubectl apply -f https://raw.githubusercontent.com/crossplane/crossplane/release-1.8/docs/snippets/configure/azure/providerconfig.yaml

sleep 10
helm upgrade --install aks-factory-release ./aks-factory

