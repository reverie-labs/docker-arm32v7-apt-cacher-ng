# docker-rpi-apt-cacher-ng
Docker Raspberry Pi image for running apt-cacher-ng

```
docker run -d -p 3142:3142 reverie/rpi-apt-cacher-ng
```

```
docker volume create aptcache-var_cache_aptcache
docker volume create aptcache-var_log_aptcache
docker service create --name aptcache \
    -p 3142:3142 && \
    --mount type=volume,source=aptcache-var_cache_aptcache,destination=/var/cache/apt-cacher-ng && \
    --mount type=volume,source=aptcache-var_log_aptcache,destination=/var/log/apt-cacher-ng && \
    --replicas 1 && \
    reverie/rpi-apt-cacher-ng:latest
```


