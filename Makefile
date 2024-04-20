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
	gcc -o bins/entry objects/mixes/mix.o $(LDFLAGS) -pthread -ldiscord -lcurl 

mixObject: commandRegistrationObject indexObject eventInteractionCreateObject commandPingObject eventReadyObject
	ld -r -o objects/mixes/mix_events.o objects/events/interactionCreate.o objects/events/ready.o
	ld -r -o objects/mixes/mix_commands.o objects/commands/ping.o
	ld -r -o objects/mixes/mix_misc.o objects/misc/commandRegistration.o objects/misc/index.o
	ld -r -o objects/mixes/mix.o objects/mixes/mix_events.o objects/mixes/mix_commands.o objects/mixes/mix_misc.o

commandRegistrationObject:
	$(CC) -c -o objects/misc/commandRegistration.o src/commandRegistration.c $(CFLAGS)

eventInteractionCreateObject:
	$(CC) -c -o objects/events/interactionCreate.o src/events/interactionCreate.c $(CFLAGS)

commandPingObject:
	$(CC) -c -o objects/commands/ping.o src/commands/ping.c

indexObject:
	$(CC) -c -o objects/misc/index.o src/index.c $(CFLAGS)

eventReadyObject:
	$(CC) -c -o objects/events/ready.o src/events/ready.c

clean:
	rm -f bins/entry objects/mixes/mix.o
	rm -f objects/mixes/mix_commands.o objects/commands/ping.o
	rm -f objects/mixes/mix_misc.o objects/misc/commandRegistration.o objects/misc/index.o
