# -*- coding: utf-8 -*-
"""
Created on Fri Sep 30 15:27:06 2022

@author: fisherfu
"""


# from datetime import date, timedelta

# def daterange(start_date, end_date):
#     for n in range(int((end_date - start_date).days)):
#         yield start_date + timedelta(n)

# start_date = date(2022, 7, 1)
# end_date = date(2022, 8, 1)
# for single_date in daterange(start_date, end_date):
#     print(single_date.strftime("%Y%m%d"))



# import numpy as np
# from datetime import datetime, timedelta
# d0 = datetime(2022, 7,1)
# d1 = datetime(2022, 8,1)
# dt = timedelta(days = 10)

# # dates = np.arange(d0, d1, dt).astype(datetime)
# dates="%Y%m%d"
# print(dates)

import requests
from datetime import date, timedelta

start_date = date(2022, 7, 1)
end_date = date(2022, 8, 2)

delta = timedelta(days=10)

delta_1 = timedelta(days=1)

while start_date <= end_date:
        if start_date.strftime("%d")== "31":
            start_date += delta_1  
    # print(start_date.strftime("%Y%m%d"))
    

        url = "https://plvr.land.moi.gov.tw/DownloadHistory?type=history&fileName="+str(start_date.strftime("%Y%m%d"))
        print(url)
        # print(start_date.strftime("%d"))
        start_date += delta
   

# URL = "https://instagram.com/favicon.ico"
# 2. download the data behind the URL

        response = requests.get(url)
# 3. Open the response into a new file called instagram.ico
# open("instagram.ico", "wb").write(response.content)


# 1. Import the requests library
# URL = "https://plvr.land.moi.gov.tw/DownloadHistory?type=history&fileName=20220701"
# # 2. download the data behind the URL

# response = requests.get(URL)
start_date_f = date(2022, 5, 1)
end_date_f = date(2022, 6, 2)

delta_f = timedelta(days=10)
delta_1_f = timedelta(days=1)

while start_date_f <= end_date_f:
        if start_date_f.strftime("%d")== "31":
            start_date_f += delta_1_f  
    # print(start_date.strftime("%Y%m%d"))
    

        filename = str(start_date_f.strftime("%Y%m%d"))+"_opendata.zip"
        
        print(filename)
        # print(start_date.strftime("%d"))
        start_date_f += delta_f



# 3. Open the response into a new file called instagram.ico
        open(filename, "wb").write(response.content)  