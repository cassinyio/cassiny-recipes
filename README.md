# Cassiny's recipes

This repository contains all Cassiny's recipes.

## Stack

* gatekeeper

## Network

We use 3 overlay networks:

* cassiny-private: the private network shared between the cassiny's services

## First part build the images

## Create networks

```
docker network create --driver overlay --attachable cassiny-private
```
