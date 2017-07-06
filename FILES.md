# Files for System Containers

## Required

These files must be present to be considered a valid system image.

### config.json.template

This file used by runc and describes the container configuration. It defines mounts, capabilities, process options, etc.

For more information see [the oci config documentation](https://github.com/opencontainers/runtime-spec/blob/master/config.md).

Example: [hello-world/config.json.template](hello-world/config.json.template)

### service.template

This file is used when creating a systemd service upon system container installation.

For more information see [systemd unit documentation](https://www.freedesktop.org/software/systemd/man/systemd.unit.html).

Example: [hello-world/service.template](hello-world/service.template)

## Optional

The following files may be omitted if their additional features are not required.

### manifest.json

Defines default values for variables used within the system image. Variables may be referenced in other system image files.

Example: [hello-world/manifest.json](hello-world/manifest.json)

### tmpfiles.template

Defines file/location creation, deletion, and purge operations for temporary storage.

For more information see [systemd tmpfiles.d documentation](https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html).

Example: [docker-fedora/tmpfiles.template](docker-fedora/tmpfiles.template)
