

import excel "/Volumes/GoogleDrive/共用雲端硬碟/台灣房價數據庫/數據/實價登錄/102S1-lvr_landcsv.xlsx", sheet("`i'") clear firstrow allstring
foreach v of varlist 年 D E F G H I J K L M N O {



tempfile tmpdata                                                                                                                                                            
clear
save `tmpdata', emptyok replace   
                                 
* forvalues i = 8/9 {

   forvalues j =1/4 {
      foreach var in a b c d e f g h i j k m n o p q t u v w x z {
*import delimited "/Volumes/GoogleDrive/共用雲端硬碟/台灣房價數據庫/數據/實價登錄/10`i'`j'/`var'_lvr_land_a.csv",delimiter("", collapse) varnames(1) encoding(utf8) clear 
import delimited "/Volumes/GoogleDrive/共用雲端硬碟/台灣房價數據庫/數據/實價登錄/108`j'/`var'_lvr_land_a.csv",delimiter("", collapse) varnames(1) encoding(utf8) clear 


drop if 土地區段位置建物區段門牌== "land sector position building sector house number plate"
destring 土地移轉總面積平方公尺 交易年月日 建築完成年月 建物移轉總面積平方公尺 建物現況格局房 建物現況格局廳 建物現況格局衛 總價元 單價元平方公尺 車位移轉總面積平方公尺 車位總價元,replace force

ren 鄉鎮市區 tname

gen year="10`i'"
gen season="`j'"
gen cname="`var'"

append using `tmpdata'
save `tmpdata', replace      
     }                                                                                                                                                                  
    }
	
save "/Volumes/GoogleDrive/共用雲端硬碟/台灣房價數據庫/數據/實價登錄/yearseason1081-1084.dta",replace
   	
	
   }

save "/Volumes/GoogleDrive/共用雲端硬碟/台灣房價數據庫/數據/實價登錄/yearseason1061-1074.dta",replace
   
save "/Volumes/GoogleDrive/共用雲端硬碟/台灣房價數據庫/數據/實價登錄/yearseason_1062.dta",replace 
////1021-1062季停止, 從1061開始 1061-1062季會重複


use "/Volumes/GoogleDrive/共用雲端硬碟/台灣房價數據庫/數據/實價登錄/yearseason_1062.dta",replace

drop if year =="106" 

append using "/Volumes/GoogleDrive/共用雲端硬碟/台灣房價數據庫/數據/實價登錄/yearseason1061-1074.dta"                               

append using "/Volumes/GoogleDrive/共用雲端硬碟/台灣房價數據庫/數據/實價登錄/yearseason1081-1084.dta"                               

destring year season,replace

replace cname= "台北市" if cname=="a"
replace cname= "台中市" if cname=="b" 
replace cname= "基隆市" if cname=="c" 
replace cname= "台南市" if cname=="d" 
replace cname= "高雄市" if cname=="e" 
replace cname= "新北市" if cname=="f" 
replace cname= "宜蘭縣" if cname=="g"   
replace cname= "桃園市" if cname=="h" 
replace cname= "嘉義市" if cname=="i"                 
replace cname= "新竹縣" if cname=="j"         
replace cname= "苗栗縣" if cname=="k" 
replace cname= "南投縣" if cname=="m" 
replace cname= "彰化縣" if cname=="n" 
replace cname= "新竹市" if cname=="o" 
replace cname= "雲林縣" if cname=="p" 
replace cname= "嘉義縣" if cname=="q" 
replace cname= "屏東縣" if cname=="t" 
replace cname= "花蓮縣" if cname=="u" 
replace cname= "台東縣" if cname=="v"                                              
replace cname= "金門縣" if cname=="w"           			         
replace cname= "澎湖縣" if cname=="x" 
replace cname= "連江縣" if cname=="z" 
                                                                    
replace year =108 if year==10

save "/Volumes/GoogleDrive/共用雲端硬碟/台灣房價數據庫/數據/實價登錄/housingprice_102-108.dta", replace

use  "/Volumes/GoogleDrive/共用雲端硬碟/台灣房價數據庫/數據/實價登錄/housingprice_102-108.dta",clear
keep if cname=="新竹縣"

keep if cname=="新竹市"

sort year season tname 


   
save "/Volumes/GoogleDrive/共用雲端硬碟/台灣房價數據庫/數據/實價登錄/dta_tmp1021-1094.dta", replace 
   
merge m:1 tname cname using  "/Volumes/GoogleDrive/我的雲端硬碟/Acadamic/[材料]數據庫/變項-土地/鄉鎮級資料/tid.dta"

drop if _merge==2

   
***single

import delimited "/Volumes/GoogleDrive/共用雲端硬碟/台灣房價數據庫/數據/實價登錄/1021/a_lvr_land_a.csv", delimiter("", asstring) bindquote(nobind) varnames(1) encoding(utf8) clear 

drop if 土地區段位置建物區段門牌== "land sector position building sector house number plate"
destring 土地移轉總面積平方公尺 交易年月日 建築完成年月 建物移轉總面積平方公尺 建物現況格局房 建物現況格局廳 建物現況格局衛 總價元 單價元平方公尺 車位移轉總面積平方公尺 車位總價元,replace force

ren 鄉鎮市區 tname

gen cname="臺北市"

merge m:1 tname cname using  "/Volumes/GoogleDrive/我的雲端硬碟/Acadamic/[材料]數據庫/變項-土地/鄉鎮級資料/tid.dta"

drop if _merge==2
ta _merge

																
/// for reference 
do	"/Volumes/GoogleDrive/我的雲端硬碟/Acadamic/[材料]數據庫/變項-土地/鄉鎮級資料/2000_2017_working200715.do"

																													  
***1995-2005                                                                                                                                                          
tempfile tmpdata                                                                                                                                                            
clear
save `tmpdata', emptyok replace   
                                                                                                                                        
set more off	                                                                                                                                                       
forvalues i = 1012/1021 {
	import excel "/Volumes/GoogleDrive/共用雲端硬碟/台灣房價數據庫/數據/實價登錄/102S1-lvr_landcsv.xlsx", sheet("`i'") clear firstrow allstring
	gen ccname = substr(地區,1,9)
	drop 地區                                                                                                                                                              
	replace ccname = "澎湖縣" if ccname == "彰湖縣"                                                                                                                            
	merge 1:1 ccname using "C:\Users\user\Downloads\cid.dta"
	ta ccname if _merge == 1
	drop if _merge != 3
	drop _merge
	ren 年 year
	append using `tmpdata'
    save `tmpdata', replace
	}
	
order ccname cname
ds ccname cname, not
foreach var in `r(varlist)' {
	replace `var' = subinstr(`var',",","",.)
	destring `var', replace
	}
replace 住宿類住宅戶數 = 戶數 if 住宿類住宅戶數 == .
replace 住宿類住宅總樓地板面積 = 住宅樓地板面積 if 住宿類住宅總樓地板面積 == .
replace 住宿類住宅總樓地板面積 = 住宅面積 if 住宿類住宅總樓地板面積 == .
replace 總計總樓地板面積 = 合計樓地板面積 if 總計總樓地板面積 == .
replace 總計總樓地板面積 = 合計 if 總計總樓地板面積 == .
keep ccname cname year 住宿類住宅戶數 住宿類住宅總樓地板面積 總計總樓地板面積 其他樓地板面積
ren 其他樓地板面積 其他樓地板面積
    save `tmpdata', replace
	save "C:\Users\user\Downloads\construt9505.dta", replace
