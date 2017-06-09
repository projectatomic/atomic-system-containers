# docker

This is the docker daemon system container for Fedora systems based on the moby project.
For more information refer to: https://github.com/moby/moby

Note this only provides the *daemon process*, and does not include CLI tools. The current use
case for this would be switching between different versions of docker by updating the container.

## Building the image from source:

```
# git clone https://github.com/projectatomic/atomic-system-containers
# cd atomic-system-containers/docker-fedora
# docker build -t docker .
```

## Running the system container, with the atomic CLI:

Pull from registry into ostree:

```
# atomic pull --storage ostree $REGISTRY/docker
```

Or alternatively, pull from local docker:

```
# atomic pull --storage ostree docker:docker:latest
```

Install the container:

Currently we recommend using --system-package=no to avoid having rpmbuild create an rpm file
during installation. This flag will tell the atomic CLI to fall back to copying files to the
host instead.

```
# atomic install --system --system-package=no --name=docker ($REGISTRY)/docker

Note that if you have the package docker locally, you would need to use another
name for the service (i.e. --name=docker-system-container, etc.)
```

Start as a systemd service:

```
# systemctl start docker
```

Stopping the service

```
# systemctl stop docker
```

Removing the container

```
# atomic uninstall docker
```
