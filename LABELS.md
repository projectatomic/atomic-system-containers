# Labels

The following lays out common and recommended labels to use with
System Containers.


## Architecture

Describes the architecture of the image.

This label is RECOMMENDED.

### Example
```
Architecture="x86_64"
```


## atomic.type

Denotes the type of image to the atomic command. If the image is for
system containers then this label should be provided and set to system.

This label MUST be used if the image is for use as a system container.

**Options**: system

### Example
```
atomic.type="system"
```


## BZComponent

Denotes the [Red Hat Bugzilla](https://bugzilla.redhat.com) component
related to this image.

### Example
```
BZComponent="flannel"
```


## Name

The name of the image.

This label is RECOMMENDED.

### Example
```
Name="Azure"
```


## license

### Example
License the image is under.

This label is RECOMMENDED.

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


## Release

The release of the image.

### Example
```
Release="10.f26"
```

## Summary

A short description of the image.

This label is RECOMMENDED.

### Example
```
Summary="An etcd driven address agent, intended to be run as a system container"
```


## Version

The version of the image.

This label is RECOMMENDED.

### Example
```
Version="1.0"
```
