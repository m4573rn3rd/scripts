import os
from slack_bolt import App
from slack_bolt.adapter.socket_mode import SocketModeHandler
import config

# Initializes your app with your bot token and socket mode handler
app = App(token=os.environ.get("SLACK_BOT_TOKEN"))

# Listens to incoming messages that contain "hello"
@app.message("knock knock")
def ask_who(message, say):
    say("_Who's there?_")

@app.message("hello")
def message_hello(message, say):
    # say() sends a message to the channel where the event was triggered
    say(
        blocks=[
            {
                "type": "section",
                "text": {"type": "mrkdwn", "text": f"Hey there <@{message['user']}>!"},
                "accessory": {
                    "type": "button",
                    "text": {"type": "plain_text", "text": "Click Me"},
                    "action_id": "button_click"
                }
            }
        ],
        text=f"Hey there <@{message['user']}>!"
    )

@app.message("payload107")
def message_payload107(message, say):
    
    say(
        blocks=[
            {
			"type": "section",
			"text": {
				"type": "plain_text",
				"text": "This is a payload test.",
				
			}
		}
        ],
        text=f"Payload <@{message['user']}>!"
    )
   
@app.event("app_mention")
def handle_app_mention_events(body, logger):
    logger.info(body)

@app.message("payload108")
def message_payload108(message, say):
    
    say(
        blocks=[
            {
			"type": "input",
			"element": {
				"type": "static_select",
				"placeholder": {
					"type": "plain_text",
					"text": "Select an item",
					
				},
				"options": [
					{
						"text": {
							"type": "plain_text",
							"text": "Last Hour",
							
						},
						"value": "value-0"
					},
					{
						"text": {
							"type": "plain_text",
							"text": "Last 8 Hours",
							
						},
						"value": "value-1"
					},
					{
						"text": {
							"type": "plain_text",
							"text": "Last 24 Hours",
							
						},
						"value": "value-2"
					}
				],
				"action_id": "static_select-action"
			},
			"label": {
				"type": "plain_text",
				"text": "Label",
				
			}
		}
        ],
        text=f"Payload <@{message['user']}>!"
    )



@app.action("button_click")
def action_button_click(body, ack, say):
    # Acknowledge the action
    ack()
    say(f"<@{body['user']['id']}> clicked the button")

# The echo command simply echoes on command
@app.command("/echo")
def repeat_text(ack, respond, command):
    # Acknowledge command request
    ack()
    respond(f"{command['text']}")


# Start your app
if __name__ == "__main__":
    SocketModeHandler(app, os.environ["SLACK_APP_TOKEN"]).start()