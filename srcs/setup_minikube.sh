#!/bin/bash

EXPECTED_MINIKUBE_VERSION="v1.21.0"
CURRENT_MINIKUBE_VERSION=$(minikube version | grep version | sed 's/minikube version: //g')

if [[ $(minikube version) =~ $EXPECTED_MINIKUBE_VERSION ]]
	then
		echo ">>>> Minikube already installed"
else
	echo ">>>> Downloading and Installing Minikube"
	curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/$arch/kubectl
	chmod +x ./kubectl && sudo mv ./kubectl /usr/local/bin/kubectl
fi

exit 0
