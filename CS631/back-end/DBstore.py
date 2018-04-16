#-*-coding:utf-8 -*-
from sqlalchemy.dialects.mysql import NVARCHAR
import readWebLogs
from sqlalchemy import create_engine, MetaData, Table, Column, TEXT, Integer


# connection
def storeDatafileToDB(newdata):
    engine = create_engine('mysql+pymysql://root:yourpasswordhere@localhost:3306/Weblogs')
    meta = MetaData()
    weblogInfo = Table('weblogInfo',meta,
                    Column('url', NVARCHAR(60), primary_key=True),
                    Column('empty1', TEXT(60), nullable=False),
                    Column('empty2', TEXT(60), nullable=False),
                    Column('date', TEXT(60), nullable=False),
                    Column('get', TEXT(60), nullable=False),
                    Column('value1', Integer(), nullable=False),
                    Column('value1', Integer(), nullable=False))
    weblogInfo.create(engine)
    # path to a file to be read
    path = '/Users/damian/Desktop/Python_Projects/Weblogs/access_log_Aug95'
    # Performing convertion to structured data
    newData = readWebLogs.structureFile(path)

    newData[5]=newData[5].str.replace("\ufffd", "")
    return newData.to_sql(con=engine,name='weblogInfo', if_exists='replace',index=False)

def main():
    path = '/Users/damian/Desktop/Python_Projects/Weblogs/access_log_Aug95'
    data = readWebLogs.structureFile(path)
    storeDatafileToDB(data)

if __name__ == "__main__": main()