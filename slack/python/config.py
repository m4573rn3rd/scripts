import os
from flask import Flask
from flask_pymongo import PyMongo
from werkzeug.security import generate_password_hash

app2 = Flask(__name__)
hash = generate_password_hash('foobar')
hash
app2.secret_key = {hash}
app2.config["MONGO_URI"] = "mongodb://localhost:27017/python"
mongo = PyMongo(app2)


# environment variables
os.environ["SLACK_APP_TOKEN"] = ""
os.environ["SLACK_BOT_TOKEN"] = ""
# To Verify above code
os.environ.get("SLACK_APP_TOKEN")
os.environ.get("SLACK_BOT_TOKEN") 