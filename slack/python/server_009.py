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

now = datetime.now()
app = App(token=os.environ.get("SLACK_BOT_TOKEN"))
app2 = Flask(__name__)
logging.basicConfig(level=logging.DEBUG, filename='std.log', filemode='w', format='%(name)s - %(levelname)s - %(message)s')


@app2.route('/')
def server():
    return 'Server Online'   

@app.message("hello")
def message_hello(message, say):  
    say(f"Hey there <@{message['user']}>!")

@app.message("bye")
def message_bye(message, say): 
    say(f"Goodbye <@{message['user']}>!")

# This will print the current time. 
@app.message("time")
def message_hello(message, say, respond):   
    dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
    #print("date and time =", dt_string)
    #say(f"Hey there <@{message['user']}>!")  
    say(f"<@{message['user']}> The time is {dt_string}")


@app.error
def custom_error_handler(error, body, logger):
    logger.exception(f"Error: {error}")
    logger.info(f"Request body: {body}")	

def respond_to_slack_within_3_seconds(body, ack):
    text = body.get("text")
    
    if text is None or len(text) == 0:
        ack(f":x: Usage: /start-process (description here)")
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

if __name__ == "__main__":
    SocketModeHandler(app, os.environ.get("SLACK_APP_TOKEN")).connect()
    app.start, app2.run()