
use "/Volumes/GoogleDrive/共用雲端硬碟/台灣房價數據庫/數據/房貸.dta",replace


collapse(mean) 平均授信餘額千元 平均授信額度千元 平均鑑估值千元 平均核貸成數 平均貸款利率 平均建物面積平方公尺 平均房價,by(cname year)

gen 平均實際貸款金額 = 平均授信額度千元-平均授信餘額千元


twoway(line 平均實際貸款金額 year),by(cname)

******
*****


use "/Volumes/GoogleDrive/共用雲端硬碟/台灣房價數據庫/數據/房貸.dta",replace


collapse(sum) 樣本數 ,by(year)


twoway(line 樣本數 year)

