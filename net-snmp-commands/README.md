# net-snmp-commands

This is the system container providing net-snmp-commands.

## Building the image from source:

```
# git clone https://github.com/projectatomic/atomic-system-containers
# cd atomic-system-containers/net-snmp-commands
# docker build -t net-snmp-commands .
```

## Running the system container, with the atomic CLI:

Pull from registry into ostree:

```
# atomic pull --storage ostree $REGISTRY/net-snmp-commands
```

Or alternatively, pull from local docker:

```
# atomic pull --storage ostree docker:net-snmp-commands:latest
```

Install the container:

Currently we recommend using --system-package=no to avoid having rpmbuild create an rpm file
during installation. This flag will tell the atomic CLI to fall back to copying files to the
host instead.

```
# atomic install --system --system-package=no --name=net-snmp-commands ($REGISTRY)/crio
```

Running commands

```
# ./sc-snmp
You must provide a command.                                                            
        COMMAND: The binary name to execute                                                                                   
        ARGS: Arguments to pass to the COMMAND                                                                                
Available commands:                                                                                                           
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
# ./sc-snmp net-snmp-create-v3-user -a SHA testing
Enter authentication pass-phrase: 
test
Enter encryption pass-phrase: 
  [press return to reuse the authentication pass-phrase]

adding the following line to /var/lib/net-snmp/snmpd.conf:
   createUser testing SHA "test" DES
adding the following line to /etc/snmp/snmpd.conf:
   rwuser testing
```
