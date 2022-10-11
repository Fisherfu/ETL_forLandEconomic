# -*- coding: utf-8 -*-
"""
Created on Tue Oct 11 15:27:43 2022

@author: fisherfu
"""





import requests
import os


## 1. to set the path
os.chdir('C:/Users/fisherfu/OneDrive - Synopsys, Inc/Desktop/python/LabforHousing')


# 2.connect to the website, for two loops
for x in range(101,111):
        for y in range(1,5):
    
     
    # https://plvr.land.moi.gov.tw//DownloadSeason?season=111S1&type=zip&fileName=lvr_landcsv.zip
              url = "https://plvr.land.moi.gov.tw//DownloadSeason?season="+str(x)+"S"+str(y)+"&type=zip&fileName=lvr_landcsv.zip"
              print(url)
      


# 3. download the data behind the URL

              response = requests.get(url)
      
# 4. set the download file 
              open(r'lvr_landcsv'+str(x)+str(y)+'.zip', "wb").write(response.content)
              
              
# 5. extract data 

              