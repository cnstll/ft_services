#!/bin/bash

minikube version &> /dev/null
if [[ $? -ne 0 ]]
# Download and install Minikube
	then
		echo ">>>> Downloading and Installing Minikube"
		curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-$arch
		sudo install minikube-linux-$arch /usr/local/bin/minikube
else
	echo ">>>> Minikube already installed"
fi

## Download and install kubectl Kubernetes CLI
#kubectl version &> /dev/null
#if [[ $? -ne 0 ]]
#	then
#		echo "	>>>> Downloading and Installing Kubectl"
#		curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/$arch/kubectl
#
#		chmod +x ./kubectl
#		sudo mv ./kubectl /usr/local/bin/kubectl
#else
#	echo ""
#	echo "	>>>> Kubectl already installed"
#fi
#
#minikube kubectl -- get po -A
