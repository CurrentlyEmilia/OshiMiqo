CC=cc
CFLAGS=-Og -ggdb
LDFLAGS=-Og -ggdb

all: registerBinary indexBinary
	@printf "OK\n";

registerObject:
	$(CC) -c -o objects/register.o src/register.c $(LDFLAGS)

registerBinary: registerObject
	$(CC) -o bins/register objects/register.o $(CFLAGS) -pthread -ldiscord -lcurl

indexObject:
	$(CC) -c -o objects/index.o src/index.c $(LDFLAGS)

indexBinary: indexObject
	$(CC) -o bins/index objects/index.o $(CFLAGS) -pthread -ldiscord -lcurl

clean:
	rm bins/register objects/register.o
	rm bins/index objects/index.o

