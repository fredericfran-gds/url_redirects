# Transition Data Checker For Bouncer

## Aims

This utility is used to:
1. make URL requests to the bouncer component of Gov.uk and retrieve the HTTP
code and URL redirect
2. the original URL to be used in each HTTP request is obtained from a file that
is fed to this utility
3. the bouncer instance/server is fronted by an elastic load balancer in AWS and
the entry point of this load balancer must be used as the address of bouncer
