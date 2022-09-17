# -*- coding: utf-8 -*-
"""
Created on Tue Jul 26 11:39:18 2022

@author: USER

PROJECT-DEVELOPING
"""
import os
import pandas

 ###重新設定路徑
os.chdir("C:/Users/USER/Google 雲端硬碟/python/python課程/project") 

###讀取所有資料:政府開放資料平台
datA1=pandas.read_csv("新北市已公告徵收案件地籍資料-樹林區.csv")
datA2=pandas.read_csv("新北市已公告徵收案件地籍資料-石碇區.csv")
datA3=pandas.read_csv("新北市已公告徵收案件地籍資料-林口區.csv")
datA4=pandas.read_csv("新北市已公告徵收案件地籍資料-淡水區.csv")
datA5=pandas.read_csv("新北市已公告徵收案件地籍資料-深坑區.csv")
datA6=pandas.read_csv("新北市已公告徵收案件地籍資料-樹林區.csv")

###使用pandas.concat合併資料
dF1=pandas.concat([datA1,datA2,datA3,datA4,datA5,datA6])

dF2=pandas.concat([datA1,datA2,datA3,datA4,datA5,datA6], ignore_index=True) 

###轉存為csv檔匯出
dF1.to_csv("新北市公告徵收地籍資料_整合.csv",index=False,encoding="utf-8-sig")


###讀取與列印檔案
dF1=pandas.read_csv("新北市公告徵收地籍資料_整合.csv")
print(dF1)
print(type(dF1))



(dF1
.groupby(['sus_year', 'district'])
.size()
.reset_index()
.rename(columns={0: 'cnt'})
)






