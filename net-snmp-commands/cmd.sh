#!/bin/bash


if [[ -z ${COMMAND} ]]; then
    echo "You must provide a command."
    echo -e "\tCOMMAND: The binary name to execute"
    echo -e "\tARGS: Arguments to pass to the COMMAND"
    echo "Available commands: "
    for x in  $(cat /exports/commands.txt); do
        echo -e "\t- ${x}"
    done
    exit 1
fi

if grep -Fqx "${COMMAND}" /exports/commands.txt; then
    exec /usr/bin/${COMMAND} ${ARGS}
else:
    echo "NOPE!!!!!"
fi
