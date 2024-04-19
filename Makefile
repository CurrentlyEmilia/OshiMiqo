CC=cc
CFLAGS=-Og -ggdb
LDFLAGS=

all: mixBinary
	@printf "OK\n";

mixBinary: mixObject
	gcc -o bins/entry objects/mix.o $(LDFLAGS) -pthread -ldiscord -lcurl 

mixObject: commandRegistrationObject indexObject
	ld -r -o objects/mix.o objects/index.o objects/commandRegistration.o $(LDFLAGS)

commandRegistrationObject:
	$(CC) -c -o objects/commandRegistration.o src/commandRegistration.c $(CFLAGS)

indexObject:
	$(CC) -c -o objects/index.o src/index.c $(CFLAGS)

clean:
	rm -f objects/mix.o bin/entry
	rm -f objects/commandRegistration.o
	rm -f objects/index.o

