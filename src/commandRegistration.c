#include <stdio.h> // printf(3)
#include <stdlib.h> // exit(3)

#include <concord/discord.h>

#include "../headers/config.h"

void rg_register_commands(struct discord *client, const struct discord_ready *event)
{
	struct discord_create_guild_application_command params = {
		.name = "ping",
		.description = "Ping command!"
	};

	discord_create_guild_application_command(client, event->application->id, GUILD_ID, &params, NULL);
	printf("%s\n", "Registered ping command!");
}

