#include <stdio.h> // printf(3)
#include <string.h> // strcat(3), strerror
#include <unistd.h> // gethostname(3)

#include "../headers/constants/oslimits.h"

#include <errno.h> // errno

#include <concord/discord.h>

void on_interaction_command_ping(struct discord *client, const struct discord_interaction *event)
{
	char hostname[HOSTNAME_MAX_LENGTH+1];
	char content[2000] = "hi from ";

	gethostname(hostname, HOSTNAME_MAX_LENGTH);

	if (errno != 0) {
		printf("%s\n", strerror(errno));

		struct discord_interaction_response params = {
			.type = DISCORD_INTERACTION_CHANNEL_MESSAGE_WITH_SOURCE,
			.data = &(struct discord_interaction_callback_data){
				.content = "Failed!"
			}
		};

		discord_create_interaction_response(client, event->id, event->token, &params, NULL);
	}

	strcat(content, hostname);
	strcat(content, "!");

	struct discord_interaction_response params = {
		.type = DISCORD_INTERACTION_CHANNEL_MESSAGE_WITH_SOURCE,
		.data = &(struct discord_interaction_callback_data){
			.content = content
		}
	};
	discord_create_interaction_response(client, event->id, event->token, &params, NULL);
}

