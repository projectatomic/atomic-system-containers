# container-engine

This is the container engine system container for fedora systems based on the moby project.
For more information refer to: https://github.com/moby/moby

Note this only provides the *daemon process*, and does not include CLI tools. The current use
case for this would be switching between different versions of the engine by updating the
container.

## Building the image from source:

```
# git clone https://github.com/projectatomic/atomic-system-containers
# cd atomic-system-containers/docker-fedora
# docker build -t container-engine .
```

## Running the system container, with the atomic CLI:

Pull from registry into ostree:

```
# atomic pull --storage ostree $REGISTRY/container-engine
```

Or alternatively, pull from local docker:

```
# atomic pull --storage ostree docker:container-engine:latest
```

Install the container:

Currently we recommend using --system-package=no to avoid having rpmbuild create an rpm file
during installation. This flag will tell the atomic CLI to fall back to copying files to the
host instead.

```
# atomic install --system --system-package=no --name=container-engine ($REGISTRY)/container-engine
```

Start as a systemd service:

```
# systemctl start container-engine
```

Stopping the service

```
# systemctl stop container-engine
```

Removing the container

```
# atomic uninstall container-engine
```
