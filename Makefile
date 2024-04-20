CC=cc
LD=ld
CFLAGS=-Og -ggdb
LDFLAGS=

dev: mixBinary
	@printf "OK\n";

prod: mixBinary
	strip bins/entry;
	@printf "OK\n";

mixBinary: mixObject
	gcc -o bins/entry objects/mix.o $(LDFLAGS) -pthread -ldiscord -lcurl 

mixObject: commandRegistrationObject indexObject eventInteractionCreateObject commandPingObject eventReadyObject
	ld -r -o objects/mix_events.o objects/eventInteractionCreate.o objects/eventReady.o
	ld -r -o objects/mix_commands.o objects/commandPing.o
	ld -r -o objects/mix_misc.o objects/commandRegistration.o objects/index.o
	ld -r -o objects/mix.o objects/mix_events.o objects/mix_commands.o objects/mix_misc.o

commandRegistrationObject:
	$(CC) -c -o objects/commandRegistration.o src/commandRegistration.c $(CFLAGS)

eventInteractionCreateObject:
	$(CC) -c -o objects/eventInteractionCreate.o src/events/interactionCreate.c $(CFLAGS)

commandPingObject:
	$(CC) -c -o objects/commandPing.o src/commands/ping.c

indexObject:
	$(CC) -c -o objects/index.o src/index.c $(CFLAGS)

eventReadyObject:
	$(CC) -c -o objects/eventReady.o src/events/ready.c

clean:
	rm -f bins/entry objects/mix.o
	rm -f objects/mix_events.o objects/eventInteractionCreate.o objects/eventReady.o
	rm -f objects/mix_commands.o objects/commandPing.o
	rm -f objects/mix_misc.o objects/commandRegistration.o objects/index.o
