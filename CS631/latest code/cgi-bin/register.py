import json
import cgitb
import cgi
import pymysql

print "Content-Type: application/json"
print

form = cgi.FieldStorage()

if "name" in form:
    name = form[name].value
if "userName" in form:
    userName = form[userName].value
if "password" in form:
    password = form[password].value

if name and userName and password:
    connection = pymysql.connect(host='localhost',user='root',password='root', db='Weblogs',autocommit=True)
    cursor = connection.cursor()
    sql = "Insert into user_table (name, username,password) values (%s, %s, %s)"
    cursor.execute(sql,name,userName,password)

    connection.commit()
    connection.close()

    message = "You have been successfully added to the Weblog Analysis system"

else:
    message = "One of the fields is empty"

print json.dumps(message)