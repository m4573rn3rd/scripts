import pymongo
 
 
client = pymongo.MongoClient("mongodb://localhost:27017/")
 
# Database Name
db = client["python"]
 
# Collection Name
col = db["python_test"]
 
x = col.find_one()
 
print(x)