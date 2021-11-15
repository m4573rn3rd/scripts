import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["python"]
mycol = mydb["python_test"]

myquery = { "ip": "192.168.0.100" }

mycol.delete_one(myquery)