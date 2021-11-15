import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["python"]
mycol = mydb["pyhon_test"]

#Record to change.
myquery = { "ip": "192.168.0.100" }
# What you want to change it to. 
newvalues = { "$set": { "ip": "192.168.0.101" } }

mycol.update_one(myquery, newvalues)

#print "customers" after the update:
for x in mycol.find():
  print(x)

