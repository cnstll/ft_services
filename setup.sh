#!/bin/bash

# Preparing minikube

set -e

## Checking Architecture for minikube and kubectl download
echo ""
echo "🔎 Checking architecture..."
if [[ $(uname -m) = x86_64 ]]
	then
		arch=amd64
elif [[ $(uname -m) = arm64 ]]
	then
		arch=arm64
else
	echo "💫 Architecture $(uname -m) not supported"
	exit 1
fi
echo "🚚 Architecture Detected $arch"
export arch

## Download and Install minikube, if necessary
echo ""
echo "⏳ Minikube setup..."
bash srcs/setup_minikube.sh 2>> error.log

## Ensure minikube env is new
echo ""
echo "⏳ Cleaning..."
minikube delete

## Starting minikube env
echo ""
echo "⏳ Starting a new instance of minikube..."
minikube start --driver=docker

## Download and Install kubectl, if necessary
echo ""
echo "⏳ Kubectl setup..."
bash srcs/setup_kubectl.sh 2>> error.log

## Set ft-services as the default namespace for all kubectl cmds
kubectl config set-context --current --namespace=ft-services

## Allowing addons
echo ""
echo "⏳ Addons setup..."
minikube addons enable dashboard &> /dev/null
minikube addons enable metallb &> /dev/null
minikube addons enable metrics-server &> /dev/null
echo "🙌 Addons enabled"

## Connet minikube image registery to local docker registry
eval $(minikube -p minikube docker-env)
sleep 5
echo "⚡ -- Minikube cluster up and running -- ⚡"

## Building docker images of our apps
echo ""
echo "⏳ Building docker local images..."
echo "☕🍵 You may have some time to grab a coffee/tea..."
echo -ne '[ ░░░░░░░░░░░░░░░░ ](0/8)\r'
docker build -t nginx:local srcs/images/nginx &> /dev/null
echo -ne '[ ▓▓░░░░░░░░░░░░░░ ](1/8)\r'
docker build -t mysql:local srcs/images/mysql &> /dev/null
echo -ne '[ ▓▓▓▓░░░░░░░░░░░░ ](2/8)\r'
docker build -t wordpress:local srcs/images/wordpress &> /dev/null
echo -ne '[ ▓▓▓▓▓▓░░░░░░░░░░ ](3/8)\r'
docker build -t phpmyadmin:local srcs/images/phpMyAdmin &> /dev/null
echo -ne '[ ▓▓▓▓▓▓▓▓░░░░░░░░ ](4/8)\r'
docker build -t influxdb:local srcs/images/influxdb &> /dev/null
echo -ne '[ ▓▓▓▓▓▓▓▓▓▓░░░░░░ ](5/8)\r'
docker build -t telegraf:local srcs/images/telegraf &> /dev/null
echo -ne '[ ▓▓▓▓▓▓▓▓▓▓▓▓░░░░ ](6/8)\r'
docker build -t grafana:local srcs/images/grafana &> /dev/null
echo -ne '[ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░ ](7/8)\r'
docker build -t ftps:local srcs/images/ftps/ &> /dev/null
echo -ne '[ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ](8/8)\r'
echo -e '\e[92m[ ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓ ](8/8)\r\e[0m'
sleep 1
echo ""
echo "⚡ -- Docker Images ready -- ⚡"

# Creating a namespace for services
kubectl create namespace ft-services


## Install MetalLB in the cluster
echo ""
echo "⏳ Applying Kubernetes manifests..."
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml &> setup.log
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml &> setup.log
kubectl apply -f ./srcs/manifests/metallb-configmap.yaml &> setup.log
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" &> setup.log
echo "⚡ -- Metallb configured and running -- ⚡"

## Apps pre-requisite (Secrets, configmaps..)
kubectl apply -f srcs/manifests/secret.yaml &> setup.log
kubectl apply -f srcs/manifests/mysql-configmap.yaml &> setup.log
kubectl apply -f srcs/manifests/phpmyadmin-configmap.yaml &> setup.log
kubectl apply -f srcs/manifests/influxdb-configmap.yaml &> setup.log
kubectl apply -f srcs/manifests/telegraf-configmap.yaml &> setup.log
kubectl apply -f srcs/manifests/telegraf-auth.yaml &> setup.log
kubectl apply -f srcs/manifests/grafana-config.yaml &> setup.log

## Json files for each app dashboard to be imported in grafana
kubectl apply -f srcs/manifests/dashboards/wordpress-dashboard.yaml &> setup.log
kubectl apply -f srcs/manifests/dashboards/nginx-dashboard.yaml &> setup.log
kubectl apply -f srcs/manifests/dashboards/phpmyadmin-dashboard.yaml &> setup.log
kubectl apply -f srcs/manifests/dashboards/mysql-dashboard.yaml &> setup.log
kubectl apply -f srcs/manifests/dashboards/telegraf-dashboard.yaml &> setup.log
kubectl apply -f srcs/manifests/dashboards/grafana-dashboard.yaml &> setup.log
kubectl apply -f srcs/manifests/dashboards/influxdb-dashboard.yaml &> setup.log
kubectl apply -f srcs/manifests/dashboards/ftps-dashboard.yaml &> setup.log

echo "⚡ -- Secrets and Configfile loaded -- ⚡"

## Deploying the different apps in the cluster
kubectl apply -f srcs/manifests/nginx.yaml &> setup.log
kubectl apply -f srcs/manifests/mysql.yaml &> setup.log
kubectl apply -f srcs/manifests/wordpress.yaml &> setup.log
kubectl apply -f srcs/manifests/phpmyadmin.yaml &> setup.log
kubectl apply -f srcs/manifests/influxdb.yaml &> setup.log
kubectl apply -f srcs/manifests/telegraf.yaml &> setup.log
kubectl apply -f srcs/manifests/grafana.yaml &> setup.log
kubectl apply -f srcs/manifests/ftps.yaml &> setup.log
echo "⚡ -- Pods configured and running -- ⚡"

echo "Do 'minikube dashboard' to open cluster dashboard"
echo "⚡⚡-- Connect to Cluster through IP: http://192.168.49.2/ -- ⚡⚡"
