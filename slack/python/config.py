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
os.environ["SLACK_APP_TOKEN"] = "xapp-1-A02JWS7BE7R-2654576618999-7457010643963577ab7449ef8014ade5482143da98cb46bb85355c0428271cf1"
os.environ["SLACK_BOT_TOKEN"] = "xoxb-2650828670406-2670419769553-7gbTfxdgFNvoKoz5tsQRVa4R"
# To Verify above code
os.environ.get("SLACK_APP_TOKEN")
os.environ.get("SLACK_BOT_TOKEN") 