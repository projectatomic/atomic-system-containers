# docker-centos

## Docker Command

```sudo docker -H unix:///var/run/$NAME/docker.sock images```

## File Locations

### Configuration

Configuration for docker-centos lives in ``/etc/$NAME``, where
``$NAME`` is the name of the container. As an example, if the container was
built as ``dockercentos``, the configuration path would be
``/etc/docker-dockercentos``.

``daemon.json`` is the preferred way to configure docker in the system container.


### Run Directory

The run directory is set to ``/var/run/$NAME``.


### State Directory

The state directory is set to ``/var/lib/$NAME``.


## Building

```
# git clone https://github.com/projectatomic/atomic-system-containers
# cd atomic-system-containers/docker-centos
# docker build -t dockercentos .
```


## System container

Pull from local docker into ostree:

```
# atomic pull --storage ostree docker:dockercentos:latest
```

Install the container:

```
# atomic install --system dockercentos
```

Start as a systemd service:

```
# systemctl start dockercentos
```

Stopping the service

```
# systemctl stop dockercentos
```

Removing the container

```
# atomic uninstall dockercentos
```
