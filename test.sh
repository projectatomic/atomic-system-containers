#!/bin/bash
set -euo pipefail

find . -name Dockerfile -exec dirname \{\} \; | while read i; do
    echo Testing container $(basename $i)
    lint/syscontainers-lint $i
    echo
done
