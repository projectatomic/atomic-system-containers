#!/bin/sh

if [ ! -d "/run/$NAME" ]; then
    mkdir /run/$NAME
fi

exec $@
