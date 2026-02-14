# Makefile for CprE 450 Project 1
# Instructor: Dr. Yong Guan

CC = gcc
# TI-RPC flags required for the ISU linux-4 servers
CFLAGS = -I/usr/include/tirpc
LDLIBS = -ltirpc
RPCGEN = rpcgen -k

# The final executables we want to build
all: client server

# 1. THE RECIPE FOR RPCGEN
# This tells make that these 4 files depend on date.x
date.h date_clnt.c date_svc.c date_xdr.c: date.x
	$(RPCGEN) date.x

# 2. THE RECIPE FOR THE CLIENT
# It needs your code + the client stub + the XDR data translator
client: client.c date_clnt.c date_xdr.c date.h
	$(CC) $(CFLAGS) -o client client.c date_clnt.c date_xdr.c $(LDLIBS)

# 3. THE RECIPE FOR THE SERVER
# It needs your code + the server skeleton + the XDR data translator
server: server.c date_svc.c date_xdr.c date.h
	$(CC) $(CFLAGS) -o server server.c date_svc.c date_xdr.c $(LDLIBS)

# A clean-up tool to reset your folder
clean:
	rm -f client server date.h date_clnt.c date_svc.c date_xdr.c