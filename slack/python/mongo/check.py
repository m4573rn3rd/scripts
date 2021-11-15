import pymongo
from pymongo import MongoClient
import datetime
from datetime import date
from flask import Flask
from flask import jsonify
from flask import request
from flask_pymongo import PyMongo

app = Flask(__name__)
myclient = pymongo.MongoClient("mongodb://localhost:27017/")
app.config['MONGO_DBNAME'] = 'python'
app.config['MONGO_URI'] = 'mongodb://localhost:27017/'
mydb = myclient["python"]
mycol = mydb["appstatus"]
mongo = PyMongo(app)
today = date.today()
c = "hello"

@app.route('/star', methods=['GET'])
def get_all_stars():
  star = mongo.db.stars
  output = []
  for s in star.find():
    output.append({'name' : s['name'], 'distance' : s['distance']})
  return jsonify({'result' : output})

@app.route('/star', methods=['POST'])
def add_star():
  star = mongo.db.stars
  name = request.json['name']
  distance = request.json['distance']
  star_id = star.insert({'name': name, 'distance': distance})
  new_star = star.find_one({'_id': star_id })
  output = {'name' : new_star['name'], 'distance' : new_star['distance']}
  return jsonify({'result' : output})




boottime = { "boottime": c }

x = mycol.insert_one(boottime)


print("<-------------------------------------------->")
a = myclient.list_database_names()
b = mydb.list_collection_names()
print(a)
print(b)
print("Today's date:", today)
print("<-------------------------------------------->")


serverStatusResult=mydb.command("serverStatus")
print(serverStatusResult)

if __name__ == '__main__':
    app.run(debug=True)


#print("The End")
#fivestarcount = mydb.python_test.find({'ip': 100}).collection.count_documentscount()
#print(fivestarcount)
