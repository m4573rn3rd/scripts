import os
from slack_bolt import App
from slack_bolt.adapter.socket_mode import SocketModeHandler
import config
import time 
#import aiml
import os
from flask import Flask, request, Response
from slack_bolt.adapter.flask import SlackRequestHandler
import logging
from datetime import datetime
from slack import WebClient
client = WebClient()
api_response = client.api_test()
#import timeit
import sys
import re
now = datetime.now()
app = App(token=os.environ.get("SLACK_BOT_TOKEN"))
app2 = Flask(__name__)
logging.basicConfig(level=logging.DEBUG, filename='std.log', filemode='w', format='%(name)s - %(levelname)s - %(message)s')

###################################################################
#   For Later Devlopment 
###################################################################
@app2.route('/')
def server():
    return 'Server Online'   

@app.message(re.compile("(hi|yo|hey)"))
def say_hello_regex(say, context):
    # regular expression matches are inside of context.matches
    greeting = context['matches'][0]
    say(f"{greeting}, how are you?")


@app.message("hello")
def message_hello(message, say):  
    say(f"Hey there <@{message['user']}>!")

@app.message("bye")
def message_bye(message, say): 
    say(f"Goodbye <@{message['user']}>!")
###################################################################
#   Prints time to the user.
###################################################################
# This will print the current time. 
@app.message("time")
def message_hello(message, say, respond):   
    dt_string = now.strftime("%H:%M: %Y-%m-%d ")
    #print("date and time =", dt_string)
    #say(f"Hey there <@{message['user']}>!")  
    say(f"<@{message['user']}> The time is {dt_string}")
    #respond(f"Runtime of the program is: {dt_string}")

	
###################################################################
#   Process 
###################################################################
def respond_to_slack_within_3_seconds(body, ack):
    text = body.get("text")
    
    if text is None or len(text) == 0:
        ack(f":x: Usage: /start-process ")
    else:
        ack(f"Accepted! (task: {body['text']})")

def run_long_process(respond, body):
    start = time.time()
    for i in range(3):
     print(i)
     respond(f"count: {i}")    
    time.sleep(5)  # longer than 3 seconds
    end = time.time()
    respond(f"Completed! (task: {body['text']})")
    respond(f"Runtime of the program is: {end - start}")
    print(f"Runtime of the program is {end - start}")
    


app.command("/start-process")(
    # ack() is still called within 3 seconds
    ack=respond_to_slack_within_3_seconds,
    # Lazy function is responsible for processing the event
    lazy=[run_long_process]
)	
###################################################################
#   Wave test 
###################################################################
@app.message("wave")
def ask_who(ack, message, say, respond, body):
    ack()
    user = message['user']
    say(":wave:")
    say(":simple_smile:")
    say("<@{body['user_id']}>")
    say(f"<@{message['user_id']}>")
    #respond(f"Happy <@{body['user_id']}>!")



@app.action("link_button")
def handle_buttons(ack, respond, logger, context, body, client):
    logger.info(f"request body: {body}")
    ack()
    if context.channel_id is not None:
        respond("Hi!")
    client.views_open(
        trigger_id=body["trigger_id"],
        view={ ... }
    )



@app.error
def custom_error_handler(error, body, logger):
    logger.exception(f"Error: {error}")
    logger.info(f"Request body: {body}")

if __name__ == "__main__":
    SocketModeHandler(app, os.environ.get("SLACK_APP_TOKEN")).connect()
    #app.start, app2.run()
    app.start, app2.run(host="0.0.0.0", port=int(os.environ.get("PORT", 5000)))
