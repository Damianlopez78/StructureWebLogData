import json
import cgitb
import cgi
import pymysql

print "Content-Type: application/json"
print

form = cgi.FieldStorage()

if "email" in form:
    email = form[email].value

if email:
    connection = pymysql.connect(host='localhost', user='root', password='root', db='Weblogs', autocommit=True)
    cursor = connection.cursor()
    query = "Select * from user_table where email == '"+email+"'";
    cursor.execute(query)
    data = cursor.fetchall()

    connection.close()

    if data:
        # Send email to user to change password functionality goes here
        message = "A password reset link has been sent to your registered email ID"
    else:
        message = "The provided email ID isnt registered in our database, please check the ID"

else:
    message = "The email ID field is empty"

print json.dumps(message)