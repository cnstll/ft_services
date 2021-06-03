#!/bin/bash

# Preparing minikube

set -e

bash setup_minikube.sh
eval $(minikube -p minikube docker-env)
sleep 5
echo "⚡ -- Minikube configured and running -- ⚡ \n"

# Building docker images of our services

docker build -t nginx:local srcs/images/nginx
docker build -t mariadb:local srcs/images/mysql
docker build -t wordpress:local srcs/images/wordpress
docker build -t phpmyadmin:local srcs/images/phpMyAdmin
docker build -t influxdb:local srcs/images/influxdb
docker build -t telegraf:local srcs/images/telegraf
docker build -t grafana:local srcs/images/grafana
docker build -t vsftpd:local srcs/images/vsftpd/

# Creating a namespace for services
kubectl create namespace ft-services

echo "⚡ -- Docker Images ready -- ⚡ \n"
#Install MetalLB in the cluster
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl apply -f ./srcs/pods/metallb-configmap.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

echo "⚡ -- Metallb configured and running -- ⚡ \n"
# Apps pre-requisite (Secrets, configmaps..)

kubectl apply -f srcs/pods/secret.yaml
kubectl apply -f srcs/pods/mariadb-configmap.yaml
kubectl apply -f srcs/pods/pma-configmap.yaml
kubectl apply -f srcs/pods/wordpress-configmap.yaml
kubectl apply -f srcs/pods/influxdb-configmap.yaml
kubectl apply -f srcs/pods/telegraf-configmap.yaml
kubectl apply -f srcs/pods/grafana-config.yaml
kubectl apply -f srcs/pods/grafana-dashboard-config.yaml

echo "⚡ -- Secrets and Configmaps available -- ⚡ \n"

# Deploying the different apps in the cluster
kubectl apply -f srcs/pods/nginx.yaml
kubectl apply -f srcs/pods/mysql.yaml
kubectl apply -f srcs/pods/wordpress.yaml
kubectl apply -f srcs/pods/phpmyadmin.yaml
kubectl apply -f srcs/pods/influxdb.yaml
kubectl apply -f srcs/pods/telegraf.yaml
kubectl apply -f srcs/pods/grafana.yaml
kubectl apply -f srcs/pods/vsftpd.yaml

echo "⚡ -- Apps configured and running -- ⚡ \n"
