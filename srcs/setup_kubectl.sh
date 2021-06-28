#!/bin/bash

# Download and install kubectl Kubernetes CLI
EXPECTED_KUBECTL_VERSION="v1.20.0"

if [[ $(kubectl version | awk '/Server Version/') =~ $CURRENT_KUBECTL_VERSION= ]] && [[ $? -eq 0 ]]
then
	echo "👍 Kubectl already installed"
else
	echo "😄 Downloading and Installing Kubectl"
		curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/$arch/kubectl

		chmod +x ./kubectl
		sudo mv ./kubectl /usr/local/bin/kubectl
	echo "⚡ Done!"
fi

exit 0
