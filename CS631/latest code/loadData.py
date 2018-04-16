import pymysql
import re
connection = pymysql.connect(host='localhost',
                             user='root',
                             password='root',
                             db='Weblogs',
			     autocommit=True)

def storeDatafileToDB(path):
  pattern = re.compile('^(\\S+) (\\S+) (\\S+) \\[([\\w:/]+\\s[+\\-]\\d{4})\\] "(.+?)" (\\S+) (\\S+)')
  cursor = connection.cursor()
  sql =  "Insert into weblogInfo (remote_address, remote_logname, user, time, request, status, bytes) values (%s, %s, %s, %s, %s, %s, %s)"
  with open(path) as f:
     content = f.readlines()
  for s in content:
     arr = pattern.split(s.strip());
     cursor.execute(sql, (arr[1].strip(), arr[2].strip(), arr[3].strip(), arr[4].strip(), arr[5].strip(), arr[6].strip(), arr[7].strip()))

  connection.commit()
  connection.close()

def main():
    path = '/Users/harsh/Downloads/access_log_Aug95'
    storeDatafileToDB(path)

if __name__ == "__main__": main()