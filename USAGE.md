# Installing System Containers

Installing system containers requires the ``atomic`` command.

## First: Pull the image

Pull from registry into ostree:

```
# atomic pull --storage ostree $REGISTRY/$IMAGE:$TAG
```

Or alternatively, pull from local docker:

```
# atomic pull --storage ostree docker:$IMAGE:$TAG
```

## Install the container

**Note**: Currently we recommend using --system-package=no to avoid having rpmbuild
create an rpm file during installation. This flag will tell the atomic CLI to fall
back to copying files to the host instead.


### Install without parameters
```
# atomic install --system --system-package=no --name=$NAME_FOR_SYSTEMD $REGISTRY/$IMAGE:$TAG
```

### Install with parameters
Some system containers can take in parameters. These parameters should be listed in
the system containers own README.md file. If for some reason a README.md does not
exist, one can check the ``defaultValues`` in the ``manifest.json`` file for
parameters to override.

```
# atomic install --system --system-package=no --name=$NAME_FOR_SYSTEMD \
  --set=KEY=VAL --set=FOO=BAR $REGISTRY/$IMAGE:$TAG
```

## Running System Containers

### Start as a systemd service

```
# systemctl start $NAME_FOR_SYSTEMD
```

### Stopping the service

```
# systemctl stop $NAME_FOR_SYSTEMD
```

## Uninstalling System Containers

```
# atomic uninstall $NAME_FOR_SYSTEMD
```
