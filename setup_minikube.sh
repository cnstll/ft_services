#!/bin/bash

# Download and install Minikube
# curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

# sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Ensure minikube env is new
minikube delete

# Starting minikube env
minikube start --driver=docker --namespace ft-services

# Allowing addons
minikube addons enable dashboard
minikube addons enable metallb

# Connet minikube image registery to local docker registry
#eval $(minikube -p minikube docker-env)
