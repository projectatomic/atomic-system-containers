# net-snmp

This is net-snmp as a system container which includes:

- snmpd daemon
- snmptrapd daemon
- snmp tools

## Building the image from source:

```
# git clone https://github.com/projectatomic/atomic-system-containers
# cd atomic-system-containers/net-snmp
# docker build -t net-netsnmp .
```

## Running the system container, with the atomic CLI:

Pull from registry into ostree:

```
# atomic pull --storage ostree $REGISTRY/net-snmp
```

Or alternatively, pull from local docker:

```
# atomic pull --storage ostree docker:net-snmp:latest
```

Install the container:

Currently we recommend using --system-package=no to avoid having rpmbuild create an rpm file
during installation. This flag will tell the atomic CLI to fall back to copying files to the
host instead.

```
# atomic install --system --system-package=no --name=net-snmp ($REGISTRY)/net-snmp
```

Start as a systemd service:

```
# systemctl start net-snmp
```

Stopping the service

```
# systemctl stop net-snmp
```

Removing the container

```
# atomic uninstall net-snmp
```

Executing Commands
```
# atomic run --storage ostree net-snmp $COMMAND $ARGS
```

Commands Provided

- agentxtrap
- encode_keychange
- net-snmp-create-v3-user
- snmpbulkget
- snmpbulkwalk
- snmpconf
- snmpdelta
- snmpdf
- snmpget
- snmpgetnext
- snmpinform
- snmpnetstat
- snmpset
- snmpstatus
- snmptable
- snmptest
- snmptls
- snmptranslate
- snmptrap
- snmpusm
- snmpvacm
- snmpwalk

For more information see the [net-snmp website](http://www.net-snmp.org/).
