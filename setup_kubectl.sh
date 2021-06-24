#!/bin/bash

# Download and install kubectl Kubernetes CLI
kubectl version &> /dev/null
if [[ $? -ne 0 ]]
	then
		echo ">>>> Downloading and Installing Kubectl"
		curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/$arch/kubectl

		chmod +x ./kubectl
		sudo mv ./kubectl /usr/local/bin/kubectl
else
	echo ">>>> Kubectl already installed"
fi

# Download and install kubectl the CLI of Kubernetes
#curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
#
#chmod +x ./kubectl
#sudo mv ./kubectl /usr/local/bin/kubectl
#
##minikube kubectl -- get po -A
#
##kubectl version --client
