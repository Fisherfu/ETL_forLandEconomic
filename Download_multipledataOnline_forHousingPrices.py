# -*- coding: utf-8 -*-
"""
Created on Fri Sep 30 15:27:06 2022

@author: fisherfu
"""

# =============================================================================
# Offical Housing Prices_dataset website/台灣實價登錄網站: https://plvr.land.moi.gov.tw/DownloadOpenData
# =============================================================================


import requests
from datetime import date, timedelta

#create a loop for URL's datetime

start_date = date(2022, 7, 1)
end_date = date(2022, 8, 2)

delta = timedelta(days=10)
delta_1 = timedelta(days=1)

while start_date <= end_date:
        if start_date.strftime("%d")== "31":
            start_date += delta_1  
    # set URL 
        url = "https://plvr.land.moi.gov.tw/DownloadHistory?type=history&fileName="+str(start_date.strftime("%Y%m%d"))
        print(url)
    
        start_date += delta
   
    # reguest URL  
        response = requests.get(url)


        
# create a loop for Filename's datetime

start_date_f = date(2022, 5, 1)
end_date_f = date(2022, 6, 2)

delta_f = timedelta(days=10)
delta_1_f = timedelta(days=1)

while start_date_f <= end_date_f:
        if start_date_f.strftime("%d")== "31":
            start_date_f += delta_1_f  
    # print(start_date.strftime("%Y%m%d"))
    
    # set Filename

        filename = str(start_date_f.strftime("%Y%m%d"))+"_opendata.zip"
        
        print(filename)
        # print(start_date.strftime("%d"))
       
        start_date_f += delta_f


      #open filename

        open(filename, "wb").write(response.content)  
