from flask import Flask
from flask_pymongo import PyMongo
from werkzeug.security import generate_password_hash

app = Flask(__name__)
hash = generate_password_hash('foobar')
hash
app.secret_key = {hash}
app.config["MONGO_URI"] = "mongodb://localhost:27017/python"
mongo = PyMongo(app)