import re
import json
import time
from argparse import ArgumentParser
#from slackclient import SlackClient
#from slackbot.slackclient import SlackClient
from slack import WebClient

def get_args():
  parser = ArgumentParser(description="")
  parser.add_argument("-j", "--join", nargs="+", dest="channel", default="all",
                      help="join list of channels (ex. general random)")
  return parser.parse_args()

def get_api_keys(file_path):
  api_keys = {}
  with open(file_path) as f:
    for line in f:
      key, value = line.partition("=")[::2]
      api_keys[key.strip()] = value.strip()[1:-1]
  return api_keys

def connect_to_slack_rtm_api(slack_api_key):
  sc = WebClient(slack_api_key)
  if sc.rtm_connect():
    return True, sc
  return False, None

def get_channels_ids(sc, channels):
  channels_list = jsonify(sc.api_call("channels.list"))["channels"]
  if channels == "all":
    return get_all_channels(sc, channels_list)
  else:
    return get_channels_given_channels_names(sc, channels, channels_list)
(sc, channels_list):
  channels_dict = {}
  for channel in channels_list:
    channel_id = stringify(channel["id"])
    channel_name = stringify(channel["name"])
    channels_dict[channel_id] = channel_name
  return channels_dict

def get_channels_given_channels_names(sc, channels, channels_list):
  channels_dict = {}
  for channel in channels:
    for ch in channels_list:
      if stringify(ch["name"]) == channel:
        channel_id = stringify(ch["id"])
        channel_name = stringify(ch["name"])
        channels_dict[channel_id] = channel_name
  return channels_dict

def join_channels(sc, channels):
  for channel_id, channel_name in channels.items():
    sc.api_call("channels.join", name=channel_id)
   # print "Joined #" + channel_name

def get_bot_id(sc, botname):
  json = jsonify(sc.api_call("users.list"))
  for member in json["members"]:
    if stringify(member["name"]) == botname:
      return stringify(member["id"])

def is_message_to_chatbot(bot_id, message):
  match = re.search(bot_id, message)
  if match is not None:
    return True
  return False

def drop_botname_from_message(bot_id, message):
  new_message = ""
  for word in message.split():
    match = re.search(bot_id, word)
    if match is None:
      new_message += word + " "
  return new_message

def stringify(uni):
  return uni.encode("ascii", "ignore")

def jsonify(string):
  return json.loads(string)

def configure_chatbot(kernel):
  kernel.setBotPredicate("name", "")
  kernel.setBotPredicate("age", "25")
  kernel.setBotPredicate("arch", "OS X")
  kernel.setBotPredicate("birthday", "")
  kernel.setBotPredicate("birthplace", "")
  kernel.setBotPredicate("botmaster", "botmaster")
  kernel.setBotPredicate("boyfriend", "")
  kernel.setBotPredicate("build", "PyAIML")
  kernel.setBotPredicate("celebrities", "")
  kernel.setBotPredicate("celebrity", "")
  kernel.setBotPredicate("city", "")
  kernel.setBotPredicate("class", "Artificial Intelligence")
  kernel.setBotPredicate("country", "")
  kernel.setBotPredicate("dailyclients", "10000")
  kernel.setBotPredicate("developers", "500")
  kernel.setBotPredicate("domain", "Machine")
  kernel.setBotPredicate("email", "basic@bot.com")
  kernel.setBotPredicate("emotions", "as a robot I lack human emotions")
  kernel.setBotPredicate("ethics", "the Golden Rule")
  kernel.setBotPredicate("etype", "9")
  kernel.setBotPredicate("family", "chat bot")
  kernel.setBotPredicate("favoriteactor", "")
  kernel.setBotPredicate("favoritecolor", "green")
  kernel.setBotPredicate("favoritefood", "electricity")
  kernel.setBotPredicate("favoritequestion", "What's your favorite movie?")
  kernel.setBotPredicate("favoritesport", "football")
  kernel.setBotPredicate("favoritesubject", "computers")
  kernel.setBotPredicate("feelings", "as a robot I lack human emotions")
  kernel.setBotPredicate("footballteam", "Barecellona")
  kernel.setBotPredicate("forfun", "chat online")
  kernel.setBotPredicate("friend", "")
  kernel.setBotPredicate("gender", "")
  kernel.setBotPredicate("genus", "AIML")
  kernel.setBotPredicate("")
  kernel.setBotPredicate("hair", "I have some plastic wires")
  kernel.setBotPredicate("job", "chat bot")
  kernel.setBotPredicate("kindmusic", "techno")
  kernel.setBotPredicate("location", "")
  kernel.setBotPredicate("looklike", "a computer")
  kernel.setBotPredicate("master", "")
  kernel.setBotPredicate("maxclients", "100000")
  kernel.setBotPredicate("memory", "16 GB")
  kernel.setBotPredicate("nationality", "")
  kernel.setBotPredicate("order", "robot")
  kernel.setBotPredicate("orientation", "")
  kernel.setBotPredicate("os", "OS X")
  kernel.setBotPredicate("party", "Independent")
  kernel.setBotPredicate("phylum", "software")
  kernel.setBotPredicate("president", "")
  kernel.setBotPredicate("question", "What's your favorite movie?")
  kernel.setBotPredicate("religion", "")