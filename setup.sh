#!/bin/bash

# Preparing minikube

bash setup_minikube.sh

# Building docker images of our services

docker build -t nginx:local srcs/images/nginx
docker build -t mysql:local srcs/images/mysql
docker build -t wordpress:local srcs/images/wordpress
#docker build -t php_my_admin ./srcs/images/phpMyAdmin
#docker build --label "wordpress" -f ./srcs/images/wordpress/Dockerfile

#Install MetalLB in the cluster
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl apply -f ./srcs/pods/metallb-configmap.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# Apps pre-requisite (Secrets, configmaps..)

kubectl apply -f srcs/pods/secret.yaml
kubectl apply -f srcs/pods/configmap.yaml

# Deploying the different apps in the cluster
kubectl apply -f srcs/pods/nginx.yaml
kubectl apply -f srcs/pods/mysql.yaml
kubectl apply -f srcs/pods/wordpress.yaml
kubectl apply -f srcs/pods/phpmyadmin.yaml
