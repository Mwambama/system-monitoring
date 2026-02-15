# system-monitoring
Remote System Monitoring using RPC 
**Author:** Alisala Mwamba
**Course:** CPRE 450/550 - Distributed Systems & Middleware
**Date:** Febuary 13, 2026

## Overview 
The application uses the following components:
-**date.x**: RPC interface definition including the `stats` struct.
-**server.c**: Implemetation of the remote procedure that parses the Linux `/proc` Filesystem.
-**client.c**: Client interface that displays system vitals to the user.
-**XDR Layer**: Hnadles data translation (marshaling) for difficult structures across the network.


##  Files

-`date.x`: RPC specifition file.
-`server.c`: Server-side implementation.
`client.c` Client-side implementation.
-`Makefile`: Automates the generation of stubs and compilation.

## How to BUILD

 Run the follwoing command in your linux server:
     Make

## How to Run
  1. start the server on the remote machine
     ./server
  2. In a separate terminal, run the client pointing to the server's hostname:
     ./client localhost (or server IP{/hostname)
