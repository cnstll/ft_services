#!/bin/bash

EXPECTED_MINIKUBE_VERSION="v1.21.0"

if [[ $(minikube version) =~ $EXPECTED_MINIKUBE_VERSION ]] && [[ $? -eq 0 ]]
	then
		echo "👍  Minikube already installed"
else
	echo "😄  Downloading and Installing Minikube"
	curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-$arch
	sudo install minikube-linux-$arch /usr/local/bin/minikube
	echo "⚡ Done"
fi

exit 0
