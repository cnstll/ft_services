#!/bin/bash

# Download and install kubectl Kubernetes CLI
EXPECTED_KUBECTL_VERSION="v1.20.0"
CURRENT_KUBECTL_VERSION=$(kubectl version | awk '/Server Version/')

if [[ $CURRENT_MINIKUBE_VERSION =~ $EXPECTED_MINIKUBE_VERSION ]]
then
	echo ">>>> Kubectl already installed"
else
	echo ">>>> Downloading and Installing Kubectl"
		curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/$arch/kubectl

		chmod +x ./kubectl && sudo mv ./kubectl /usr/local/bin/kubectl
fi

exit 0
