# OshiMiqo

OshiMiqo is a [pathetic] attempt at writing a discord bot using C.

## How to use?

Due to OshiMiqo's specific nature, as in configuration being built in, there are no prebuilt binaries available.

You have to build OshiMiqo from source code, available here.

## How to build?

### Notes

You need to build from the main directory.
The Makefile is both hardcoded and handcoded to only be compatible with building from the main directory.
No, I have no plans to use autohell at this time.

### Build prerequisites

- A C99-compliant compiler (tested with GCC 13.2.1\_p20240210 p14)
- Make (tested with GNU Make 4.4.1)
- A standard C library (tested with glibc Gentoo 2.38-r10 (patchset 10))
- [Concord](https://github.com/Cogmasters/concord) (requires pthreads and curl)
- POSIX thread support
- [libcurl](https://curl.se/)

### Building

Copy the headers/config.example.h file to headers/config.h, then customise the configuration file for all your needs (token and guild id to register commands to)

Build it using make:

```
$ make
```

Congratulations! If the command above quit with no errors, you have (likely) successfully compiled this shitty project!

## Running the program

It's quite simple, actually:

Register the commands (one-time run, run again per command metadata change)

```
$ bins/register
```

Next, if the command above didn't quit with any error, you have (likely) successfully registered the commands.

Now, all you have to do is to run the ACTUAL bot:

```
$ bins/index
```

Well, there you have it. You've got the shitty bot running!
I don't know, show this piece of shit to your programmer friends, or something.

## Why create this thing?

Just for fun.

- huh, discord C bot. Interesting, I'll study it's internals to see how it works.
- haha C discord bot XDDDDDDDDDDDDDDDDDDDDDDDDDDDDD

