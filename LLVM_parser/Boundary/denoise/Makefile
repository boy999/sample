# Habanero C Makefile common for linux and mac Makefile
#
#HC_VERSION=0.1

#compiler and linker options
CC=gcc
# CFLAGS=-Wall -std=c89 -g -O2 -D__sparc__=1
CFLAGS=-Wall -O3
INCLUDES=
LIBS=

default: denoise
OBJS=denoise.o

denoise:${OBJS}
	${CC} ${LIBS} -o $@ $<

#.c.o:
#	$(CC) $(CFLAGS) $(INCLUDES) -c $<  -o $@

clean:
	rm -rf ${OBJS} denoise
