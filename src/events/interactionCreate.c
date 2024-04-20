#include <string.h>

#include <concord/discord.h>
#include "../../headers/source/commands/ping.h"

void on_interaction_command(struct discord *client, const struct discord_interaction *event)
{
	if (strcmp(event->data->name, "ping") == 0) {
		on_interaction_command_ping(client, event);
	}
}
