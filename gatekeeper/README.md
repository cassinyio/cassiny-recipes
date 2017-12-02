
# Gatekeeper recipe

![The gatekeeper](https://memegenerator.net/img/instances/500x/41294111/i-am-the-gatekeeper-you-shall-not-pass.jpg)

## To run the Gatekeeper
```bash
make create
```

## To remove the Gatekeeper
```bash
make remove
```

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
--label traefik.frontend.rule=Host:www.cassiny.io,www.getcassiny.com \
--network cassiny-private \
cassinyio/www-cassiny-io:0.0.1
