![Mode swarm logo](https://image.slidesharecdn.com/docker1-160710015254/95/docker-112-swarm-mode-6-638.jpg?cb=1468115592 "Mode swarm log")

Pré requis
-

Docker

*$ curl -s https://get.docker.com | sudo bash*

Docker-compose (ici version 1.14.0-rc1

*$ curl -L https://github.com/docker/compose/releases/download/1.14.0-rc1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose*

*$ chmod +x /usr/local/bin/docker-compose*

Upgrade de Python (pour centos/redhat)

*$ yum upgrade python**

Configuration du cluster (les ports TCP:2377, UDP:TCP:7946, UDP:4789 doivent être ouverts) 
-

Sur Master :

*$ docker swarm init*

Sur Node :

*$ docker swarm join --token <token given by previous command>*

Deploiement de httpd avec docker-compose :
-

*$ docker-compose -f docker-compose.MY_WEBSITE.yml up -d*
