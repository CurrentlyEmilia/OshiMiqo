#include <stdio.h> // printf(3)
#include <string.h> // strcmp(3)
#include <unistd.h> // getpid(3)
#include <sys/types.h> // pid_t
#include <stdlib.h> // exit(3)

#include <concord/discord.h>

#include "../headers/config.h"

void on_ready(struct discord *client, const struct discord_ready *event) {
	printf("%s\n", "Ready event emitted!");
	rg_register_commands(client, event);
}

void on_interaction_command(struct discord *client, const struct discord_interaction *event)
{
	if (strcmp(event->data->name, "ping") == 0) {
		struct discord_interaction_response params = {
			.type = DISCORD_INTERACTION_CHANNEL_MESSAGE_WITH_SOURCE,
			.data = &(struct discord_interaction_callback_data){
				.content = "pong"
			}
		};
		discord_create_interaction_response(client, event->id, event->token, &params, NULL);
	}
}

void on_interaction(struct discord *client, const struct discord_interaction *event)
{
	switch (event->type) {
	case DISCORD_INTERACTION_APPLICATION_COMMAND:
		on_interaction_command(client, event);
		break;
	}
}

void main()
{
	struct discord *client = discord_init(BOT_TOKEN);

	discord_set_on_ready(client, &on_ready);
	discord_set_on_interaction_create(client, &on_interaction);

	discord_run(client);
}

