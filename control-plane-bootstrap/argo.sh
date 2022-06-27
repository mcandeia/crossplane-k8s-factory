#!/bin/bash

kubectl port-forward service/mme1-argo-cd-argocd-server -n argo-cd 8080:443
kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d


kubectl port-forward service/httpbin -n workload 8081:80
