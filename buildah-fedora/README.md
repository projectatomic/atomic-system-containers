# buildah-container

## Running the system container

The Buildah system container doesn't install a service, but it requires
`atomic run`.  The container has a mount point `/host` to the host.

It is possible to run it as:

```
# atomic run --storage ostree docker.io/gscrivano/buildah buildah bud --pull /host/$(PWD)
```

It works also as not root user, in this case please be sure to use the
vfs driver for Buildah:

```
$ atomic run --storage ostree docker.io/gscrivano/buildah buildah --storage-driver vfs bud --pull /host/$(PWD)
```
