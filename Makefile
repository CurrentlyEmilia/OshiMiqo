CC=cc
LD=ld
CFLAGS=-Og -ggdb -Wall -Wextra -Wpedantic -std=c99
LDFLAGS=

dev: mixBinary
	@printf "OK\n";

prod: mixBinary
	strip bins/entry;
	@printf "OK\n";

mixBinary: mixObject
	$(CC) -o bins/entry objects/mixes/mix.o $(LDFLAGS) -pthread -ldiscord -lcurl 

mixObject: commandRegistrationObject indexObject eventInteractionCreateObject commandPingObject eventReadyObject
	$(LD) $(LDFLAGS) -r -o objects/mixes/mix_events.o objects/events/interactionCreate.o objects/events/ready.o
	$(LD) $(LDFLAGS) -r -o objects/mixes/mix_commands.o objects/commands/ping.o
	$(LD) $(LDFLAGS) -r -o objects/mixes/mix_misc.o objects/misc/commandRegistration.o objects/misc/index.o
	$(LD) $(LDFLAGS) -r -o objects/mixes/mix.o objects/mixes/mix_events.o objects/mixes/mix_commands.o objects/mixes/mix_misc.o

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
