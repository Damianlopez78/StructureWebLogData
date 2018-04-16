import json
import cgitb
import cgi
import mod_python

print "Content-Type: application/json"
print

#form = cgi.FieldStorage()
#json.loads(form)

form = mod_python.util.FieldStorage()
print form
# if "userName" in form:
#     userName = form[userName].value
# if "password" in form:
#     password = form[password].value
value = form['password'].value
# print value
value = form.getvalue('password')
# print value
value = form.getvalue('password', default_value)
#print value
# print json.dumps(userName)