# System Containers

As part of our effort to reduce the number of packages that are shipped with
the Atomic Host image, we faced the problem of how to containerize services
that are needed to be run before a container runtime, like the upstream docker
daemon, is running. The result: *system containers*: a way to run containers
in production using read only images.

A system container is a container that is executed out of an systemd unit file
early in boot, using runc. The specified IMAGE must be a system image
already fetched. If it is not already present, atomic will attempt to fetch it
assuming it is an oci image. Installing a system container consists of
checking it the image by default under /var/lib/containers/atomic/ and
generating the configuration files for runc and systemd. OSTree and runc are
required for this feature to be available.

System containers use different technologies:

 * We use the [atomic](https://github.com/projectatomic/atomic) tool to install
 system containers.
 * [Labels](LABELS.md) can influence how the *atomic tool* uses a system container
 * For storage system containers do not need to use COW File systems, since
 they are in production. We default to using OSTree for storage of the
 container images.
 * The *atomic tool* does not use upstream docker to pull the container images,
 instead we use the [Skopeo](https://github.com/projectatomic/skopeo) tool to pull images from a container registry.
 * When you *atomic install* a system container the tool will look for a systemd unit file template in /exports directory and will create a systemd unit file to run the container on the host.
 * The unit files uses [runc](https://github.com/opencontainers/runc) to create and run the containers.
 * [systemd](https://github.com/systemd/systemd) manages the lifestyle of the container.

To use system containers you must have Atomic CLI version 1.12 or later and the
ostree utility installed.

For more information on system containers see:

http://www.projectatomic.io/blog/2016/09/intro-to-system-containers
