import json
import pymysql

# def readDB():
connection = pymysql.connect(host='localhost',user='root',password='root',db='weblogs',autocommit=True)
cursor = connection.cursor()
cursor.execute("select * from webloginfo")
data = cursor.fetchall()

print (data)