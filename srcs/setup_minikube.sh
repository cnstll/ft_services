#!/bin/bash

minikube
if [[ $? -ne 0 ]]
# Download and install Minikube
then
	curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
	sudo install minikube-linux-amd64 /usr/local/bin/minikube
fi

# Ensure minikube env is new
minikube delete

# Starting minikube env
minikube start --driver=docker --namespace ft-services

# Allowing addons
minikube addons enable dashboard
minikube addons enable metallb
