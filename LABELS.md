# Labels

The following lays out common and recommended labels to use with
System Containers.


## architecture

Describes the architecture of the image.

This label is RECOMMENDED.

### Example
```
architecture="x86_64"
```


## atomic.type

Denotes the type of image to the atomic command. If the image is to be used
as a system container only, then this label should be provided and set to
system.

This label MUST be used if the image is for use as a system container only.

**Options**: system

### Example
```
atomic.type="system"
```

## authoritative-source-url

The official location the image is published and available.

### Example
```
authoritative-source-url="https://example.org/registry/myimage"
```


## build-date

The RFC-3339 date the image was built.

### Example
```
build-date="2017-12-01T10:30:30Z"
```


## bzcomponent

Denotes the [Red Hat Bugzilla](https://bugzilla.redhat.com) component
related to this image.

### Example
```
bzcomponent="flannel"
```


## debug

Command executed to run the image with debugging.

### Example
**TODO**
```
debug=""
```


## distribution-scope

Expected scope of distribution for the image.

**Options**: private, authoritative-source-only, restricted, public

### Example
```
distribution-scope="private"
```


## help

Description on how to run the container.

### Example
```
help="The following options are valid..."
```


## install

Command executed to install the image.

### Example
**TODO**
```
install=""
```


## name

The name of the image.

This label is RECOMMENDED.

### Example
```
name="Azure"
```


## license

License the image is under.

This label is RECOMMENDED.

### Example

```
license="ASL 2.0"
```


## maintainer

The maintainer of the image in "NAME <EMAIL>" format.

This label is RECOMMENDED.

### Example

```
maintainer="Giuseppe Scrivano <gscrivan@redhat.com>"
```


## pubkey-id

Email address associated with the key.

### Example
```
pubkey-id="someaddress@example.org"
```


## pubkey-fingerprint

Fingerprint of the public key.

### Example
```
pubkey-fingerprint="F5451E00F128467EEEEECDED721CACC013E83AACC"
```


## pubkey-url

Link to the downloadable public key.

### Example
```
pubkey-url="https://pgp.mit.edu/pks/lookup?op=get&search=$KEYID"
```


## sigstore-url

Host and port of the signature server.

### Example
```
sigstore-url="example.org:8443"
```


## sigstore-type

Signature server type.

**Options**: docker, atomic

### Example
```
sigstore-type="docker"
```


## release

The release of the image.

### Example
```
release="10.f26"
```


## run

Command to execute the image

### Example
**TODO**
```
run=""
```


## run_opts_file

Full path to a file listing switches for use in run.

### Example
```
run_opts_file="/conf/options.conf"
```


## stop

Command executed before stopping a running container

### Example
**TODO**
```
stop=""
```


## summary

A short description of the image.

This label is RECOMMENDED.

### Example
```
summary="An etcd driven address agent, intended to be run as a system container"
```


## uninstall

Command executed to uninstall the image

This label is REQUIRED when the install label is used.

### Example
**TODO**
```
uninstall=""
```

## url

Link to more information about the image.

### Example
```
url="https://projectatomic.io/"
```


## vcs-type

The source control type used for the image source code.

### Example
```
vcs-type="git"
```

## vcs-url

The link to the source control repository.

### Example
```
vcs-url="https://github.com/example/example.git"
```

## vcs-ref

The reference to the code change this image was built from.

### Example
```
vcs-ref='7ecddccf6ee49000b1fee3d90020a8a0ddd9a765'
```


## vendor

The owner of the image.

### Example
```
vendor="Me"
```


## version

The version of the image.

This label is RECOMMENDED.

### Example
```
version="1.0"
```
