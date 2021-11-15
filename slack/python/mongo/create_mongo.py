import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["python"]
mycol = mydb["python_test"]

mydict = { "host": "devserver", "ip": "192.168.0.50" }

x = mycol.insert_one(mydict)
