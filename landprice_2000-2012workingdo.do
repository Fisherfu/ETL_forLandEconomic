 
 use "G:\Shared drives\台灣房價數據庫\數據\landprice2000-2012.dta" ,clear
 gen year=substr(日期,-19,4)
 order year
 destring year,replace
 save "G:\Shared drives\台灣房價數據庫\數據\landprice2000-2012working.dta",replace
 
 
 use "G:\Shared drives\台灣房價數據庫\數據\landprice2000-2012working.dta",clear
 keep year 縣市 鄉鎮區 用途類別 總價萬元 
 destring 總價萬元,replace force
 replace 總價萬元= 總價萬元*10000
 ren 總價萬元 price
 ren 縣市 county
 
replace county="高雄市" if county=="高雄巿"
replace county="基隆市" if county=="基隆巿"
replace county="新竹市" if county=="新竹巿"
replace county="嘉義市" if county=="嘉義巿"
replace county="彰化縣" if county=="彰化鎮"
replace county="花蓮縣" if county=="花縣縣"
replace county ="桃園市" if county=="桃園縣"

bysort year county: egen ave_price =mean(price)

bysort year county: egen med_price =median(price)
sort county year

collapse(first)ave_price med_price,by(year county)

drop if ave_price==.

sort county year
drop if year >=2009
****合併資料2008-2019資料****
append using "G:\Shared drives\台灣房價數據庫\數據\hoseprice2019_forappend.dta"
sort county year
ta county 

drop med_price 平均房價每坪

xtset id_tmp year
encode county,gen(id_tmp)
save "G:\Shared drives\台灣房價數據庫\數據\hoseprice2000-2019_formerge.dta",replace


*****整理2009-2019 dta******
use "G:\Shared drives\台灣房價數據庫\數據\hoseprice2019.dta",clear
ren cname county
ren 平均鑑估值元 ave_price
replace county ="桃園市" if county=="桃園縣"

save  "G:\Shared drives\台灣房價數據庫\數據\hoseprice2019_forappend.dta",replace

