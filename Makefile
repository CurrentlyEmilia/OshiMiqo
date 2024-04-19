all: registerBinary indexBinary
	@printf "OK\n";

registerBinary: registerObject
	cc -o bins/register objects/register.o -pthread -ldiscord -lcurl

registerObject:
	cc -c -o objects/register.o src/register.c

indexBinary: indexObject
	cc -o bins/index objects/index.o -pthread -ldiscord -lcurl

indexObject:
	cc -c -o objects/index.o src/index.c

clean:
	rm bins/register objects/register.o
	rm bins/index objects/index.o

