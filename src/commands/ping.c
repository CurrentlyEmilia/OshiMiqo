#include <stdio.h> // printf(3)
#include <sys/utsname.h>

#include "../../headers/constants/oslimits.h"

#include <errno.h> // errno

#include <concord/discord.h>

void on_interaction_command_ping(struct discord *client, const struct discord_interaction *event)
{
	struct discord_interaction_response params = {
		.type = DISCORD_INTERACTION_CHANNEL_MESSAGE_WITH_SOURCE,
		.data = &(struct discord_interaction_callback_data){
			.content = "hi"
		}
	};

	discord_create_interaction_response(client, event->id, event->token, &params, NULL);
}

