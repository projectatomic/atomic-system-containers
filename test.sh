#!/bin/bash
set -euo pipefail

find . -name 'config.json*' -o -name 'manifest.json' | while read i; do
    echo Testing file $i
    MODE=PREPROCESS lint/syscontainers-lint $(dirname $i) $i | json_verify -s
done

find . -name Dockerfile -exec dirname \{\} \; | while read i; do
    echo Testing container $(basename $i)
    lint/syscontainers-lint $i
    echo
done
