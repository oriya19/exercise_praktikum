import sys
sys.path.append('C:\Users\user\Desktop\spl')
from Hebrew_date import change_date
import datetime
now = datetime.datetime.now()
print(change_date.change_date(now))
