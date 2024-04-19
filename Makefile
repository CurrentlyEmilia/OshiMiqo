CC=cc
CFLAGS=-Og -ggdb
LDFLAGS=

all: mixBinary
	@printf "OK\n";

mixBinary: mixObject
	gcc -o bins/entry objects/mix.o $(LDFLAGS) -pthread -ldiscord -lcurl 

mixObject: registerObject indexObject
	ld -r -o objects/mix.o objects/index.o objects/register.o $(LDFLAGS)

registerObject:
	$(CC) -c -o objects/register.o src/register.c $(CFLAGS)

indexObject:
	$(CC) -c -o objects/index.o src/index.c $(CFLAGS)

clean:
	rm -f objects/mix.o bin/entry
	rm -f objects/register.o
	rm -f objects/index.o

