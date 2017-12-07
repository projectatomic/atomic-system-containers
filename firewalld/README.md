# firewalld 

This is firewalld daemon as a system container.

## Building the image from source:

```
# git clone https://github.com/projectatomic/atomic-system-containers
# cd atomic-system-containers/firewalld
# docker build -t firewalld .
```

## Running the system container, with the atomic CLI:

Pull from registry into ostree:

```
# atomic pull --storage ostree $REGISTRY/firewalld
```

Or alternatively, pull from local docker:

```
# atomic pull --storage ostree docker:firewalld:latest
```

Install the container:

Currently we recommend using --system-package=no to avoid having rpmbuild create an rpm file
during installation. This flag will tell the atomic CLI to fall back to copying files to the
host instead.

```
# atomic install --system --system-package=no --name=firewalld ($REGISTRY)/firewalld
```

Or alternatively, without specifying Registry, it will default to ostree image:

```
# atomic install --system --system-package=no --name=firewalld firewalld
```

Before you start the service, you need to reload dbus before it considers
the new configuration. (make sure you are under root when execute this!)

```
killall -SIGHUP dbus-daemon
```

Start as a systemd service:

```
# systemctl start firewalld
```

Stopping the service

```
# systemctl stop firewalld
```

Removing the container

```
# atomic uninstall firewalld
```

Or alternatively, you can do:

```
# atomic containers delete firewalld
``` 
