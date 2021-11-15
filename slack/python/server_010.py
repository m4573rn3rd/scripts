import os
from slack_bolt import App
from slack_bolt.adapter.socket_mode import SocketModeHandler
import config
import time 
from flask import Flask, request, Response, config,render_template,request,redirect,url_for, make_response, jsonify, session
from slack_bolt.adapter.flask import SlackRequestHandler
import logging
from datetime import datetime
from slack import WebClient
import sys
import re
from config import app2, mongo
from bson.json_util import dumps
from bson.objectid import ObjectId
from flask import jsonify, request
from werkzeug.security import generate_password_hash
from operator import concat
import json
import subprocess
import pymongo
import pandas as pd
import random


#logging.basicConfig(level=logging.DEBUG, filename='std.log', filemode='w', format='%(name)s - %(levelname)s - %(message)s')
# newvar = re.compile('what time is it in (?P<place>[A-Za-z/_]+)[?]$', flags=re.IGNORECASE)

now = datetime.now()
app = App(token=os.environ.get("SLACK_BOT_TOKEN"))
client = WebClient()
api_response = client.api_test() 
app2 = Flask(__name__)

###################################################################
#   Startup
###################################################################
# Log to dp
randnum = (random.randint(0,500))
print (randnum)
myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["python"]
mycol = mydb["appstatus"]
appstart = {"tempid":randnum, "boottime":datetime.now()}
x = mycol.insert_one(appstart)
print("Boot Record logged")
#convert entire collection to Pandas dataframe
test = mydb["python_test"]
report = mydb["appstatus"]
test = pd.DataFrame(list(test.find()))
report = pd.DataFrame(list(report.find()))
#print(test)
#print(report)
# This will only show the value of the dataframe.
#print(test.iat[0,0])
#print(report.iat[0,1])

###################################################################
#   For Later Devlopment 
###################################################################
@app2.route('/')
def home():
   return render_template('index.html')

@app2.route("/getTime", methods=['GET'])
def getTime():
    print("browser time: ", request.args.get("time"))
    print("server time : ", time.strftime('%A %B, %d %Y %H:%M:%S'));
    return "Done"

###################################################################
#   Internal Api Start
###################################################################   
@app2.route('/add', methods=['POST'])
def add_user():
	_json = request.json
	_name = _json['name']
	_email = _json['email']
	_password = _json['pwd']
	# validate the received values
	if _name and _email and _password and request.method == 'POST':
		#do not save password as a plain text
		_hashed_password = generate_password_hash(_password)
		# save details
		id = mongo.db.user.insert({'name': _name, 'email': _email, 'pwd': _hashed_password})
		resp = jsonify('User added successfully!')
		resp.status_code = 200
		return resp
	else:
		return not_found()


@app2.route('/userrunningreport', methods=['POST'])
def userrunningreport():
	_json = request.json
	_userid = _json['userid']
	_reportstatus = _json['reportstatus']
	
	# validate the received values
	if _userid and _reportstatus and request.method == 'POST':

		# save details
		id = mongo.db.report.insert({'userid': _userid, 'reportstatus': _reportstatus, })
		resp = jsonify('User added successfully!')
		resp.status_code = 200
		return resp
	else:
		return not_found()


@app2.route('/users')
def users():
	users = mongo.db.user.find()
	resp = dumps(users)
	return resp
		
@app2.route('/user/<id>')
def user(id):
	user = mongo.db.user.find_one({'_id': ObjectId(id)})
	resp = dumps(user)
	return resp

@app2.route('/update', methods=['PUT'])
def update_user():
	_json = request.json
	_id = _json['_id']
	_name = _json['name']
	_email = _json['email']
	_password = _json['pwd']		
	# validate the received values
	if _name and _email and _password and _id and request.method == 'PUT':
		#do not save password as a plain text
		_hashed_password = generate_password_hash(_password)
		# save edits
		mongo.db.user.update_one({'_id': ObjectId(_id['$oid']) if '$oid' in _id else ObjectId(_id)}, {'$set': {'name': _name, 'email': _email, 'pwd': _hashed_password}})
		resp = jsonify('User updated successfully!')
		resp.status_code = 200
		return resp
	else:
		return not_found()
		
@app2.route('/delete/<id>', methods=['DELETE'])
def delete_user(id):
	mongo.db.user.delete_one({'_id': ObjectId(id)})
	resp = jsonify('User deleted successfully!')
	resp.status_code = 200
	return resp
		
@app2.errorhandler(404)
def not_found(error=None):
    message = {
        'status': 404,
        'message': 'Not Found: ' + request.url,
    }
    resp = jsonify(message)
    resp.status_code = 404

    return resp
###################################################################
#   Slack Strart
###################################################################

@app.message(re.compile("(hi|yo|hey)"))
def say_hello_regex(say, context):
    # regular expression matches are inside of context.matches
    greeting = context['matches'][0]
    say(f"{greeting}, how are you?")


@app.message("dbtest")
def message_hello(message, say): 
    myclient1 = pymongo.MongoClient("mongodb://localhost:27017/")
    mydb = myclient1["python"]
    mycol1 = mydb["python_dbtest"]
    mydict1 = { "host": "devserver", "ip": "192.168.0.50" }
    x1 = mycol1.insert_one(mydict1)
    x1
    say(f"Check Database <@{message['user']}>!")

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
    time.sleep(6)  # longer than 3 seconds
    
    end = time.time()
    respond(f"Completed! (task: {body['text']})")
    respond(f"Runtime of the program is: {end - start}")
    print(f"Runtime of the program is {end - start}") 
    hold2 = float(end - start) 
    myclient = pymongo.MongoClient("mongodb://localhost:27017/")
    mydb = myclient["python"]
    mycol3 = mydb["python_dbtest"]
    botlog = { "appname": "longprocess", "command": "longprocess", "time":  hold2 }
    mycol3.insert_one(botlog)

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

@app.event("message")
def handle_message_events(body, logger):
    logger.info(body)

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
    app.start, app2.run(host="0.0.0.0",debug = True, port=int(os.environ.get("PORT", 5000)))