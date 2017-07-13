# cri-o

This is the cri-o daemon as a system container. Currently this is only
in the experimental stage, and cri-o is being build from source inside
the container, causing the image to be quite large.

This container currently provides crioctl on the host once installed,
but does not include cni configs. The daemon will run as is, but to
run pods and containers, you must set up cni plugins as shown in:
https://github.com/kubernetes-incubator/cri-o/blob/master/tutorial.md


## Building the image from source:

```
# git clone https://github.com/projectatomic/atomic-system-containers
# cd atomic-system-containers/cri-o
# docker build -t crio .
```

## Running the system container, with the atomic CLI:

Pull from registry into ostree:

```
# atomic pull --storage ostree $REGISTRY/crio
```

Or alternatively, pull from local docker:

```
# atomic pull --storage ostree docker:crio:latest
```

Install the container:

Currently we recommend using --system-package=no to avoid having rpmbuild create an rpm file
during installation. This flag will tell the atomic CLI to fall back to copying files to the
host instead.

```
# atomic install --system --system-package=no --name=crio ($REGISTRY)/crio
```

Start as a systemd service:

```
# systemctl start crio
```

Stopping the service

```
# systemctl stop crio
```

Removing the container

```
# atomic uninstall crio
```

