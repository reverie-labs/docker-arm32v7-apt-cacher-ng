# docker-armhf-apt-cacher-ng

Docker image for running apt-cacher-ng in an `armhf` device (such as Raspberry Pi 2 or 3, etc)

To run with the default configurations, disposing of the cache when done:

```
docker run -d -p 3142:3142 reverie/rpi-apt-cacher-ng
```

To create a service and persistent volumes:

```
docker volume create aptcache-var_cache_aptcache
docker volume create aptcache-var_log_aptcache
docker service create --name aptcache \
    -p 3142:3142 && \
    --mount type=volume,source=aptcache-var_cache_aptcache,destination=/var/cache/apt-cacher-ng && \
    --mount type=volume,source=aptcache-var_log_aptcache,destination=/var/log/apt-cacher-ng && \
    --replicas 1 && \
    reverie/armhf-apt-cacher-ng:latest
```

To point an Ubuntu/Debian client to the cache:

```
echo 'Acquire::http { Proxy "http://your.ip.address.here:3142"; }' >> /etc/apt/apt.conf.d/99aptcache
```



