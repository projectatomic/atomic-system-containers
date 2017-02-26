#!/bin/bash


/usr/bin/python /usr/share/ovirt-guest-agent/ovirt-guest-agent.py &

cleanup ()
{
        kill -15 $!
        exit 0
}

trap cleanup SIGINT SIGTERM
wait $!
