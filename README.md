# Cassiny's recipes

This repository contains all Cassiny's recipes.

## Stack

* [gatekeeper](gatekeeper/)
* [frontenders](frontenders/)
* [pillars](pillars/)
* [services](services/)


## Network

We use 2 overlay networks:

* cassiny-private: the private network shared between the cassiny's services
* cassiny-public: the public network shared between probes/apis/cargos, cassiny-auth and traefik

## First part build the images

## Create networks

```
docker network create --driver overlay --attachable cassiny-private
docker network create --driver overlay --attachable cassiny-public
```

## Nodes' labels

* gpu = {true|false}
* public = {true|false}

```
docker node update --label-add gpu=false {id_of_node}
docker node update --label-add public=false {id_of_node}
```

## Start the stacks

Update environment/.env

From `gatekeeper/`
```
docker stack deploy gatekeeper -c stack-gatekeeper.yml
```

From `frontenders/`
```
docker stack deploy frontenders -c stack-frontenders.yml
```

From `pillars/`
```
docker stack deploy pillars -c stack-pillars.yml
```

Wait for the activation of the pillars before starting the services.

From `services/`
```
docker stack deploy services -c stack-services.yml
```
