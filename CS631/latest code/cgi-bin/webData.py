import json
import pymysql

connection = pymysql.connect(host='localhost',user='root',password='root',db='weblogs',autocommit=True)
cursor = connection.cursor()
cursor.execute("select * from webloginfo LIMIT 5")
data = cursor.fetchall()

print (data)