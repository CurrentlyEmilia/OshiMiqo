#include <stdio.h> // printf(3)
#include <string.h> // strcmp(3)
#include <unistd.h> // getpid(3)
#include <sys/types.h> // pid_t
#include <stdlib.h> // exit(3)

#include <concord/discord.h>

#include "../headers/config.h"

void on_ready(struct discord *client, const struct discord_ready *event) {
	printf("%s\n", "Ready event emitted!");

	printf("%s\n", event->application->name);
}

int main()
{
	struct discord *client = discord_init(BOT_TOKEN);

	discord_set_on_ready(client, &on_ready);
	discord_run(client);
}

