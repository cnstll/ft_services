# ft_services

## Poject Presentation
Ft_services is a introduction to Kubernetes (minikube + kubectl) and cluster management.  
It aims at deploying a set of apps:
* A **Wordpress** website supported by a **mysql** database which can be accessed through **phpMyAdmin**
* A monitoring architecture based on influxdb/grafana/telegraf. **Influxdb** to store the data collected on pods by **telegraf**. **Grafana** to vizualize the data from the cluster.
* A standalone **ftps** (vsftpd)

##  Project requirements
x86_64 and arm64 architectures supported.
GNU/Linux - 18.04 required.

To allow docker daemon to work please type in the following commands:
`sudo groupadd docker; sudo usermod -aG docker ${USER}; su ${USER}`

## Running the project
Launch the `setup.sh` script in your preferred shell.
The images of the different apps and their dependencies are built from individual dockerfiles if not already available, see the image folder.  
Then manifests are applied to set the baremetal cluster.  
Then clusters secrets and configs are applied.    
Then dashboards information is set up to populate grafana's interface
Finally all the apps in the cluster are deployed.  

## Kubernetes basics 
- **What is Kubernetes (K8s)?**  
It is a open source container orchestration tool - or orchestrator - developped by Google. K8s helps manage containerized applications which can be in different deployment env.

- **What problems is k8s solving?**  
There are more and more microservices deployed in different env instead of packaged monolitic apps. Additionaly apps are more and more deployed in containers. In this context k8s offer high availability, scalability and backup for apps (microservices).

- **What is the basic architecture of k8s ?**  
You have at least 1 master node linked to worker nodes through a virtual network. Master nodes run k8s processes to run and manage the cluster (API Server, Controller Manager, Scheduler, etcd key value storage). Worker nodes handles apps in a containerized way. Each worker node has a "kubelet" process that makes it possible to the cluster to run apps on the different nodes. The virtual network unify the worker nodes and harness maximum capacity from it.

- K8s basic concepts:
   - **Pod**: A pod is the smallest unit of K8s that is an abastraction over containers. It is a layer that manages containers and container images for the user (a pod can restart a container if it dies). A pod is usually meant to run 1 app. Worker nodes may contain multiple pods. The virtual network grants each pod a unique internal IP address.
  - **Deployment**: it is an abstraction over pods that helps configure and manage pods.
  - **Service**: it is a substitute to Pod's IP addresses that are ephemeral and dynamic (meaning if a pod dies and get restarted, its IP will change as well). It is a permanent IP address and a load balancer. Basically, service ease communcication between pods through runtime of the cluster.
  - **ConfigMap**: basic and external configuration of your application that unable some flexibility (eg: changing DB url)
  - **Secrets**: used to store sensitive data such as passwords or users. This data is encoded in base64.
  - **Volumes**: attached local or remote physical storage to a pod that contain a DB for example. It handles data persitence.
  - **Replicas**: cloned pods of the same app that are connected to the same service. In case a pod dies another one is available to run the app to avoid down time for the end user.
  - **StatefulSet**: it is an abstraction over DB pods or stateful apps that take care of replicating and writing/reading data.
  - **Ingress**: It refers to the different ways of routing external traffic to a K8s cluster.
