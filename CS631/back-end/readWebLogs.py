import pandas as pd
#create a function to structe un-structure data
#input: weblog file (un-structure)
#output:
def structureFile(path):
    #set the column names
    #columns = ['','Url', 'Empty1', 'Empty2', 'Date', 'Get', 'Value1', 'Value2','']
    #path = '/Users/damian/Desktop/Python_Projects/Weblogs/access_log_Aug95'
    data = pd.read_csv(path,
                       sep='^(\\S+) (\\S+) (\\S+) \\[([\\w:/]+\\s[+\\-]\\d{4})\\] "(.+?)" (\\S+) (\\S+)',
                       engine='python', header=None)
    outData = data.drop([0, 8], axis=1)
    #data.columns = columns
    return outData
    #print(url)
