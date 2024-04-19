#include <stdio.h> // printf(3)
#include <string.h> // strcmp(3)
#include <unistd.h> // getpid(3)
#include <sys/types.h> // pid_t
#include <signal.h> // signal(3)
#include <stdlib.h> // exit(3)

#include <concord/discord.h>

#include "../headers/config.h"

void on_ready(struct discord *client, const struct discord_ready *event) {
	struct discord_create_guild_application_command params = {
		.name = "ping",
		.description = "Ping command!"
	};
	int pid = getpid();

	discord_create_guild_application_command(client, event->application->id, GUILD_ID, &params, NULL);

	printf("Registered ping!\n");

	kill(pid, SIGUSR1);
}

void sigusro_handler(int sig)
{
	signal(sig, SIG_IGN);
	exit(0);
}

int main(void) {
	struct discord *client = discord_init(BOT_TOKEN);

	signal(SIGUSR1, sigusro_handler);

	discord_set_on_ready(client, &on_ready);
	discord_run(client);
}

