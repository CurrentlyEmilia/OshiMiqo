#include <stdio.h> // printf(3)

#include <concord/discord.h>

#include "../../headers/source/commandRegistration.h"

void on_event_ready(struct discord *client, const struct discord_ready *event) {
	printf("%s\n", "Ready event emitted!");
	rg_register_commands(client, event);
}

