# -*- coding: utf-8 -*-
"""
Created on Tue Oct 11 15:27:43 2022

@author: fisherfu
"""


import zipfile
import requests
import os


## 1. to set the path
os.chdir('C:/Users/fisherfu/OneDrive')


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
for i in range(101,111):
        for j in range(1,5):
              with zipfile.ZipFile('lvr_landcsv'+str(i)+str(j)+'.zip', 'r') as zip_ref:
                  zip_ref.extractall('lvr_landcsv'+str(i)+str(j)+'temp')        
              


        
# 6. import all csv and combine into one table via pandas

list_panda_res = []

for i in range(102,111):
        for j in range(1,5):

            path="C:/Users/fisherfu/OneDrive - Synopsys, Inc/Desktop/python/LabforHousing/lvr_landcsv"+str(i)+str(j)+"temp"
    
            os.chdir(path)
    
            key=pandas.read_csv("a_lvr_land_a.csv")   
            list_panda_res.append(key) 
            dF1=pandas.concat(list_panda_res)

            
## 7. save as csv 

os.chdir("C:/Users/fisherfu/OneDrive - Synopsys, Inc/Desktop/python/LabforHousing")
dF1.to_csv("Housingprices_concat.csv",index=False,encoding="utf-8-sig")  


              
