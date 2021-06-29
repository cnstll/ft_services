# ft_services

## REQUIREMENT
x86_64 and arm64 architectures supported.
GNU/Linux - 18.04 required.

To allow docker daemon to work please type in the following commands:
`sudo groupadd docker; sudo usermod -aG docker ${USER}; su ${USER}`

## Poject Presentation
Ft_services is a introduction to Kubernetes and cluster management.
It aims at deploying a set of apps:
* A **Wordpress** website supported by a **mysql** database which can be accessed through **phpMyAdmin**
* A monitoring architecture based on influxdb/grafana/telegraf. **Influxdb** to store the data collected on pods by **telegraf**. **Grafana** to vizualize the data from the cluster.
* A standalone **ftps** (vsftpd)
