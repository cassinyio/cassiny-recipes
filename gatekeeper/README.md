

# To issue let's encrypt certs
```bash
acme.sh --issue \
-d cassiny.io \
-d www.cassiny.io \
-d mcc.cassiny.io \
-d docs.cassiny.io \
-d registry.cassiny.io \
--stateless
```


# List of domains and subdomains for SSL certs

### Cassiny main web site
* cassiny.io
* www.cassiny.io
* getcassiny.com
### Cassiny backedn
* mcc.cassiny.io
### Subdomain for the Probe
* *.cssny.space
### Subdomain for Docs
* docs.cassiny.io
### Subdomain for Registry
* registry.cassiny.io


## password
docker run --entrypoint htpasswd registry:2 -Bbn cassiny 'chrstn88' > registry.password

## Locally
docker run -it --rm -p 80:80 -p 8443:8443 --name cassiny_nginx --network cassiny-network  cassiny/nginx:1.0
docker network connect probes-network cassiny_nginx


docker run -it --rm -p 80:80 -p 8080:8080 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /Users/christianbarra/Projects/cassiny/stack/traefik/ssl:/etc/traefik/ssl \
-v /Users/christianbarra/Projects/cassiny/stack/traefik/traefik.toml:/etc/traefik/traefik.toml \
--network traefik-net traefik


docker service create \
--name whoami \
--label traefik.port=80 \
--label traefik.enable=true \
--label traefik.frontend.rule=Host:mcc.cassiny.io \
--network cassiny-private \
emilevauge/whoami

docker service create \
--name cargo-prinhere-9090 \
--label traefik.port=9000 \
--label traefik.enable=true \
--label traefik.frontend.rule=Host:mcc.cassiny.io \
--network traefik-net \
minio/minio server /export

docker service create \
--name www-cassiny-com \
--label traefik.port=8043 \
--label traefik.enable=true \
--label traefik.frontend.rule=Host:www.cassiny.io \
--network cassiny-private \
cassinyio/www-cassiny-com

docker service create \
--name mcc-cassiny-io \
--label traefik.port=8043 \
--label traefik.enable=true \
--label traefik.frontend.rule=Host:mcc.cassiny.io \
--network traefik-net \
mcc.cassiny.io:1.0

docker service create \
--name www-cassiny-io \
--label traefik.port=8043 \
--label traefik.enable=true \
--label traefik.frontend.rule=Host:www.cassiny.io \
--network cassiny-private \
www-cassiny-io:1.0

export CDIR=`pwd`
docker run \
 -v $CDIR/traefik.toml:/etc/traefik/traefik.toml  \
 --network cassiny-private \
 traefik \
 storeconfig \
 --consul \
 --consul.endpoint=consul:8500 \
 --consul.prefix="traefik"