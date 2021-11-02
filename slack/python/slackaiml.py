import aiml
import os
import time
from slack_bolt import App
from slack_bolt.adapter.socket_mode import SocketModeHandler
from utils import get_args
from utils import get_api_keys
from utils import connect_to_slack_rtm_api
from utils import join_channels
from utils import get_channels_ids
from utils import get_bot_id
from utils import configure_chatbot
from utils import is_message_to_chatbot
from utils import drop_botname_from_message
from slack import WebClient
from slack_bolt.app.app import App

app = App(token=os.environ.get("SLACK_BOT_TOKEN"))
SlackClient = WebClient(os.environ.get("SLACK_BOT_TOKEN"))
connected, sc = App(token=os.environ.get("SLACK_BOT_TOKEN"))
kernel = aiml.Kernel()

    


args = get_args()
channels = args.channel


if connected:
  kernel = aiml.Kernel()
  kernel.learn("std-startup.xml")
  kernel.respond("load aiml b")
  configure_chatbot(kernel)

  channels_dict = get_c@app.event("message")
def handle_message_events(body, logger):
   # logger.info(body)channels_ids(sc, channels)
    join_channels(sc, channels_dict)
    bot_id = get_bot_id(sc, kernel.getBotPredicate("name"))




while True:
    events = sc.rtm_read()
    if events:
      for event in events:
        try:
          if event["channel"] in channels_dict.keys():
            channel_id = event["channel"]
            user_id = event["user"]
            message = event["text"]

            # reply to messages directed to bot
            if is_message_to_chatbot(bot_id, message):
              message = drop_botname_from_message(bot_id, message)
              sc.rtm_send_message(channel_id, "<@" + user_id + ">: " +
                                  kernel.respond(message))

            # greet users who join channel
            if event["subtype"] == "channel_join":
              sc.rtm_send_message(channel_id, "Welcome " + "<@" + user_id + ">")
        except:
          pass
    time.sleep(1)
else:
  



    SocketModeHandler(app, os.environ["SLACK_APP_TOKEN"]).start()