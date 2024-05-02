#include <stdio.h> // printf(3)
#include <string.h> // strcat(3), strerror
#include <sys/utsname.h>

#include "../../headers/constants/oslimits.h"

#include <errno.h> // errno

#include <concord/discord.h>

void on_interaction_command_ping(struct discord *client, const struct discord_interaction *event)
{
	struct utsname unameData;
	int unameCode;
	char content[2000];

	unameCode = uname(&unameData);

	if (unameCode != 0 && errno != 0) {
		printf("%s\n", strerror(errno));

		struct discord_interaction_response params = {
			.type = DISCORD_INTERACTION_CHANNEL_MESSAGE_WITH_SOURCE,
			.data = &(struct discord_interaction_callback_data){
				.content = "Failed!"
			}
		};

		printf("%s\n", unameData.sysname);

		discord_create_interaction_response(client, event->id, event->token, &params, NULL);
	}

	strcat(content, "Hello from ");
	strcat(content, unameData.sysname);
	strcat(content, " ");
	strcat(content, unameData.release);
	strcat(content, " (");
	strcat(content, unameData.machine);
	strcat(content, ")!");

	struct discord_interaction_response params = {
		.type = DISCORD_INTERACTION_CHANNEL_MESSAGE_WITH_SOURCE,
		.data = &(struct discord_interaction_callback_data){
			.content = content
		}
	};
	discord_create_interaction_response(client, event->id, event->token, &params, NULL);
}

