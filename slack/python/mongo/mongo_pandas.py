import pymongo
import pandas as pd
from pymongo import MongoClient
from datetime import datetime
datetime.now()



# Log to dp
myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["python"]
mycol = mydb["appstatus"]
appstart = {'boottime':datetime.now()}
x = mycol.insert_one(appstart)
print("Boot Record logged")

client = MongoClient()
#point the client at mongo URI
client = pymongo.MongoClient("mongodb://localhost:27017/")
#select database
db = client['python']
#select the collection within the database
test = db["python_test"]
report = db["appstatus"]
#convert entire collection to Pandas dataframe
test = pd.DataFrame(list(test.find()))
report = pd.DataFrame(list(report.find()))

print(test)
print(report)
# This will only show the value of the dataframe.
print(test.iat[0,0])
print(report.iat[0,1])

