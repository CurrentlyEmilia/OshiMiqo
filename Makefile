CC=cc
CFLAGS=-Og -ggdb
LDFLAGS=

dev: mixBinary
	@printf "OK\n";

prod: mixBinary
	strip bins/entry;
	@printf "OK\n";

mixBinary: mixObject
	gcc -o bins/entry objects/mix.o $(LDFLAGS) -pthread -ldiscord -lcurl 

mixObject: commandRegistrationObject indexObject eventInteractionCreateObject commandPing
	ld -r -o objects/commandHandler.o objects/eventInteractionCreate.o objects/commandPing.o $(LDFLAGS)
	ld -r -o objects/main.o objects/index.o objects/commandRegistration.o $(LDFLAGS)
	ld -r -o objects/mix.o objects/commandHandler.o objects/main.o $(LDFLAGS)

commandRegistrationObject:
	$(CC) -c -o objects/commandRegistration.o src/commandRegistration.c $(CFLAGS)

eventInteractionCreateObject:
	$(CC) -c -o objects/eventInteractionCreate.o src/events/interactionCreate.c $(CFLAGS)

commandPing:
	$(CC) -c -o objects/commandPing.o src/ping.c

indexObject:
	$(CC) -c -o objects/index.o src/index.c $(CFLAGS)

clean:
	rm -f objects/mix.o bin/entry
	rm -f objects/commandRegistration.o
	rm -f objects/index.o

