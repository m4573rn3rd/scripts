import os
from slack_bolt import App
from slack_bolt.adapter.socket_mode import SocketModeHandler
import config
import time 
import aiml
import os

app = App(token=os.environ.get("SLACK_BOT_TOKEN"))


    
@app.message("hello")
def message_hello(message, say):  
    say(f"Hey there <@{message['user']}>!")

@app.message("bye")
def message_bye(message, say): 
    say(f"Goodbye <@{message['user']}>!")

@app.message("time")
def message_hello(message, say):   
    say(f"Hey there <@{message['user']}>!")  

if __name__ == "__main__":
    SocketModeHandler(app, os.environ["SLACK_APP_TOKEN"]).start()
    