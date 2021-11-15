import pymongo
import pandas as pd
from pymongo import MongoClient
from datetime import datetime

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
