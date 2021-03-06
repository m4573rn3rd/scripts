#!/usr/local/bin/python2
import aiml
import time
from utils import get_args
from utils import get_api_keys
from utils import connect_to_slack_rtm_api
from utils import join_channels
from utils import get_channels_ids
from utils import get_bot_id
from utils import configure_chatbot
from utils import is_message_to_chatbot
from utils import drop_botname_from_message

args = get_args()
channels = args.channel

api_keys = get_api_keys("api_keys.txt")
connected, sc = connect_to_slack_rtm_api(api_keys["slack_api_key"])

if connected:
  kernel = aiml.Kernel()
  kernel.learn("std-startup.xml")
  kernel.respond("load aiml b")
  configure_chatbot(kernel)

  channels_dict = get_channels_ids(sc, channels)
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
  print 