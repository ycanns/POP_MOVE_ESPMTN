dir <- "Z:/Working/2025/KISDI/data//"
setwd(dir)

# 0. define libraries ========================================================== 
if (!require('foreign')) install.packages("foreign")
if (!require('sp')) install.packages("sp")
if (!require('maps')) install.packages("maps")
if (!require('leaflet')) install.packages("leaflet")
if (!require('DT')) install.packages("DT")
if (!require('rgeos')) install.packages("rgeos")
if (!require('maptools')) install.packages("maptools")
if (!require('RColorBrewer')) install.packages("RColorBrewer")
if (!require('geosphere')) install.packages("geosphere")
if (!require('dplyr')) install.packages("dplyr")
if (!require('curl')) install.packages("curl")
if (!require('plotly')) install.packages("plotly")
if (!require('leaflet.minicharts')) install.packages("leaflet.minicharts")
if (!require('httr')) install.packages("httr")
if (!require('readxl')) install.packages("readxl")
if (!require('rgdal')) install.packages("rgdal")
if (!require('varhandle')) install.packages("varhandle")
if (!require('ggplot2')) install.packages("ggplot2")
if (!require('gridExtra')) install.packages("gridExtra")
if (!require('sf')) install.packages("sf")
if (!require('spdep')) install.packages("spdep")
if (!require('reshape2')) install.packages("reshape2")
if (!require('tsne')) install.packages("tsne")
if (!require('fpc')) install.packages("fpc")
if (!require('dbscan')) install.packages("dbscan")
if (!require('stringr')) install.packages("stringr")
if (!require('xlsx')) install.packages("xlsx")
if (!require('data.table')) install.packages("data.table")
if (!require('tidyverse')) install.packages("tidyverse")
if (!require('psych')) install.packages("psych")
if (!require('fpc')) install.packages("fpc")
if (!require('GPArotation')) install.packages("GPArotation")
if (!require('factoextra')) install.packages("factoextra")
if (!require('randomForest')) install.packages("randomForest")
if (!require('Rtsne')) install.packages("Rtsne")
if (!require('umap')) install.packages("umap")
if (!require("NbClust"))install.packages("NbClust")
if (!require("cluster"))install.packages("cluster")
if (!require("frbs"))install.packages("frbs")
if (!require("xgboost"))install.packages("xgboost")
if (!require("Matrix"))install.packages("Matrix")
if (!require("keras"))install.packages("keras")



# 0.1. define directories ======================================================
# BUSINESS
dir_new <- paste0(dir, "business/");
filenames = dir(dir_new)
filenames = gsub(".txt", "", filenames)
BUSNS_df <- as.data.frame(matrix(0, ncol=4, nrow=0))

for (file_to_load in filenames){
	assign(
		"TMP",
		read_delim(paste0(dir_new, "/", file_to_load, ".txt"), "^", col_names = FALSE, escape_double = FALSE, trim_ws = TRUE, locale=locale(encoding="UTF-8")))
	BUSNS_df <- rbind(BUSNS_df, TMP)}
rm(file_to_load, filenames, TMP)
colnames(BUSNS_df) <- c("Year", "GRID", "TEMP", "COUNT")
BUSNS_df <- as.data.frame(BUSNS_df)



# HOUSEHOLD
dir_new <- paste0(dir, "households/");
filenames = dir(dir_new)
filenames = gsub(".txt", "", filenames)

HSHD_df <- as.data.frame(matrix(0, ncol=4, nrow=0))
HSHD_df <- as.data.frame(HSHD_df)

for (file_to_load in filenames){
	assign(
		"TMP",
		read_delim(paste0(dir_new, "/", file_to_load, ".txt"), "^", col_names = FALSE, escape_double = FALSE, trim_ws = TRUE, locale=locale(encoding="UTF-8")))
	HSHD_df <- rbind(HSHD_df, TMP)}
rm(file_to_load, filenames, TMP)
colnames(HSHD_df) <- c("Year", "GRID", "TEMP", "COUNT")
HSHD_df <- as.data.frame(HSHD_df)



# POPULATION
dir_new <- paste0(dir, "population/");
filenames = dir(dir_new)
filenames = gsub(".txt", "", filenames)
POPTN_df <- as.data.frame(matrix(0, ncol=4, nrow=0))

for (file_to_load in filenames){
	assign(
		"TMP",
		read_delim(paste0(dir_new, "/", file_to_load, ".txt"), "^", col_names = FALSE, escape_double = FALSE, trim_ws = TRUE, locale=locale(encoding="UTF-8")))
	POPTN_df <- rbind(POPTN_df, TMP)}
rm(file_to_load, filenames, TMP)
colnames(POPTN_df) <- c("Year", "GRID", "TEMP", "COUNT")
POPTN_df <- as.data.frame(POPTN_df)



# RESIDENCE
dir_new <- paste0(dir, "residence/");
filenames = dir(dir_new)
filenames = gsub(".txt", "", filenames)
RSDNC_df <- as.data.frame(matrix(0, ncol=4, nrow=0))

for (file_to_load in filenames){
	assign(
		"TMP",
		read_delim(paste0(dir_new, "/", file_to_load, ".txt"), "^", col_names = FALSE, escape_double = FALSE, trim_ws = TRUE, locale=locale(encoding="UTF-8")))
	RSDNC_df <- rbind(RSDNC_df, TMP)}
rm(file_to_load, filenames, TMP)
colnames(RSDNC_df) <- c("Year", "GRID", "TEMP", "COUNT")
RSDNC_df <- as.data.frame(RSDNC_df)



# WORKERS
dir_new <- paste0(dir, "workers/");
filenames = dir(dir_new)
filenames = gsub(".txt", "", filenames)
WRKRS_df <- as.data.frame(matrix(0, ncol=4, nrow=0))

for (file_to_load in filenames){
	assign(
		"TMP",
		read_delim(paste0(dir_new, "/", file_to_load, ".txt"), "^", col_names = FALSE, escape_double = FALSE, trim_ws = TRUE, locale=locale(encoding="UTF-8")))
	WRKRS_df <- rbind(WRKRS_df, TMP)}
rm(file_to_load, filenames, TMP)
colnames(WRKRS_df) <- c("Year", "GRID", "TEMP", "COUNT")
WRKRS_df <- as.data.frame(WRKRS_df)


# BUSINESS-CLASS B
dir_new <- paste0(dir, "business_B/");
filenames = dir(dir_new)
filenames = gsub(".txt", "", filenames)
BUSN_B_df <- as.data.frame(matrix(0, ncol=4, nrow=0))

for (file_to_load in filenames){
	assign(
		"TMP",
		read_delim(paste0(dir_new, "/", file_to_load, ".txt"), "^", col_names = FALSE, escape_double = FALSE, trim_ws = TRUE, locale=locale(encoding="UTF-8")))
	BUSN_B_df <- rbind(BUSN_B_df, TMP)}
rm(file_to_load, filenames, TMP)
colnames(BUSN_B_df) <- c("Year", "GRID", "TEMP", "COUNT")
BUSN_B_df <- as.data.frame(BUSN_B_df)



# WORKERS-CLASS B
dir_new <- paste0(dir, "workers_B/");
filenames = dir(dir_new)
filenames = gsub(".txt", "", filenames)
WRKR_B_df <- as.data.frame(matrix(0, ncol=4, nrow=0))

for (file_to_load in filenames){
	assign(
		"TMP",
		read_delim(paste0(dir_new, "/", file_to_load, ".txt"), "^", col_names = FALSE, escape_double = FALSE, trim_ws = TRUE, locale=locale(encoding="UTF-8")))
	WRKR_B_df <- rbind(WRKR_B_df, TMP)}
rm(file_to_load, filenames, TMP)
colnames(WRKR_B_df) <- c("Year", "GRID", "TEMP", "COUNT")
WRKR_B_df <- as.data.frame(WRKR_B_df)








#마이크로데이터 통합서비스(https://mdis.kostat.go.kr/index.do, 2025년 5월 31일 접속)
#국토연구원 수행 중인 연구보고서 작성 (인구이동관련 통계분석)


#통계지리정보서비스(https://sgis.kostat.go.kr/view/index, 2025년 5월 31일 접속)
#통계자료, 통계지역경계를 제공합니다.
#통계지역경계 기준시점 : 기준년도 12월31일(단, 2023년도는 6월 30일)
#지리정보 좌표계 : UTM-K(GRS80타원체)(EPSG5179)
#서비스 제한 기준 : 집계구별 5미만 통계값 서비스제외(총괄항목은 미적용)



# 1년단위: 2023~2016 | 5년단위: 2015~2000
#격자통계(인구) | 전체, 성연령별 인구, 인구총괄(총인구, 남여인구)
#격자통계(가구) | 전체, 세대구성별가구, 가구총괄(총가구)
#격자통계(주택) | 전체, 건축년도별주택, 주택유형별주택,연건평별주택, 주택총괄_총주택(거처수)
# 2022~2000
#격자통계(사업체) | 총사업체수, 산업분류별 사업체수
# 격자 통계(종사자) | 총 종사자수, 산업분류별 종사자수




# BUSINESS | BUSNS_df
# HOUSEHOLD | HSHD_df
# POPULATION | POPTN_df
# RESIDENCE | RSDNC_df
# WORKERS | WRKRS_df
# BUSINESS-CLASS B | BUSN_B_df
# WORKERS-CLASS B | WRKR_B_df


BUSNS_df$Year[which(BUSNS_df$Year == 9016)] <- 2016
BUSNS_df[is.na(BUSNS_df)] <- 0
BUSNS_df <- BUSNS_df %>% group_by(Year, GRID) %>% summarize(COUNTs = sum(COUNT)) %>% ungroup()

# > unique(BUSNS_df $Year)
#  2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022


HSHD_df[is.na(HSHD_df)] <- 0
HSHD_df <- HSHD_df %>% group_by(Year, GRID) %>% summarize(COUNTs = sum(COUNT)) %>% ungroup()

# > unique(HSHD_df$Year)
#  2000 2005 2010 2015 2016 2017 2018 2019 2020 2021 2022 2023


POPTN_df[is.na(POPTN_df)] <- 0
POPTN_df <- POPTN_df %>% group_by(Year, GRID) %>% summarize(COUNTs = sum(COUNT)) %>% ungroup()

# > unique(POPTN_df$Year)
#  2000 2005 2010 2015 2016 2017 2018 2019 2020 2021 2022 2023


RSDNC_df[is.na(RSDNC_df)] <- 0
RSDNC_df <- RSDNC_df %>% group_by(Year, GRID) %>% summarize(COUNTs = sum(COUNT)) %>% ungroup()

# > unique(RSDNC_df$Year)
#  2000 2005 2010 2015 2016 2017 2018 2019 2020 2021 2022 2023

WRKRS_df$Year[which(WRKRS_df$Year == 9016)] <- 2016
WRKRS_df[is.na(WRKRS_df)] <- 0
WRKRS_df <- WRKRS_df %>% group_by(Year, GRID) %>% summarize(COUNTs = sum(COUNT)) %>% ungroup()

# > unique(WRKRS_df$Year)
#  2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022





colnames(BUSNS_df) <- c("Year", "GRID", "BUSNS")
colnames(HSHD_df) <- c("Year", "GRID", "HSHD")
colnames(POPTN_df) <- c("Year", "GRID", "POPTN")
colnames(RSDNC_df) <- c("Year", "GRID", "RSDNC")
colnames(WRKRS_df) <- c("Year", "GRID", "WRKRS")

BUSNS_df <- subset(BUSNS_df, Year %in% unique(HSHD_df$Year))
WRKRS_df <- subset(WRKRS_df, Year %in% unique(HSHD_df$Year))


STAT_Yr <- full_join(POPTN_df, HSHD_df, by= c("Year", "GRID"))
STAT_Yr <- full_join(STAT_Yr, RSDNC_df, by= c("Year", "GRID"))
STAT_Yr <- full_join(STAT_Yr, BUSNS_df, by= c("Year", "GRID"))
STAT_Yr <- full_join(STAT_Yr, WRKRS_df, by= c("Year", "GRID"))

rm(BUSNS_df, HSHD_df, POPTN_df, RSDNC_df, WRKRS_df)


rm(zip_file, zipnames, loopyear, KCB_1km_Col_name, dir_new)

save.image(paste0(dir, "/STEP_1_INITAL_DATA.RData"))


POP_EST_SD <- read_excel(paste0(dir,"/STAT/POP_EST_by_SGG.xlsx"), sheet = 1)
colnames(POP_EST_SD) <- c("Scen", "SIDO", "SEX", "AGE", "TOPIC", "Unit",
						"EST_2023", "EST_2024", "EST_2025", "EST_2026", "EST_2027", "EST_2028", "EST_2029", "EST_2030", "EST_2031", "EST_2032", 
						"EST_2033", "EST_2034", "EST_2035", "EST_2036", "EST_2037", "EST_2038", "EST_2039", "EST_2040", "EST_2041", "EST_2042", 
						"EST_2043", "EST_2044", "EST_2045", "EST_2046", "EST_2047", "EST_2048", "EST_2049", "EST_2050", "EST_2051", "EST_2052")
POP_EST_SD <- POP_EST_SD[,c("SIDO", "AGE", 
		"EST_2023", "EST_2024", "EST_2025", "EST_2026", "EST_2027", "EST_2028", "EST_2029", "EST_2030", "EST_2031", "EST_2032", 
		"EST_2033", "EST_2034", "EST_2035", "EST_2036", "EST_2037", "EST_2038", "EST_2039", "EST_2040", "EST_2041", "EST_2042", 
		"EST_2043", "EST_2044", "EST_2045", "EST_2046", "EST_2047", "EST_2048", "EST_2049", "EST_2050", "EST_2051", "EST_2052")]

POP_EST_SD <- subset(POP_EST_SD, SIDO != "전국")
# > unique(POP_EST_SD$SIDO)
#  [1] "서울특별시"     "부산광역시"     "대구광역시"     "인천광역시"     "광주광역시"     "대전광역시"     "울산광역시"    
#  [8] "세종특별자치시" "경기도"         "강원도"         "충청북도"       "충청남도"       "전라북도"       "전라남도"      
# [15] "경상북도"       "경상남도"       "제주특별자치도"

# > unique(POP_EST_SD$AGE)
#  [1] "계"         "0 - 4세"    "5 - 9세"    "10 - 14세"  "15 - 19세"  "20 - 24세"  "25 - 29세"  "30 - 34세"  "35 - 39세"  "40 - 44세" 
# [11] "45 - 49세"  "50 - 54세"  "55 - 59세"  "60 - 64세"  "65 - 69세"  "70 - 74세"  "75 - 79세"  "80세이상"   "80 - 84세"  "85 - 89세" 
# [21] "90 - 94세"  "95 - 99세"  "100세 이상"
POP_EST_SD <- as.data.frame(POP_EST_SD)
POP_EST_SD <- subset(POP_EST_SD, c(AGE == "계" | AGE == "20 - 24세" | AGE == "25 - 29세" | AGE == "30 - 34세" | AGE == "35 - 39세"))
POP_EST_SD_ALL <- subset(POP_EST_SD, AGE == "계")
POP_EST_SD_YNG <- subset(POP_EST_SD, AGE != "계")
rm(POP_EST_SD)


POP_EST_SD_ALL$AGE <- NULL
POP_EST_SD_YNG$AGE <- NULL

POP_EST_SD_ALL <- POP_EST_SD_ALL %>%
    group_by(SIDO) %>%
    summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))

POP_EST_SD_YNG <- POP_EST_SD_YNG %>%
    group_by(SIDO) %>%
    summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE)))


#STAT_Yr_00 <- subset(STAT_Yr, Year == 2000)
#STAT_Yr_05 <- subset(STAT_Yr, Year == 2005)
#STAT_Yr_10 <- subset(STAT_Yr, Year == 2010)
#STAT_Yr_15 <- subset(STAT_Yr, Year == 2015)
#STAT_Yr_16 <- subset(STAT_Yr, Year == 2016)
#STAT_Yr_17 <- subset(STAT_Yr, Year == 2017)
#STAT_Yr_18 <- subset(STAT_Yr, Year == 2018)
#STAT_Yr_19 <- subset(STAT_Yr, Year == 2019)
#STAT_Yr_20 <- subset(STAT_Yr, Year == 2020)
#STAT_Yr_21 <- subset(STAT_Yr, Year == 2021)
#STAT_Yr_22 <- subset(STAT_Yr, Year == 2022)
#STAT_Yr_23 <- subset(STAT_Yr, Year == 2023)

STAT_Yr <- subset(STAT_Yr, c(Year == 2000 | Year == 2005 | Year == 2010 | Year == 2015 | Year == 2016 | 
	Year == 2017 | Year == 2018 | Year == 2019 | Year == 2020 | Year == 2021 | Year == 2022 | Year == 2023))

POPTN <- STAT_Yr %>%
  select(GRID, Year, POPTN) %>%
  mutate(Year = sprintf("POPTN_%02d", Year %% 100)) %>%  # e.g., 2000 → POPTN_00
  pivot_wider(names_from = Year, values_from = POPTN)

HSHD <- STAT_Yr %>%
  select(GRID, Year, HSHD) %>%
  mutate(Year = sprintf("HSHD_%02d", Year %% 100)) %>%  # e.g., 2000 → HSHD_00
  pivot_wider(names_from = Year, values_from = HSHD)
  
RSDNC <- STAT_Yr %>%
  select(GRID, Year, RSDNC) %>%
  mutate(Year = sprintf("RSDNC_%02d", Year %% 100)) %>%  # e.g., 2000 → RSDNC_00
  pivot_wider(names_from = Year, values_from = RSDNC)

  
BUSNS <- STAT_Yr %>%
  select(GRID, Year, BUSNS) %>%
  mutate(Year = sprintf("BUSNS_%02d", Year %% 100)) %>%  # e.g., 2000 → BUSNS_00
  pivot_wider(names_from = Year, values_from = BUSNS)

  
WRKRS <- STAT_Yr %>%
  select(GRID, Year, WRKRS) %>%
  mutate(Year = sprintf("WRKRS_%02d", Year %% 100)) %>%  # e.g., 2000 → WRKRS_00
  pivot_wider(names_from = Year, values_from = WRKRS)


POPTN[is.na(POPTN)] <- 0
HSHD[is.na(HSHD)] <- 0
RSDNC[is.na(RSDNC)] <- 0
BUSNS[is.na(BUSNS)] <- 0
WRKRS[is.na(WRKRS)] <- 0

save.image(paste0(dir, "/STEP_2_INITAL_DATA.RData"))




#dir <- "Z:/Working/2022/Pop_Estimation_X_AI/data/"
load(paste0(dir, "/GRID_Info.RData"))

Index_grid_info <- Index_grid_v3[, c("gLC", "gCT", "gRT", "gLM", "gTg", "gRM", "gLB", "gCB", "gRB")]
#names(Index_grid_info)[names(Index_grid_info) == 'GRID_1K_CD'] <- 'GRID'



# LEARNING FASHION] LEARNING > TESTING > TUNING (w/ STAT EST.)
# Young population has only between 2014 - 2024
#============================ YEARLY DESGIN for LEARNING FASHION =============================#
#---------------------------------------------------------------------------------------------
#---------------|-------------- LEARNING --------------|--------------- TESTING --------------
#   PREDICTION  |      TRAINING-SET     |    TARGET    |      TRAINING-SET     |    TARGET   
#---------------|-----------------------|--------------|-----------------------|--------------
#  1year-model  |      2000 ~ 2022      |     2023     |      2005 ~ 2023      |     2025     
#  2year-model  |      2000 ~ 2021      |     2023     |      2005 ~ 2022      |     2026     
#  3year-model  |      2000 ~ 2020      |     2023     |      2005 ~ 2021      |     2027     
#  4year-model  |      2000 ~ 2019      |     2023     |      2005 ~ 2020      |     2028     
#  5year-model  |      2000 ~ 2018      |     2023     |      2005 ~ 2019      |     2029     
#  6year-model  |      2000 ~ 2017      |     2023     |      2005 ~ 2018      |     2030     
#----------------------------------------------------------------------------------------------

# Total 12 years data) 2000 2005 2010 2015 2016 2017 2018 2019 2020 2021 2022 2023
# 1year-model: Learning(11)-Target(1) > Testing(11)-Target(1)
# 2year-model: Learning(10)-Target(1) > Testing(10)-Target(1)
# 3year-model: Learning(9)-Target(1) > Testing(9)-Target(1)
# 4year-model: Learning(8)-Target(1) > Testing(8)-Target(1)
# 5year-model: Learning(7)-Target(1) > Testing(7)-Target(1)
# 6year-model: Learning(6)-Target(1) > Testing(6)-Target(1)


Arrange_by_GRID <- function(Index_grid_info, BG_DATA){

	colnames(BG_DATA) <- c("GRID", "X_00", "X_05", "X_10", "X_15", "X_16", "X_17", "X_18", "X_19", "X_20", "X_21", "X_22", "X_23")
	BG_DATA <- as.data.frame(BG_DATA)

	# 2000
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_00")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_00")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_00")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_00")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_00")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_00")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_00")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_00")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_00")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_00 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_00) <- colnames(Index_grid_info)
	BG_00[is.na(BG_00)] <- 0
	BG_00$YEAR <- 2000	


	# 2005
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_05")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_05")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_05")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_05")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_05")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_05")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_05")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_05")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_05")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_05 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_05) <- colnames(Index_grid_info)
	BG_05[is.na(BG_05)] <- 0
	BG_05$YEAR <- 2005


	# 2010
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_10")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_10")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_10")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_10")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_10")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_10")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_10")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_10")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_10")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_10 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_10) <- colnames(Index_grid_info)
	BG_10[is.na(BG_10)] <- 0
	BG_10$YEAR <- 2010


	# 2015
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_15")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_15")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_15")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_15")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_15")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_15")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_15")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_15")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_15")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_15 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_15) <- colnames(Index_grid_info)
	BG_15[is.na(BG_15)] <- 0
	BG_15$YEAR <- 2015


	# 2016
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_16")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_16")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_16")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_16")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_16")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_16")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_16")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_16")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_16")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_16 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_16) <- colnames(Index_grid_info)
	BG_16[is.na(BG_16)] <- 0
	BG_16$YEAR <- 2016


	# 2017
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_17")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_17")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_17")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_17")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_17")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_17")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_17")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_17")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_17")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_17 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_17) <- colnames(Index_grid_info)
	BG_17[is.na(BG_17)] <- 0
	BG_17$YEAR <- 2017


	# 2018
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_18")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_18")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_18")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_18")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_18")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_18")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_18")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_18")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_18")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_18 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_18) <- colnames(Index_grid_info)
	BG_18[is.na(BG_18)] <- 0
	BG_18$YEAR <- 2018


	# 2019
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_19")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_19")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_19")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_19")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_19")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_19")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_19")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_19")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_19")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_19 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_19) <- colnames(Index_grid_info)
	BG_19[is.na(BG_19)] <- 0
	BG_19$YEAR <- 2019


	# 2020
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_20")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_20")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_20")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_20")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_20")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_20")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_20")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_20")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_20")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_20 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_20) <- colnames(Index_grid_info)
	BG_20[is.na(BG_20)] <- 0
	BG_20$YEAR <- 2020


	# 2021
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_21")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_21")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_21")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_21")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_21")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_21")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_21")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_21")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_21")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_21 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_21) <- colnames(Index_grid_info)
	BG_21[is.na(BG_21)] <- 0
	BG_21$YEAR <- 2021


	# 2022
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_22")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_22")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_22")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_22")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_22")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_22")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_22")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_22")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_22")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_22 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_22) <- colnames(Index_grid_info)
	BG_22[is.na(BG_22)] <- 0
	BG_22$YEAR <- 2022


	# 2023
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_22")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_22")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_22")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_22")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_22")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_22")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_22")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_22")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_22")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_23 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_23) <- colnames(Index_grid_info)
	BG_23[is.na(BG_23)] <- 0
	BG_23$YEAR <- 2023


	ALL_BG_DATA <- rbind(BG_00, BG_05, BG_10, BG_15, BG_16, BG_17, BG_18, BG_19, BG_20, BG_21, BG_22, BG_23)
	gc()
	return(ALL_BG_DATA)
}


Arrange_by_GRID_YNG <- function(Index_grid_info, BG_DATA){

	colnames(BG_DATA) <- c("GRID", "X_13", "X_14", "X_15", "X_16", "X_17", "X_18", "X_19", "X_20", "X_21", "X_22", "X_23")
	BG_DATA <- as.data.frame(BG_DATA)

	# 2013
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_13")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_13")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_13")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_13")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_13")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_13")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_13")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_13")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_13")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_05 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_05) <- colnames(Index_grid_info)
	BG_05[is.na(BG_05)] <- 0
	BG_05$YEAR <- 2005	


	# 2014
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_14")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_14")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_14")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_14")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_14")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_14")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_14")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_14")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_14")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_10 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_10) <- colnames(Index_grid_info)
	BG_10[is.na(BG_10)] <- 0
	BG_10$YEAR <- 2010


	# 2015
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_15")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_15")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_15")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_15")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_15")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_15")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_15")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_15")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_15")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_15 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_15) <- colnames(Index_grid_info)
	BG_15[is.na(BG_15)] <- 0
	BG_15$YEAR <- 2015


	# 2016
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_16")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_16")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_16")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_16")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_16")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_16")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_16")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_16")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_16")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_16 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_16) <- colnames(Index_grid_info)
	BG_16[is.na(BG_16)] <- 0
	BG_16$YEAR <- 2016


	# 2017
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_17")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_17")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_17")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_17")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_17")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_17")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_17")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_17")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_17")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_17 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_17) <- colnames(Index_grid_info)
	BG_17[is.na(BG_17)] <- 0
	BG_17$YEAR <- 2017


	# 2018
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_18")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_18")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_18")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_18")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_18")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_18")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_18")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_18")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_18")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_18 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_18) <- colnames(Index_grid_info)
	BG_18[is.na(BG_18)] <- 0
	BG_18$YEAR <- 2018


	# 2019
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_19")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_19")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_19")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_19")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_19")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_19")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_19")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_19")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_19")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_19 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_19) <- colnames(Index_grid_info)
	BG_19[is.na(BG_19)] <- 0
	BG_19$YEAR <- 2019


	# 2020
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_20")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_20")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_20")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_20")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_20")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_20")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_20")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_20")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_20")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_20 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_20) <- colnames(Index_grid_info)
	BG_20[is.na(BG_20)] <- 0
	BG_20$YEAR <- 2020


	# 2021
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_21")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_21")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_21")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_21")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_21")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_21")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_21")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_21")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_21")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_21 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_21) <- colnames(Index_grid_info)
	BG_21[is.na(BG_21)] <- 0
	BG_21$YEAR <- 2021


	# 2022
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_22")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_22")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_22")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_22")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_22")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_22")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_22")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_22")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_22")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_22 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_22) <- colnames(Index_grid_info)
	BG_22[is.na(BG_22)] <- 0
	BG_22$YEAR <- 2022


	# 2023
	BG_00_gLC <- left_join(Index_grid_info[,c("gLC", "gCT")], BG_DATA[,c("GRID", "X_22")], by= c("gLC"="GRID")); BG_00_gLC$gLC <- NULL; BG_00_gLC$gCT <- NULL;
	BG_00_gCT <- left_join(Index_grid_info[,c("gCT", "gRT")], BG_DATA[,c("GRID", "X_22")], by= c("gCT"="GRID")); BG_00_gCT$gCT <- NULL; BG_00_gCT$gRT <- NULL;
	BG_00_gRT <- left_join(Index_grid_info[,c("gRT", "gLM")], BG_DATA[,c("GRID", "X_22")], by= c("gRT"="GRID")); BG_00_gRT$gRT <- NULL; BG_00_gRT$gLM <- NULL;
	BG_00_gLM <- left_join(Index_grid_info[,c("gLM", "gTg")], BG_DATA[,c("GRID", "X_22")], by= c("gLM"="GRID")); BG_00_gLM$gLM <- NULL; BG_00_gLM$gTg <- NULL;
	BG_00_gTg <- left_join(Index_grid_info[,c("gTg", "gRM")], BG_DATA[,c("GRID", "X_22")], by= c("gTg"="GRID")); BG_00_gTg$gTg <- NULL; BG_00_gTg$gRM <- NULL;
	BG_00_gRM <- left_join(Index_grid_info[,c("gRM", "gLB")], BG_DATA[,c("GRID", "X_22")], by= c("gRM"="GRID")); BG_00_gRM$gRM <- NULL; BG_00_gRM$gLB <- NULL;
	BG_00_gLB <- left_join(Index_grid_info[,c("gLB", "gCB")], BG_DATA[,c("GRID", "X_22")], by= c("gLB"="GRID")); BG_00_gLB$gLB <- NULL; BG_00_gLB$gCB <- NULL;
	BG_00_gCB <- left_join(Index_grid_info[,c("gCB", "gRB")], BG_DATA[,c("GRID", "X_22")], by= c("gCB"="GRID")); BG_00_gCB$gCB <- NULL; BG_00_gCB$gRB <- NULL;
	BG_00_gRB <- left_join(Index_grid_info[,c("gRB", "gLC")], BG_DATA[,c("GRID", "X_22")], by= c("gRB"="GRID")); BG_00_gRB$gRB <- NULL; BG_00_gRB$gLC <- NULL;

	BG_23 <- cbind(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	rm(BG_00_gLC, BG_00_gCT, BG_00_gRT, BG_00_gLM, BG_00_gTg, BG_00_gRM, BG_00_gLB, BG_00_gCB, BG_00_gRB)
	colnames(BG_23) <- colnames(Index_grid_info)
	BG_23[is.na(BG_23)] <- 0
	BG_23$YEAR <- 2023


	ALL_BG_DATA <- rbind(BG_05, BG_10, BG_15, BG_16, BG_17, BG_18, BG_19, BG_20, BG_21, BG_22, BG_23)
	gc()
	return(ALL_BG_DATA)
}

GRD_BUSNS <- Arrange_by_GRID(Index_grid_info, BUSNS)
GRD_HSHD <- Arrange_by_GRID(Index_grid_info, HSHD)
GRD_RSDNC <- Arrange_by_GRID(Index_grid_info, RSDNC)
GRD_WRKRS <- Arrange_by_GRID(Index_grid_info, WRKRS)
GRD_POPTN <- Arrange_by_GRID(Index_grid_info, POPTN)
GRD_YNG_POP <- Arrange_by_GRID_YNG(Index_grid_info, YNG_POP)




GRD_YNG_POP_TG <- subset(GRD_YNG_POP, YEAR == 2023); GRD_YNG_POP_TG <- GRD_YNG_POP_TG[,c("YEAR", "gTg")]
GRD_YNG_POP_TG <- cbind(Index_grid_info[,c("gTg", "gLC")], GRD_YNG_POP_TG); GRD_YNG_POP_TG$gLC <- NULL;





############################################ TRAINING DATA PREPARATION

TRAINING_data_TYPE_1 <- function(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP){


	# LEARNING FASHION] LEARNING > TESTING > TUNING (w/ STAT EST.)
	# Young population has only between 2014 - 2024
	#============================ YEARLY DESGIN for LEARNING FASHION =============================#
	#---------------------------------------------------------------------------------------------
	#---------------|-------------- LEARNING --------------|--------------- TESTING --------------
	#   PREDICTION  |      TRAINING-SET     |    TARGET    |      TRAINING-SET     |    TARGET   
	#---------------|-----------------------|--------------|-----------------------|--------------
	#  1year-model  |      2000 ~ 2022      |     2023     |      2005 ~ 2023      |     2025     
	#  2year-model  |      2000 ~ 2021      |     2023     |      2005 ~ 2022      |     2026     
	#  3year-model  |      2000 ~ 2020      |     2023     |      2005 ~ 2021      |     2027     
	#  4year-model  |      2000 ~ 2019      |     2023     |      2005 ~ 2020      |     2028     
	#  5year-model  |      2000 ~ 2018      |     2023     |      2005 ~ 2019      |     2029     
	#  6year-model  |      2000 ~ 2017      |     2023     |      2005 ~ 2018      |     2030     
	#----------------------------------------------------------------------------------------------

	# Total 12 years data) 2000 2005 2010 2015 2016 2017 2018 2019 2020 2021 2022 2023
	# 1year-model: Learning(11)-Target(1) > Testing(11)-Target(1)
	# 2year-model: Learning(10)-Target(1) > Testing(10)-Target(1)
	# 3year-model: Learning(9)-Target(1) > Testing(9)-Target(1)
	# 4year-model: Learning(8)-Target(1) > Testing(8)-Target(1)
	# 5year-model: Learning(7)-Target(1) > Testing(7)-Target(1)
	# 6year-model: Learning(6)-Target(1) > Testing(6)-Target(1)

	GRD_BUSNS_00 <- subset(GRD_BUSNS, YEAR == 2000)
	GRD_HSHD_00 <- subset(GRD_HSHD, YEAR == 2000)
	GRD_RSDNC_00 <- subset(GRD_RSDNC, YEAR == 2000)
	GRD_WRKRS_00 <- subset(GRD_WRKRS, YEAR == 2000)
	GRD_POPTN_00 <- subset(GRD_POPTN, YEAR == 2000)
	GRD_YNG_POP_00 <- subset(GRD_YNG_POP, YEAR == 2000)

	new_col_BUSNS <- c("gLC_B00", "gCT_B00", "gRT_B00", "gLM_B00", "gTg_B00", "gRM_B00", "gLB_B00", "gCB_B00", "gRB_B00", "YEAR")
	new_col_HSHD <- c("gLC_H00", "gCT_H00", "gRT_H00", "gLM_H00", "gTg_H00", "gRM_H00", "gLB_H00", "gCB_H00", "gRB_H00", "YEAR")
	new_col_RSDNC <- c("gLC_R00", "gCT_R00", "gRT_R00", "gLM_R00", "gTg_R00", "gRM_R00", "gLB_R00", "gCB_R00", "gRB_R00", "YEAR")
	new_col_WRKRS <- c("gLC_W00", "gCT_W00", "gRT_W00", "gLM_W00", "gTg_W00", "gRM_W00", "gLB_W00", "gCB_W00", "gRB_W00", "YEAR")
	new_col_POPTN <- c("gLC_P00", "gCT_P00", "gRT_P00", "gLM_P00", "gTg_P00", "gRM_P00", "gLB_P00", "gCB_P00", "gRB_P00", "YEAR")
	new_col_YNG_POP <- c("gLC_Y00", "gCT_Y00", "gRT_Y00", "gLM_Y00", "gTg_Y00", "gRM_Y00", "gLB_Y00", "gCB_Y00", "gRB_Y00", "YEAR")

	colnames(GRD_BUSNS_00) <- new_col_BUSNS; GRD_BUSNS_00$YEAR <- NULL
	colnames(GRD_HSHD_00) <- new_col_HSHD; GRD_HSHD_00$YEAR <- NULL
	colnames(GRD_RSDNC_00) <- new_col_RSDNC; GRD_RSDNC_00$YEAR <- NULL
	colnames(GRD_WRKRS_00) <- new_col_WRKRS; GRD_WRKRS_00$YEAR <- NULL
	colnames(GRD_POPTN_00) <- new_col_POPTN; GRD_POPTN_00$YEAR <- NULL
	colnames(GRD_YNG_POP_00) <- new_col_YNG_POP; GRD_YNG_POP_00$YEAR <- NULL



	GRD_BUSNS_05 <- subset(GRD_BUSNS, YEAR == 2005)
	GRD_HSHD_05 <- subset(GRD_HSHD, YEAR == 2005)
	GRD_RSDNC_05 <- subset(GRD_RSDNC, YEAR == 2005)
	GRD_WRKRS_05 <- subset(GRD_WRKRS, YEAR == 2005)
	GRD_POPTN_05 <- subset(GRD_POPTN, YEAR == 2005)
	GRD_YNG_POP_05 <- subset(GRD_YNG_POP, YEAR == 2005)

	new_col_BUSNS <- c("gLC_B05", "gCT_B05", "gRT_B05", "gLM_B05", "gTg_B05", "gRM_B05", "gLB_B05", "gCB_B05", "gRB_B05", "YEAR")
	new_col_HSHD <- c("gLC_H05", "gCT_H05", "gRT_H05", "gLM_H05", "gTg_H05", "gRM_H05", "gLB_H05", "gCB_H05", "gRB_H05", "YEAR")
	new_col_RSDNC <- c("gLC_R05", "gCT_R05", "gRT_R05", "gLM_R05", "gTg_R05", "gRM_R05", "gLB_R05", "gCB_R05", "gRB_R05", "YEAR")
	new_col_WRKRS <- c("gLC_W05", "gCT_W05", "gRT_W05", "gLM_W05", "gTg_W05", "gRM_W05", "gLB_W05", "gCB_W05", "gRB_W05", "YEAR")
	new_col_POPTN <- c("gLC_P05", "gCT_P05", "gRT_P05", "gLM_P05", "gTg_P05", "gRM_P05", "gLB_P05", "gCB_P05", "gRB_P05", "YEAR")
	new_col_YNG_POP <- c("gLC_Y05", "gCT_Y05", "gRT_Y05", "gLM_Y05", "gTg_Y05", "gRM_Y05", "gLB_Y05", "gCB_Y05", "gRB_Y05", "YEAR")

	colnames(GRD_BUSNS_05) <- new_col_BUSNS; GRD_BUSNS_05$YEAR <- NULL
	colnames(GRD_HSHD_05) <- new_col_HSHD; GRD_HSHD_05$YEAR <- NULL
	colnames(GRD_RSDNC_05) <- new_col_RSDNC; GRD_RSDNC_05$YEAR <- NULL
	colnames(GRD_WRKRS_05) <- new_col_WRKRS; GRD_WRKRS_05$YEAR <- NULL
	colnames(GRD_POPTN_05) <- new_col_POPTN; GRD_POPTN_05$YEAR <- NULL
	colnames(GRD_YNG_POP_05) <- new_col_YNG_POP; GRD_YNG_POP_05$YEAR <- NULL



	GRD_BUSNS_10 <- subset(GRD_BUSNS, YEAR == 2010)
	GRD_HSHD_10 <- subset(GRD_HSHD, YEAR == 2010)
	GRD_RSDNC_10 <- subset(GRD_RSDNC, YEAR == 2010)
	GRD_WRKRS_10 <- subset(GRD_WRKRS, YEAR == 2010)
	GRD_POPTN_10 <- subset(GRD_POPTN, YEAR == 2010)
	GRD_YNG_POP_10 <- subset(GRD_YNG_POP, YEAR == 2010)

	new_col_BUSNS <- c("gLC_B10", "gCT_B10", "gRT_B10", "gLM_B10", "gTg_B10", "gRM_B10", "gLB_B10", "gCB_B10", "gRB_B10", "YEAR")
	new_col_HSHD <- c("gLC_H10", "gCT_H10", "gRT_H10", "gLM_H10", "gTg_H10", "gRM_H10", "gLB_H10", "gCB_H10", "gRB_H10", "YEAR")
	new_col_RSDNC <- c("gLC_R10", "gCT_R10", "gRT_R10", "gLM_R10", "gTg_R10", "gRM_R10", "gLB_R10", "gCB_R10", "gRB_R10", "YEAR")
	new_col_WRKRS <- c("gLC_W10", "gCT_W10", "gRT_W10", "gLM_W10", "gTg_W10", "gRM_W10", "gLB_W10", "gCB_W10", "gRB_W10", "YEAR")
	new_col_POPTN <- c("gLC_P10", "gCT_P10", "gRT_P10", "gLM_P10", "gTg_P10", "gRM_P10", "gLB_P10", "gCB_P10", "gRB_P10", "YEAR")
	new_col_YNG_POP <- c("gLC_Y10", "gCT_Y10", "gRT_Y10", "gLM_Y10", "gTg_Y10", "gRM_Y10", "gLB_Y10", "gCB_Y10", "gRB_Y10", "YEAR")

	colnames(GRD_BUSNS_10) <- new_col_BUSNS; GRD_BUSNS_10$YEAR <- NULL
	colnames(GRD_HSHD_10) <- new_col_HSHD; GRD_HSHD_10$YEAR <- NULL
	colnames(GRD_RSDNC_10) <- new_col_RSDNC; GRD_RSDNC_10$YEAR <- NULL
	colnames(GRD_WRKRS_10) <- new_col_WRKRS; GRD_WRKRS_10$YEAR <- NULL
	colnames(GRD_POPTN_10) <- new_col_POPTN; GRD_POPTN_10$YEAR <- NULL
	colnames(GRD_YNG_POP_10) <- new_col_YNG_POP; GRD_YNG_POP_10$YEAR <- NULL


	GRD_BUSNS_15 <- subset(GRD_BUSNS, YEAR == 2015)
	GRD_HSHD_15 <- subset(GRD_HSHD, YEAR == 2015)
	GRD_RSDNC_15 <- subset(GRD_RSDNC, YEAR == 2015)
	GRD_WRKRS_15 <- subset(GRD_WRKRS, YEAR == 2015)
	GRD_POPTN_15 <- subset(GRD_POPTN, YEAR == 2015)
	GRD_YNG_POP_15 <- subset(GRD_YNG_POP, YEAR == 2015)

	new_col_BUSNS <- c("gLC_B15", "gCT_B15", "gRT_B15", "gLM_B15", "gTg_B15", "gRM_B15", "gLB_B15", "gCB_B15", "gRB_B15", "YEAR")
	new_col_HSHD <- c("gLC_H15", "gCT_H15", "gRT_H15", "gLM_H15", "gTg_H15", "gRM_H15", "gLB_H15", "gCB_H15", "gRB_H15", "YEAR")
	new_col_RSDNC <- c("gLC_R15", "gCT_R15", "gRT_R15", "gLM_R15", "gTg_R15", "gRM_R15", "gLB_R15", "gCB_R15", "gRB_R15", "YEAR")
	new_col_WRKRS <- c("gLC_W15", "gCT_W15", "gRT_W15", "gLM_W15", "gTg_W15", "gRM_W15", "gLB_W15", "gCB_W15", "gRB_W15", "YEAR")
	new_col_POPTN <- c("gLC_P15", "gCT_P15", "gRT_P15", "gLM_P15", "gTg_P15", "gRM_P15", "gLB_P15", "gCB_P15", "gRB_P15", "YEAR")
	new_col_YNG_POP <- c("gLC_Y15", "gCT_Y15", "gRT_Y15", "gLM_Y15", "gTg_Y15", "gRM_Y15", "gLB_Y15", "gCB_Y15", "gRB_Y15", "YEAR")

	colnames(GRD_BUSNS_15) <- new_col_BUSNS; GRD_BUSNS_15$YEAR <- NULL
	colnames(GRD_HSHD_15) <- new_col_HSHD; GRD_HSHD_15$YEAR <- NULL
	colnames(GRD_RSDNC_15) <- new_col_RSDNC; GRD_RSDNC_15$YEAR <- NULL
	colnames(GRD_WRKRS_15) <- new_col_WRKRS; GRD_WRKRS_15$YEAR <- NULL
	colnames(GRD_POPTN_15) <- new_col_POPTN; GRD_POPTN_15$YEAR <- NULL
	colnames(GRD_YNG_POP_15) <- new_col_YNG_POP; GRD_YNG_POP_15$YEAR <- NULL



	GRD_BUSNS_16 <- subset(GRD_BUSNS, YEAR == 2016)
	GRD_HSHD_16 <- subset(GRD_HSHD, YEAR == 2016)
	GRD_RSDNC_16 <- subset(GRD_RSDNC, YEAR == 2016)
	GRD_WRKRS_16 <- subset(GRD_WRKRS, YEAR == 2016)
	GRD_POPTN_16 <- subset(GRD_POPTN, YEAR == 2016)
	GRD_YNG_POP_16 <- subset(GRD_YNG_POP, YEAR == 2016)

	new_col_BUSNS <- c("gLC_B16", "gCT_B16", "gRT_B16", "gLM_B16", "gTg_B16", "gRM_B16", "gLB_B16", "gCB_B16", "gRB_B16", "YEAR")
	new_col_HSHD <- c("gLC_H16", "gCT_H16", "gRT_H16", "gLM_H16", "gTg_H16", "gRM_H16", "gLB_H16", "gCB_H16", "gRB_H16", "YEAR")
	new_col_RSDNC <- c("gLC_R16", "gCT_R16", "gRT_R16", "gLM_R16", "gTg_R16", "gRM_R16", "gLB_R16", "gCB_R16", "gRB_R16", "YEAR")
	new_col_WRKRS <- c("gLC_W16", "gCT_W16", "gRT_W16", "gLM_W16", "gTg_W16", "gRM_W16", "gLB_W16", "gCB_W16", "gRB_W16", "YEAR")
	new_col_POPTN <- c("gLC_P16", "gCT_P16", "gRT_P16", "gLM_P16", "gTg_P16", "gRM_P16", "gLB_P16", "gCB_P16", "gRB_P16", "YEAR")
	new_col_YNG_POP <- c("gLC_Y16", "gCT_Y16", "gRT_Y16", "gLM_Y16", "gTg_Y16", "gRM_Y16", "gLB_Y16", "gCB_Y16", "gRB_Y16", "YEAR")

	colnames(GRD_BUSNS_16) <- new_col_BUSNS; GRD_BUSNS_16$YEAR <- NULL
	colnames(GRD_HSHD_16) <- new_col_HSHD; GRD_HSHD_16$YEAR <- NULL
	colnames(GRD_RSDNC_16) <- new_col_RSDNC; GRD_RSDNC_16$YEAR <- NULL
	colnames(GRD_WRKRS_16) <- new_col_WRKRS; GRD_WRKRS_16$YEAR <- NULL
	colnames(GRD_POPTN_16) <- new_col_POPTN; GRD_POPTN_16$YEAR <- NULL
	colnames(GRD_YNG_POP_16) <- new_col_YNG_POP; GRD_YNG_POP_16$YEAR <- NULL



	GRD_BUSNS_17 <- subset(GRD_BUSNS, YEAR == 2017)
	GRD_HSHD_17 <- subset(GRD_HSHD, YEAR == 2017)
	GRD_RSDNC_17 <- subset(GRD_RSDNC, YEAR == 2017)
	GRD_WRKRS_17 <- subset(GRD_WRKRS, YEAR == 2017)
	GRD_POPTN_17 <- subset(GRD_POPTN, YEAR == 2017)
	GRD_YNG_POP_17 <- subset(GRD_YNG_POP, YEAR == 2017)

	new_col_BUSNS <- c("gLC_B17", "gCT_B17", "gRT_B17", "gLM_B17", "gTg_B17", "gRM_B17", "gLB_B17", "gCB_B17", "gRB_B17", "YEAR")
	new_col_HSHD <- c("gLC_H17", "gCT_H17", "gRT_H17", "gLM_H17", "gTg_H17", "gRM_H17", "gLB_H17", "gCB_H17", "gRB_H17", "YEAR")
	new_col_RSDNC <- c("gLC_R17", "gCT_R17", "gRT_R17", "gLM_R17", "gTg_R17", "gRM_R17", "gLB_R17", "gCB_R17", "gRB_R17", "YEAR")
	new_col_WRKRS <- c("gLC_W17", "gCT_W17", "gRT_W17", "gLM_W17", "gTg_W17", "gRM_W17", "gLB_W17", "gCB_W17", "gRB_W17", "YEAR")
	new_col_POPTN <- c("gLC_P17", "gCT_P17", "gRT_P17", "gLM_P17", "gTg_P17", "gRM_P17", "gLB_P17", "gCB_P17", "gRB_P17", "YEAR")
	new_col_YNG_POP <- c("gLC_Y17", "gCT_Y17", "gRT_Y17", "gLM_Y17", "gTg_Y17", "gRM_Y17", "gLB_Y17", "gCB_Y17", "gRB_Y17", "YEAR")

	colnames(GRD_BUSNS_17) <- new_col_BUSNS; GRD_BUSNS_17$YEAR <- NULL
	colnames(GRD_HSHD_17) <- new_col_HSHD; GRD_HSHD_17$YEAR <- NULL
	colnames(GRD_RSDNC_17) <- new_col_RSDNC; GRD_RSDNC_17$YEAR <- NULL
	colnames(GRD_WRKRS_17) <- new_col_WRKRS; GRD_WRKRS_17$YEAR <- NULL
	colnames(GRD_POPTN_17) <- new_col_POPTN; GRD_POPTN_17$YEAR <- NULL
	colnames(GRD_YNG_POP_17) <- new_col_YNG_POP; GRD_YNG_POP_17$YEAR <- NULL



	GRD_BUSNS_18 <- subset(GRD_BUSNS, YEAR == 2018)
	GRD_HSHD_18 <- subset(GRD_HSHD, YEAR == 2018)
	GRD_RSDNC_18 <- subset(GRD_RSDNC, YEAR == 2018)
	GRD_WRKRS_18 <- subset(GRD_WRKRS, YEAR == 2018)
	GRD_POPTN_18 <- subset(GRD_POPTN, YEAR == 2018)
	GRD_YNG_POP_18 <- subset(GRD_YNG_POP, YEAR == 2018)

	new_col_BUSNS <- c("gLC_B18", "gCT_B18", "gRT_B18", "gLM_B18", "gTg_B18", "gRM_B18", "gLB_B18", "gCB_B18", "gRB_B18", "YEAR")
	new_col_HSHD <- c("gLC_H18", "gCT_H18", "gRT_H18", "gLM_H18", "gTg_H18", "gRM_H18", "gLB_H18", "gCB_H18", "gRB_H18", "YEAR")
	new_col_RSDNC <- c("gLC_R18", "gCT_R18", "gRT_R18", "gLM_R18", "gTg_R18", "gRM_R18", "gLB_R18", "gCB_R18", "gRB_R18", "YEAR")
	new_col_WRKRS <- c("gLC_W18", "gCT_W18", "gRT_W18", "gLM_W18", "gTg_W18", "gRM_W18", "gLB_W18", "gCB_W18", "gRB_W18", "YEAR")
	new_col_POPTN <- c("gLC_P18", "gCT_P18", "gRT_P18", "gLM_P18", "gTg_P18", "gRM_P18", "gLB_P18", "gCB_P18", "gRB_P18", "YEAR")
	new_col_YNG_POP <- c("gLC_Y18", "gCT_Y18", "gRT_Y18", "gLM_Y18", "gTg_Y18", "gRM_Y18", "gLB_Y18", "gCB_Y18", "gRB_Y18", "YEAR")

	colnames(GRD_BUSNS_18) <- new_col_BUSNS; GRD_BUSNS_18$YEAR <- NULL
	colnames(GRD_HSHD_18) <- new_col_HSHD; GRD_HSHD_18$YEAR <- NULL
	colnames(GRD_RSDNC_18) <- new_col_RSDNC; GRD_RSDNC_18$YEAR <- NULL
	colnames(GRD_WRKRS_18) <- new_col_WRKRS; GRD_WRKRS_18$YEAR <- NULL
	colnames(GRD_POPTN_18) <- new_col_POPTN; GRD_POPTN_18$YEAR <- NULL
	colnames(GRD_YNG_POP_18) <- new_col_YNG_POP; GRD_YNG_POP_18$YEAR <- NULL


	GRD_BUSNS_19 <- subset(GRD_BUSNS, YEAR == 2019)
	GRD_HSHD_19 <- subset(GRD_HSHD, YEAR == 2019)
	GRD_RSDNC_19 <- subset(GRD_RSDNC, YEAR == 2019)
	GRD_WRKRS_19 <- subset(GRD_WRKRS, YEAR == 2019)
	GRD_POPTN_19 <- subset(GRD_POPTN, YEAR == 2019)
	GRD_YNG_POP_19 <- subset(GRD_YNG_POP, YEAR == 2019)

	new_col_BUSNS <- c("gLC_B19", "gCT_B19", "gRT_B19", "gLM_B19", "gTg_B19", "gRM_B19", "gLB_B19", "gCB_B19", "gRB_B19", "YEAR")
	new_col_HSHD <- c("gLC_H19", "gCT_H19", "gRT_H19", "gLM_H19", "gTg_H19", "gRM_H19", "gLB_H19", "gCB_H19", "gRB_H19", "YEAR")
	new_col_RSDNC <- c("gLC_R19", "gCT_R19", "gRT_R19", "gLM_R19", "gTg_R19", "gRM_R19", "gLB_R19", "gCB_R19", "gRB_R19", "YEAR")
	new_col_WRKRS <- c("gLC_W19", "gCT_W19", "gRT_W19", "gLM_W19", "gTg_W19", "gRM_W19", "gLB_W19", "gCB_W19", "gRB_W19", "YEAR")
	new_col_POPTN <- c("gLC_P19", "gCT_P19", "gRT_P19", "gLM_P19", "gTg_P19", "gRM_P19", "gLB_P19", "gCB_P19", "gRB_P19", "YEAR")
	new_col_YNG_POP <- c("gLC_Y19", "gCT_Y19", "gRT_Y19", "gLM_Y19", "gTg_Y19", "gRM_Y19", "gLB_Y19", "gCB_Y19", "gRB_Y19", "YEAR")

	colnames(GRD_BUSNS_19) <- new_col_BUSNS; GRD_BUSNS_19$YEAR <- NULL
	colnames(GRD_HSHD_19) <- new_col_HSHD; GRD_HSHD_19$YEAR <- NULL
	colnames(GRD_RSDNC_19) <- new_col_RSDNC; GRD_RSDNC_19$YEAR <- NULL
	colnames(GRD_WRKRS_19) <- new_col_WRKRS; GRD_WRKRS_19$YEAR <- NULL
	colnames(GRD_POPTN_19) <- new_col_POPTN; GRD_POPTN_19$YEAR <- NULL
	colnames(GRD_YNG_POP_19) <- new_col_YNG_POP; GRD_YNG_POP_19$YEAR <- NULL



	GRD_BUSNS_20 <- subset(GRD_BUSNS, YEAR == 2020)
	GRD_HSHD_20 <- subset(GRD_HSHD, YEAR == 2020)
	GRD_RSDNC_20 <- subset(GRD_RSDNC, YEAR == 2020)
	GRD_WRKRS_20 <- subset(GRD_WRKRS, YEAR == 2020)
	GRD_POPTN_20 <- subset(GRD_POPTN, YEAR == 2020)
	GRD_YNG_POP_20 <- subset(GRD_YNG_POP, YEAR == 2020)

	new_col_BUSNS <- c("gLC_B20", "gCT_B20", "gRT_B20", "gLM_B20", "gTg_B20", "gRM_B20", "gLB_B20", "gCB_B20", "gRB_B20", "YEAR")
	new_col_HSHD <- c("gLC_H20", "gCT_H20", "gRT_H20", "gLM_H20", "gTg_H20", "gRM_H20", "gLB_H20", "gCB_H20", "gRB_H20", "YEAR")
	new_col_RSDNC <- c("gLC_R20", "gCT_R20", "gRT_R20", "gLM_R20", "gTg_R20", "gRM_R20", "gLB_R20", "gCB_R20", "gRB_R20", "YEAR")
	new_col_WRKRS <- c("gLC_W20", "gCT_W20", "gRT_W20", "gLM_W20", "gTg_W20", "gRM_W20", "gLB_W20", "gCB_W20", "gRB_W20", "YEAR")
	new_col_POPTN <- c("gLC_P20", "gCT_P20", "gRT_P20", "gLM_P20", "gTg_P20", "gRM_P20", "gLB_P20", "gCB_P20", "gRB_P20", "YEAR")
	new_col_YNG_POP <- c("gLC_Y20", "gCT_Y20", "gRT_Y20", "gLM_Y20", "gTg_Y20", "gRM_Y20", "gLB_Y20", "gCB_Y20", "gRB_Y20", "YEAR")

	colnames(GRD_BUSNS_20) <- new_col_BUSNS; GRD_BUSNS_20$YEAR <- NULL
	colnames(GRD_HSHD_20) <- new_col_HSHD; GRD_HSHD_20$YEAR <- NULL
	colnames(GRD_RSDNC_20) <- new_col_RSDNC; GRD_RSDNC_20$YEAR <- NULL
	colnames(GRD_WRKRS_20) <- new_col_WRKRS; GRD_WRKRS_20$YEAR <- NULL
	colnames(GRD_POPTN_20) <- new_col_POPTN; GRD_POPTN_20$YEAR <- NULL
	colnames(GRD_YNG_POP_20) <- new_col_YNG_POP; GRD_YNG_POP_20$YEAR <- NULL



	GRD_BUSNS_21 <- subset(GRD_BUSNS, YEAR == 2021)
	GRD_HSHD_21 <- subset(GRD_HSHD, YEAR == 2021)
	GRD_RSDNC_21 <- subset(GRD_RSDNC, YEAR == 2021)
	GRD_WRKRS_21 <- subset(GRD_WRKRS, YEAR == 2021)
	GRD_POPTN_21 <- subset(GRD_POPTN, YEAR == 2021)
	GRD_YNG_POP_21 <- subset(GRD_YNG_POP, YEAR == 2021)

	new_col_BUSNS <- c("gLC_B21", "gCT_B21", "gRT_B21", "gLM_B21", "gTg_B21", "gRM_B21", "gLB_B21", "gCB_B21", "gRB_B21", "YEAR")
	new_col_HSHD <- c("gLC_H21", "gCT_H21", "gRT_H21", "gLM_H21", "gTg_H21", "gRM_H21", "gLB_H21", "gCB_H21", "gRB_H21", "YEAR")
	new_col_RSDNC <- c("gLC_R21", "gCT_R21", "gRT_R21", "gLM_R21", "gTg_R21", "gRM_R21", "gLB_R21", "gCB_R21", "gRB_R21", "YEAR")
	new_col_WRKRS <- c("gLC_W21", "gCT_W21", "gRT_W21", "gLM_W21", "gTg_W21", "gRM_W21", "gLB_W21", "gCB_W21", "gRB_W21", "YEAR")
	new_col_POPTN <- c("gLC_P21", "gCT_P21", "gRT_P21", "gLM_P21", "gTg_P21", "gRM_P21", "gLB_P21", "gCB_P21", "gRB_P21", "YEAR")
	new_col_YNG_POP <- c("gLC_Y21", "gCT_Y21", "gRT_Y21", "gLM_Y21", "gTg_Y21", "gRM_Y21", "gLB_Y21", "gCB_Y21", "gRB_Y21", "YEAR")

	colnames(GRD_BUSNS_21) <- new_col_BUSNS; GRD_BUSNS_21$YEAR <- NULL
	colnames(GRD_HSHD_21) <- new_col_HSHD; GRD_HSHD_21$YEAR <- NULL
	colnames(GRD_RSDNC_21) <- new_col_RSDNC; GRD_RSDNC_21$YEAR <- NULL
	colnames(GRD_WRKRS_21) <- new_col_WRKRS; GRD_WRKRS_21$YEAR <- NULL
	colnames(GRD_POPTN_21) <- new_col_POPTN; GRD_POPTN_21$YEAR <- NULL
	colnames(GRD_YNG_POP_21) <- new_col_YNG_POP; GRD_YNG_POP_21$YEAR <- NULL


	GRD_BUSNS_22 <- subset(GRD_BUSNS, YEAR == 2022)
	GRD_HSHD_22 <- subset(GRD_HSHD, YEAR == 2022)
	GRD_RSDNC_22 <- subset(GRD_RSDNC, YEAR == 2022)
	GRD_WRKRS_22 <- subset(GRD_WRKRS, YEAR == 2022)
	GRD_POPTN_22 <- subset(GRD_POPTN, YEAR == 2022)
	GRD_YNG_POP_22 <- subset(GRD_YNG_POP, YEAR == 2022)

	new_col_BUSNS <- c("gLC_B22", "gCT_B22", "gRT_B22", "gLM_B22", "gTg_B22", "gRM_B22", "gLB_B22", "gCB_B22", "gRB_B22", "YEAR")
	new_col_HSHD <- c("gLC_H22", "gCT_H22", "gRT_H22", "gLM_H22", "gTg_H22", "gRM_H22", "gLB_H22", "gCB_H22", "gRB_H22", "YEAR")
	new_col_RSDNC <- c("gLC_R22", "gCT_R22", "gRT_R22", "gLM_R22", "gTg_R22", "gRM_R22", "gLB_R22", "gCB_R22", "gRB_R22", "YEAR")
	new_col_WRKRS <- c("gLC_W22", "gCT_W22", "gRT_W22", "gLM_W22", "gTg_W22", "gRM_W22", "gLB_W22", "gCB_W22", "gRB_W22", "YEAR")
	new_col_POPTN <- c("gLC_P22", "gCT_P22", "gRT_P22", "gLM_P22", "gTg_P22", "gRM_P22", "gLB_P22", "gCB_P22", "gRB_P22", "YEAR")
	new_col_YNG_POP <- c("gLC_Y22", "gCT_Y22", "gRT_Y22", "gLM_Y22", "gTg_Y22", "gRM_Y22", "gLB_Y22", "gCB_Y22", "gRB_Y22", "YEAR")

	colnames(GRD_BUSNS_22) <- new_col_BUSNS; GRD_BUSNS_22$YEAR <- NULL
	colnames(GRD_HSHD_22) <- new_col_HSHD; GRD_HSHD_22$YEAR <- NULL
	colnames(GRD_RSDNC_22) <- new_col_RSDNC; GRD_RSDNC_22$YEAR <- NULL
	colnames(GRD_WRKRS_22) <- new_col_WRKRS; GRD_WRKRS_22$YEAR <- NULL
	colnames(GRD_POPTN_22) <- new_col_POPTN; GRD_POPTN_22$YEAR <- NULL
	colnames(GRD_YNG_POP_22) <- new_col_YNG_POP; GRD_YNG_POP_22$YEAR <- NULL


	TRAINING_SET <- cbind(
	GRD_BUSNS_00, GRD_HSHD_00, GRD_RSDNC_00, GRD_WRKRS_00, GRD_POPTN_00, GRD_YNG_POP_05, 
	GRD_BUSNS_05, GRD_HSHD_05, GRD_RSDNC_05, GRD_WRKRS_05, GRD_POPTN_05, GRD_YNG_POP_05,
	GRD_BUSNS_10, GRD_HSHD_10, GRD_RSDNC_10, GRD_WRKRS_10, GRD_POPTN_10, GRD_YNG_POP_10, 
	GRD_BUSNS_15, GRD_HSHD_15, GRD_RSDNC_15, GRD_WRKRS_15, GRD_POPTN_15, GRD_YNG_POP_15, 
	GRD_BUSNS_16, GRD_HSHD_16, GRD_RSDNC_16, GRD_WRKRS_16, GRD_POPTN_16, GRD_YNG_POP_16, 
	GRD_BUSNS_17, GRD_HSHD_17, GRD_RSDNC_17, GRD_WRKRS_17, GRD_POPTN_17, GRD_YNG_POP_17, 
	GRD_BUSNS_18, GRD_HSHD_18, GRD_RSDNC_18, GRD_WRKRS_18, GRD_POPTN_18, GRD_YNG_POP_18, 
	GRD_BUSNS_19, GRD_HSHD_19, GRD_RSDNC_19, GRD_WRKRS_19, GRD_POPTN_19, GRD_YNG_POP_19, 
	GRD_BUSNS_20, GRD_HSHD_20, GRD_RSDNC_20, GRD_WRKRS_20, GRD_POPTN_20, GRD_YNG_POP_20, 
	GRD_BUSNS_21, GRD_HSHD_21, GRD_RSDNC_21, GRD_WRKRS_21, GRD_POPTN_21, GRD_YNG_POP_21, 
	GRD_BUSNS_22, GRD_HSHD_22, GRD_RSDNC_22, GRD_WRKRS_22, GRD_POPTN_22, GRD_YNG_POP_22)

	return(TRAINING_SET)
}




TRAINING_data_TYPE_2 <- function(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP){


	# LEARNING FASHION] LEARNING > TESTING > TUNING (w/ STAT EST.)
	# Young population has only between 2014 - 2024
	#============================ YEARLY DESGIN for LEARNING FASHION =============================#
	#---------------------------------------------------------------------------------------------
	#---------------|-------------- LEARNING --------------|--------------- TESTING --------------
	#   PREDICTION  |      TRAINING-SET     |    TARGET    |      TRAINING-SET     |    TARGET   
	#---------------|-----------------------|--------------|-----------------------|--------------
	#  1year-model  |      2000 ~ 2022      |     2023     |      2005 ~ 2023      |     2025     
	#  2year-model  |      2000 ~ 2021      |     2023     |      2005 ~ 2022      |     2026     
	#  3year-model  |      2000 ~ 2020      |     2023     |      2005 ~ 2021      |     2027     
	#  4year-model  |      2000 ~ 2019      |     2023     |      2005 ~ 2020      |     2028     
	#  5year-model  |      2000 ~ 2018      |     2023     |      2005 ~ 2019      |     2029     
	#  6year-model  |      2000 ~ 2017      |     2023     |      2005 ~ 2018      |     2030     
	#----------------------------------------------------------------------------------------------

	# Total 12 years data) 2000 2005 2010 2015 2016 2017 2018 2019 2020 2021 2022 2023
	# 1year-model: Learning(11)-Target(1) > Testing(11)-Target(1)
	# 2year-model: Learning(10)-Target(1) > Testing(10)-Target(1)
	# 3year-model: Learning(9)-Target(1) > Testing(9)-Target(1)
	# 4year-model: Learning(8)-Target(1) > Testing(8)-Target(1)
	# 5year-model: Learning(7)-Target(1) > Testing(7)-Target(1)
	# 6year-model: Learning(6)-Target(1) > Testing(6)-Target(1)

	GRD_BUSNS_00 <- subset(GRD_BUSNS, YEAR == 2000)
	GRD_HSHD_00 <- subset(GRD_HSHD, YEAR == 2000)
	GRD_RSDNC_00 <- subset(GRD_RSDNC, YEAR == 2000)
	GRD_WRKRS_00 <- subset(GRD_WRKRS, YEAR == 2000)
	GRD_POPTN_00 <- subset(GRD_POPTN, YEAR == 2000)
	GRD_YNG_POP_00 <- subset(GRD_YNG_POP, YEAR == 2000)

	new_col_BUSNS <- c("gLC_B00", "gCT_B00", "gRT_B00", "gLM_B00", "gTg_B00", "gRM_B00", "gLB_B00", "gCB_B00", "gRB_B00", "YEAR")
	new_col_HSHD <- c("gLC_H00", "gCT_H00", "gRT_H00", "gLM_H00", "gTg_H00", "gRM_H00", "gLB_H00", "gCB_H00", "gRB_H00", "YEAR")
	new_col_RSDNC <- c("gLC_R00", "gCT_R00", "gRT_R00", "gLM_R00", "gTg_R00", "gRM_R00", "gLB_R00", "gCB_R00", "gRB_R00", "YEAR")
	new_col_WRKRS <- c("gLC_W00", "gCT_W00", "gRT_W00", "gLM_W00", "gTg_W00", "gRM_W00", "gLB_W00", "gCB_W00", "gRB_W00", "YEAR")
	new_col_POPTN <- c("gLC_P00", "gCT_P00", "gRT_P00", "gLM_P00", "gTg_P00", "gRM_P00", "gLB_P00", "gCB_P00", "gRB_P00", "YEAR")
	new_col_YNG_POP <- c("gLC_Y00", "gCT_Y00", "gRT_Y00", "gLM_Y00", "gTg_Y00", "gRM_Y00", "gLB_Y00", "gCB_Y00", "gRB_Y00", "YEAR")

	colnames(GRD_BUSNS_00) <- new_col_BUSNS; GRD_BUSNS_00$YEAR <- NULL
	colnames(GRD_HSHD_00) <- new_col_HSHD; GRD_HSHD_00$YEAR <- NULL
	colnames(GRD_RSDNC_00) <- new_col_RSDNC; GRD_RSDNC_00$YEAR <- NULL
	colnames(GRD_WRKRS_00) <- new_col_WRKRS; GRD_WRKRS_00$YEAR <- NULL
	colnames(GRD_POPTN_00) <- new_col_POPTN; GRD_POPTN_00$YEAR <- NULL
	colnames(GRD_YNG_POP_00) <- new_col_YNG_POP; GRD_YNG_POP_00$YEAR <- NULL



	GRD_BUSNS_05 <- subset(GRD_BUSNS, YEAR == 2005)
	GRD_HSHD_05 <- subset(GRD_HSHD, YEAR == 2005)
	GRD_RSDNC_05 <- subset(GRD_RSDNC, YEAR == 2005)
	GRD_WRKRS_05 <- subset(GRD_WRKRS, YEAR == 2005)
	GRD_POPTN_05 <- subset(GRD_POPTN, YEAR == 2005)
	GRD_YNG_POP_05 <- subset(GRD_YNG_POP, YEAR == 2005)

	new_col_BUSNS <- c("gLC_B05", "gCT_B05", "gRT_B05", "gLM_B05", "gTg_B05", "gRM_B05", "gLB_B05", "gCB_B05", "gRB_B05", "YEAR")
	new_col_HSHD <- c("gLC_H05", "gCT_H05", "gRT_H05", "gLM_H05", "gTg_H05", "gRM_H05", "gLB_H05", "gCB_H05", "gRB_H05", "YEAR")
	new_col_RSDNC <- c("gLC_R05", "gCT_R05", "gRT_R05", "gLM_R05", "gTg_R05", "gRM_R05", "gLB_R05", "gCB_R05", "gRB_R05", "YEAR")
	new_col_WRKRS <- c("gLC_W05", "gCT_W05", "gRT_W05", "gLM_W05", "gTg_W05", "gRM_W05", "gLB_W05", "gCB_W05", "gRB_W05", "YEAR")
	new_col_POPTN <- c("gLC_P05", "gCT_P05", "gRT_P05", "gLM_P05", "gTg_P05", "gRM_P05", "gLB_P05", "gCB_P05", "gRB_P05", "YEAR")
	new_col_YNG_POP <- c("gLC_Y05", "gCT_Y05", "gRT_Y05", "gLM_Y05", "gTg_Y05", "gRM_Y05", "gLB_Y05", "gCB_Y05", "gRB_Y05", "YEAR")

	colnames(GRD_BUSNS_05) <- new_col_BUSNS; GRD_BUSNS_05$YEAR <- NULL
	colnames(GRD_HSHD_05) <- new_col_HSHD; GRD_HSHD_05$YEAR <- NULL
	colnames(GRD_RSDNC_05) <- new_col_RSDNC; GRD_RSDNC_05$YEAR <- NULL
	colnames(GRD_WRKRS_05) <- new_col_WRKRS; GRD_WRKRS_05$YEAR <- NULL
	colnames(GRD_POPTN_05) <- new_col_POPTN; GRD_POPTN_05$YEAR <- NULL
	colnames(GRD_YNG_POP_05) <- new_col_YNG_POP; GRD_YNG_POP_05$YEAR <- NULL


	GRD_BUSNS_10 <- subset(GRD_BUSNS, YEAR == 2010)
	GRD_HSHD_10 <- subset(GRD_HSHD, YEAR == 2010)
	GRD_RSDNC_10 <- subset(GRD_RSDNC, YEAR == 2010)
	GRD_WRKRS_10 <- subset(GRD_WRKRS, YEAR == 2010)
	GRD_POPTN_10 <- subset(GRD_POPTN, YEAR == 2010)
	GRD_YNG_POP_10 <- subset(GRD_YNG_POP, YEAR == 2010)

	new_col_BUSNS <- c("gLC_B10", "gCT_B10", "gRT_B10", "gLM_B10", "gTg_B10", "gRM_B10", "gLB_B10", "gCB_B10", "gRB_B10", "YEAR")
	new_col_HSHD <- c("gLC_H10", "gCT_H10", "gRT_H10", "gLM_H10", "gTg_H10", "gRM_H10", "gLB_H10", "gCB_H10", "gRB_H10", "YEAR")
	new_col_RSDNC <- c("gLC_R10", "gCT_R10", "gRT_R10", "gLM_R10", "gTg_R10", "gRM_R10", "gLB_R10", "gCB_R10", "gRB_R10", "YEAR")
	new_col_WRKRS <- c("gLC_W10", "gCT_W10", "gRT_W10", "gLM_W10", "gTg_W10", "gRM_W10", "gLB_W10", "gCB_W10", "gRB_W10", "YEAR")
	new_col_POPTN <- c("gLC_P10", "gCT_P10", "gRT_P10", "gLM_P10", "gTg_P10", "gRM_P10", "gLB_P10", "gCB_P10", "gRB_P10", "YEAR")
	new_col_YNG_POP <- c("gLC_Y10", "gCT_Y10", "gRT_Y10", "gLM_Y10", "gTg_Y10", "gRM_Y10", "gLB_Y10", "gCB_Y10", "gRB_Y10", "YEAR")

	colnames(GRD_BUSNS_10) <- new_col_BUSNS; GRD_BUSNS_10$YEAR <- NULL
	colnames(GRD_HSHD_10) <- new_col_HSHD; GRD_HSHD_10$YEAR <- NULL
	colnames(GRD_RSDNC_10) <- new_col_RSDNC; GRD_RSDNC_10$YEAR <- NULL
	colnames(GRD_WRKRS_10) <- new_col_WRKRS; GRD_WRKRS_10$YEAR <- NULL
	colnames(GRD_POPTN_10) <- new_col_POPTN; GRD_POPTN_10$YEAR <- NULL
	colnames(GRD_YNG_POP_10) <- new_col_YNG_POP; GRD_YNG_POP_10$YEAR <- NULL



	GRD_BUSNS_15 <- subset(GRD_BUSNS, YEAR == 2015)
	GRD_HSHD_15 <- subset(GRD_HSHD, YEAR == 2015)
	GRD_RSDNC_15 <- subset(GRD_RSDNC, YEAR == 2015)
	GRD_WRKRS_15 <- subset(GRD_WRKRS, YEAR == 2015)
	GRD_POPTN_15 <- subset(GRD_POPTN, YEAR == 2015)
	GRD_YNG_POP_15 <- subset(GRD_YNG_POP, YEAR == 2015)

	new_col_BUSNS <- c("gLC_B15", "gCT_B15", "gRT_B15", "gLM_B15", "gTg_B15", "gRM_B15", "gLB_B15", "gCB_B15", "gRB_B15", "YEAR")
	new_col_HSHD <- c("gLC_H15", "gCT_H15", "gRT_H15", "gLM_H15", "gTg_H15", "gRM_H15", "gLB_H15", "gCB_H15", "gRB_H15", "YEAR")
	new_col_RSDNC <- c("gLC_R15", "gCT_R15", "gRT_R15", "gLM_R15", "gTg_R15", "gRM_R15", "gLB_R15", "gCB_R15", "gRB_R15", "YEAR")
	new_col_WRKRS <- c("gLC_W15", "gCT_W15", "gRT_W15", "gLM_W15", "gTg_W15", "gRM_W15", "gLB_W15", "gCB_W15", "gRB_W15", "YEAR")
	new_col_POPTN <- c("gLC_P15", "gCT_P15", "gRT_P15", "gLM_P15", "gTg_P15", "gRM_P15", "gLB_P15", "gCB_P15", "gRB_P15", "YEAR")
	new_col_YNG_POP <- c("gLC_Y15", "gCT_Y15", "gRT_Y15", "gLM_Y15", "gTg_Y15", "gRM_Y15", "gLB_Y15", "gCB_Y15", "gRB_Y15", "YEAR")

	colnames(GRD_BUSNS_15) <- new_col_BUSNS; GRD_BUSNS_15$YEAR <- NULL
	colnames(GRD_HSHD_15) <- new_col_HSHD; GRD_HSHD_15$YEAR <- NULL
	colnames(GRD_RSDNC_15) <- new_col_RSDNC; GRD_RSDNC_15$YEAR <- NULL
	colnames(GRD_WRKRS_15) <- new_col_WRKRS; GRD_WRKRS_15$YEAR <- NULL
	colnames(GRD_POPTN_15) <- new_col_POPTN; GRD_POPTN_15$YEAR <- NULL
	colnames(GRD_YNG_POP_15) <- new_col_YNG_POP; GRD_YNG_POP_15$YEAR <- NULL



	GRD_BUSNS_16 <- subset(GRD_BUSNS, YEAR == 2016)
	GRD_HSHD_16 <- subset(GRD_HSHD, YEAR == 2016)
	GRD_RSDNC_16 <- subset(GRD_RSDNC, YEAR == 2016)
	GRD_WRKRS_16 <- subset(GRD_WRKRS, YEAR == 2016)
	GRD_POPTN_16 <- subset(GRD_POPTN, YEAR == 2016)
	GRD_YNG_POP_16 <- subset(GRD_YNG_POP, YEAR == 2016)

	new_col_BUSNS <- c("gLC_B16", "gCT_B16", "gRT_B16", "gLM_B16", "gTg_B16", "gRM_B16", "gLB_B16", "gCB_B16", "gRB_B16", "YEAR")
	new_col_HSHD <- c("gLC_H16", "gCT_H16", "gRT_H16", "gLM_H16", "gTg_H16", "gRM_H16", "gLB_H16", "gCB_H16", "gRB_H16", "YEAR")
	new_col_RSDNC <- c("gLC_R16", "gCT_R16", "gRT_R16", "gLM_R16", "gTg_R16", "gRM_R16", "gLB_R16", "gCB_R16", "gRB_R16", "YEAR")
	new_col_WRKRS <- c("gLC_W16", "gCT_W16", "gRT_W16", "gLM_W16", "gTg_W16", "gRM_W16", "gLB_W16", "gCB_W16", "gRB_W16", "YEAR")
	new_col_POPTN <- c("gLC_P16", "gCT_P16", "gRT_P16", "gLM_P16", "gTg_P16", "gRM_P16", "gLB_P16", "gCB_P16", "gRB_P16", "YEAR")
	new_col_YNG_POP <- c("gLC_Y16", "gCT_Y16", "gRT_Y16", "gLM_Y16", "gTg_Y16", "gRM_Y16", "gLB_Y16", "gCB_Y16", "gRB_Y16", "YEAR")

	colnames(GRD_BUSNS_16) <- new_col_BUSNS; GRD_BUSNS_16$YEAR <- NULL
	colnames(GRD_HSHD_16) <- new_col_HSHD; GRD_HSHD_16$YEAR <- NULL
	colnames(GRD_RSDNC_16) <- new_col_RSDNC; GRD_RSDNC_16$YEAR <- NULL
	colnames(GRD_WRKRS_16) <- new_col_WRKRS; GRD_WRKRS_16$YEAR <- NULL
	colnames(GRD_POPTN_16) <- new_col_POPTN; GRD_POPTN_16$YEAR <- NULL
	colnames(GRD_YNG_POP_16) <- new_col_YNG_POP; GRD_YNG_POP_16$YEAR <- NULL



	GRD_BUSNS_17 <- subset(GRD_BUSNS, YEAR == 2017)
	GRD_HSHD_17 <- subset(GRD_HSHD, YEAR == 2017)
	GRD_RSDNC_17 <- subset(GRD_RSDNC, YEAR == 2017)
	GRD_WRKRS_17 <- subset(GRD_WRKRS, YEAR == 2017)
	GRD_POPTN_17 <- subset(GRD_POPTN, YEAR == 2017)
	GRD_YNG_POP_17 <- subset(GRD_YNG_POP, YEAR == 2017)

	new_col_BUSNS <- c("gLC_B17", "gCT_B17", "gRT_B17", "gLM_B17", "gTg_B17", "gRM_B17", "gLB_B17", "gCB_B17", "gRB_B17", "YEAR")
	new_col_HSHD <- c("gLC_H17", "gCT_H17", "gRT_H17", "gLM_H17", "gTg_H17", "gRM_H17", "gLB_H17", "gCB_H17", "gRB_H17", "YEAR")
	new_col_RSDNC <- c("gLC_R17", "gCT_R17", "gRT_R17", "gLM_R17", "gTg_R17", "gRM_R17", "gLB_R17", "gCB_R17", "gRB_R17", "YEAR")
	new_col_WRKRS <- c("gLC_W17", "gCT_W17", "gRT_W17", "gLM_W17", "gTg_W17", "gRM_W17", "gLB_W17", "gCB_W17", "gRB_W17", "YEAR")
	new_col_POPTN <- c("gLC_P17", "gCT_P17", "gRT_P17", "gLM_P17", "gTg_P17", "gRM_P17", "gLB_P17", "gCB_P17", "gRB_P17", "YEAR")
	new_col_YNG_POP <- c("gLC_Y17", "gCT_Y17", "gRT_Y17", "gLM_Y17", "gTg_Y17", "gRM_Y17", "gLB_Y17", "gCB_Y17", "gRB_Y17", "YEAR")

	colnames(GRD_BUSNS_17) <- new_col_BUSNS; GRD_BUSNS_17$YEAR <- NULL
	colnames(GRD_HSHD_17) <- new_col_HSHD; GRD_HSHD_17$YEAR <- NULL
	colnames(GRD_RSDNC_17) <- new_col_RSDNC; GRD_RSDNC_17$YEAR <- NULL
	colnames(GRD_WRKRS_17) <- new_col_WRKRS; GRD_WRKRS_17$YEAR <- NULL
	colnames(GRD_POPTN_17) <- new_col_POPTN; GRD_POPTN_17$YEAR <- NULL
	colnames(GRD_YNG_POP_17) <- new_col_YNG_POP; GRD_YNG_POP_17$YEAR <- NULL



	GRD_BUSNS_18 <- subset(GRD_BUSNS, YEAR == 2018)
	GRD_HSHD_18 <- subset(GRD_HSHD, YEAR == 2018)
	GRD_RSDNC_18 <- subset(GRD_RSDNC, YEAR == 2018)
	GRD_WRKRS_18 <- subset(GRD_WRKRS, YEAR == 2018)
	GRD_POPTN_18 <- subset(GRD_POPTN, YEAR == 2018)
	GRD_YNG_POP_18 <- subset(GRD_YNG_POP, YEAR == 2018)

	new_col_BUSNS <- c("gLC_B18", "gCT_B18", "gRT_B18", "gLM_B18", "gTg_B18", "gRM_B18", "gLB_B18", "gCB_B18", "gRB_B18", "YEAR")
	new_col_HSHD <- c("gLC_H18", "gCT_H18", "gRT_H18", "gLM_H18", "gTg_H18", "gRM_H18", "gLB_H18", "gCB_H18", "gRB_H18", "YEAR")
	new_col_RSDNC <- c("gLC_R18", "gCT_R18", "gRT_R18", "gLM_R18", "gTg_R18", "gRM_R18", "gLB_R18", "gCB_R18", "gRB_R18", "YEAR")
	new_col_WRKRS <- c("gLC_W18", "gCT_W18", "gRT_W18", "gLM_W18", "gTg_W18", "gRM_W18", "gLB_W18", "gCB_W18", "gRB_W18", "YEAR")
	new_col_POPTN <- c("gLC_P18", "gCT_P18", "gRT_P18", "gLM_P18", "gTg_P18", "gRM_P18", "gLB_P18", "gCB_P18", "gRB_P18", "YEAR")
	new_col_YNG_POP <- c("gLC_Y18", "gCT_Y18", "gRT_Y18", "gLM_Y18", "gTg_Y18", "gRM_Y18", "gLB_Y18", "gCB_Y18", "gRB_Y18", "YEAR")

	colnames(GRD_BUSNS_18) <- new_col_BUSNS; GRD_BUSNS_18$YEAR <- NULL
	colnames(GRD_HSHD_18) <- new_col_HSHD; GRD_HSHD_18$YEAR <- NULL
	colnames(GRD_RSDNC_18) <- new_col_RSDNC; GRD_RSDNC_18$YEAR <- NULL
	colnames(GRD_WRKRS_18) <- new_col_WRKRS; GRD_WRKRS_18$YEAR <- NULL
	colnames(GRD_POPTN_18) <- new_col_POPTN; GRD_POPTN_18$YEAR <- NULL
	colnames(GRD_YNG_POP_18) <- new_col_YNG_POP; GRD_YNG_POP_18$YEAR <- NULL


	GRD_BUSNS_19 <- subset(GRD_BUSNS, YEAR == 2019)
	GRD_HSHD_19 <- subset(GRD_HSHD, YEAR == 2019)
	GRD_RSDNC_19 <- subset(GRD_RSDNC, YEAR == 2019)
	GRD_WRKRS_19 <- subset(GRD_WRKRS, YEAR == 2019)
	GRD_POPTN_19 <- subset(GRD_POPTN, YEAR == 2019)
	GRD_YNG_POP_19 <- subset(GRD_YNG_POP, YEAR == 2019)

	new_col_BUSNS <- c("gLC_B19", "gCT_B19", "gRT_B19", "gLM_B19", "gTg_B19", "gRM_B19", "gLB_B19", "gCB_B19", "gRB_B19", "YEAR")
	new_col_HSHD <- c("gLC_H19", "gCT_H19", "gRT_H19", "gLM_H19", "gTg_H19", "gRM_H19", "gLB_H19", "gCB_H19", "gRB_H19", "YEAR")
	new_col_RSDNC <- c("gLC_R19", "gCT_R19", "gRT_R19", "gLM_R19", "gTg_R19", "gRM_R19", "gLB_R19", "gCB_R19", "gRB_R19", "YEAR")
	new_col_WRKRS <- c("gLC_W19", "gCT_W19", "gRT_W19", "gLM_W19", "gTg_W19", "gRM_W19", "gLB_W19", "gCB_W19", "gRB_W19", "YEAR")
	new_col_POPTN <- c("gLC_P19", "gCT_P19", "gRT_P19", "gLM_P19", "gTg_P19", "gRM_P19", "gLB_P19", "gCB_P19", "gRB_P19", "YEAR")
	new_col_YNG_POP <- c("gLC_Y19", "gCT_Y19", "gRT_Y19", "gLM_Y19", "gTg_Y19", "gRM_Y19", "gLB_Y19", "gCB_Y19", "gRB_Y19", "YEAR")

	colnames(GRD_BUSNS_19) <- new_col_BUSNS; GRD_BUSNS_19$YEAR <- NULL
	colnames(GRD_HSHD_19) <- new_col_HSHD; GRD_HSHD_19$YEAR <- NULL
	colnames(GRD_RSDNC_19) <- new_col_RSDNC; GRD_RSDNC_19$YEAR <- NULL
	colnames(GRD_WRKRS_19) <- new_col_WRKRS; GRD_WRKRS_19$YEAR <- NULL
	colnames(GRD_POPTN_19) <- new_col_POPTN; GRD_POPTN_19$YEAR <- NULL
	colnames(GRD_YNG_POP_19) <- new_col_YNG_POP; GRD_YNG_POP_19$YEAR <- NULL



	GRD_BUSNS_20 <- subset(GRD_BUSNS, YEAR == 2020)
	GRD_HSHD_20 <- subset(GRD_HSHD, YEAR == 2020)
	GRD_RSDNC_20 <- subset(GRD_RSDNC, YEAR == 2020)
	GRD_WRKRS_20 <- subset(GRD_WRKRS, YEAR == 2020)
	GRD_POPTN_20 <- subset(GRD_POPTN, YEAR == 2020)
	GRD_YNG_POP_20 <- subset(GRD_YNG_POP, YEAR == 2020)

	new_col_BUSNS <- c("gLC_B20", "gCT_B20", "gRT_B20", "gLM_B20", "gTg_B20", "gRM_B20", "gLB_B20", "gCB_B20", "gRB_B20", "YEAR")
	new_col_HSHD <- c("gLC_H20", "gCT_H20", "gRT_H20", "gLM_H20", "gTg_H20", "gRM_H20", "gLB_H20", "gCB_H20", "gRB_H20", "YEAR")
	new_col_RSDNC <- c("gLC_R20", "gCT_R20", "gRT_R20", "gLM_R20", "gTg_R20", "gRM_R20", "gLB_R20", "gCB_R20", "gRB_R20", "YEAR")
	new_col_WRKRS <- c("gLC_W20", "gCT_W20", "gRT_W20", "gLM_W20", "gTg_W20", "gRM_W20", "gLB_W20", "gCB_W20", "gRB_W20", "YEAR")
	new_col_POPTN <- c("gLC_P20", "gCT_P20", "gRT_P20", "gLM_P20", "gTg_P20", "gRM_P20", "gLB_P20", "gCB_P20", "gRB_P20", "YEAR")
	new_col_YNG_POP <- c("gLC_Y20", "gCT_Y20", "gRT_Y20", "gLM_Y20", "gTg_Y20", "gRM_Y20", "gLB_Y20", "gCB_Y20", "gRB_Y20", "YEAR")

	colnames(GRD_BUSNS_20) <- new_col_BUSNS; GRD_BUSNS_20$YEAR <- NULL
	colnames(GRD_HSHD_20) <- new_col_HSHD; GRD_HSHD_20$YEAR <- NULL
	colnames(GRD_RSDNC_20) <- new_col_RSDNC; GRD_RSDNC_20$YEAR <- NULL
	colnames(GRD_WRKRS_20) <- new_col_WRKRS; GRD_WRKRS_20$YEAR <- NULL
	colnames(GRD_POPTN_20) <- new_col_POPTN; GRD_POPTN_20$YEAR <- NULL
	colnames(GRD_YNG_POP_20) <- new_col_YNG_POP; GRD_YNG_POP_20$YEAR <- NULL



	GRD_BUSNS_21 <- subset(GRD_BUSNS, YEAR == 2021)
	GRD_HSHD_21 <- subset(GRD_HSHD, YEAR == 2021)
	GRD_RSDNC_21 <- subset(GRD_RSDNC, YEAR == 2021)
	GRD_WRKRS_21 <- subset(GRD_WRKRS, YEAR == 2021)
	GRD_POPTN_21 <- subset(GRD_POPTN, YEAR == 2021)
	GRD_YNG_POP_21 <- subset(GRD_YNG_POP, YEAR == 2021)

	new_col_BUSNS <- c("gLC_B21", "gCT_B21", "gRT_B21", "gLM_B21", "gTg_B21", "gRM_B21", "gLB_B21", "gCB_B21", "gRB_B21", "YEAR")
	new_col_HSHD <- c("gLC_H21", "gCT_H21", "gRT_H21", "gLM_H21", "gTg_H21", "gRM_H21", "gLB_H21", "gCB_H21", "gRB_H21", "YEAR")
	new_col_RSDNC <- c("gLC_R21", "gCT_R21", "gRT_R21", "gLM_R21", "gTg_R21", "gRM_R21", "gLB_R21", "gCB_R21", "gRB_R21", "YEAR")
	new_col_WRKRS <- c("gLC_W21", "gCT_W21", "gRT_W21", "gLM_W21", "gTg_W21", "gRM_W21", "gLB_W21", "gCB_W21", "gRB_W21", "YEAR")
	new_col_POPTN <- c("gLC_P21", "gCT_P21", "gRT_P21", "gLM_P21", "gTg_P21", "gRM_P21", "gLB_P21", "gCB_P21", "gRB_P21", "YEAR")
	new_col_YNG_POP <- c("gLC_Y21", "gCT_Y21", "gRT_Y21", "gLM_Y21", "gTg_Y21", "gRM_Y21", "gLB_Y21", "gCB_Y21", "gRB_Y21", "YEAR")

	colnames(GRD_BUSNS_21) <- new_col_BUSNS; GRD_BUSNS_21$YEAR <- NULL
	colnames(GRD_HSHD_21) <- new_col_HSHD; GRD_HSHD_21$YEAR <- NULL
	colnames(GRD_RSDNC_21) <- new_col_RSDNC; GRD_RSDNC_21$YEAR <- NULL
	colnames(GRD_WRKRS_21) <- new_col_WRKRS; GRD_WRKRS_21$YEAR <- NULL
	colnames(GRD_POPTN_21) <- new_col_POPTN; GRD_POPTN_21$YEAR <- NULL
	colnames(GRD_YNG_POP_21) <- new_col_YNG_POP; GRD_YNG_POP_21$YEAR <- NULL


	TRAINING_SET <- cbind(
	GRD_BUSNS_00, GRD_HSHD_00, GRD_RSDNC_00, GRD_WRKRS_00, GRD_POPTN_00, GRD_YNG_POP_05, 
	GRD_BUSNS_05, GRD_HSHD_05, GRD_RSDNC_05, GRD_WRKRS_05, GRD_POPTN_05, GRD_YNG_POP_05,
	GRD_BUSNS_10, GRD_HSHD_10, GRD_RSDNC_10, GRD_WRKRS_10, GRD_POPTN_10, GRD_YNG_POP_10, 
	GRD_BUSNS_15, GRD_HSHD_15, GRD_RSDNC_15, GRD_WRKRS_15, GRD_POPTN_15, GRD_YNG_POP_15, 
	GRD_BUSNS_16, GRD_HSHD_16, GRD_RSDNC_16, GRD_WRKRS_16, GRD_POPTN_16, GRD_YNG_POP_16, 
	GRD_BUSNS_17, GRD_HSHD_17, GRD_RSDNC_17, GRD_WRKRS_17, GRD_POPTN_17, GRD_YNG_POP_17, 
	GRD_BUSNS_18, GRD_HSHD_18, GRD_RSDNC_18, GRD_WRKRS_18, GRD_POPTN_18, GRD_YNG_POP_18, 
	GRD_BUSNS_19, GRD_HSHD_19, GRD_RSDNC_19, GRD_WRKRS_19, GRD_POPTN_19, GRD_YNG_POP_19, 
	GRD_BUSNS_20, GRD_HSHD_20, GRD_RSDNC_20, GRD_WRKRS_20, GRD_POPTN_20, GRD_YNG_POP_20, 
	GRD_BUSNS_21, GRD_HSHD_21, GRD_RSDNC_21, GRD_WRKRS_21, GRD_POPTN_21, GRD_YNG_POP_21)

	return(TRAINING_SET)
}




TRAINING_data_TYPE_3 <- function(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP){


	# LEARNING FASHION] LEARNING > TESTING > TUNING (w/ STAT EST.)
	# Young population has only between 2014 - 2024
	#============================ YEARLY DESGIN for LEARNING FASHION =============================#
	#---------------------------------------------------------------------------------------------
	#---------------|-------------- LEARNING --------------|--------------- TESTING --------------
	#   PREDICTION  |      TRAINING-SET     |    TARGET    |      TRAINING-SET     |    TARGET   
	#---------------|-----------------------|--------------|-----------------------|--------------
	#  1year-model  |      2000 ~ 2022      |     2023     |      2005 ~ 2023      |     2025     
	#  2year-model  |      2000 ~ 2021      |     2023     |      2005 ~ 2022      |     2026     
	#  3year-model  |      2000 ~ 2020      |     2023     |      2005 ~ 2021      |     2027     
	#  4year-model  |      2000 ~ 2019      |     2023     |      2005 ~ 2020      |     2028     
	#  5year-model  |      2000 ~ 2018      |     2023     |      2005 ~ 2019      |     2029     
	#  6year-model  |      2000 ~ 2017      |     2023     |      2005 ~ 2018      |     2030     
	#----------------------------------------------------------------------------------------------

	# Total 12 years data) 2000 2005 2010 2015 2016 2017 2018 2019 2020 2021 2022 2023
	# 1year-model: Learning(11)-Target(1) > Testing(11)-Target(1)
	# 2year-model: Learning(10)-Target(1) > Testing(10)-Target(1)
	# 3year-model: Learning(9)-Target(1) > Testing(9)-Target(1)
	# 4year-model: Learning(8)-Target(1) > Testing(8)-Target(1)
	# 5year-model: Learning(7)-Target(1) > Testing(7)-Target(1)
	# 6year-model: Learning(6)-Target(1) > Testing(6)-Target(1)

	GRD_BUSNS_00 <- subset(GRD_BUSNS, YEAR == 2000)
	GRD_HSHD_00 <- subset(GRD_HSHD, YEAR == 2000)
	GRD_RSDNC_00 <- subset(GRD_RSDNC, YEAR == 2000)
	GRD_WRKRS_00 <- subset(GRD_WRKRS, YEAR == 2000)
	GRD_POPTN_00 <- subset(GRD_POPTN, YEAR == 2000)
	GRD_YNG_POP_00 <- subset(GRD_YNG_POP, YEAR == 2000)

	new_col_BUSNS <- c("gLC_B00", "gCT_B00", "gRT_B00", "gLM_B00", "gTg_B00", "gRM_B00", "gLB_B00", "gCB_B00", "gRB_B00", "YEAR")
	new_col_HSHD <- c("gLC_H00", "gCT_H00", "gRT_H00", "gLM_H00", "gTg_H00", "gRM_H00", "gLB_H00", "gCB_H00", "gRB_H00", "YEAR")
	new_col_RSDNC <- c("gLC_R00", "gCT_R00", "gRT_R00", "gLM_R00", "gTg_R00", "gRM_R00", "gLB_R00", "gCB_R00", "gRB_R00", "YEAR")
	new_col_WRKRS <- c("gLC_W00", "gCT_W00", "gRT_W00", "gLM_W00", "gTg_W00", "gRM_W00", "gLB_W00", "gCB_W00", "gRB_W00", "YEAR")
	new_col_POPTN <- c("gLC_P00", "gCT_P00", "gRT_P00", "gLM_P00", "gTg_P00", "gRM_P00", "gLB_P00", "gCB_P00", "gRB_P00", "YEAR")
	new_col_YNG_POP <- c("gLC_Y00", "gCT_Y00", "gRT_Y00", "gLM_Y00", "gTg_Y00", "gRM_Y00", "gLB_Y00", "gCB_Y00", "gRB_Y00", "YEAR")

	colnames(GRD_BUSNS_00) <- new_col_BUSNS; GRD_BUSNS_00$YEAR <- NULL
	colnames(GRD_HSHD_00) <- new_col_HSHD; GRD_HSHD_00$YEAR <- NULL
	colnames(GRD_RSDNC_00) <- new_col_RSDNC; GRD_RSDNC_00$YEAR <- NULL
	colnames(GRD_WRKRS_00) <- new_col_WRKRS; GRD_WRKRS_00$YEAR <- NULL
	colnames(GRD_POPTN_00) <- new_col_POPTN; GRD_POPTN_00$YEAR <- NULL
	colnames(GRD_YNG_POP_00) <- new_col_YNG_POP; GRD_YNG_POP_00$YEAR <- NULL



	GRD_BUSNS_05 <- subset(GRD_BUSNS, YEAR == 2005)
	GRD_HSHD_05 <- subset(GRD_HSHD, YEAR == 2005)
	GRD_RSDNC_05 <- subset(GRD_RSDNC, YEAR == 2005)
	GRD_WRKRS_05 <- subset(GRD_WRKRS, YEAR == 2005)
	GRD_POPTN_05 <- subset(GRD_POPTN, YEAR == 2005)
	GRD_YNG_POP_05 <- subset(GRD_YNG_POP, YEAR == 2005)

	new_col_BUSNS <- c("gLC_B05", "gCT_B05", "gRT_B05", "gLM_B05", "gTg_B05", "gRM_B05", "gLB_B05", "gCB_B05", "gRB_B05", "YEAR")
	new_col_HSHD <- c("gLC_H05", "gCT_H05", "gRT_H05", "gLM_H05", "gTg_H05", "gRM_H05", "gLB_H05", "gCB_H05", "gRB_H05", "YEAR")
	new_col_RSDNC <- c("gLC_R05", "gCT_R05", "gRT_R05", "gLM_R05", "gTg_R05", "gRM_R05", "gLB_R05", "gCB_R05", "gRB_R05", "YEAR")
	new_col_WRKRS <- c("gLC_W05", "gCT_W05", "gRT_W05", "gLM_W05", "gTg_W05", "gRM_W05", "gLB_W05", "gCB_W05", "gRB_W05", "YEAR")
	new_col_POPTN <- c("gLC_P05", "gCT_P05", "gRT_P05", "gLM_P05", "gTg_P05", "gRM_P05", "gLB_P05", "gCB_P05", "gRB_P05", "YEAR")
	new_col_YNG_POP <- c("gLC_Y05", "gCT_Y05", "gRT_Y05", "gLM_Y05", "gTg_Y05", "gRM_Y05", "gLB_Y05", "gCB_Y05", "gRB_Y05", "YEAR")

	colnames(GRD_BUSNS_05) <- new_col_BUSNS; GRD_BUSNS_05$YEAR <- NULL
	colnames(GRD_HSHD_05) <- new_col_HSHD; GRD_HSHD_05$YEAR <- NULL
	colnames(GRD_RSDNC_05) <- new_col_RSDNC; GRD_RSDNC_05$YEAR <- NULL
	colnames(GRD_WRKRS_05) <- new_col_WRKRS; GRD_WRKRS_05$YEAR <- NULL
	colnames(GRD_POPTN_05) <- new_col_POPTN; GRD_POPTN_05$YEAR <- NULL
	colnames(GRD_YNG_POP_05) <- new_col_YNG_POP; GRD_YNG_POP_05$YEAR <- NULL



	GRD_BUSNS_10 <- subset(GRD_BUSNS, YEAR == 2010)
	GRD_HSHD_10 <- subset(GRD_HSHD, YEAR == 2010)
	GRD_RSDNC_10 <- subset(GRD_RSDNC, YEAR == 2010)
	GRD_WRKRS_10 <- subset(GRD_WRKRS, YEAR == 2010)
	GRD_POPTN_10 <- subset(GRD_POPTN, YEAR == 2010)
	GRD_YNG_POP_10 <- subset(GRD_YNG_POP, YEAR == 2010)

	new_col_BUSNS <- c("gLC_B10", "gCT_B10", "gRT_B10", "gLM_B10", "gTg_B10", "gRM_B10", "gLB_B10", "gCB_B10", "gRB_B10", "YEAR")
	new_col_HSHD <- c("gLC_H10", "gCT_H10", "gRT_H10", "gLM_H10", "gTg_H10", "gRM_H10", "gLB_H10", "gCB_H10", "gRB_H10", "YEAR")
	new_col_RSDNC <- c("gLC_R10", "gCT_R10", "gRT_R10", "gLM_R10", "gTg_R10", "gRM_R10", "gLB_R10", "gCB_R10", "gRB_R10", "YEAR")
	new_col_WRKRS <- c("gLC_W10", "gCT_W10", "gRT_W10", "gLM_W10", "gTg_W10", "gRM_W10", "gLB_W10", "gCB_W10", "gRB_W10", "YEAR")
	new_col_POPTN <- c("gLC_P10", "gCT_P10", "gRT_P10", "gLM_P10", "gTg_P10", "gRM_P10", "gLB_P10", "gCB_P10", "gRB_P10", "YEAR")
	new_col_YNG_POP <- c("gLC_Y10", "gCT_Y10", "gRT_Y10", "gLM_Y10", "gTg_Y10", "gRM_Y10", "gLB_Y10", "gCB_Y10", "gRB_Y10", "YEAR")

	colnames(GRD_BUSNS_10) <- new_col_BUSNS; GRD_BUSNS_10$YEAR <- NULL
	colnames(GRD_HSHD_10) <- new_col_HSHD; GRD_HSHD_10$YEAR <- NULL
	colnames(GRD_RSDNC_10) <- new_col_RSDNC; GRD_RSDNC_10$YEAR <- NULL
	colnames(GRD_WRKRS_10) <- new_col_WRKRS; GRD_WRKRS_10$YEAR <- NULL
	colnames(GRD_POPTN_10) <- new_col_POPTN; GRD_POPTN_10$YEAR <- NULL
	colnames(GRD_YNG_POP_10) <- new_col_YNG_POP; GRD_YNG_POP_10$YEAR <- NULL



	GRD_BUSNS_15 <- subset(GRD_BUSNS, YEAR == 2015)
	GRD_HSHD_15 <- subset(GRD_HSHD, YEAR == 2015)
	GRD_RSDNC_15 <- subset(GRD_RSDNC, YEAR == 2015)
	GRD_WRKRS_15 <- subset(GRD_WRKRS, YEAR == 2015)
	GRD_POPTN_15 <- subset(GRD_POPTN, YEAR == 2015)
	GRD_YNG_POP_15 <- subset(GRD_YNG_POP, YEAR == 2015)

	new_col_BUSNS <- c("gLC_B15", "gCT_B15", "gRT_B15", "gLM_B15", "gTg_B15", "gRM_B15", "gLB_B15", "gCB_B15", "gRB_B15", "YEAR")
	new_col_HSHD <- c("gLC_H15", "gCT_H15", "gRT_H15", "gLM_H15", "gTg_H15", "gRM_H15", "gLB_H15", "gCB_H15", "gRB_H15", "YEAR")
	new_col_RSDNC <- c("gLC_R15", "gCT_R15", "gRT_R15", "gLM_R15", "gTg_R15", "gRM_R15", "gLB_R15", "gCB_R15", "gRB_R15", "YEAR")
	new_col_WRKRS <- c("gLC_W15", "gCT_W15", "gRT_W15", "gLM_W15", "gTg_W15", "gRM_W15", "gLB_W15", "gCB_W15", "gRB_W15", "YEAR")
	new_col_POPTN <- c("gLC_P15", "gCT_P15", "gRT_P15", "gLM_P15", "gTg_P15", "gRM_P15", "gLB_P15", "gCB_P15", "gRB_P15", "YEAR")
	new_col_YNG_POP <- c("gLC_Y15", "gCT_Y15", "gRT_Y15", "gLM_Y15", "gTg_Y15", "gRM_Y15", "gLB_Y15", "gCB_Y15", "gRB_Y15", "YEAR")

	colnames(GRD_BUSNS_15) <- new_col_BUSNS; GRD_BUSNS_15$YEAR <- NULL
	colnames(GRD_HSHD_15) <- new_col_HSHD; GRD_HSHD_15$YEAR <- NULL
	colnames(GRD_RSDNC_15) <- new_col_RSDNC; GRD_RSDNC_15$YEAR <- NULL
	colnames(GRD_WRKRS_15) <- new_col_WRKRS; GRD_WRKRS_15$YEAR <- NULL
	colnames(GRD_POPTN_15) <- new_col_POPTN; GRD_POPTN_15$YEAR <- NULL
	colnames(GRD_YNG_POP_15) <- new_col_YNG_POP; GRD_YNG_POP_15$YEAR <- NULL



	GRD_BUSNS_16 <- subset(GRD_BUSNS, YEAR == 2016)
	GRD_HSHD_16 <- subset(GRD_HSHD, YEAR == 2016)
	GRD_RSDNC_16 <- subset(GRD_RSDNC, YEAR == 2016)
	GRD_WRKRS_16 <- subset(GRD_WRKRS, YEAR == 2016)
	GRD_POPTN_16 <- subset(GRD_POPTN, YEAR == 2016)
	GRD_YNG_POP_16 <- subset(GRD_YNG_POP, YEAR == 2016)

	new_col_BUSNS <- c("gLC_B16", "gCT_B16", "gRT_B16", "gLM_B16", "gTg_B16", "gRM_B16", "gLB_B16", "gCB_B16", "gRB_B16", "YEAR")
	new_col_HSHD <- c("gLC_H16", "gCT_H16", "gRT_H16", "gLM_H16", "gTg_H16", "gRM_H16", "gLB_H16", "gCB_H16", "gRB_H16", "YEAR")
	new_col_RSDNC <- c("gLC_R16", "gCT_R16", "gRT_R16", "gLM_R16", "gTg_R16", "gRM_R16", "gLB_R16", "gCB_R16", "gRB_R16", "YEAR")
	new_col_WRKRS <- c("gLC_W16", "gCT_W16", "gRT_W16", "gLM_W16", "gTg_W16", "gRM_W16", "gLB_W16", "gCB_W16", "gRB_W16", "YEAR")
	new_col_POPTN <- c("gLC_P16", "gCT_P16", "gRT_P16", "gLM_P16", "gTg_P16", "gRM_P16", "gLB_P16", "gCB_P16", "gRB_P16", "YEAR")
	new_col_YNG_POP <- c("gLC_Y16", "gCT_Y16", "gRT_Y16", "gLM_Y16", "gTg_Y16", "gRM_Y16", "gLB_Y16", "gCB_Y16", "gRB_Y16", "YEAR")

	colnames(GRD_BUSNS_16) <- new_col_BUSNS; GRD_BUSNS_16$YEAR <- NULL
	colnames(GRD_HSHD_16) <- new_col_HSHD; GRD_HSHD_16$YEAR <- NULL
	colnames(GRD_RSDNC_16) <- new_col_RSDNC; GRD_RSDNC_16$YEAR <- NULL
	colnames(GRD_WRKRS_16) <- new_col_WRKRS; GRD_WRKRS_16$YEAR <- NULL
	colnames(GRD_POPTN_16) <- new_col_POPTN; GRD_POPTN_16$YEAR <- NULL
	colnames(GRD_YNG_POP_16) <- new_col_YNG_POP; GRD_YNG_POP_16$YEAR <- NULL



	GRD_BUSNS_17 <- subset(GRD_BUSNS, YEAR == 2017)
	GRD_HSHD_17 <- subset(GRD_HSHD, YEAR == 2017)
	GRD_RSDNC_17 <- subset(GRD_RSDNC, YEAR == 2017)
	GRD_WRKRS_17 <- subset(GRD_WRKRS, YEAR == 2017)
	GRD_POPTN_17 <- subset(GRD_POPTN, YEAR == 2017)
	GRD_YNG_POP_17 <- subset(GRD_YNG_POP, YEAR == 2017)

	new_col_BUSNS <- c("gLC_B17", "gCT_B17", "gRT_B17", "gLM_B17", "gTg_B17", "gRM_B17", "gLB_B17", "gCB_B17", "gRB_B17", "YEAR")
	new_col_HSHD <- c("gLC_H17", "gCT_H17", "gRT_H17", "gLM_H17", "gTg_H17", "gRM_H17", "gLB_H17", "gCB_H17", "gRB_H17", "YEAR")
	new_col_RSDNC <- c("gLC_R17", "gCT_R17", "gRT_R17", "gLM_R17", "gTg_R17", "gRM_R17", "gLB_R17", "gCB_R17", "gRB_R17", "YEAR")
	new_col_WRKRS <- c("gLC_W17", "gCT_W17", "gRT_W17", "gLM_W17", "gTg_W17", "gRM_W17", "gLB_W17", "gCB_W17", "gRB_W17", "YEAR")
	new_col_POPTN <- c("gLC_P17", "gCT_P17", "gRT_P17", "gLM_P17", "gTg_P17", "gRM_P17", "gLB_P17", "gCB_P17", "gRB_P17", "YEAR")
	new_col_YNG_POP <- c("gLC_Y17", "gCT_Y17", "gRT_Y17", "gLM_Y17", "gTg_Y17", "gRM_Y17", "gLB_Y17", "gCB_Y17", "gRB_Y17", "YEAR")

	colnames(GRD_BUSNS_17) <- new_col_BUSNS; GRD_BUSNS_17$YEAR <- NULL
	colnames(GRD_HSHD_17) <- new_col_HSHD; GRD_HSHD_17$YEAR <- NULL
	colnames(GRD_RSDNC_17) <- new_col_RSDNC; GRD_RSDNC_17$YEAR <- NULL
	colnames(GRD_WRKRS_17) <- new_col_WRKRS; GRD_WRKRS_17$YEAR <- NULL
	colnames(GRD_POPTN_17) <- new_col_POPTN; GRD_POPTN_17$YEAR <- NULL
	colnames(GRD_YNG_POP_17) <- new_col_YNG_POP; GRD_YNG_POP_17$YEAR <- NULL



	GRD_BUSNS_18 <- subset(GRD_BUSNS, YEAR == 2018)
	GRD_HSHD_18 <- subset(GRD_HSHD, YEAR == 2018)
	GRD_RSDNC_18 <- subset(GRD_RSDNC, YEAR == 2018)
	GRD_WRKRS_18 <- subset(GRD_WRKRS, YEAR == 2018)
	GRD_POPTN_18 <- subset(GRD_POPTN, YEAR == 2018)
	GRD_YNG_POP_18 <- subset(GRD_YNG_POP, YEAR == 2018)

	new_col_BUSNS <- c("gLC_B18", "gCT_B18", "gRT_B18", "gLM_B18", "gTg_B18", "gRM_B18", "gLB_B18", "gCB_B18", "gRB_B18", "YEAR")
	new_col_HSHD <- c("gLC_H18", "gCT_H18", "gRT_H18", "gLM_H18", "gTg_H18", "gRM_H18", "gLB_H18", "gCB_H18", "gRB_H18", "YEAR")
	new_col_RSDNC <- c("gLC_R18", "gCT_R18", "gRT_R18", "gLM_R18", "gTg_R18", "gRM_R18", "gLB_R18", "gCB_R18", "gRB_R18", "YEAR")
	new_col_WRKRS <- c("gLC_W18", "gCT_W18", "gRT_W18", "gLM_W18", "gTg_W18", "gRM_W18", "gLB_W18", "gCB_W18", "gRB_W18", "YEAR")
	new_col_POPTN <- c("gLC_P18", "gCT_P18", "gRT_P18", "gLM_P18", "gTg_P18", "gRM_P18", "gLB_P18", "gCB_P18", "gRB_P18", "YEAR")
	new_col_YNG_POP <- c("gLC_Y18", "gCT_Y18", "gRT_Y18", "gLM_Y18", "gTg_Y18", "gRM_Y18", "gLB_Y18", "gCB_Y18", "gRB_Y18", "YEAR")

	colnames(GRD_BUSNS_18) <- new_col_BUSNS; GRD_BUSNS_18$YEAR <- NULL
	colnames(GRD_HSHD_18) <- new_col_HSHD; GRD_HSHD_18$YEAR <- NULL
	colnames(GRD_RSDNC_18) <- new_col_RSDNC; GRD_RSDNC_18$YEAR <- NULL
	colnames(GRD_WRKRS_18) <- new_col_WRKRS; GRD_WRKRS_18$YEAR <- NULL
	colnames(GRD_POPTN_18) <- new_col_POPTN; GRD_POPTN_18$YEAR <- NULL
	colnames(GRD_YNG_POP_18) <- new_col_YNG_POP; GRD_YNG_POP_18$YEAR <- NULL


	GRD_BUSNS_19 <- subset(GRD_BUSNS, YEAR == 2019)
	GRD_HSHD_19 <- subset(GRD_HSHD, YEAR == 2019)
	GRD_RSDNC_19 <- subset(GRD_RSDNC, YEAR == 2019)
	GRD_WRKRS_19 <- subset(GRD_WRKRS, YEAR == 2019)
	GRD_POPTN_19 <- subset(GRD_POPTN, YEAR == 2019)
	GRD_YNG_POP_19 <- subset(GRD_YNG_POP, YEAR == 2019)

	new_col_BUSNS <- c("gLC_B19", "gCT_B19", "gRT_B19", "gLM_B19", "gTg_B19", "gRM_B19", "gLB_B19", "gCB_B19", "gRB_B19", "YEAR")
	new_col_HSHD <- c("gLC_H19", "gCT_H19", "gRT_H19", "gLM_H19", "gTg_H19", "gRM_H19", "gLB_H19", "gCB_H19", "gRB_H19", "YEAR")
	new_col_RSDNC <- c("gLC_R19", "gCT_R19", "gRT_R19", "gLM_R19", "gTg_R19", "gRM_R19", "gLB_R19", "gCB_R19", "gRB_R19", "YEAR")
	new_col_WRKRS <- c("gLC_W19", "gCT_W19", "gRT_W19", "gLM_W19", "gTg_W19", "gRM_W19", "gLB_W19", "gCB_W19", "gRB_W19", "YEAR")
	new_col_POPTN <- c("gLC_P19", "gCT_P19", "gRT_P19", "gLM_P19", "gTg_P19", "gRM_P19", "gLB_P19", "gCB_P19", "gRB_P19", "YEAR")
	new_col_YNG_POP <- c("gLC_Y19", "gCT_Y19", "gRT_Y19", "gLM_Y19", "gTg_Y19", "gRM_Y19", "gLB_Y19", "gCB_Y19", "gRB_Y19", "YEAR")

	colnames(GRD_BUSNS_19) <- new_col_BUSNS; GRD_BUSNS_19$YEAR <- NULL
	colnames(GRD_HSHD_19) <- new_col_HSHD; GRD_HSHD_19$YEAR <- NULL
	colnames(GRD_RSDNC_19) <- new_col_RSDNC; GRD_RSDNC_19$YEAR <- NULL
	colnames(GRD_WRKRS_19) <- new_col_WRKRS; GRD_WRKRS_19$YEAR <- NULL
	colnames(GRD_POPTN_19) <- new_col_POPTN; GRD_POPTN_19$YEAR <- NULL
	colnames(GRD_YNG_POP_19) <- new_col_YNG_POP; GRD_YNG_POP_19$YEAR <- NULL



	GRD_BUSNS_20 <- subset(GRD_BUSNS, YEAR == 2020)
	GRD_HSHD_20 <- subset(GRD_HSHD, YEAR == 2020)
	GRD_RSDNC_20 <- subset(GRD_RSDNC, YEAR == 2020)
	GRD_WRKRS_20 <- subset(GRD_WRKRS, YEAR == 2020)
	GRD_POPTN_20 <- subset(GRD_POPTN, YEAR == 2020)
	GRD_YNG_POP_20 <- subset(GRD_YNG_POP, YEAR == 2020)

	new_col_BUSNS <- c("gLC_B20", "gCT_B20", "gRT_B20", "gLM_B20", "gTg_B20", "gRM_B20", "gLB_B20", "gCB_B20", "gRB_B20", "YEAR")
	new_col_HSHD <- c("gLC_H20", "gCT_H20", "gRT_H20", "gLM_H20", "gTg_H20", "gRM_H20", "gLB_H20", "gCB_H20", "gRB_H20", "YEAR")
	new_col_RSDNC <- c("gLC_R20", "gCT_R20", "gRT_R20", "gLM_R20", "gTg_R20", "gRM_R20", "gLB_R20", "gCB_R20", "gRB_R20", "YEAR")
	new_col_WRKRS <- c("gLC_W20", "gCT_W20", "gRT_W20", "gLM_W20", "gTg_W20", "gRM_W20", "gLB_W20", "gCB_W20", "gRB_W20", "YEAR")
	new_col_POPTN <- c("gLC_P20", "gCT_P20", "gRT_P20", "gLM_P20", "gTg_P20", "gRM_P20", "gLB_P20", "gCB_P20", "gRB_P20", "YEAR")
	new_col_YNG_POP <- c("gLC_Y20", "gCT_Y20", "gRT_Y20", "gLM_Y20", "gTg_Y20", "gRM_Y20", "gLB_Y20", "gCB_Y20", "gRB_Y20", "YEAR")

	colnames(GRD_BUSNS_20) <- new_col_BUSNS; GRD_BUSNS_20$YEAR <- NULL
	colnames(GRD_HSHD_20) <- new_col_HSHD; GRD_HSHD_20$YEAR <- NULL
	colnames(GRD_RSDNC_20) <- new_col_RSDNC; GRD_RSDNC_20$YEAR <- NULL
	colnames(GRD_WRKRS_20) <- new_col_WRKRS; GRD_WRKRS_20$YEAR <- NULL
	colnames(GRD_POPTN_20) <- new_col_POPTN; GRD_POPTN_20$YEAR <- NULL
	colnames(GRD_YNG_POP_20) <- new_col_YNG_POP; GRD_YNG_POP_20$YEAR <- NULL


	TRAINING_SET <- cbind(
	GRD_BUSNS_00, GRD_HSHD_00, GRD_RSDNC_00, GRD_WRKRS_00, GRD_POPTN_00, GRD_YNG_POP_05, 
	GRD_BUSNS_05, GRD_HSHD_05, GRD_RSDNC_05, GRD_WRKRS_05, GRD_POPTN_05, GRD_YNG_POP_05,
	GRD_BUSNS_10, GRD_HSHD_10, GRD_RSDNC_10, GRD_WRKRS_10, GRD_POPTN_10, GRD_YNG_POP_10, 
	GRD_BUSNS_15, GRD_HSHD_15, GRD_RSDNC_15, GRD_WRKRS_15, GRD_POPTN_15, GRD_YNG_POP_15, 
	GRD_BUSNS_16, GRD_HSHD_16, GRD_RSDNC_16, GRD_WRKRS_16, GRD_POPTN_16, GRD_YNG_POP_16, 
	GRD_BUSNS_17, GRD_HSHD_17, GRD_RSDNC_17, GRD_WRKRS_17, GRD_POPTN_17, GRD_YNG_POP_17, 
	GRD_BUSNS_18, GRD_HSHD_18, GRD_RSDNC_18, GRD_WRKRS_18, GRD_POPTN_18, GRD_YNG_POP_18, 
	GRD_BUSNS_19, GRD_HSHD_19, GRD_RSDNC_19, GRD_WRKRS_19, GRD_POPTN_19, GRD_YNG_POP_19, 
	GRD_BUSNS_20, GRD_HSHD_20, GRD_RSDNC_20, GRD_WRKRS_20, GRD_POPTN_20, GRD_YNG_POP_20)

	return(TRAINING_SET)
}




TRAINING_data_TYPE_4 <- function(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP){


	# LEARNING FASHION] LEARNING > TESTING > TUNING (w/ STAT EST.)
	# Young population has only between 2014 - 2024
	#============================ YEARLY DESGIN for LEARNING FASHION =============================#
	#---------------------------------------------------------------------------------------------
	#---------------|-------------- LEARNING --------------|--------------- TESTING --------------
	#   PREDICTION  |      TRAINING-SET     |    TARGET    |      TRAINING-SET     |    TARGET   
	#---------------|-----------------------|--------------|-----------------------|--------------
	#  1year-model  |      2000 ~ 2022      |     2023     |      2005 ~ 2023      |     2025     
	#  2year-model  |      2000 ~ 2021      |     2023     |      2005 ~ 2022      |     2026     
	#  3year-model  |      2000 ~ 2020      |     2023     |      2005 ~ 2021      |     2027     
	#  4year-model  |      2000 ~ 2019      |     2023     |      2005 ~ 2020      |     2028     
	#  5year-model  |      2000 ~ 2018      |     2023     |      2005 ~ 2019      |     2029     
	#  6year-model  |      2000 ~ 2017      |     2023     |      2005 ~ 2018      |     2030     
	#----------------------------------------------------------------------------------------------

	# Total 12 years data) 2000 2005 2010 2015 2016 2017 2018 2019 2020 2021 2022 2023
	# 1year-model: Learning(11)-Target(1) > Testing(11)-Target(1)
	# 2year-model: Learning(10)-Target(1) > Testing(10)-Target(1)
	# 3year-model: Learning(9)-Target(1) > Testing(9)-Target(1)
	# 4year-model: Learning(8)-Target(1) > Testing(8)-Target(1)
	# 5year-model: Learning(7)-Target(1) > Testing(7)-Target(1)
	# 6year-model: Learning(6)-Target(1) > Testing(6)-Target(1)

	GRD_BUSNS_00 <- subset(GRD_BUSNS, YEAR == 2000)
	GRD_HSHD_00 <- subset(GRD_HSHD, YEAR == 2000)
	GRD_RSDNC_00 <- subset(GRD_RSDNC, YEAR == 2000)
	GRD_WRKRS_00 <- subset(GRD_WRKRS, YEAR == 2000)
	GRD_POPTN_00 <- subset(GRD_POPTN, YEAR == 2000)
	GRD_YNG_POP_00 <- subset(GRD_YNG_POP, YEAR == 2000)

	new_col_BUSNS <- c("gLC_B00", "gCT_B00", "gRT_B00", "gLM_B00", "gTg_B00", "gRM_B00", "gLB_B00", "gCB_B00", "gRB_B00", "YEAR")
	new_col_HSHD <- c("gLC_H00", "gCT_H00", "gRT_H00", "gLM_H00", "gTg_H00", "gRM_H00", "gLB_H00", "gCB_H00", "gRB_H00", "YEAR")
	new_col_RSDNC <- c("gLC_R00", "gCT_R00", "gRT_R00", "gLM_R00", "gTg_R00", "gRM_R00", "gLB_R00", "gCB_R00", "gRB_R00", "YEAR")
	new_col_WRKRS <- c("gLC_W00", "gCT_W00", "gRT_W00", "gLM_W00", "gTg_W00", "gRM_W00", "gLB_W00", "gCB_W00", "gRB_W00", "YEAR")
	new_col_POPTN <- c("gLC_P00", "gCT_P00", "gRT_P00", "gLM_P00", "gTg_P00", "gRM_P00", "gLB_P00", "gCB_P00", "gRB_P00", "YEAR")
	new_col_YNG_POP <- c("gLC_Y00", "gCT_Y00", "gRT_Y00", "gLM_Y00", "gTg_Y00", "gRM_Y00", "gLB_Y00", "gCB_Y00", "gRB_Y00", "YEAR")

	colnames(GRD_BUSNS_00) <- new_col_BUSNS; GRD_BUSNS_00$YEAR <- NULL
	colnames(GRD_HSHD_00) <- new_col_HSHD; GRD_HSHD_00$YEAR <- NULL
	colnames(GRD_RSDNC_00) <- new_col_RSDNC; GRD_RSDNC_00$YEAR <- NULL
	colnames(GRD_WRKRS_00) <- new_col_WRKRS; GRD_WRKRS_00$YEAR <- NULL
	colnames(GRD_POPTN_00) <- new_col_POPTN; GRD_POPTN_00$YEAR <- NULL
	colnames(GRD_YNG_POP_00) <- new_col_YNG_POP; GRD_YNG_POP_00$YEAR <- NULL



	GRD_BUSNS_05 <- subset(GRD_BUSNS, YEAR == 2005)
	GRD_HSHD_05 <- subset(GRD_HSHD, YEAR == 2005)
	GRD_RSDNC_05 <- subset(GRD_RSDNC, YEAR == 2005)
	GRD_WRKRS_05 <- subset(GRD_WRKRS, YEAR == 2005)
	GRD_POPTN_05 <- subset(GRD_POPTN, YEAR == 2005)
	GRD_YNG_POP_05 <- subset(GRD_YNG_POP, YEAR == 2005)

	new_col_BUSNS <- c("gLC_B05", "gCT_B05", "gRT_B05", "gLM_B05", "gTg_B05", "gRM_B05", "gLB_B05", "gCB_B05", "gRB_B05", "YEAR")
	new_col_HSHD <- c("gLC_H05", "gCT_H05", "gRT_H05", "gLM_H05", "gTg_H05", "gRM_H05", "gLB_H05", "gCB_H05", "gRB_H05", "YEAR")
	new_col_RSDNC <- c("gLC_R05", "gCT_R05", "gRT_R05", "gLM_R05", "gTg_R05", "gRM_R05", "gLB_R05", "gCB_R05", "gRB_R05", "YEAR")
	new_col_WRKRS <- c("gLC_W05", "gCT_W05", "gRT_W05", "gLM_W05", "gTg_W05", "gRM_W05", "gLB_W05", "gCB_W05", "gRB_W05", "YEAR")
	new_col_POPTN <- c("gLC_P05", "gCT_P05", "gRT_P05", "gLM_P05", "gTg_P05", "gRM_P05", "gLB_P05", "gCB_P05", "gRB_P05", "YEAR")
	new_col_YNG_POP <- c("gLC_Y05", "gCT_Y05", "gRT_Y05", "gLM_Y05", "gTg_Y05", "gRM_Y05", "gLB_Y05", "gCB_Y05", "gRB_Y05", "YEAR")

	colnames(GRD_BUSNS_05) <- new_col_BUSNS; GRD_BUSNS_05$YEAR <- NULL
	colnames(GRD_HSHD_05) <- new_col_HSHD; GRD_HSHD_05$YEAR <- NULL
	colnames(GRD_RSDNC_05) <- new_col_RSDNC; GRD_RSDNC_05$YEAR <- NULL
	colnames(GRD_WRKRS_05) <- new_col_WRKRS; GRD_WRKRS_05$YEAR <- NULL
	colnames(GRD_POPTN_05) <- new_col_POPTN; GRD_POPTN_05$YEAR <- NULL
	colnames(GRD_YNG_POP_05) <- new_col_YNG_POP; GRD_YNG_POP_05$YEAR <- NULL



	GRD_BUSNS_10 <- subset(GRD_BUSNS, YEAR == 2010)
	GRD_HSHD_10 <- subset(GRD_HSHD, YEAR == 2010)
	GRD_RSDNC_10 <- subset(GRD_RSDNC, YEAR == 2010)
	GRD_WRKRS_10 <- subset(GRD_WRKRS, YEAR == 2010)
	GRD_POPTN_10 <- subset(GRD_POPTN, YEAR == 2010)
	GRD_YNG_POP_10 <- subset(GRD_YNG_POP, YEAR == 2010)

	new_col_BUSNS <- c("gLC_B10", "gCT_B10", "gRT_B10", "gLM_B10", "gTg_B10", "gRM_B10", "gLB_B10", "gCB_B10", "gRB_B10", "YEAR")
	new_col_HSHD <- c("gLC_H10", "gCT_H10", "gRT_H10", "gLM_H10", "gTg_H10", "gRM_H10", "gLB_H10", "gCB_H10", "gRB_H10", "YEAR")
	new_col_RSDNC <- c("gLC_R10", "gCT_R10", "gRT_R10", "gLM_R10", "gTg_R10", "gRM_R10", "gLB_R10", "gCB_R10", "gRB_R10", "YEAR")
	new_col_WRKRS <- c("gLC_W10", "gCT_W10", "gRT_W10", "gLM_W10", "gTg_W10", "gRM_W10", "gLB_W10", "gCB_W10", "gRB_W10", "YEAR")
	new_col_POPTN <- c("gLC_P10", "gCT_P10", "gRT_P10", "gLM_P10", "gTg_P10", "gRM_P10", "gLB_P10", "gCB_P10", "gRB_P10", "YEAR")
	new_col_YNG_POP <- c("gLC_Y10", "gCT_Y10", "gRT_Y10", "gLM_Y10", "gTg_Y10", "gRM_Y10", "gLB_Y10", "gCB_Y10", "gRB_Y10", "YEAR")

	colnames(GRD_BUSNS_10) <- new_col_BUSNS; GRD_BUSNS_10$YEAR <- NULL
	colnames(GRD_HSHD_10) <- new_col_HSHD; GRD_HSHD_10$YEAR <- NULL
	colnames(GRD_RSDNC_10) <- new_col_RSDNC; GRD_RSDNC_10$YEAR <- NULL
	colnames(GRD_WRKRS_10) <- new_col_WRKRS; GRD_WRKRS_10$YEAR <- NULL
	colnames(GRD_POPTN_10) <- new_col_POPTN; GRD_POPTN_10$YEAR <- NULL
	colnames(GRD_YNG_POP_10) <- new_col_YNG_POP; GRD_YNG_POP_10$YEAR <- NULL



	GRD_BUSNS_15 <- subset(GRD_BUSNS, YEAR == 2015)
	GRD_HSHD_15 <- subset(GRD_HSHD, YEAR == 2015)
	GRD_RSDNC_15 <- subset(GRD_RSDNC, YEAR == 2015)
	GRD_WRKRS_15 <- subset(GRD_WRKRS, YEAR == 2015)
	GRD_POPTN_15 <- subset(GRD_POPTN, YEAR == 2015)
	GRD_YNG_POP_15 <- subset(GRD_YNG_POP, YEAR == 2015)

	new_col_BUSNS <- c("gLC_B15", "gCT_B15", "gRT_B15", "gLM_B15", "gTg_B15", "gRM_B15", "gLB_B15", "gCB_B15", "gRB_B15", "YEAR")
	new_col_HSHD <- c("gLC_H15", "gCT_H15", "gRT_H15", "gLM_H15", "gTg_H15", "gRM_H15", "gLB_H15", "gCB_H15", "gRB_H15", "YEAR")
	new_col_RSDNC <- c("gLC_R15", "gCT_R15", "gRT_R15", "gLM_R15", "gTg_R15", "gRM_R15", "gLB_R15", "gCB_R15", "gRB_R15", "YEAR")
	new_col_WRKRS <- c("gLC_W15", "gCT_W15", "gRT_W15", "gLM_W15", "gTg_W15", "gRM_W15", "gLB_W15", "gCB_W15", "gRB_W15", "YEAR")
	new_col_POPTN <- c("gLC_P15", "gCT_P15", "gRT_P15", "gLM_P15", "gTg_P15", "gRM_P15", "gLB_P15", "gCB_P15", "gRB_P15", "YEAR")
	new_col_YNG_POP <- c("gLC_Y15", "gCT_Y15", "gRT_Y15", "gLM_Y15", "gTg_Y15", "gRM_Y15", "gLB_Y15", "gCB_Y15", "gRB_Y15", "YEAR")

	colnames(GRD_BUSNS_15) <- new_col_BUSNS; GRD_BUSNS_15$YEAR <- NULL
	colnames(GRD_HSHD_15) <- new_col_HSHD; GRD_HSHD_15$YEAR <- NULL
	colnames(GRD_RSDNC_15) <- new_col_RSDNC; GRD_RSDNC_15$YEAR <- NULL
	colnames(GRD_WRKRS_15) <- new_col_WRKRS; GRD_WRKRS_15$YEAR <- NULL
	colnames(GRD_POPTN_15) <- new_col_POPTN; GRD_POPTN_15$YEAR <- NULL
	colnames(GRD_YNG_POP_15) <- new_col_YNG_POP; GRD_YNG_POP_15$YEAR <- NULL



	GRD_BUSNS_16 <- subset(GRD_BUSNS, YEAR == 2016)
	GRD_HSHD_16 <- subset(GRD_HSHD, YEAR == 2016)
	GRD_RSDNC_16 <- subset(GRD_RSDNC, YEAR == 2016)
	GRD_WRKRS_16 <- subset(GRD_WRKRS, YEAR == 2016)
	GRD_POPTN_16 <- subset(GRD_POPTN, YEAR == 2016)
	GRD_YNG_POP_16 <- subset(GRD_YNG_POP, YEAR == 2016)

	new_col_BUSNS <- c("gLC_B16", "gCT_B16", "gRT_B16", "gLM_B16", "gTg_B16", "gRM_B16", "gLB_B16", "gCB_B16", "gRB_B16", "YEAR")
	new_col_HSHD <- c("gLC_H16", "gCT_H16", "gRT_H16", "gLM_H16", "gTg_H16", "gRM_H16", "gLB_H16", "gCB_H16", "gRB_H16", "YEAR")
	new_col_RSDNC <- c("gLC_R16", "gCT_R16", "gRT_R16", "gLM_R16", "gTg_R16", "gRM_R16", "gLB_R16", "gCB_R16", "gRB_R16", "YEAR")
	new_col_WRKRS <- c("gLC_W16", "gCT_W16", "gRT_W16", "gLM_W16", "gTg_W16", "gRM_W16", "gLB_W16", "gCB_W16", "gRB_W16", "YEAR")
	new_col_POPTN <- c("gLC_P16", "gCT_P16", "gRT_P16", "gLM_P16", "gTg_P16", "gRM_P16", "gLB_P16", "gCB_P16", "gRB_P16", "YEAR")
	new_col_YNG_POP <- c("gLC_Y16", "gCT_Y16", "gRT_Y16", "gLM_Y16", "gTg_Y16", "gRM_Y16", "gLB_Y16", "gCB_Y16", "gRB_Y16", "YEAR")

	colnames(GRD_BUSNS_16) <- new_col_BUSNS; GRD_BUSNS_16$YEAR <- NULL
	colnames(GRD_HSHD_16) <- new_col_HSHD; GRD_HSHD_16$YEAR <- NULL
	colnames(GRD_RSDNC_16) <- new_col_RSDNC; GRD_RSDNC_16$YEAR <- NULL
	colnames(GRD_WRKRS_16) <- new_col_WRKRS; GRD_WRKRS_16$YEAR <- NULL
	colnames(GRD_POPTN_16) <- new_col_POPTN; GRD_POPTN_16$YEAR <- NULL
	colnames(GRD_YNG_POP_16) <- new_col_YNG_POP; GRD_YNG_POP_16$YEAR <- NULL



	GRD_BUSNS_17 <- subset(GRD_BUSNS, YEAR == 2017)
	GRD_HSHD_17 <- subset(GRD_HSHD, YEAR == 2017)
	GRD_RSDNC_17 <- subset(GRD_RSDNC, YEAR == 2017)
	GRD_WRKRS_17 <- subset(GRD_WRKRS, YEAR == 2017)
	GRD_POPTN_17 <- subset(GRD_POPTN, YEAR == 2017)
	GRD_YNG_POP_17 <- subset(GRD_YNG_POP, YEAR == 2017)

	new_col_BUSNS <- c("gLC_B17", "gCT_B17", "gRT_B17", "gLM_B17", "gTg_B17", "gRM_B17", "gLB_B17", "gCB_B17", "gRB_B17", "YEAR")
	new_col_HSHD <- c("gLC_H17", "gCT_H17", "gRT_H17", "gLM_H17", "gTg_H17", "gRM_H17", "gLB_H17", "gCB_H17", "gRB_H17", "YEAR")
	new_col_RSDNC <- c("gLC_R17", "gCT_R17", "gRT_R17", "gLM_R17", "gTg_R17", "gRM_R17", "gLB_R17", "gCB_R17", "gRB_R17", "YEAR")
	new_col_WRKRS <- c("gLC_W17", "gCT_W17", "gRT_W17", "gLM_W17", "gTg_W17", "gRM_W17", "gLB_W17", "gCB_W17", "gRB_W17", "YEAR")
	new_col_POPTN <- c("gLC_P17", "gCT_P17", "gRT_P17", "gLM_P17", "gTg_P17", "gRM_P17", "gLB_P17", "gCB_P17", "gRB_P17", "YEAR")
	new_col_YNG_POP <- c("gLC_Y17", "gCT_Y17", "gRT_Y17", "gLM_Y17", "gTg_Y17", "gRM_Y17", "gLB_Y17", "gCB_Y17", "gRB_Y17", "YEAR")

	colnames(GRD_BUSNS_17) <- new_col_BUSNS; GRD_BUSNS_17$YEAR <- NULL
	colnames(GRD_HSHD_17) <- new_col_HSHD; GRD_HSHD_17$YEAR <- NULL
	colnames(GRD_RSDNC_17) <- new_col_RSDNC; GRD_RSDNC_17$YEAR <- NULL
	colnames(GRD_WRKRS_17) <- new_col_WRKRS; GRD_WRKRS_17$YEAR <- NULL
	colnames(GRD_POPTN_17) <- new_col_POPTN; GRD_POPTN_17$YEAR <- NULL
	colnames(GRD_YNG_POP_17) <- new_col_YNG_POP; GRD_YNG_POP_17$YEAR <- NULL



	GRD_BUSNS_18 <- subset(GRD_BUSNS, YEAR == 2018)
	GRD_HSHD_18 <- subset(GRD_HSHD, YEAR == 2018)
	GRD_RSDNC_18 <- subset(GRD_RSDNC, YEAR == 2018)
	GRD_WRKRS_18 <- subset(GRD_WRKRS, YEAR == 2018)
	GRD_POPTN_18 <- subset(GRD_POPTN, YEAR == 2018)
	GRD_YNG_POP_18 <- subset(GRD_YNG_POP, YEAR == 2018)

	new_col_BUSNS <- c("gLC_B18", "gCT_B18", "gRT_B18", "gLM_B18", "gTg_B18", "gRM_B18", "gLB_B18", "gCB_B18", "gRB_B18", "YEAR")
	new_col_HSHD <- c("gLC_H18", "gCT_H18", "gRT_H18", "gLM_H18", "gTg_H18", "gRM_H18", "gLB_H18", "gCB_H18", "gRB_H18", "YEAR")
	new_col_RSDNC <- c("gLC_R18", "gCT_R18", "gRT_R18", "gLM_R18", "gTg_R18", "gRM_R18", "gLB_R18", "gCB_R18", "gRB_R18", "YEAR")
	new_col_WRKRS <- c("gLC_W18", "gCT_W18", "gRT_W18", "gLM_W18", "gTg_W18", "gRM_W18", "gLB_W18", "gCB_W18", "gRB_W18", "YEAR")
	new_col_POPTN <- c("gLC_P18", "gCT_P18", "gRT_P18", "gLM_P18", "gTg_P18", "gRM_P18", "gLB_P18", "gCB_P18", "gRB_P18", "YEAR")
	new_col_YNG_POP <- c("gLC_Y18", "gCT_Y18", "gRT_Y18", "gLM_Y18", "gTg_Y18", "gRM_Y18", "gLB_Y18", "gCB_Y18", "gRB_Y18", "YEAR")

	colnames(GRD_BUSNS_18) <- new_col_BUSNS; GRD_BUSNS_18$YEAR <- NULL
	colnames(GRD_HSHD_18) <- new_col_HSHD; GRD_HSHD_18$YEAR <- NULL
	colnames(GRD_RSDNC_18) <- new_col_RSDNC; GRD_RSDNC_18$YEAR <- NULL
	colnames(GRD_WRKRS_18) <- new_col_WRKRS; GRD_WRKRS_18$YEAR <- NULL
	colnames(GRD_POPTN_18) <- new_col_POPTN; GRD_POPTN_18$YEAR <- NULL
	colnames(GRD_YNG_POP_18) <- new_col_YNG_POP; GRD_YNG_POP_18$YEAR <- NULL


	GRD_BUSNS_19 <- subset(GRD_BUSNS, YEAR == 2019)
	GRD_HSHD_19 <- subset(GRD_HSHD, YEAR == 2019)
	GRD_RSDNC_19 <- subset(GRD_RSDNC, YEAR == 2019)
	GRD_WRKRS_19 <- subset(GRD_WRKRS, YEAR == 2019)
	GRD_POPTN_19 <- subset(GRD_POPTN, YEAR == 2019)
	GRD_YNG_POP_19 <- subset(GRD_YNG_POP, YEAR == 2019)

	new_col_BUSNS <- c("gLC_B19", "gCT_B19", "gRT_B19", "gLM_B19", "gTg_B19", "gRM_B19", "gLB_B19", "gCB_B19", "gRB_B19", "YEAR")
	new_col_HSHD <- c("gLC_H19", "gCT_H19", "gRT_H19", "gLM_H19", "gTg_H19", "gRM_H19", "gLB_H19", "gCB_H19", "gRB_H19", "YEAR")
	new_col_RSDNC <- c("gLC_R19", "gCT_R19", "gRT_R19", "gLM_R19", "gTg_R19", "gRM_R19", "gLB_R19", "gCB_R19", "gRB_R19", "YEAR")
	new_col_WRKRS <- c("gLC_W19", "gCT_W19", "gRT_W19", "gLM_W19", "gTg_W19", "gRM_W19", "gLB_W19", "gCB_W19", "gRB_W19", "YEAR")
	new_col_POPTN <- c("gLC_P19", "gCT_P19", "gRT_P19", "gLM_P19", "gTg_P19", "gRM_P19", "gLB_P19", "gCB_P19", "gRB_P19", "YEAR")
	new_col_YNG_POP <- c("gLC_Y19", "gCT_Y19", "gRT_Y19", "gLM_Y19", "gTg_Y19", "gRM_Y19", "gLB_Y19", "gCB_Y19", "gRB_Y19", "YEAR")

	colnames(GRD_BUSNS_19) <- new_col_BUSNS; GRD_BUSNS_19$YEAR <- NULL
	colnames(GRD_HSHD_19) <- new_col_HSHD; GRD_HSHD_19$YEAR <- NULL
	colnames(GRD_RSDNC_19) <- new_col_RSDNC; GRD_RSDNC_19$YEAR <- NULL
	colnames(GRD_WRKRS_19) <- new_col_WRKRS; GRD_WRKRS_19$YEAR <- NULL
	colnames(GRD_POPTN_19) <- new_col_POPTN; GRD_POPTN_19$YEAR <- NULL
	colnames(GRD_YNG_POP_19) <- new_col_YNG_POP; GRD_YNG_POP_19$YEAR <- NULL


	TRAINING_SET <- cbind(
	GRD_BUSNS_00, GRD_HSHD_00, GRD_RSDNC_00, GRD_WRKRS_00, GRD_POPTN_00, GRD_YNG_POP_05, 
	GRD_BUSNS_05, GRD_HSHD_05, GRD_RSDNC_05, GRD_WRKRS_05, GRD_POPTN_05, GRD_YNG_POP_05,
	GRD_BUSNS_10, GRD_HSHD_10, GRD_RSDNC_10, GRD_WRKRS_10, GRD_POPTN_10, GRD_YNG_POP_10, 
	GRD_BUSNS_15, GRD_HSHD_15, GRD_RSDNC_15, GRD_WRKRS_15, GRD_POPTN_15, GRD_YNG_POP_15, 
	GRD_BUSNS_16, GRD_HSHD_16, GRD_RSDNC_16, GRD_WRKRS_16, GRD_POPTN_16, GRD_YNG_POP_16, 
	GRD_BUSNS_17, GRD_HSHD_17, GRD_RSDNC_17, GRD_WRKRS_17, GRD_POPTN_17, GRD_YNG_POP_17, 
	GRD_BUSNS_18, GRD_HSHD_18, GRD_RSDNC_18, GRD_WRKRS_18, GRD_POPTN_18, GRD_YNG_POP_18, 
	GRD_BUSNS_19, GRD_HSHD_19, GRD_RSDNC_19, GRD_WRKRS_19, GRD_POPTN_19, GRD_YNG_POP_19)

	return(TRAINING_SET)
}




TRAINING_data_TYPE_5 <- function(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP){


	# LEARNING FASHION] LEARNING > TESTING > TUNING (w/ STAT EST.)
	# Young population has only between 2014 - 2024
	#============================ YEARLY DESGIN for LEARNING FASHION =============================#
	#---------------------------------------------------------------------------------------------
	#---------------|-------------- LEARNING --------------|--------------- TESTING --------------
	#   PREDICTION  |      TRAINING-SET     |    TARGET    |      TRAINING-SET     |    TARGET   
	#---------------|-----------------------|--------------|-----------------------|--------------
	#  1year-model  |      2000 ~ 2022      |     2023     |      2005 ~ 2023      |     2025     
	#  2year-model  |      2000 ~ 2021      |     2023     |      2005 ~ 2022      |     2026     
	#  3year-model  |      2000 ~ 2020      |     2023     |      2005 ~ 2021      |     2027     
	#  4year-model  |      2000 ~ 2019      |     2023     |      2005 ~ 2020      |     2028     
	#  5year-model  |      2000 ~ 2018      |     2023     |      2005 ~ 2019      |     2029     
	#  6year-model  |      2000 ~ 2017      |     2023     |      2005 ~ 2018      |     2030     
	#----------------------------------------------------------------------------------------------

	# Total 12 years data) 2000 2005 2010 2015 2016 2017 2018 2019 2020 2021 2022 2023
	# 1year-model: Learning(11)-Target(1) > Testing(11)-Target(1)
	# 2year-model: Learning(10)-Target(1) > Testing(10)-Target(1)
	# 3year-model: Learning(9)-Target(1) > Testing(9)-Target(1)
	# 4year-model: Learning(8)-Target(1) > Testing(8)-Target(1)
	# 5year-model: Learning(7)-Target(1) > Testing(7)-Target(1)
	# 6year-model: Learning(6)-Target(1) > Testing(6)-Target(1)

	GRD_BUSNS_00 <- subset(GRD_BUSNS, YEAR == 2000)
	GRD_HSHD_00 <- subset(GRD_HSHD, YEAR == 2000)
	GRD_RSDNC_00 <- subset(GRD_RSDNC, YEAR == 2000)
	GRD_WRKRS_00 <- subset(GRD_WRKRS, YEAR == 2000)
	GRD_POPTN_00 <- subset(GRD_POPTN, YEAR == 2000)
	GRD_YNG_POP_00 <- subset(GRD_YNG_POP, YEAR == 2000)

	new_col_BUSNS <- c("gLC_B00", "gCT_B00", "gRT_B00", "gLM_B00", "gTg_B00", "gRM_B00", "gLB_B00", "gCB_B00", "gRB_B00", "YEAR")
	new_col_HSHD <- c("gLC_H00", "gCT_H00", "gRT_H00", "gLM_H00", "gTg_H00", "gRM_H00", "gLB_H00", "gCB_H00", "gRB_H00", "YEAR")
	new_col_RSDNC <- c("gLC_R00", "gCT_R00", "gRT_R00", "gLM_R00", "gTg_R00", "gRM_R00", "gLB_R00", "gCB_R00", "gRB_R00", "YEAR")
	new_col_WRKRS <- c("gLC_W00", "gCT_W00", "gRT_W00", "gLM_W00", "gTg_W00", "gRM_W00", "gLB_W00", "gCB_W00", "gRB_W00", "YEAR")
	new_col_POPTN <- c("gLC_P00", "gCT_P00", "gRT_P00", "gLM_P00", "gTg_P00", "gRM_P00", "gLB_P00", "gCB_P00", "gRB_P00", "YEAR")
	new_col_YNG_POP <- c("gLC_Y00", "gCT_Y00", "gRT_Y00", "gLM_Y00", "gTg_Y00", "gRM_Y00", "gLB_Y00", "gCB_Y00", "gRB_Y00", "YEAR")

	colnames(GRD_BUSNS_00) <- new_col_BUSNS; GRD_BUSNS_00$YEAR <- NULL
	colnames(GRD_HSHD_00) <- new_col_HSHD; GRD_HSHD_00$YEAR <- NULL
	colnames(GRD_RSDNC_00) <- new_col_RSDNC; GRD_RSDNC_00$YEAR <- NULL
	colnames(GRD_WRKRS_00) <- new_col_WRKRS; GRD_WRKRS_00$YEAR <- NULL
	colnames(GRD_POPTN_00) <- new_col_POPTN; GRD_POPTN_00$YEAR <- NULL
	colnames(GRD_YNG_POP_00) <- new_col_YNG_POP; GRD_YNG_POP_00$YEAR <- NULL



	GRD_BUSNS_05 <- subset(GRD_BUSNS, YEAR == 2005)
	GRD_HSHD_05 <- subset(GRD_HSHD, YEAR == 2005)
	GRD_RSDNC_05 <- subset(GRD_RSDNC, YEAR == 2005)
	GRD_WRKRS_05 <- subset(GRD_WRKRS, YEAR == 2005)
	GRD_POPTN_05 <- subset(GRD_POPTN, YEAR == 2005)
	GRD_YNG_POP_05 <- subset(GRD_YNG_POP, YEAR == 2005)

	new_col_BUSNS <- c("gLC_B05", "gCT_B05", "gRT_B05", "gLM_B05", "gTg_B05", "gRM_B05", "gLB_B05", "gCB_B05", "gRB_B05", "YEAR")
	new_col_HSHD <- c("gLC_H05", "gCT_H05", "gRT_H05", "gLM_H05", "gTg_H05", "gRM_H05", "gLB_H05", "gCB_H05", "gRB_H05", "YEAR")
	new_col_RSDNC <- c("gLC_R05", "gCT_R05", "gRT_R05", "gLM_R05", "gTg_R05", "gRM_R05", "gLB_R05", "gCB_R05", "gRB_R05", "YEAR")
	new_col_WRKRS <- c("gLC_W05", "gCT_W05", "gRT_W05", "gLM_W05", "gTg_W05", "gRM_W05", "gLB_W05", "gCB_W05", "gRB_W05", "YEAR")
	new_col_POPTN <- c("gLC_P05", "gCT_P05", "gRT_P05", "gLM_P05", "gTg_P05", "gRM_P05", "gLB_P05", "gCB_P05", "gRB_P05", "YEAR")
	new_col_YNG_POP <- c("gLC_Y05", "gCT_Y05", "gRT_Y05", "gLM_Y05", "gTg_Y05", "gRM_Y05", "gLB_Y05", "gCB_Y05", "gRB_Y05", "YEAR")

	colnames(GRD_BUSNS_05) <- new_col_BUSNS; GRD_BUSNS_05$YEAR <- NULL
	colnames(GRD_HSHD_05) <- new_col_HSHD; GRD_HSHD_05$YEAR <- NULL
	colnames(GRD_RSDNC_05) <- new_col_RSDNC; GRD_RSDNC_05$YEAR <- NULL
	colnames(GRD_WRKRS_05) <- new_col_WRKRS; GRD_WRKRS_05$YEAR <- NULL
	colnames(GRD_POPTN_05) <- new_col_POPTN; GRD_POPTN_05$YEAR <- NULL
	colnames(GRD_YNG_POP_05) <- new_col_YNG_POP; GRD_YNG_POP_05$YEAR <- NULL



	GRD_BUSNS_10 <- subset(GRD_BUSNS, YEAR == 2010)
	GRD_HSHD_10 <- subset(GRD_HSHD, YEAR == 2010)
	GRD_RSDNC_10 <- subset(GRD_RSDNC, YEAR == 2010)
	GRD_WRKRS_10 <- subset(GRD_WRKRS, YEAR == 2010)
	GRD_POPTN_10 <- subset(GRD_POPTN, YEAR == 2010)
	GRD_YNG_POP_10 <- subset(GRD_YNG_POP, YEAR == 2010)

	new_col_BUSNS <- c("gLC_B10", "gCT_B10", "gRT_B10", "gLM_B10", "gTg_B10", "gRM_B10", "gLB_B10", "gCB_B10", "gRB_B10", "YEAR")
	new_col_HSHD <- c("gLC_H10", "gCT_H10", "gRT_H10", "gLM_H10", "gTg_H10", "gRM_H10", "gLB_H10", "gCB_H10", "gRB_H10", "YEAR")
	new_col_RSDNC <- c("gLC_R10", "gCT_R10", "gRT_R10", "gLM_R10", "gTg_R10", "gRM_R10", "gLB_R10", "gCB_R10", "gRB_R10", "YEAR")
	new_col_WRKRS <- c("gLC_W10", "gCT_W10", "gRT_W10", "gLM_W10", "gTg_W10", "gRM_W10", "gLB_W10", "gCB_W10", "gRB_W10", "YEAR")
	new_col_POPTN <- c("gLC_P10", "gCT_P10", "gRT_P10", "gLM_P10", "gTg_P10", "gRM_P10", "gLB_P10", "gCB_P10", "gRB_P10", "YEAR")
	new_col_YNG_POP <- c("gLC_Y10", "gCT_Y10", "gRT_Y10", "gLM_Y10", "gTg_Y10", "gRM_Y10", "gLB_Y10", "gCB_Y10", "gRB_Y10", "YEAR")

	colnames(GRD_BUSNS_10) <- new_col_BUSNS; GRD_BUSNS_10$YEAR <- NULL
	colnames(GRD_HSHD_10) <- new_col_HSHD; GRD_HSHD_10$YEAR <- NULL
	colnames(GRD_RSDNC_10) <- new_col_RSDNC; GRD_RSDNC_10$YEAR <- NULL
	colnames(GRD_WRKRS_10) <- new_col_WRKRS; GRD_WRKRS_10$YEAR <- NULL
	colnames(GRD_POPTN_10) <- new_col_POPTN; GRD_POPTN_10$YEAR <- NULL
	colnames(GRD_YNG_POP_10) <- new_col_YNG_POP; GRD_YNG_POP_10$YEAR <- NULL



	GRD_BUSNS_15 <- subset(GRD_BUSNS, YEAR == 2015)
	GRD_HSHD_15 <- subset(GRD_HSHD, YEAR == 2015)
	GRD_RSDNC_15 <- subset(GRD_RSDNC, YEAR == 2015)
	GRD_WRKRS_15 <- subset(GRD_WRKRS, YEAR == 2015)
	GRD_POPTN_15 <- subset(GRD_POPTN, YEAR == 2015)
	GRD_YNG_POP_15 <- subset(GRD_YNG_POP, YEAR == 2015)

	new_col_BUSNS <- c("gLC_B15", "gCT_B15", "gRT_B15", "gLM_B15", "gTg_B15", "gRM_B15", "gLB_B15", "gCB_B15", "gRB_B15", "YEAR")
	new_col_HSHD <- c("gLC_H15", "gCT_H15", "gRT_H15", "gLM_H15", "gTg_H15", "gRM_H15", "gLB_H15", "gCB_H15", "gRB_H15", "YEAR")
	new_col_RSDNC <- c("gLC_R15", "gCT_R15", "gRT_R15", "gLM_R15", "gTg_R15", "gRM_R15", "gLB_R15", "gCB_R15", "gRB_R15", "YEAR")
	new_col_WRKRS <- c("gLC_W15", "gCT_W15", "gRT_W15", "gLM_W15", "gTg_W15", "gRM_W15", "gLB_W15", "gCB_W15", "gRB_W15", "YEAR")
	new_col_POPTN <- c("gLC_P15", "gCT_P15", "gRT_P15", "gLM_P15", "gTg_P15", "gRM_P15", "gLB_P15", "gCB_P15", "gRB_P15", "YEAR")
	new_col_YNG_POP <- c("gLC_Y15", "gCT_Y15", "gRT_Y15", "gLM_Y15", "gTg_Y15", "gRM_Y15", "gLB_Y15", "gCB_Y15", "gRB_Y15", "YEAR")

	colnames(GRD_BUSNS_15) <- new_col_BUSNS; GRD_BUSNS_15$YEAR <- NULL
	colnames(GRD_HSHD_15) <- new_col_HSHD; GRD_HSHD_15$YEAR <- NULL
	colnames(GRD_RSDNC_15) <- new_col_RSDNC; GRD_RSDNC_15$YEAR <- NULL
	colnames(GRD_WRKRS_15) <- new_col_WRKRS; GRD_WRKRS_15$YEAR <- NULL
	colnames(GRD_POPTN_15) <- new_col_POPTN; GRD_POPTN_15$YEAR <- NULL
	colnames(GRD_YNG_POP_15) <- new_col_YNG_POP; GRD_YNG_POP_15$YEAR <- NULL



	GRD_BUSNS_16 <- subset(GRD_BUSNS, YEAR == 2016)
	GRD_HSHD_16 <- subset(GRD_HSHD, YEAR == 2016)
	GRD_RSDNC_16 <- subset(GRD_RSDNC, YEAR == 2016)
	GRD_WRKRS_16 <- subset(GRD_WRKRS, YEAR == 2016)
	GRD_POPTN_16 <- subset(GRD_POPTN, YEAR == 2016)
	GRD_YNG_POP_16 <- subset(GRD_YNG_POP, YEAR == 2016)

	new_col_BUSNS <- c("gLC_B16", "gCT_B16", "gRT_B16", "gLM_B16", "gTg_B16", "gRM_B16", "gLB_B16", "gCB_B16", "gRB_B16", "YEAR")
	new_col_HSHD <- c("gLC_H16", "gCT_H16", "gRT_H16", "gLM_H16", "gTg_H16", "gRM_H16", "gLB_H16", "gCB_H16", "gRB_H16", "YEAR")
	new_col_RSDNC <- c("gLC_R16", "gCT_R16", "gRT_R16", "gLM_R16", "gTg_R16", "gRM_R16", "gLB_R16", "gCB_R16", "gRB_R16", "YEAR")
	new_col_WRKRS <- c("gLC_W16", "gCT_W16", "gRT_W16", "gLM_W16", "gTg_W16", "gRM_W16", "gLB_W16", "gCB_W16", "gRB_W16", "YEAR")
	new_col_POPTN <- c("gLC_P16", "gCT_P16", "gRT_P16", "gLM_P16", "gTg_P16", "gRM_P16", "gLB_P16", "gCB_P16", "gRB_P16", "YEAR")
	new_col_YNG_POP <- c("gLC_Y16", "gCT_Y16", "gRT_Y16", "gLM_Y16", "gTg_Y16", "gRM_Y16", "gLB_Y16", "gCB_Y16", "gRB_Y16", "YEAR")

	colnames(GRD_BUSNS_16) <- new_col_BUSNS; GRD_BUSNS_16$YEAR <- NULL
	colnames(GRD_HSHD_16) <- new_col_HSHD; GRD_HSHD_16$YEAR <- NULL
	colnames(GRD_RSDNC_16) <- new_col_RSDNC; GRD_RSDNC_16$YEAR <- NULL
	colnames(GRD_WRKRS_16) <- new_col_WRKRS; GRD_WRKRS_16$YEAR <- NULL
	colnames(GRD_POPTN_16) <- new_col_POPTN; GRD_POPTN_16$YEAR <- NULL
	colnames(GRD_YNG_POP_16) <- new_col_YNG_POP; GRD_YNG_POP_16$YEAR <- NULL



	GRD_BUSNS_17 <- subset(GRD_BUSNS, YEAR == 2017)
	GRD_HSHD_17 <- subset(GRD_HSHD, YEAR == 2017)
	GRD_RSDNC_17 <- subset(GRD_RSDNC, YEAR == 2017)
	GRD_WRKRS_17 <- subset(GRD_WRKRS, YEAR == 2017)
	GRD_POPTN_17 <- subset(GRD_POPTN, YEAR == 2017)
	GRD_YNG_POP_17 <- subset(GRD_YNG_POP, YEAR == 2017)

	new_col_BUSNS <- c("gLC_B17", "gCT_B17", "gRT_B17", "gLM_B17", "gTg_B17", "gRM_B17", "gLB_B17", "gCB_B17", "gRB_B17", "YEAR")
	new_col_HSHD <- c("gLC_H17", "gCT_H17", "gRT_H17", "gLM_H17", "gTg_H17", "gRM_H17", "gLB_H17", "gCB_H17", "gRB_H17", "YEAR")
	new_col_RSDNC <- c("gLC_R17", "gCT_R17", "gRT_R17", "gLM_R17", "gTg_R17", "gRM_R17", "gLB_R17", "gCB_R17", "gRB_R17", "YEAR")
	new_col_WRKRS <- c("gLC_W17", "gCT_W17", "gRT_W17", "gLM_W17", "gTg_W17", "gRM_W17", "gLB_W17", "gCB_W17", "gRB_W17", "YEAR")
	new_col_POPTN <- c("gLC_P17", "gCT_P17", "gRT_P17", "gLM_P17", "gTg_P17", "gRM_P17", "gLB_P17", "gCB_P17", "gRB_P17", "YEAR")
	new_col_YNG_POP <- c("gLC_Y17", "gCT_Y17", "gRT_Y17", "gLM_Y17", "gTg_Y17", "gRM_Y17", "gLB_Y17", "gCB_Y17", "gRB_Y17", "YEAR")

	colnames(GRD_BUSNS_17) <- new_col_BUSNS; GRD_BUSNS_17$YEAR <- NULL
	colnames(GRD_HSHD_17) <- new_col_HSHD; GRD_HSHD_17$YEAR <- NULL
	colnames(GRD_RSDNC_17) <- new_col_RSDNC; GRD_RSDNC_17$YEAR <- NULL
	colnames(GRD_WRKRS_17) <- new_col_WRKRS; GRD_WRKRS_17$YEAR <- NULL
	colnames(GRD_POPTN_17) <- new_col_POPTN; GRD_POPTN_17$YEAR <- NULL
	colnames(GRD_YNG_POP_17) <- new_col_YNG_POP; GRD_YNG_POP_17$YEAR <- NULL



	GRD_BUSNS_18 <- subset(GRD_BUSNS, YEAR == 2018)
	GRD_HSHD_18 <- subset(GRD_HSHD, YEAR == 2018)
	GRD_RSDNC_18 <- subset(GRD_RSDNC, YEAR == 2018)
	GRD_WRKRS_18 <- subset(GRD_WRKRS, YEAR == 2018)
	GRD_POPTN_18 <- subset(GRD_POPTN, YEAR == 2018)
	GRD_YNG_POP_18 <- subset(GRD_YNG_POP, YEAR == 2018)

	new_col_BUSNS <- c("gLC_B18", "gCT_B18", "gRT_B18", "gLM_B18", "gTg_B18", "gRM_B18", "gLB_B18", "gCB_B18", "gRB_B18", "YEAR")
	new_col_HSHD <- c("gLC_H18", "gCT_H18", "gRT_H18", "gLM_H18", "gTg_H18", "gRM_H18", "gLB_H18", "gCB_H18", "gRB_H18", "YEAR")
	new_col_RSDNC <- c("gLC_R18", "gCT_R18", "gRT_R18", "gLM_R18", "gTg_R18", "gRM_R18", "gLB_R18", "gCB_R18", "gRB_R18", "YEAR")
	new_col_WRKRS <- c("gLC_W18", "gCT_W18", "gRT_W18", "gLM_W18", "gTg_W18", "gRM_W18", "gLB_W18", "gCB_W18", "gRB_W18", "YEAR")
	new_col_POPTN <- c("gLC_P18", "gCT_P18", "gRT_P18", "gLM_P18", "gTg_P18", "gRM_P18", "gLB_P18", "gCB_P18", "gRB_P18", "YEAR")
	new_col_YNG_POP <- c("gLC_Y18", "gCT_Y18", "gRT_Y18", "gLM_Y18", "gTg_Y18", "gRM_Y18", "gLB_Y18", "gCB_Y18", "gRB_Y18", "YEAR")

	colnames(GRD_BUSNS_18) <- new_col_BUSNS; GRD_BUSNS_18$YEAR <- NULL
	colnames(GRD_HSHD_18) <- new_col_HSHD; GRD_HSHD_18$YEAR <- NULL
	colnames(GRD_RSDNC_18) <- new_col_RSDNC; GRD_RSDNC_18$YEAR <- NULL
	colnames(GRD_WRKRS_18) <- new_col_WRKRS; GRD_WRKRS_18$YEAR <- NULL
	colnames(GRD_POPTN_18) <- new_col_POPTN; GRD_POPTN_18$YEAR <- NULL
	colnames(GRD_YNG_POP_18) <- new_col_YNG_POP; GRD_YNG_POP_18$YEAR <- NULL

	TRAINING_SET <- cbind(
	GRD_BUSNS_00, GRD_HSHD_00, GRD_RSDNC_00, GRD_WRKRS_00, GRD_POPTN_00, GRD_YNG_POP_05, 
	GRD_BUSNS_05, GRD_HSHD_05, GRD_RSDNC_05, GRD_WRKRS_05, GRD_POPTN_05, GRD_YNG_POP_05,
	GRD_BUSNS_10, GRD_HSHD_10, GRD_RSDNC_10, GRD_WRKRS_10, GRD_POPTN_10, GRD_YNG_POP_10, 
	GRD_BUSNS_15, GRD_HSHD_15, GRD_RSDNC_15, GRD_WRKRS_15, GRD_POPTN_15, GRD_YNG_POP_15, 
	GRD_BUSNS_16, GRD_HSHD_16, GRD_RSDNC_16, GRD_WRKRS_16, GRD_POPTN_16, GRD_YNG_POP_16, 
	GRD_BUSNS_17, GRD_HSHD_17, GRD_RSDNC_17, GRD_WRKRS_17, GRD_POPTN_17, GRD_YNG_POP_17, 
	GRD_BUSNS_18, GRD_HSHD_18, GRD_RSDNC_18, GRD_WRKRS_18, GRD_POPTN_18, GRD_YNG_POP_18)

	return(TRAINING_SET)
}




TRAINING_data_TYPE_6 <- function(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP){


	# LEARNING FASHION] LEARNING > TESTING > TUNING (w/ STAT EST.)
	# Young population has only between 2014 - 2024
	#============================ YEARLY DESGIN for LEARNING FASHION =============================#
	#---------------------------------------------------------------------------------------------
	#---------------|-------------- LEARNING --------------|--------------- TESTING --------------
	#   PREDICTION  |      TRAINING-SET     |    TARGET    |      TRAINING-SET     |    TARGET   
	#---------------|-----------------------|--------------|-----------------------|--------------
	#  1year-model  |      2000 ~ 2022      |     2023     |      2005 ~ 2023      |     2025     
	#  2year-model  |      2000 ~ 2021      |     2023     |      2005 ~ 2022      |     2026     
	#  3year-model  |      2000 ~ 2020      |     2023     |      2005 ~ 2021      |     2027     
	#  4year-model  |      2000 ~ 2019      |     2023     |      2005 ~ 2020      |     2028     
	#  5year-model  |      2000 ~ 2018      |     2023     |      2005 ~ 2019      |     2029     
	#  6year-model  |      2000 ~ 2017      |     2023     |      2005 ~ 2018      |     2030     
	#----------------------------------------------------------------------------------------------

	# Total 12 years data) 2000 2005 2010 2015 2016 2017 2018 2019 2020 2021 2022 2023
	# 1year-model: Learning(11)-Target(1) > Testing(11)-Target(1)
	# 2year-model: Learning(10)-Target(1) > Testing(10)-Target(1)
	# 3year-model: Learning(9)-Target(1) > Testing(9)-Target(1)
	# 4year-model: Learning(8)-Target(1) > Testing(8)-Target(1)
	# 5year-model: Learning(7)-Target(1) > Testing(7)-Target(1)
	# 6year-model: Learning(6)-Target(1) > Testing(6)-Target(1)

	GRD_BUSNS_00 <- subset(GRD_BUSNS, YEAR == 2000)
	GRD_HSHD_00 <- subset(GRD_HSHD, YEAR == 2000)
	GRD_RSDNC_00 <- subset(GRD_RSDNC, YEAR == 2000)
	GRD_WRKRS_00 <- subset(GRD_WRKRS, YEAR == 2000)
	GRD_POPTN_00 <- subset(GRD_POPTN, YEAR == 2000)
	GRD_YNG_POP_00 <- subset(GRD_YNG_POP, YEAR == 2000)

	new_col_BUSNS <- c("gLC_B00", "gCT_B00", "gRT_B00", "gLM_B00", "gTg_B00", "gRM_B00", "gLB_B00", "gCB_B00", "gRB_B00", "YEAR")
	new_col_HSHD <- c("gLC_H00", "gCT_H00", "gRT_H00", "gLM_H00", "gTg_H00", "gRM_H00", "gLB_H00", "gCB_H00", "gRB_H00", "YEAR")
	new_col_RSDNC <- c("gLC_R00", "gCT_R00", "gRT_R00", "gLM_R00", "gTg_R00", "gRM_R00", "gLB_R00", "gCB_R00", "gRB_R00", "YEAR")
	new_col_WRKRS <- c("gLC_W00", "gCT_W00", "gRT_W00", "gLM_W00", "gTg_W00", "gRM_W00", "gLB_W00", "gCB_W00", "gRB_W00", "YEAR")
	new_col_POPTN <- c("gLC_P00", "gCT_P00", "gRT_P00", "gLM_P00", "gTg_P00", "gRM_P00", "gLB_P00", "gCB_P00", "gRB_P00", "YEAR")
	new_col_YNG_POP <- c("gLC_Y00", "gCT_Y00", "gRT_Y00", "gLM_Y00", "gTg_Y00", "gRM_Y00", "gLB_Y00", "gCB_Y00", "gRB_Y00", "YEAR")

	colnames(GRD_BUSNS_00) <- new_col_BUSNS; GRD_BUSNS_00$YEAR <- NULL
	colnames(GRD_HSHD_00) <- new_col_HSHD; GRD_HSHD_00$YEAR <- NULL
	colnames(GRD_RSDNC_00) <- new_col_RSDNC; GRD_RSDNC_00$YEAR <- NULL
	colnames(GRD_WRKRS_00) <- new_col_WRKRS; GRD_WRKRS_00$YEAR <- NULL
	colnames(GRD_POPTN_00) <- new_col_POPTN; GRD_POPTN_00$YEAR <- NULL
	colnames(GRD_YNG_POP_00) <- new_col_YNG_POP; GRD_YNG_POP_00$YEAR <- NULL



	GRD_BUSNS_05 <- subset(GRD_BUSNS, YEAR == 2005)
	GRD_HSHD_05 <- subset(GRD_HSHD, YEAR == 2005)
	GRD_RSDNC_05 <- subset(GRD_RSDNC, YEAR == 2005)
	GRD_WRKRS_05 <- subset(GRD_WRKRS, YEAR == 2005)
	GRD_POPTN_05 <- subset(GRD_POPTN, YEAR == 2005)
	GRD_YNG_POP_05 <- subset(GRD_YNG_POP, YEAR == 2005)

	new_col_BUSNS <- c("gLC_B05", "gCT_B05", "gRT_B05", "gLM_B05", "gTg_B05", "gRM_B05", "gLB_B05", "gCB_B05", "gRB_B05", "YEAR")
	new_col_HSHD <- c("gLC_H05", "gCT_H05", "gRT_H05", "gLM_H05", "gTg_H05", "gRM_H05", "gLB_H05", "gCB_H05", "gRB_H05", "YEAR")
	new_col_RSDNC <- c("gLC_R05", "gCT_R05", "gRT_R05", "gLM_R05", "gTg_R05", "gRM_R05", "gLB_R05", "gCB_R05", "gRB_R05", "YEAR")
	new_col_WRKRS <- c("gLC_W05", "gCT_W05", "gRT_W05", "gLM_W05", "gTg_W05", "gRM_W05", "gLB_W05", "gCB_W05", "gRB_W05", "YEAR")
	new_col_POPTN <- c("gLC_P05", "gCT_P05", "gRT_P05", "gLM_P05", "gTg_P05", "gRM_P05", "gLB_P05", "gCB_P05", "gRB_P05", "YEAR")
	new_col_YNG_POP <- c("gLC_Y05", "gCT_Y05", "gRT_Y05", "gLM_Y05", "gTg_Y05", "gRM_Y05", "gLB_Y05", "gCB_Y05", "gRB_Y05", "YEAR")

	colnames(GRD_BUSNS_05) <- new_col_BUSNS; GRD_BUSNS_05$YEAR <- NULL
	colnames(GRD_HSHD_05) <- new_col_HSHD; GRD_HSHD_05$YEAR <- NULL
	colnames(GRD_RSDNC_05) <- new_col_RSDNC; GRD_RSDNC_05$YEAR <- NULL
	colnames(GRD_WRKRS_05) <- new_col_WRKRS; GRD_WRKRS_05$YEAR <- NULL
	colnames(GRD_POPTN_05) <- new_col_POPTN; GRD_POPTN_05$YEAR <- NULL
	colnames(GRD_YNG_POP_05) <- new_col_YNG_POP; GRD_YNG_POP_05$YEAR <- NULL


	GRD_BUSNS_10 <- subset(GRD_BUSNS, YEAR == 2010)
	GRD_HSHD_10 <- subset(GRD_HSHD, YEAR == 2010)
	GRD_RSDNC_10 <- subset(GRD_RSDNC, YEAR == 2010)
	GRD_WRKRS_10 <- subset(GRD_WRKRS, YEAR == 2010)
	GRD_POPTN_10 <- subset(GRD_POPTN, YEAR == 2010)
	GRD_YNG_POP_10 <- subset(GRD_YNG_POP, YEAR == 2010)

	new_col_BUSNS <- c("gLC_B10", "gCT_B10", "gRT_B10", "gLM_B10", "gTg_B10", "gRM_B10", "gLB_B10", "gCB_B10", "gRB_B10", "YEAR")
	new_col_HSHD <- c("gLC_H10", "gCT_H10", "gRT_H10", "gLM_H10", "gTg_H10", "gRM_H10", "gLB_H10", "gCB_H10", "gRB_H10", "YEAR")
	new_col_RSDNC <- c("gLC_R10", "gCT_R10", "gRT_R10", "gLM_R10", "gTg_R10", "gRM_R10", "gLB_R10", "gCB_R10", "gRB_R10", "YEAR")
	new_col_WRKRS <- c("gLC_W10", "gCT_W10", "gRT_W10", "gLM_W10", "gTg_W10", "gRM_W10", "gLB_W10", "gCB_W10", "gRB_W10", "YEAR")
	new_col_POPTN <- c("gLC_P10", "gCT_P10", "gRT_P10", "gLM_P10", "gTg_P10", "gRM_P10", "gLB_P10", "gCB_P10", "gRB_P10", "YEAR")
	new_col_YNG_POP <- c("gLC_Y10", "gCT_Y10", "gRT_Y10", "gLM_Y10", "gTg_Y10", "gRM_Y10", "gLB_Y10", "gCB_Y10", "gRB_Y10", "YEAR")

	colnames(GRD_BUSNS_10) <- new_col_BUSNS; GRD_BUSNS_10$YEAR <- NULL
	colnames(GRD_HSHD_10) <- new_col_HSHD; GRD_HSHD_10$YEAR <- NULL
	colnames(GRD_RSDNC_10) <- new_col_RSDNC; GRD_RSDNC_10$YEAR <- NULL
	colnames(GRD_WRKRS_10) <- new_col_WRKRS; GRD_WRKRS_10$YEAR <- NULL
	colnames(GRD_POPTN_10) <- new_col_POPTN; GRD_POPTN_10$YEAR <- NULL
	colnames(GRD_YNG_POP_10) <- new_col_YNG_POP; GRD_YNG_POP_10$YEAR <- NULL


	GRD_BUSNS_15 <- subset(GRD_BUSNS, YEAR == 2015)
	GRD_HSHD_15 <- subset(GRD_HSHD, YEAR == 2015)
	GRD_RSDNC_15 <- subset(GRD_RSDNC, YEAR == 2015)
	GRD_WRKRS_15 <- subset(GRD_WRKRS, YEAR == 2015)
	GRD_POPTN_15 <- subset(GRD_POPTN, YEAR == 2015)
	GRD_YNG_POP_15 <- subset(GRD_YNG_POP, YEAR == 2015)

	new_col_BUSNS <- c("gLC_B15", "gCT_B15", "gRT_B15", "gLM_B15", "gTg_B15", "gRM_B15", "gLB_B15", "gCB_B15", "gRB_B15", "YEAR")
	new_col_HSHD <- c("gLC_H15", "gCT_H15", "gRT_H15", "gLM_H15", "gTg_H15", "gRM_H15", "gLB_H15", "gCB_H15", "gRB_H15", "YEAR")
	new_col_RSDNC <- c("gLC_R15", "gCT_R15", "gRT_R15", "gLM_R15", "gTg_R15", "gRM_R15", "gLB_R15", "gCB_R15", "gRB_R15", "YEAR")
	new_col_WRKRS <- c("gLC_W15", "gCT_W15", "gRT_W15", "gLM_W15", "gTg_W15", "gRM_W15", "gLB_W15", "gCB_W15", "gRB_W15", "YEAR")
	new_col_POPTN <- c("gLC_P15", "gCT_P15", "gRT_P15", "gLM_P15", "gTg_P15", "gRM_P15", "gLB_P15", "gCB_P15", "gRB_P15", "YEAR")
	new_col_YNG_POP <- c("gLC_Y15", "gCT_Y15", "gRT_Y15", "gLM_Y15", "gTg_Y15", "gRM_Y15", "gLB_Y15", "gCB_Y15", "gRB_Y15", "YEAR")

	colnames(GRD_BUSNS_15) <- new_col_BUSNS; GRD_BUSNS_15$YEAR <- NULL
	colnames(GRD_HSHD_15) <- new_col_HSHD; GRD_HSHD_15$YEAR <- NULL
	colnames(GRD_RSDNC_15) <- new_col_RSDNC; GRD_RSDNC_15$YEAR <- NULL
	colnames(GRD_WRKRS_15) <- new_col_WRKRS; GRD_WRKRS_15$YEAR <- NULL
	colnames(GRD_POPTN_15) <- new_col_POPTN; GRD_POPTN_15$YEAR <- NULL
	colnames(GRD_YNG_POP_15) <- new_col_YNG_POP; GRD_YNG_POP_15$YEAR <- NULL



	GRD_BUSNS_16 <- subset(GRD_BUSNS, YEAR == 2016)
	GRD_HSHD_16 <- subset(GRD_HSHD, YEAR == 2016)
	GRD_RSDNC_16 <- subset(GRD_RSDNC, YEAR == 2016)
	GRD_WRKRS_16 <- subset(GRD_WRKRS, YEAR == 2016)
	GRD_POPTN_16 <- subset(GRD_POPTN, YEAR == 2016)
	GRD_YNG_POP_16 <- subset(GRD_YNG_POP, YEAR == 2016)

	new_col_BUSNS <- c("gLC_B16", "gCT_B16", "gRT_B16", "gLM_B16", "gTg_B16", "gRM_B16", "gLB_B16", "gCB_B16", "gRB_B16", "YEAR")
	new_col_HSHD <- c("gLC_H16", "gCT_H16", "gRT_H16", "gLM_H16", "gTg_H16", "gRM_H16", "gLB_H16", "gCB_H16", "gRB_H16", "YEAR")
	new_col_RSDNC <- c("gLC_R16", "gCT_R16", "gRT_R16", "gLM_R16", "gTg_R16", "gRM_R16", "gLB_R16", "gCB_R16", "gRB_R16", "YEAR")
	new_col_WRKRS <- c("gLC_W16", "gCT_W16", "gRT_W16", "gLM_W16", "gTg_W16", "gRM_W16", "gLB_W16", "gCB_W16", "gRB_W16", "YEAR")
	new_col_POPTN <- c("gLC_P16", "gCT_P16", "gRT_P16", "gLM_P16", "gTg_P16", "gRM_P16", "gLB_P16", "gCB_P16", "gRB_P16", "YEAR")
	new_col_YNG_POP <- c("gLC_Y16", "gCT_Y16", "gRT_Y16", "gLM_Y16", "gTg_Y16", "gRM_Y16", "gLB_Y16", "gCB_Y16", "gRB_Y16", "YEAR")

	colnames(GRD_BUSNS_16) <- new_col_BUSNS; GRD_BUSNS_16$YEAR <- NULL
	colnames(GRD_HSHD_16) <- new_col_HSHD; GRD_HSHD_16$YEAR <- NULL
	colnames(GRD_RSDNC_16) <- new_col_RSDNC; GRD_RSDNC_16$YEAR <- NULL
	colnames(GRD_WRKRS_16) <- new_col_WRKRS; GRD_WRKRS_16$YEAR <- NULL
	colnames(GRD_POPTN_16) <- new_col_POPTN; GRD_POPTN_16$YEAR <- NULL
	colnames(GRD_YNG_POP_16) <- new_col_YNG_POP; GRD_YNG_POP_16$YEAR <- NULL



	GRD_BUSNS_17 <- subset(GRD_BUSNS, YEAR == 2017)
	GRD_HSHD_17 <- subset(GRD_HSHD, YEAR == 2017)
	GRD_RSDNC_17 <- subset(GRD_RSDNC, YEAR == 2017)
	GRD_WRKRS_17 <- subset(GRD_WRKRS, YEAR == 2017)
	GRD_POPTN_17 <- subset(GRD_POPTN, YEAR == 2017)
	GRD_YNG_POP_17 <- subset(GRD_YNG_POP, YEAR == 2017)

	new_col_BUSNS <- c("gLC_B17", "gCT_B17", "gRT_B17", "gLM_B17", "gTg_B17", "gRM_B17", "gLB_B17", "gCB_B17", "gRB_B17", "YEAR")
	new_col_HSHD <- c("gLC_H17", "gCT_H17", "gRT_H17", "gLM_H17", "gTg_H17", "gRM_H17", "gLB_H17", "gCB_H17", "gRB_H17", "YEAR")
	new_col_RSDNC <- c("gLC_R17", "gCT_R17", "gRT_R17", "gLM_R17", "gTg_R17", "gRM_R17", "gLB_R17", "gCB_R17", "gRB_R17", "YEAR")
	new_col_WRKRS <- c("gLC_W17", "gCT_W17", "gRT_W17", "gLM_W17", "gTg_W17", "gRM_W17", "gLB_W17", "gCB_W17", "gRB_W17", "YEAR")
	new_col_POPTN <- c("gLC_P17", "gCT_P17", "gRT_P17", "gLM_P17", "gTg_P17", "gRM_P17", "gLB_P17", "gCB_P17", "gRB_P17", "YEAR")
	new_col_YNG_POP <- c("gLC_Y17", "gCT_Y17", "gRT_Y17", "gLM_Y17", "gTg_Y17", "gRM_Y17", "gLB_Y17", "gCB_Y17", "gRB_Y17", "YEAR")

	colnames(GRD_BUSNS_17) <- new_col_BUSNS; GRD_BUSNS_17$YEAR <- NULL
	colnames(GRD_HSHD_17) <- new_col_HSHD; GRD_HSHD_17$YEAR <- NULL
	colnames(GRD_RSDNC_17) <- new_col_RSDNC; GRD_RSDNC_17$YEAR <- NULL
	colnames(GRD_WRKRS_17) <- new_col_WRKRS; GRD_WRKRS_17$YEAR <- NULL
	colnames(GRD_POPTN_17) <- new_col_POPTN; GRD_POPTN_17$YEAR <- NULL
	colnames(GRD_YNG_POP_17) <- new_col_YNG_POP; GRD_YNG_POP_17$YEAR <- NULL



	GRD_BUSNS_18 <- subset(GRD_BUSNS, YEAR == 2018)
	GRD_HSHD_18 <- subset(GRD_HSHD, YEAR == 2018)
	GRD_RSDNC_18 <- subset(GRD_RSDNC, YEAR == 2018)
	GRD_WRKRS_18 <- subset(GRD_WRKRS, YEAR == 2018)
	GRD_POPTN_18 <- subset(GRD_POPTN, YEAR == 2018)
	GRD_YNG_POP_18 <- subset(GRD_YNG_POP, YEAR == 2018)

	new_col_BUSNS <- c("gLC_B18", "gCT_B18", "gRT_B18", "gLM_B18", "gTg_B18", "gRM_B18", "gLB_B18", "gCB_B18", "gRB_B18", "YEAR")
	new_col_HSHD <- c("gLC_H18", "gCT_H18", "gRT_H18", "gLM_H18", "gTg_H18", "gRM_H18", "gLB_H18", "gCB_H18", "gRB_H18", "YEAR")
	new_col_RSDNC <- c("gLC_R18", "gCT_R18", "gRT_R18", "gLM_R18", "gTg_R18", "gRM_R18", "gLB_R18", "gCB_R18", "gRB_R18", "YEAR")
	new_col_WRKRS <- c("gLC_W18", "gCT_W18", "gRT_W18", "gLM_W18", "gTg_W18", "gRM_W18", "gLB_W18", "gCB_W18", "gRB_W18", "YEAR")
	new_col_POPTN <- c("gLC_P18", "gCT_P18", "gRT_P18", "gLM_P18", "gTg_P18", "gRM_P18", "gLB_P18", "gCB_P18", "gRB_P18", "YEAR")
	new_col_YNG_POP <- c("gLC_Y18", "gCT_Y18", "gRT_Y18", "gLM_Y18", "gTg_Y18", "gRM_Y18", "gLB_Y18", "gCB_Y18", "gRB_Y18", "YEAR")

	colnames(GRD_BUSNS_18) <- new_col_BUSNS; GRD_BUSNS_18$YEAR <- NULL
	colnames(GRD_HSHD_18) <- new_col_HSHD; GRD_HSHD_18$YEAR <- NULL
	colnames(GRD_RSDNC_18) <- new_col_RSDNC; GRD_RSDNC_18$YEAR <- NULL
	colnames(GRD_WRKRS_18) <- new_col_WRKRS; GRD_WRKRS_18$YEAR <- NULL
	colnames(GRD_POPTN_18) <- new_col_POPTN; GRD_POPTN_18$YEAR <- NULL
	colnames(GRD_YNG_POP_18) <- new_col_YNG_POP; GRD_YNG_POP_18$YEAR <- NULL

	TRAINING_SET <- cbind(
	GRD_BUSNS_00, GRD_HSHD_00, GRD_RSDNC_00, GRD_WRKRS_00, GRD_POPTN_00, GRD_YNG_POP_05, 
	GRD_BUSNS_05, GRD_HSHD_05, GRD_RSDNC_05, GRD_WRKRS_05, GRD_POPTN_05, GRD_YNG_POP_05, 
	GRD_BUSNS_10, GRD_HSHD_10, GRD_RSDNC_10, GRD_WRKRS_10, GRD_POPTN_10, GRD_YNG_POP_10, 
	GRD_BUSNS_15, GRD_HSHD_15, GRD_RSDNC_15, GRD_WRKRS_15, GRD_POPTN_15, GRD_YNG_POP_15, 
	GRD_BUSNS_16, GRD_HSHD_16, GRD_RSDNC_16, GRD_WRKRS_16, GRD_POPTN_16, GRD_YNG_POP_16, 
	GRD_BUSNS_17, GRD_HSHD_17, GRD_RSDNC_17, GRD_WRKRS_17, GRD_POPTN_17, GRD_YNG_POP_17)

	return(TRAINING_SET)
}







############################################ TESTING DATA PREPARATION


TESTING_data_TYPE_1 <- function(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP){


	# LEARNING FASHION] LEARNING > TESTING > TUNING (w/ STAT EST.)
	# Young population has only between 2014 - 2024
	#============================ YEARLY DESGIN for LEARNING FASHION =============================#
	#---------------------------------------------------------------------------------------------
	#---------------|-------------- LEARNING --------------|--------------- TESTING --------------
	#   PREDICTION  |      TRAINING-SET     |    TARGET    |      TRAINING-SET     |    TARGET   
	#---------------|-----------------------|--------------|-----------------------|--------------
	#  1year-model  |      2000 ~ 2022      |     2023     |      2005 ~ 2023      |     2025     
	#  2year-model  |      2000 ~ 2021      |     2023     |      2005 ~ 2022      |     2026     
	#  3year-model  |      2000 ~ 2020      |     2023     |      2005 ~ 2021      |     2027     
	#  4year-model  |      2000 ~ 2019      |     2023     |      2005 ~ 2020      |     2028     
	#  5year-model  |      2000 ~ 2018      |     2023     |      2005 ~ 2019      |     2029     
	#  6year-model  |      2000 ~ 2017      |     2023     |      2005 ~ 2018      |     2030     
	#----------------------------------------------------------------------------------------------

	# Total 12 years data) 2000 2005 2010 2015 2016 2017 2018 2019 2020 2021 2022 2023
	# 1year-model: Learning(11)-Target(1) > Testing(11)-Target(1)
	# 2year-model: Learning(10)-Target(1) > Testing(10)-Target(1)
	# 3year-model: Learning(9)-Target(1) > Testing(9)-Target(1)
	# 4year-model: Learning(8)-Target(1) > Testing(8)-Target(1)
	# 5year-model: Learning(7)-Target(1) > Testing(7)-Target(1)
	# 6year-model: Learning(6)-Target(1) > Testing(6)-Target(1)

	GRD_BUSNS_05 <- subset(GRD_BUSNS, YEAR == 2005)
	GRD_HSHD_05 <- subset(GRD_HSHD, YEAR == 2005)
	GRD_RSDNC_05 <- subset(GRD_RSDNC, YEAR == 2005)
	GRD_WRKRS_05 <- subset(GRD_WRKRS, YEAR == 2005)
	GRD_POPTN_05 <- subset(GRD_POPTN, YEAR == 2005)
	GRD_YNG_POP_05 <- subset(GRD_YNG_POP, YEAR == 2005)

	new_col_BUSNS <- c("gLC_B05", "gCT_B05", "gRT_B05", "gLM_B05", "gTg_B05", "gRM_B05", "gLB_B05", "gCB_B05", "gRB_B05", "YEAR")
	new_col_HSHD <- c("gLC_H05", "gCT_H05", "gRT_H05", "gLM_H05", "gTg_H05", "gRM_H05", "gLB_H05", "gCB_H05", "gRB_H05", "YEAR")
	new_col_RSDNC <- c("gLC_R05", "gCT_R05", "gRT_R05", "gLM_R05", "gTg_R05", "gRM_R05", "gLB_R05", "gCB_R05", "gRB_R05", "YEAR")
	new_col_WRKRS <- c("gLC_W05", "gCT_W05", "gRT_W05", "gLM_W05", "gTg_W05", "gRM_W05", "gLB_W05", "gCB_W05", "gRB_W05", "YEAR")
	new_col_POPTN <- c("gLC_P05", "gCT_P05", "gRT_P05", "gLM_P05", "gTg_P05", "gRM_P05", "gLB_P05", "gCB_P05", "gRB_P05", "YEAR")
	new_col_YNG_POP <- c("gLC_Y05", "gCT_Y05", "gRT_Y05", "gLM_Y05", "gTg_Y05", "gRM_Y05", "gLB_Y05", "gCB_Y05", "gRB_Y05", "YEAR")

	colnames(GRD_BUSNS_05) <- new_col_BUSNS; GRD_BUSNS_05$YEAR <- NULL
	colnames(GRD_HSHD_05) <- new_col_HSHD; GRD_HSHD_05$YEAR <- NULL
	colnames(GRD_RSDNC_05) <- new_col_RSDNC; GRD_RSDNC_05$YEAR <- NULL
	colnames(GRD_WRKRS_05) <- new_col_WRKRS; GRD_WRKRS_05$YEAR <- NULL
	colnames(GRD_POPTN_05) <- new_col_POPTN; GRD_POPTN_05$YEAR <- NULL
	colnames(GRD_YNG_POP_05) <- new_col_YNG_POP; GRD_YNG_POP_05$YEAR <- NULL



	GRD_BUSNS_10 <- subset(GRD_BUSNS, YEAR == 2010)
	GRD_HSHD_10 <- subset(GRD_HSHD, YEAR == 2010)
	GRD_RSDNC_10 <- subset(GRD_RSDNC, YEAR == 2010)
	GRD_WRKRS_10 <- subset(GRD_WRKRS, YEAR == 2010)
	GRD_POPTN_10 <- subset(GRD_POPTN, YEAR == 2010)
	GRD_YNG_POP_10 <- subset(GRD_YNG_POP, YEAR == 2010)

	new_col_BUSNS <- c("gLC_B10", "gCT_B10", "gRT_B10", "gLM_B10", "gTg_B10", "gRM_B10", "gLB_B10", "gCB_B10", "gRB_B10", "YEAR")
	new_col_HSHD <- c("gLC_H10", "gCT_H10", "gRT_H10", "gLM_H10", "gTg_H10", "gRM_H10", "gLB_H10", "gCB_H10", "gRB_H10", "YEAR")
	new_col_RSDNC <- c("gLC_R10", "gCT_R10", "gRT_R10", "gLM_R10", "gTg_R10", "gRM_R10", "gLB_R10", "gCB_R10", "gRB_R10", "YEAR")
	new_col_WRKRS <- c("gLC_W10", "gCT_W10", "gRT_W10", "gLM_W10", "gTg_W10", "gRM_W10", "gLB_W10", "gCB_W10", "gRB_W10", "YEAR")
	new_col_POPTN <- c("gLC_P10", "gCT_P10", "gRT_P10", "gLM_P10", "gTg_P10", "gRM_P10", "gLB_P10", "gCB_P10", "gRB_P10", "YEAR")
	new_col_YNG_POP <- c("gLC_Y10", "gCT_Y10", "gRT_Y10", "gLM_Y10", "gTg_Y10", "gRM_Y10", "gLB_Y10", "gCB_Y10", "gRB_Y10", "YEAR")

	colnames(GRD_BUSNS_10) <- new_col_BUSNS; GRD_BUSNS_10$YEAR <- NULL
	colnames(GRD_HSHD_10) <- new_col_HSHD; GRD_HSHD_10$YEAR <- NULL
	colnames(GRD_RSDNC_10) <- new_col_RSDNC; GRD_RSDNC_10$YEAR <- NULL
	colnames(GRD_WRKRS_10) <- new_col_WRKRS; GRD_WRKRS_10$YEAR <- NULL
	colnames(GRD_POPTN_10) <- new_col_POPTN; GRD_POPTN_10$YEAR <- NULL
	colnames(GRD_YNG_POP_10) <- new_col_YNG_POP; GRD_YNG_POP_10$YEAR <- NULL



	GRD_BUSNS_15 <- subset(GRD_BUSNS, YEAR == 2015)
	GRD_HSHD_15 <- subset(GRD_HSHD, YEAR == 2015)
	GRD_RSDNC_15 <- subset(GRD_RSDNC, YEAR == 2015)
	GRD_WRKRS_15 <- subset(GRD_WRKRS, YEAR == 2015)
	GRD_POPTN_15 <- subset(GRD_POPTN, YEAR == 2015)
	GRD_YNG_POP_15 <- subset(GRD_YNG_POP, YEAR == 2015)

	new_col_BUSNS <- c("gLC_B15", "gCT_B15", "gRT_B15", "gLM_B15", "gTg_B15", "gRM_B15", "gLB_B15", "gCB_B15", "gRB_B15", "YEAR")
	new_col_HSHD <- c("gLC_H15", "gCT_H15", "gRT_H15", "gLM_H15", "gTg_H15", "gRM_H15", "gLB_H15", "gCB_H15", "gRB_H15", "YEAR")
	new_col_RSDNC <- c("gLC_R15", "gCT_R15", "gRT_R15", "gLM_R15", "gTg_R15", "gRM_R15", "gLB_R15", "gCB_R15", "gRB_R15", "YEAR")
	new_col_WRKRS <- c("gLC_W15", "gCT_W15", "gRT_W15", "gLM_W15", "gTg_W15", "gRM_W15", "gLB_W15", "gCB_W15", "gRB_W15", "YEAR")
	new_col_POPTN <- c("gLC_P15", "gCT_P15", "gRT_P15", "gLM_P15", "gTg_P15", "gRM_P15", "gLB_P15", "gCB_P15", "gRB_P15", "YEAR")
	new_col_YNG_POP <- c("gLC_Y15", "gCT_Y15", "gRT_Y15", "gLM_Y15", "gTg_Y15", "gRM_Y15", "gLB_Y15", "gCB_Y15", "gRB_Y15", "YEAR")

	colnames(GRD_BUSNS_15) <- new_col_BUSNS; GRD_BUSNS_15$YEAR <- NULL
	colnames(GRD_HSHD_15) <- new_col_HSHD; GRD_HSHD_15$YEAR <- NULL
	colnames(GRD_RSDNC_15) <- new_col_RSDNC; GRD_RSDNC_15$YEAR <- NULL
	colnames(GRD_WRKRS_15) <- new_col_WRKRS; GRD_WRKRS_15$YEAR <- NULL
	colnames(GRD_POPTN_15) <- new_col_POPTN; GRD_POPTN_15$YEAR <- NULL
	colnames(GRD_YNG_POP_15) <- new_col_YNG_POP; GRD_YNG_POP_15$YEAR <- NULL



	GRD_BUSNS_16 <- subset(GRD_BUSNS, YEAR == 2016)
	GRD_HSHD_16 <- subset(GRD_HSHD, YEAR == 2016)
	GRD_RSDNC_16 <- subset(GRD_RSDNC, YEAR == 2016)
	GRD_WRKRS_16 <- subset(GRD_WRKRS, YEAR == 2016)
	GRD_POPTN_16 <- subset(GRD_POPTN, YEAR == 2016)
	GRD_YNG_POP_16 <- subset(GRD_YNG_POP, YEAR == 2016)

	new_col_BUSNS <- c("gLC_B16", "gCT_B16", "gRT_B16", "gLM_B16", "gTg_B16", "gRM_B16", "gLB_B16", "gCB_B16", "gRB_B16", "YEAR")
	new_col_HSHD <- c("gLC_H16", "gCT_H16", "gRT_H16", "gLM_H16", "gTg_H16", "gRM_H16", "gLB_H16", "gCB_H16", "gRB_H16", "YEAR")
	new_col_RSDNC <- c("gLC_R16", "gCT_R16", "gRT_R16", "gLM_R16", "gTg_R16", "gRM_R16", "gLB_R16", "gCB_R16", "gRB_R16", "YEAR")
	new_col_WRKRS <- c("gLC_W16", "gCT_W16", "gRT_W16", "gLM_W16", "gTg_W16", "gRM_W16", "gLB_W16", "gCB_W16", "gRB_W16", "YEAR")
	new_col_POPTN <- c("gLC_P16", "gCT_P16", "gRT_P16", "gLM_P16", "gTg_P16", "gRM_P16", "gLB_P16", "gCB_P16", "gRB_P16", "YEAR")
	new_col_YNG_POP <- c("gLC_Y16", "gCT_Y16", "gRT_Y16", "gLM_Y16", "gTg_Y16", "gRM_Y16", "gLB_Y16", "gCB_Y16", "gRB_Y16", "YEAR")

	colnames(GRD_BUSNS_16) <- new_col_BUSNS; GRD_BUSNS_16$YEAR <- NULL
	colnames(GRD_HSHD_16) <- new_col_HSHD; GRD_HSHD_16$YEAR <- NULL
	colnames(GRD_RSDNC_16) <- new_col_RSDNC; GRD_RSDNC_16$YEAR <- NULL
	colnames(GRD_WRKRS_16) <- new_col_WRKRS; GRD_WRKRS_16$YEAR <- NULL
	colnames(GRD_POPTN_16) <- new_col_POPTN; GRD_POPTN_16$YEAR <- NULL
	colnames(GRD_YNG_POP_16) <- new_col_YNG_POP; GRD_YNG_POP_16$YEAR <- NULL



	GRD_BUSNS_17 <- subset(GRD_BUSNS, YEAR == 2017)
	GRD_HSHD_17 <- subset(GRD_HSHD, YEAR == 2017)
	GRD_RSDNC_17 <- subset(GRD_RSDNC, YEAR == 2017)
	GRD_WRKRS_17 <- subset(GRD_WRKRS, YEAR == 2017)
	GRD_POPTN_17 <- subset(GRD_POPTN, YEAR == 2017)
	GRD_YNG_POP_17 <- subset(GRD_YNG_POP, YEAR == 2017)

	new_col_BUSNS <- c("gLC_B17", "gCT_B17", "gRT_B17", "gLM_B17", "gTg_B17", "gRM_B17", "gLB_B17", "gCB_B17", "gRB_B17", "YEAR")
	new_col_HSHD <- c("gLC_H17", "gCT_H17", "gRT_H17", "gLM_H17", "gTg_H17", "gRM_H17", "gLB_H17", "gCB_H17", "gRB_H17", "YEAR")
	new_col_RSDNC <- c("gLC_R17", "gCT_R17", "gRT_R17", "gLM_R17", "gTg_R17", "gRM_R17", "gLB_R17", "gCB_R17", "gRB_R17", "YEAR")
	new_col_WRKRS <- c("gLC_W17", "gCT_W17", "gRT_W17", "gLM_W17", "gTg_W17", "gRM_W17", "gLB_W17", "gCB_W17", "gRB_W17", "YEAR")
	new_col_POPTN <- c("gLC_P17", "gCT_P17", "gRT_P17", "gLM_P17", "gTg_P17", "gRM_P17", "gLB_P17", "gCB_P17", "gRB_P17", "YEAR")
	new_col_YNG_POP <- c("gLC_Y17", "gCT_Y17", "gRT_Y17", "gLM_Y17", "gTg_Y17", "gRM_Y17", "gLB_Y17", "gCB_Y17", "gRB_Y17", "YEAR")

	colnames(GRD_BUSNS_17) <- new_col_BUSNS; GRD_BUSNS_17$YEAR <- NULL
	colnames(GRD_HSHD_17) <- new_col_HSHD; GRD_HSHD_17$YEAR <- NULL
	colnames(GRD_RSDNC_17) <- new_col_RSDNC; GRD_RSDNC_17$YEAR <- NULL
	colnames(GRD_WRKRS_17) <- new_col_WRKRS; GRD_WRKRS_17$YEAR <- NULL
	colnames(GRD_POPTN_17) <- new_col_POPTN; GRD_POPTN_17$YEAR <- NULL
	colnames(GRD_YNG_POP_17) <- new_col_YNG_POP; GRD_YNG_POP_17$YEAR <- NULL



	GRD_BUSNS_18 <- subset(GRD_BUSNS, YEAR == 2018)
	GRD_HSHD_18 <- subset(GRD_HSHD, YEAR == 2018)
	GRD_RSDNC_18 <- subset(GRD_RSDNC, YEAR == 2018)
	GRD_WRKRS_18 <- subset(GRD_WRKRS, YEAR == 2018)
	GRD_POPTN_18 <- subset(GRD_POPTN, YEAR == 2018)
	GRD_YNG_POP_18 <- subset(GRD_YNG_POP, YEAR == 2018)

	new_col_BUSNS <- c("gLC_B18", "gCT_B18", "gRT_B18", "gLM_B18", "gTg_B18", "gRM_B18", "gLB_B18", "gCB_B18", "gRB_B18", "YEAR")
	new_col_HSHD <- c("gLC_H18", "gCT_H18", "gRT_H18", "gLM_H18", "gTg_H18", "gRM_H18", "gLB_H18", "gCB_H18", "gRB_H18", "YEAR")
	new_col_RSDNC <- c("gLC_R18", "gCT_R18", "gRT_R18", "gLM_R18", "gTg_R18", "gRM_R18", "gLB_R18", "gCB_R18", "gRB_R18", "YEAR")
	new_col_WRKRS <- c("gLC_W18", "gCT_W18", "gRT_W18", "gLM_W18", "gTg_W18", "gRM_W18", "gLB_W18", "gCB_W18", "gRB_W18", "YEAR")
	new_col_POPTN <- c("gLC_P18", "gCT_P18", "gRT_P18", "gLM_P18", "gTg_P18", "gRM_P18", "gLB_P18", "gCB_P18", "gRB_P18", "YEAR")
	new_col_YNG_POP <- c("gLC_Y18", "gCT_Y18", "gRT_Y18", "gLM_Y18", "gTg_Y18", "gRM_Y18", "gLB_Y18", "gCB_Y18", "gRB_Y18", "YEAR")

	colnames(GRD_BUSNS_18) <- new_col_BUSNS; GRD_BUSNS_18$YEAR <- NULL
	colnames(GRD_HSHD_18) <- new_col_HSHD; GRD_HSHD_18$YEAR <- NULL
	colnames(GRD_RSDNC_18) <- new_col_RSDNC; GRD_RSDNC_18$YEAR <- NULL
	colnames(GRD_WRKRS_18) <- new_col_WRKRS; GRD_WRKRS_18$YEAR <- NULL
	colnames(GRD_POPTN_18) <- new_col_POPTN; GRD_POPTN_18$YEAR <- NULL
	colnames(GRD_YNG_POP_18) <- new_col_YNG_POP; GRD_YNG_POP_18$YEAR <- NULL


	GRD_BUSNS_19 <- subset(GRD_BUSNS, YEAR == 2019)
	GRD_HSHD_19 <- subset(GRD_HSHD, YEAR == 2019)
	GRD_RSDNC_19 <- subset(GRD_RSDNC, YEAR == 2019)
	GRD_WRKRS_19 <- subset(GRD_WRKRS, YEAR == 2019)
	GRD_POPTN_19 <- subset(GRD_POPTN, YEAR == 2019)
	GRD_YNG_POP_19 <- subset(GRD_YNG_POP, YEAR == 2019)

	new_col_BUSNS <- c("gLC_B19", "gCT_B19", "gRT_B19", "gLM_B19", "gTg_B19", "gRM_B19", "gLB_B19", "gCB_B19", "gRB_B19", "YEAR")
	new_col_HSHD <- c("gLC_H19", "gCT_H19", "gRT_H19", "gLM_H19", "gTg_H19", "gRM_H19", "gLB_H19", "gCB_H19", "gRB_H19", "YEAR")
	new_col_RSDNC <- c("gLC_R19", "gCT_R19", "gRT_R19", "gLM_R19", "gTg_R19", "gRM_R19", "gLB_R19", "gCB_R19", "gRB_R19", "YEAR")
	new_col_WRKRS <- c("gLC_W19", "gCT_W19", "gRT_W19", "gLM_W19", "gTg_W19", "gRM_W19", "gLB_W19", "gCB_W19", "gRB_W19", "YEAR")
	new_col_POPTN <- c("gLC_P19", "gCT_P19", "gRT_P19", "gLM_P19", "gTg_P19", "gRM_P19", "gLB_P19", "gCB_P19", "gRB_P19", "YEAR")
	new_col_YNG_POP <- c("gLC_Y19", "gCT_Y19", "gRT_Y19", "gLM_Y19", "gTg_Y19", "gRM_Y19", "gLB_Y19", "gCB_Y19", "gRB_Y19", "YEAR")

	colnames(GRD_BUSNS_19) <- new_col_BUSNS; GRD_BUSNS_19$YEAR <- NULL
	colnames(GRD_HSHD_19) <- new_col_HSHD; GRD_HSHD_19$YEAR <- NULL
	colnames(GRD_RSDNC_19) <- new_col_RSDNC; GRD_RSDNC_19$YEAR <- NULL
	colnames(GRD_WRKRS_19) <- new_col_WRKRS; GRD_WRKRS_19$YEAR <- NULL
	colnames(GRD_POPTN_19) <- new_col_POPTN; GRD_POPTN_19$YEAR <- NULL
	colnames(GRD_YNG_POP_19) <- new_col_YNG_POP; GRD_YNG_POP_19$YEAR <- NULL



	GRD_BUSNS_20 <- subset(GRD_BUSNS, YEAR == 2020)
	GRD_HSHD_20 <- subset(GRD_HSHD, YEAR == 2020)
	GRD_RSDNC_20 <- subset(GRD_RSDNC, YEAR == 2020)
	GRD_WRKRS_20 <- subset(GRD_WRKRS, YEAR == 2020)
	GRD_POPTN_20 <- subset(GRD_POPTN, YEAR == 2020)
	GRD_YNG_POP_20 <- subset(GRD_YNG_POP, YEAR == 2020)

	new_col_BUSNS <- c("gLC_B20", "gCT_B20", "gRT_B20", "gLM_B20", "gTg_B20", "gRM_B20", "gLB_B20", "gCB_B20", "gRB_B20", "YEAR")
	new_col_HSHD <- c("gLC_H20", "gCT_H20", "gRT_H20", "gLM_H20", "gTg_H20", "gRM_H20", "gLB_H20", "gCB_H20", "gRB_H20", "YEAR")
	new_col_RSDNC <- c("gLC_R20", "gCT_R20", "gRT_R20", "gLM_R20", "gTg_R20", "gRM_R20", "gLB_R20", "gCB_R20", "gRB_R20", "YEAR")
	new_col_WRKRS <- c("gLC_W20", "gCT_W20", "gRT_W20", "gLM_W20", "gTg_W20", "gRM_W20", "gLB_W20", "gCB_W20", "gRB_W20", "YEAR")
	new_col_POPTN <- c("gLC_P20", "gCT_P20", "gRT_P20", "gLM_P20", "gTg_P20", "gRM_P20", "gLB_P20", "gCB_P20", "gRB_P20", "YEAR")
	new_col_YNG_POP <- c("gLC_Y20", "gCT_Y20", "gRT_Y20", "gLM_Y20", "gTg_Y20", "gRM_Y20", "gLB_Y20", "gCB_Y20", "gRB_Y20", "YEAR")

	colnames(GRD_BUSNS_20) <- new_col_BUSNS; GRD_BUSNS_20$YEAR <- NULL
	colnames(GRD_HSHD_20) <- new_col_HSHD; GRD_HSHD_20$YEAR <- NULL
	colnames(GRD_RSDNC_20) <- new_col_RSDNC; GRD_RSDNC_20$YEAR <- NULL
	colnames(GRD_WRKRS_20) <- new_col_WRKRS; GRD_WRKRS_20$YEAR <- NULL
	colnames(GRD_POPTN_20) <- new_col_POPTN; GRD_POPTN_20$YEAR <- NULL
	colnames(GRD_YNG_POP_20) <- new_col_YNG_POP; GRD_YNG_POP_20$YEAR <- NULL



	GRD_BUSNS_21 <- subset(GRD_BUSNS, YEAR == 2021)
	GRD_HSHD_21 <- subset(GRD_HSHD, YEAR == 2021)
	GRD_RSDNC_21 <- subset(GRD_RSDNC, YEAR == 2021)
	GRD_WRKRS_21 <- subset(GRD_WRKRS, YEAR == 2021)
	GRD_POPTN_21 <- subset(GRD_POPTN, YEAR == 2021)
	GRD_YNG_POP_21 <- subset(GRD_YNG_POP, YEAR == 2021)

	new_col_BUSNS <- c("gLC_B21", "gCT_B21", "gRT_B21", "gLM_B21", "gTg_B21", "gRM_B21", "gLB_B21", "gCB_B21", "gRB_B21", "YEAR")
	new_col_HSHD <- c("gLC_H21", "gCT_H21", "gRT_H21", "gLM_H21", "gTg_H21", "gRM_H21", "gLB_H21", "gCB_H21", "gRB_H21", "YEAR")
	new_col_RSDNC <- c("gLC_R21", "gCT_R21", "gRT_R21", "gLM_R21", "gTg_R21", "gRM_R21", "gLB_R21", "gCB_R21", "gRB_R21", "YEAR")
	new_col_WRKRS <- c("gLC_W21", "gCT_W21", "gRT_W21", "gLM_W21", "gTg_W21", "gRM_W21", "gLB_W21", "gCB_W21", "gRB_W21", "YEAR")
	new_col_POPTN <- c("gLC_P21", "gCT_P21", "gRT_P21", "gLM_P21", "gTg_P21", "gRM_P21", "gLB_P21", "gCB_P21", "gRB_P21", "YEAR")
	new_col_YNG_POP <- c("gLC_Y21", "gCT_Y21", "gRT_Y21", "gLM_Y21", "gTg_Y21", "gRM_Y21", "gLB_Y21", "gCB_Y21", "gRB_Y21", "YEAR")

	colnames(GRD_BUSNS_21) <- new_col_BUSNS; GRD_BUSNS_21$YEAR <- NULL
	colnames(GRD_HSHD_21) <- new_col_HSHD; GRD_HSHD_21$YEAR <- NULL
	colnames(GRD_RSDNC_21) <- new_col_RSDNC; GRD_RSDNC_21$YEAR <- NULL
	colnames(GRD_WRKRS_21) <- new_col_WRKRS; GRD_WRKRS_21$YEAR <- NULL
	colnames(GRD_POPTN_21) <- new_col_POPTN; GRD_POPTN_21$YEAR <- NULL
	colnames(GRD_YNG_POP_21) <- new_col_YNG_POP; GRD_YNG_POP_21$YEAR <- NULL


	GRD_BUSNS_22 <- subset(GRD_BUSNS, YEAR == 2022)
	GRD_HSHD_22 <- subset(GRD_HSHD, YEAR == 2022)
	GRD_RSDNC_22 <- subset(GRD_RSDNC, YEAR == 2022)
	GRD_WRKRS_22 <- subset(GRD_WRKRS, YEAR == 2022)
	GRD_POPTN_22 <- subset(GRD_POPTN, YEAR == 2022)
	GRD_YNG_POP_22 <- subset(GRD_YNG_POP, YEAR == 2022)

	new_col_BUSNS <- c("gLC_B22", "gCT_B22", "gRT_B22", "gLM_B22", "gTg_B22", "gRM_B22", "gLB_B22", "gCB_B22", "gRB_B22", "YEAR")
	new_col_HSHD <- c("gLC_H22", "gCT_H22", "gRT_H22", "gLM_H22", "gTg_H22", "gRM_H22", "gLB_H22", "gCB_H22", "gRB_H22", "YEAR")
	new_col_RSDNC <- c("gLC_R22", "gCT_R22", "gRT_R22", "gLM_R22", "gTg_R22", "gRM_R22", "gLB_R22", "gCB_R22", "gRB_R22", "YEAR")
	new_col_WRKRS <- c("gLC_W22", "gCT_W22", "gRT_W22", "gLM_W22", "gTg_W22", "gRM_W22", "gLB_W22", "gCB_W22", "gRB_W22", "YEAR")
	new_col_POPTN <- c("gLC_P22", "gCT_P22", "gRT_P22", "gLM_P22", "gTg_P22", "gRM_P22", "gLB_P22", "gCB_P22", "gRB_P22", "YEAR")
	new_col_YNG_POP <- c("gLC_Y22", "gCT_Y22", "gRT_Y22", "gLM_Y22", "gTg_Y22", "gRM_Y22", "gLB_Y22", "gCB_Y22", "gRB_Y22", "YEAR")

	colnames(GRD_BUSNS_22) <- new_col_BUSNS; GRD_BUSNS_22$YEAR <- NULL
	colnames(GRD_HSHD_22) <- new_col_HSHD; GRD_HSHD_22$YEAR <- NULL
	colnames(GRD_RSDNC_22) <- new_col_RSDNC; GRD_RSDNC_22$YEAR <- NULL
	colnames(GRD_WRKRS_22) <- new_col_WRKRS; GRD_WRKRS_22$YEAR <- NULL
	colnames(GRD_POPTN_22) <- new_col_POPTN; GRD_POPTN_22$YEAR <- NULL
	colnames(GRD_YNG_POP_22) <- new_col_YNG_POP; GRD_YNG_POP_22$YEAR <- NULL


	GRD_BUSNS_23 <- subset(GRD_BUSNS, YEAR == 2023)
	GRD_HSHD_23 <- subset(GRD_HSHD, YEAR == 2023)
	GRD_RSDNC_23 <- subset(GRD_RSDNC, YEAR == 2023)
	GRD_WRKRS_23 <- subset(GRD_WRKRS, YEAR == 2023)
	GRD_POPTN_23 <- subset(GRD_POPTN, YEAR == 2023)
	GRD_YNG_POP_23 <- subset(GRD_YNG_POP, YEAR == 2023)

	new_col_BUSNS <- c("gLC_B23", "gCT_B23", "gRT_B23", "gLM_B23", "gTg_B23", "gRM_B23", "gLB_B23", "gCB_B23", "gRB_B23", "YEAR")
	new_col_HSHD <- c("gLC_H23", "gCT_H23", "gRT_H23", "gLM_H23", "gTg_H23", "gRM_H23", "gLB_H23", "gCB_H23", "gRB_H23", "YEAR")
	new_col_RSDNC <- c("gLC_R23", "gCT_R23", "gRT_R23", "gLM_R23", "gTg_R23", "gRM_R23", "gLB_R23", "gCB_R23", "gRB_R23", "YEAR")
	new_col_WRKRS <- c("gLC_W23", "gCT_W23", "gRT_W23", "gLM_W23", "gTg_W23", "gRM_W23", "gLB_W23", "gCB_W23", "gRB_W23", "YEAR")
	new_col_POPTN <- c("gLC_P23", "gCT_P23", "gRT_P23", "gLM_P23", "gTg_P23", "gRM_P23", "gLB_P23", "gCB_P23", "gRB_P23", "YEAR")
	new_col_YNG_POP <- c("gLC_Y23", "gCT_Y23", "gRT_Y23", "gLM_Y23", "gTg_Y23", "gRM_Y23", "gLB_Y23", "gCB_Y23", "gRB_Y23", "YEAR")

	colnames(GRD_BUSNS_23) <- new_col_BUSNS; GRD_BUSNS_23$YEAR <- NULL
	colnames(GRD_HSHD_23) <- new_col_HSHD; GRD_HSHD_23$YEAR <- NULL
	colnames(GRD_RSDNC_23) <- new_col_RSDNC; GRD_RSDNC_23$YEAR <- NULL
	colnames(GRD_WRKRS_23) <- new_col_WRKRS; GRD_WRKRS_23$YEAR <- NULL
	colnames(GRD_POPTN_23) <- new_col_POPTN; GRD_POPTN_23$YEAR <- NULL
	colnames(GRD_YNG_POP_23) <- new_col_YNG_POP; GRD_YNG_POP_23$YEAR <- NULL

	TESTING_SET <- cbind(
	GRD_BUSNS_05, GRD_HSHD_05, GRD_RSDNC_05, GRD_WRKRS_05, GRD_POPTN_05, GRD_YNG_POP_05, 
	GRD_BUSNS_10, GRD_HSHD_10, GRD_RSDNC_10, GRD_WRKRS_10, GRD_POPTN_10, GRD_YNG_POP_10, 
	GRD_BUSNS_15, GRD_HSHD_15, GRD_RSDNC_15, GRD_WRKRS_15, GRD_POPTN_15, GRD_YNG_POP_15, 
	GRD_BUSNS_16, GRD_HSHD_16, GRD_RSDNC_16, GRD_WRKRS_16, GRD_POPTN_16, GRD_YNG_POP_16, 
	GRD_BUSNS_17, GRD_HSHD_17, GRD_RSDNC_17, GRD_WRKRS_17, GRD_POPTN_17, GRD_YNG_POP_17, 
	GRD_BUSNS_18, GRD_HSHD_18, GRD_RSDNC_18, GRD_WRKRS_18, GRD_POPTN_18, GRD_YNG_POP_18, 
	GRD_BUSNS_19, GRD_HSHD_19, GRD_RSDNC_19, GRD_WRKRS_19, GRD_POPTN_19, GRD_YNG_POP_19, 
	GRD_BUSNS_20, GRD_HSHD_20, GRD_RSDNC_20, GRD_WRKRS_20, GRD_POPTN_20, GRD_YNG_POP_20, 
	GRD_BUSNS_21, GRD_HSHD_21, GRD_RSDNC_21, GRD_WRKRS_21, GRD_POPTN_21, GRD_YNG_POP_21, 
	GRD_BUSNS_22, GRD_HSHD_22, GRD_RSDNC_22, GRD_WRKRS_22, GRD_POPTN_22, GRD_YNG_POP_22, 
	GRD_BUSNS_23, GRD_HSHD_23, GRD_RSDNC_23, GRD_WRKRS_23, GRD_POPTN_23, GRD_YNG_POP_23)

	return(TESTING_SET)
}




TESTING_data_TYPE_2 <- function(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP){


	# LEARNING FASHION] LEARNING > TESTING > TUNING (w/ STAT EST.)
	# Young population has only between 2014 - 2024
	#============================ YEARLY DESGIN for LEARNING FASHION =============================#
	#---------------------------------------------------------------------------------------------
	#---------------|-------------- LEARNING --------------|--------------- TESTING --------------
	#   PREDICTION  |      TRAINING-SET     |    TARGET    |      TRAINING-SET     |    TARGET   
	#---------------|-----------------------|--------------|-----------------------|--------------
	#  1year-model  |      2000 ~ 2022      |     2023     |      2005 ~ 2023      |     2025     
	#  2year-model  |      2000 ~ 2021      |     2023     |      2005 ~ 2022      |     2026     
	#  3year-model  |      2000 ~ 2020      |     2023     |      2005 ~ 2021      |     2027     
	#  4year-model  |      2000 ~ 2019      |     2023     |      2005 ~ 2020      |     2028     
	#  5year-model  |      2000 ~ 2018      |     2023     |      2005 ~ 2019      |     2029     
	#  6year-model  |      2000 ~ 2017      |     2023     |      2005 ~ 2018      |     2030     
	#----------------------------------------------------------------------------------------------

	# Total 12 years data) 2000 2005 2010 2015 2016 2017 2018 2019 2020 2021 2022 2023
	# 1year-model: Learning(11)-Target(1) > Testing(11)-Target(1)
	# 2year-model: Learning(10)-Target(1) > Testing(10)-Target(1)
	# 3year-model: Learning(9)-Target(1) > Testing(9)-Target(1)
	# 4year-model: Learning(8)-Target(1) > Testing(8)-Target(1)
	# 5year-model: Learning(7)-Target(1) > Testing(7)-Target(1)
	# 6year-model: Learning(6)-Target(1) > Testing(6)-Target(1)


	GRD_BUSNS_05 <- subset(GRD_BUSNS, YEAR == 2005)
	GRD_HSHD_05 <- subset(GRD_HSHD, YEAR == 2005)
	GRD_RSDNC_05 <- subset(GRD_RSDNC, YEAR == 2005)
	GRD_WRKRS_05 <- subset(GRD_WRKRS, YEAR == 2005)
	GRD_POPTN_05 <- subset(GRD_POPTN, YEAR == 2005)
	GRD_YNG_POP_05 <- subset(GRD_YNG_POP, YEAR == 2005)

	new_col_BUSNS <- c("gLC_B05", "gCT_B05", "gRT_B05", "gLM_B05", "gTg_B05", "gRM_B05", "gLB_B05", "gCB_B05", "gRB_B05", "YEAR")
	new_col_HSHD <- c("gLC_H05", "gCT_H05", "gRT_H05", "gLM_H05", "gTg_H05", "gRM_H05", "gLB_H05", "gCB_H05", "gRB_H05", "YEAR")
	new_col_RSDNC <- c("gLC_R05", "gCT_R05", "gRT_R05", "gLM_R05", "gTg_R05", "gRM_R05", "gLB_R05", "gCB_R05", "gRB_R05", "YEAR")
	new_col_WRKRS <- c("gLC_W05", "gCT_W05", "gRT_W05", "gLM_W05", "gTg_W05", "gRM_W05", "gLB_W05", "gCB_W05", "gRB_W05", "YEAR")
	new_col_POPTN <- c("gLC_P05", "gCT_P05", "gRT_P05", "gLM_P05", "gTg_P05", "gRM_P05", "gLB_P05", "gCB_P05", "gRB_P05", "YEAR")
	new_col_YNG_POP <- c("gLC_Y05", "gCT_Y05", "gRT_Y05", "gLM_Y05", "gTg_Y05", "gRM_Y05", "gLB_Y05", "gCB_Y05", "gRB_Y05", "YEAR")

	colnames(GRD_BUSNS_05) <- new_col_BUSNS; GRD_BUSNS_05$YEAR <- NULL
	colnames(GRD_HSHD_05) <- new_col_HSHD; GRD_HSHD_05$YEAR <- NULL
	colnames(GRD_RSDNC_05) <- new_col_RSDNC; GRD_RSDNC_05$YEAR <- NULL
	colnames(GRD_WRKRS_05) <- new_col_WRKRS; GRD_WRKRS_05$YEAR <- NULL
	colnames(GRD_POPTN_05) <- new_col_POPTN; GRD_POPTN_05$YEAR <- NULL
	colnames(GRD_YNG_POP_05) <- new_col_YNG_POP; GRD_YNG_POP_05$YEAR <- NULL



	GRD_BUSNS_10 <- subset(GRD_BUSNS, YEAR == 2010)
	GRD_HSHD_10 <- subset(GRD_HSHD, YEAR == 2010)
	GRD_RSDNC_10 <- subset(GRD_RSDNC, YEAR == 2010)
	GRD_WRKRS_10 <- subset(GRD_WRKRS, YEAR == 2010)
	GRD_POPTN_10 <- subset(GRD_POPTN, YEAR == 2010)
	GRD_YNG_POP_10 <- subset(GRD_YNG_POP, YEAR == 2010)

	new_col_BUSNS <- c("gLC_B10", "gCT_B10", "gRT_B10", "gLM_B10", "gTg_B10", "gRM_B10", "gLB_B10", "gCB_B10", "gRB_B10", "YEAR")
	new_col_HSHD <- c("gLC_H10", "gCT_H10", "gRT_H10", "gLM_H10", "gTg_H10", "gRM_H10", "gLB_H10", "gCB_H10", "gRB_H10", "YEAR")
	new_col_RSDNC <- c("gLC_R10", "gCT_R10", "gRT_R10", "gLM_R10", "gTg_R10", "gRM_R10", "gLB_R10", "gCB_R10", "gRB_R10", "YEAR")
	new_col_WRKRS <- c("gLC_W10", "gCT_W10", "gRT_W10", "gLM_W10", "gTg_W10", "gRM_W10", "gLB_W10", "gCB_W10", "gRB_W10", "YEAR")
	new_col_POPTN <- c("gLC_P10", "gCT_P10", "gRT_P10", "gLM_P10", "gTg_P10", "gRM_P10", "gLB_P10", "gCB_P10", "gRB_P10", "YEAR")
	new_col_YNG_POP <- c("gLC_Y10", "gCT_Y10", "gRT_Y10", "gLM_Y10", "gTg_Y10", "gRM_Y10", "gLB_Y10", "gCB_Y10", "gRB_Y10", "YEAR")

	colnames(GRD_BUSNS_10) <- new_col_BUSNS; GRD_BUSNS_10$YEAR <- NULL
	colnames(GRD_HSHD_10) <- new_col_HSHD; GRD_HSHD_10$YEAR <- NULL
	colnames(GRD_RSDNC_10) <- new_col_RSDNC; GRD_RSDNC_10$YEAR <- NULL
	colnames(GRD_WRKRS_10) <- new_col_WRKRS; GRD_WRKRS_10$YEAR <- NULL
	colnames(GRD_POPTN_10) <- new_col_POPTN; GRD_POPTN_10$YEAR <- NULL
	colnames(GRD_YNG_POP_10) <- new_col_YNG_POP; GRD_YNG_POP_10$YEAR <- NULL




	GRD_BUSNS_15 <- subset(GRD_BUSNS, YEAR == 2015)
	GRD_HSHD_15 <- subset(GRD_HSHD, YEAR == 2015)
	GRD_RSDNC_15 <- subset(GRD_RSDNC, YEAR == 2015)
	GRD_WRKRS_15 <- subset(GRD_WRKRS, YEAR == 2015)
	GRD_POPTN_15 <- subset(GRD_POPTN, YEAR == 2015)
	GRD_YNG_POP_15 <- subset(GRD_YNG_POP, YEAR == 2015)

	new_col_BUSNS <- c("gLC_B15", "gCT_B15", "gRT_B15", "gLM_B15", "gTg_B15", "gRM_B15", "gLB_B15", "gCB_B15", "gRB_B15", "YEAR")
	new_col_HSHD <- c("gLC_H15", "gCT_H15", "gRT_H15", "gLM_H15", "gTg_H15", "gRM_H15", "gLB_H15", "gCB_H15", "gRB_H15", "YEAR")
	new_col_RSDNC <- c("gLC_R15", "gCT_R15", "gRT_R15", "gLM_R15", "gTg_R15", "gRM_R15", "gLB_R15", "gCB_R15", "gRB_R15", "YEAR")
	new_col_WRKRS <- c("gLC_W15", "gCT_W15", "gRT_W15", "gLM_W15", "gTg_W15", "gRM_W15", "gLB_W15", "gCB_W15", "gRB_W15", "YEAR")
	new_col_POPTN <- c("gLC_P15", "gCT_P15", "gRT_P15", "gLM_P15", "gTg_P15", "gRM_P15", "gLB_P15", "gCB_P15", "gRB_P15", "YEAR")
	new_col_YNG_POP <- c("gLC_Y15", "gCT_Y15", "gRT_Y15", "gLM_Y15", "gTg_Y15", "gRM_Y15", "gLB_Y15", "gCB_Y15", "gRB_Y15", "YEAR")

	colnames(GRD_BUSNS_15) <- new_col_BUSNS; GRD_BUSNS_15$YEAR <- NULL
	colnames(GRD_HSHD_15) <- new_col_HSHD; GRD_HSHD_15$YEAR <- NULL
	colnames(GRD_RSDNC_15) <- new_col_RSDNC; GRD_RSDNC_15$YEAR <- NULL
	colnames(GRD_WRKRS_15) <- new_col_WRKRS; GRD_WRKRS_15$YEAR <- NULL
	colnames(GRD_POPTN_15) <- new_col_POPTN; GRD_POPTN_15$YEAR <- NULL
	colnames(GRD_YNG_POP_15) <- new_col_YNG_POP; GRD_YNG_POP_15$YEAR <- NULL



	GRD_BUSNS_16 <- subset(GRD_BUSNS, YEAR == 2016)
	GRD_HSHD_16 <- subset(GRD_HSHD, YEAR == 2016)
	GRD_RSDNC_16 <- subset(GRD_RSDNC, YEAR == 2016)
	GRD_WRKRS_16 <- subset(GRD_WRKRS, YEAR == 2016)
	GRD_POPTN_16 <- subset(GRD_POPTN, YEAR == 2016)
	GRD_YNG_POP_16 <- subset(GRD_YNG_POP, YEAR == 2016)

	new_col_BUSNS <- c("gLC_B16", "gCT_B16", "gRT_B16", "gLM_B16", "gTg_B16", "gRM_B16", "gLB_B16", "gCB_B16", "gRB_B16", "YEAR")
	new_col_HSHD <- c("gLC_H16", "gCT_H16", "gRT_H16", "gLM_H16", "gTg_H16", "gRM_H16", "gLB_H16", "gCB_H16", "gRB_H16", "YEAR")
	new_col_RSDNC <- c("gLC_R16", "gCT_R16", "gRT_R16", "gLM_R16", "gTg_R16", "gRM_R16", "gLB_R16", "gCB_R16", "gRB_R16", "YEAR")
	new_col_WRKRS <- c("gLC_W16", "gCT_W16", "gRT_W16", "gLM_W16", "gTg_W16", "gRM_W16", "gLB_W16", "gCB_W16", "gRB_W16", "YEAR")
	new_col_POPTN <- c("gLC_P16", "gCT_P16", "gRT_P16", "gLM_P16", "gTg_P16", "gRM_P16", "gLB_P16", "gCB_P16", "gRB_P16", "YEAR")
	new_col_YNG_POP <- c("gLC_Y16", "gCT_Y16", "gRT_Y16", "gLM_Y16", "gTg_Y16", "gRM_Y16", "gLB_Y16", "gCB_Y16", "gRB_Y16", "YEAR")

	colnames(GRD_BUSNS_16) <- new_col_BUSNS; GRD_BUSNS_16$YEAR <- NULL
	colnames(GRD_HSHD_16) <- new_col_HSHD; GRD_HSHD_16$YEAR <- NULL
	colnames(GRD_RSDNC_16) <- new_col_RSDNC; GRD_RSDNC_16$YEAR <- NULL
	colnames(GRD_WRKRS_16) <- new_col_WRKRS; GRD_WRKRS_16$YEAR <- NULL
	colnames(GRD_POPTN_16) <- new_col_POPTN; GRD_POPTN_16$YEAR <- NULL
	colnames(GRD_YNG_POP_16) <- new_col_YNG_POP; GRD_YNG_POP_16$YEAR <- NULL



	GRD_BUSNS_17 <- subset(GRD_BUSNS, YEAR == 2017)
	GRD_HSHD_17 <- subset(GRD_HSHD, YEAR == 2017)
	GRD_RSDNC_17 <- subset(GRD_RSDNC, YEAR == 2017)
	GRD_WRKRS_17 <- subset(GRD_WRKRS, YEAR == 2017)
	GRD_POPTN_17 <- subset(GRD_POPTN, YEAR == 2017)
	GRD_YNG_POP_17 <- subset(GRD_YNG_POP, YEAR == 2017)

	new_col_BUSNS <- c("gLC_B17", "gCT_B17", "gRT_B17", "gLM_B17", "gTg_B17", "gRM_B17", "gLB_B17", "gCB_B17", "gRB_B17", "YEAR")
	new_col_HSHD <- c("gLC_H17", "gCT_H17", "gRT_H17", "gLM_H17", "gTg_H17", "gRM_H17", "gLB_H17", "gCB_H17", "gRB_H17", "YEAR")
	new_col_RSDNC <- c("gLC_R17", "gCT_R17", "gRT_R17", "gLM_R17", "gTg_R17", "gRM_R17", "gLB_R17", "gCB_R17", "gRB_R17", "YEAR")
	new_col_WRKRS <- c("gLC_W17", "gCT_W17", "gRT_W17", "gLM_W17", "gTg_W17", "gRM_W17", "gLB_W17", "gCB_W17", "gRB_W17", "YEAR")
	new_col_POPTN <- c("gLC_P17", "gCT_P17", "gRT_P17", "gLM_P17", "gTg_P17", "gRM_P17", "gLB_P17", "gCB_P17", "gRB_P17", "YEAR")
	new_col_YNG_POP <- c("gLC_Y17", "gCT_Y17", "gRT_Y17", "gLM_Y17", "gTg_Y17", "gRM_Y17", "gLB_Y17", "gCB_Y17", "gRB_Y17", "YEAR")

	colnames(GRD_BUSNS_17) <- new_col_BUSNS; GRD_BUSNS_17$YEAR <- NULL
	colnames(GRD_HSHD_17) <- new_col_HSHD; GRD_HSHD_17$YEAR <- NULL
	colnames(GRD_RSDNC_17) <- new_col_RSDNC; GRD_RSDNC_17$YEAR <- NULL
	colnames(GRD_WRKRS_17) <- new_col_WRKRS; GRD_WRKRS_17$YEAR <- NULL
	colnames(GRD_POPTN_17) <- new_col_POPTN; GRD_POPTN_17$YEAR <- NULL
	colnames(GRD_YNG_POP_17) <- new_col_YNG_POP; GRD_YNG_POP_17$YEAR <- NULL



	GRD_BUSNS_18 <- subset(GRD_BUSNS, YEAR == 2018)
	GRD_HSHD_18 <- subset(GRD_HSHD, YEAR == 2018)
	GRD_RSDNC_18 <- subset(GRD_RSDNC, YEAR == 2018)
	GRD_WRKRS_18 <- subset(GRD_WRKRS, YEAR == 2018)
	GRD_POPTN_18 <- subset(GRD_POPTN, YEAR == 2018)
	GRD_YNG_POP_18 <- subset(GRD_YNG_POP, YEAR == 2018)

	new_col_BUSNS <- c("gLC_B18", "gCT_B18", "gRT_B18", "gLM_B18", "gTg_B18", "gRM_B18", "gLB_B18", "gCB_B18", "gRB_B18", "YEAR")
	new_col_HSHD <- c("gLC_H18", "gCT_H18", "gRT_H18", "gLM_H18", "gTg_H18", "gRM_H18", "gLB_H18", "gCB_H18", "gRB_H18", "YEAR")
	new_col_RSDNC <- c("gLC_R18", "gCT_R18", "gRT_R18", "gLM_R18", "gTg_R18", "gRM_R18", "gLB_R18", "gCB_R18", "gRB_R18", "YEAR")
	new_col_WRKRS <- c("gLC_W18", "gCT_W18", "gRT_W18", "gLM_W18", "gTg_W18", "gRM_W18", "gLB_W18", "gCB_W18", "gRB_W18", "YEAR")
	new_col_POPTN <- c("gLC_P18", "gCT_P18", "gRT_P18", "gLM_P18", "gTg_P18", "gRM_P18", "gLB_P18", "gCB_P18", "gRB_P18", "YEAR")
	new_col_YNG_POP <- c("gLC_Y18", "gCT_Y18", "gRT_Y18", "gLM_Y18", "gTg_Y18", "gRM_Y18", "gLB_Y18", "gCB_Y18", "gRB_Y18", "YEAR")

	colnames(GRD_BUSNS_18) <- new_col_BUSNS; GRD_BUSNS_18$YEAR <- NULL
	colnames(GRD_HSHD_18) <- new_col_HSHD; GRD_HSHD_18$YEAR <- NULL
	colnames(GRD_RSDNC_18) <- new_col_RSDNC; GRD_RSDNC_18$YEAR <- NULL
	colnames(GRD_WRKRS_18) <- new_col_WRKRS; GRD_WRKRS_18$YEAR <- NULL
	colnames(GRD_POPTN_18) <- new_col_POPTN; GRD_POPTN_18$YEAR <- NULL
	colnames(GRD_YNG_POP_18) <- new_col_YNG_POP; GRD_YNG_POP_18$YEAR <- NULL


	GRD_BUSNS_19 <- subset(GRD_BUSNS, YEAR == 2019)
	GRD_HSHD_19 <- subset(GRD_HSHD, YEAR == 2019)
	GRD_RSDNC_19 <- subset(GRD_RSDNC, YEAR == 2019)
	GRD_WRKRS_19 <- subset(GRD_WRKRS, YEAR == 2019)
	GRD_POPTN_19 <- subset(GRD_POPTN, YEAR == 2019)
	GRD_YNG_POP_19 <- subset(GRD_YNG_POP, YEAR == 2019)

	new_col_BUSNS <- c("gLC_B19", "gCT_B19", "gRT_B19", "gLM_B19", "gTg_B19", "gRM_B19", "gLB_B19", "gCB_B19", "gRB_B19", "YEAR")
	new_col_HSHD <- c("gLC_H19", "gCT_H19", "gRT_H19", "gLM_H19", "gTg_H19", "gRM_H19", "gLB_H19", "gCB_H19", "gRB_H19", "YEAR")
	new_col_RSDNC <- c("gLC_R19", "gCT_R19", "gRT_R19", "gLM_R19", "gTg_R19", "gRM_R19", "gLB_R19", "gCB_R19", "gRB_R19", "YEAR")
	new_col_WRKRS <- c("gLC_W19", "gCT_W19", "gRT_W19", "gLM_W19", "gTg_W19", "gRM_W19", "gLB_W19", "gCB_W19", "gRB_W19", "YEAR")
	new_col_POPTN <- c("gLC_P19", "gCT_P19", "gRT_P19", "gLM_P19", "gTg_P19", "gRM_P19", "gLB_P19", "gCB_P19", "gRB_P19", "YEAR")
	new_col_YNG_POP <- c("gLC_Y19", "gCT_Y19", "gRT_Y19", "gLM_Y19", "gTg_Y19", "gRM_Y19", "gLB_Y19", "gCB_Y19", "gRB_Y19", "YEAR")

	colnames(GRD_BUSNS_19) <- new_col_BUSNS; GRD_BUSNS_19$YEAR <- NULL
	colnames(GRD_HSHD_19) <- new_col_HSHD; GRD_HSHD_19$YEAR <- NULL
	colnames(GRD_RSDNC_19) <- new_col_RSDNC; GRD_RSDNC_19$YEAR <- NULL
	colnames(GRD_WRKRS_19) <- new_col_WRKRS; GRD_WRKRS_19$YEAR <- NULL
	colnames(GRD_POPTN_19) <- new_col_POPTN; GRD_POPTN_19$YEAR <- NULL
	colnames(GRD_YNG_POP_19) <- new_col_YNG_POP; GRD_YNG_POP_19$YEAR <- NULL



	GRD_BUSNS_20 <- subset(GRD_BUSNS, YEAR == 2020)
	GRD_HSHD_20 <- subset(GRD_HSHD, YEAR == 2020)
	GRD_RSDNC_20 <- subset(GRD_RSDNC, YEAR == 2020)
	GRD_WRKRS_20 <- subset(GRD_WRKRS, YEAR == 2020)
	GRD_POPTN_20 <- subset(GRD_POPTN, YEAR == 2020)
	GRD_YNG_POP_20 <- subset(GRD_YNG_POP, YEAR == 2020)

	new_col_BUSNS <- c("gLC_B20", "gCT_B20", "gRT_B20", "gLM_B20", "gTg_B20", "gRM_B20", "gLB_B20", "gCB_B20", "gRB_B20", "YEAR")
	new_col_HSHD <- c("gLC_H20", "gCT_H20", "gRT_H20", "gLM_H20", "gTg_H20", "gRM_H20", "gLB_H20", "gCB_H20", "gRB_H20", "YEAR")
	new_col_RSDNC <- c("gLC_R20", "gCT_R20", "gRT_R20", "gLM_R20", "gTg_R20", "gRM_R20", "gLB_R20", "gCB_R20", "gRB_R20", "YEAR")
	new_col_WRKRS <- c("gLC_W20", "gCT_W20", "gRT_W20", "gLM_W20", "gTg_W20", "gRM_W20", "gLB_W20", "gCB_W20", "gRB_W20", "YEAR")
	new_col_POPTN <- c("gLC_P20", "gCT_P20", "gRT_P20", "gLM_P20", "gTg_P20", "gRM_P20", "gLB_P20", "gCB_P20", "gRB_P20", "YEAR")
	new_col_YNG_POP <- c("gLC_Y20", "gCT_Y20", "gRT_Y20", "gLM_Y20", "gTg_Y20", "gRM_Y20", "gLB_Y20", "gCB_Y20", "gRB_Y20", "YEAR")

	colnames(GRD_BUSNS_20) <- new_col_BUSNS; GRD_BUSNS_20$YEAR <- NULL
	colnames(GRD_HSHD_20) <- new_col_HSHD; GRD_HSHD_20$YEAR <- NULL
	colnames(GRD_RSDNC_20) <- new_col_RSDNC; GRD_RSDNC_20$YEAR <- NULL
	colnames(GRD_WRKRS_20) <- new_col_WRKRS; GRD_WRKRS_20$YEAR <- NULL
	colnames(GRD_POPTN_20) <- new_col_POPTN; GRD_POPTN_20$YEAR <- NULL
	colnames(GRD_YNG_POP_20) <- new_col_YNG_POP; GRD_YNG_POP_20$YEAR <- NULL



	GRD_BUSNS_21 <- subset(GRD_BUSNS, YEAR == 2021)
	GRD_HSHD_21 <- subset(GRD_HSHD, YEAR == 2021)
	GRD_RSDNC_21 <- subset(GRD_RSDNC, YEAR == 2021)
	GRD_WRKRS_21 <- subset(GRD_WRKRS, YEAR == 2021)
	GRD_POPTN_21 <- subset(GRD_POPTN, YEAR == 2021)
	GRD_YNG_POP_21 <- subset(GRD_YNG_POP, YEAR == 2021)

	new_col_BUSNS <- c("gLC_B21", "gCT_B21", "gRT_B21", "gLM_B21", "gTg_B21", "gRM_B21", "gLB_B21", "gCB_B21", "gRB_B21", "YEAR")
	new_col_HSHD <- c("gLC_H21", "gCT_H21", "gRT_H21", "gLM_H21", "gTg_H21", "gRM_H21", "gLB_H21", "gCB_H21", "gRB_H21", "YEAR")
	new_col_RSDNC <- c("gLC_R21", "gCT_R21", "gRT_R21", "gLM_R21", "gTg_R21", "gRM_R21", "gLB_R21", "gCB_R21", "gRB_R21", "YEAR")
	new_col_WRKRS <- c("gLC_W21", "gCT_W21", "gRT_W21", "gLM_W21", "gTg_W21", "gRM_W21", "gLB_W21", "gCB_W21", "gRB_W21", "YEAR")
	new_col_POPTN <- c("gLC_P21", "gCT_P21", "gRT_P21", "gLM_P21", "gTg_P21", "gRM_P21", "gLB_P21", "gCB_P21", "gRB_P21", "YEAR")
	new_col_YNG_POP <- c("gLC_Y21", "gCT_Y21", "gRT_Y21", "gLM_Y21", "gTg_Y21", "gRM_Y21", "gLB_Y21", "gCB_Y21", "gRB_Y21", "YEAR")

	colnames(GRD_BUSNS_21) <- new_col_BUSNS; GRD_BUSNS_21$YEAR <- NULL
	colnames(GRD_HSHD_21) <- new_col_HSHD; GRD_HSHD_21$YEAR <- NULL
	colnames(GRD_RSDNC_21) <- new_col_RSDNC; GRD_RSDNC_21$YEAR <- NULL
	colnames(GRD_WRKRS_21) <- new_col_WRKRS; GRD_WRKRS_21$YEAR <- NULL
	colnames(GRD_POPTN_21) <- new_col_POPTN; GRD_POPTN_21$YEAR <- NULL
	colnames(GRD_YNG_POP_21) <- new_col_YNG_POP; GRD_YNG_POP_21$YEAR <- NULL


	GRD_BUSNS_22 <- subset(GRD_BUSNS, YEAR == 2022)
	GRD_HSHD_22 <- subset(GRD_HSHD, YEAR == 2022)
	GRD_RSDNC_22 <- subset(GRD_RSDNC, YEAR == 2022)
	GRD_WRKRS_22 <- subset(GRD_WRKRS, YEAR == 2022)
	GRD_POPTN_22 <- subset(GRD_POPTN, YEAR == 2022)
	GRD_YNG_POP_22 <- subset(GRD_YNG_POP, YEAR == 2022)

	new_col_BUSNS <- c("gLC_B22", "gCT_B22", "gRT_B22", "gLM_B22", "gTg_B22", "gRM_B22", "gLB_B22", "gCB_B22", "gRB_B22", "YEAR")
	new_col_HSHD <- c("gLC_H22", "gCT_H22", "gRT_H22", "gLM_H22", "gTg_H22", "gRM_H22", "gLB_H22", "gCB_H22", "gRB_H22", "YEAR")
	new_col_RSDNC <- c("gLC_R22", "gCT_R22", "gRT_R22", "gLM_R22", "gTg_R22", "gRM_R22", "gLB_R22", "gCB_R22", "gRB_R22", "YEAR")
	new_col_WRKRS <- c("gLC_W22", "gCT_W22", "gRT_W22", "gLM_W22", "gTg_W22", "gRM_W22", "gLB_W22", "gCB_W22", "gRB_W22", "YEAR")
	new_col_POPTN <- c("gLC_P22", "gCT_P22", "gRT_P22", "gLM_P22", "gTg_P22", "gRM_P22", "gLB_P22", "gCB_P22", "gRB_P22", "YEAR")
	new_col_YNG_POP <- c("gLC_Y22", "gCT_Y22", "gRT_Y22", "gLM_Y22", "gTg_Y22", "gRM_Y22", "gLB_Y22", "gCB_Y22", "gRB_Y22", "YEAR")

	colnames(GRD_BUSNS_22) <- new_col_BUSNS; GRD_BUSNS_22$YEAR <- NULL
	colnames(GRD_HSHD_22) <- new_col_HSHD; GRD_HSHD_22$YEAR <- NULL
	colnames(GRD_RSDNC_22) <- new_col_RSDNC; GRD_RSDNC_22$YEAR <- NULL
	colnames(GRD_WRKRS_22) <- new_col_WRKRS; GRD_WRKRS_22$YEAR <- NULL
	colnames(GRD_POPTN_22) <- new_col_POPTN; GRD_POPTN_22$YEAR <- NULL
	colnames(GRD_YNG_POP_22) <- new_col_YNG_POP; GRD_YNG_POP_22$YEAR <- NULL


	TESTING_SET <- cbind(
	GRD_BUSNS_05, GRD_HSHD_05, GRD_RSDNC_05, GRD_WRKRS_05, GRD_POPTN_05, GRD_YNG_POP_05, 
	GRD_BUSNS_10, GRD_HSHD_10, GRD_RSDNC_10, GRD_WRKRS_10, GRD_POPTN_10, GRD_YNG_POP_10, 
	GRD_BUSNS_15, GRD_HSHD_15, GRD_RSDNC_15, GRD_WRKRS_15, GRD_POPTN_15, GRD_YNG_POP_15, 
	GRD_BUSNS_16, GRD_HSHD_16, GRD_RSDNC_16, GRD_WRKRS_16, GRD_POPTN_16, GRD_YNG_POP_16, 
	GRD_BUSNS_17, GRD_HSHD_17, GRD_RSDNC_17, GRD_WRKRS_17, GRD_POPTN_17, GRD_YNG_POP_17, 
	GRD_BUSNS_18, GRD_HSHD_18, GRD_RSDNC_18, GRD_WRKRS_18, GRD_POPTN_18, GRD_YNG_POP_18, 
	GRD_BUSNS_19, GRD_HSHD_19, GRD_RSDNC_19, GRD_WRKRS_19, GRD_POPTN_19, GRD_YNG_POP_19, 
	GRD_BUSNS_20, GRD_HSHD_20, GRD_RSDNC_20, GRD_WRKRS_20, GRD_POPTN_20, GRD_YNG_POP_20, 
	GRD_BUSNS_21, GRD_HSHD_21, GRD_RSDNC_21, GRD_WRKRS_21, GRD_POPTN_21, GRD_YNG_POP_21, 
	GRD_BUSNS_22, GRD_HSHD_22, GRD_RSDNC_22, GRD_WRKRS_22, GRD_POPTN_22, GRD_YNG_POP_22)

	return(TESTING_SET)
}




TESTING_data_TYPE_3 <- function(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP){


	# LEARNING FASHION] LEARNING > TESTING > TUNING (w/ STAT EST.)
	# Young population has only between 2014 - 2024
	#============================ YEARLY DESGIN for LEARNING FASHION =============================#
	#---------------------------------------------------------------------------------------------
	#---------------|-------------- LEARNING --------------|--------------- TESTING --------------
	#   PREDICTION  |      TRAINING-SET     |    TARGET    |      TRAINING-SET     |    TARGET   
	#---------------|-----------------------|--------------|-----------------------|--------------
	#  1year-model  |      2000 ~ 2022      |     2023     |      2005 ~ 2023      |     2025     
	#  2year-model  |      2000 ~ 2021      |     2023     |      2005 ~ 2022      |     2026     
	#  3year-model  |      2000 ~ 2020      |     2023     |      2005 ~ 2021      |     2027     
	#  4year-model  |      2000 ~ 2019      |     2023     |      2005 ~ 2020      |     2028     
	#  5year-model  |      2000 ~ 2018      |     2023     |      2005 ~ 2019      |     2029     
	#  6year-model  |      2000 ~ 2017      |     2023     |      2005 ~ 2018      |     2030     
	#----------------------------------------------------------------------------------------------

	# Total 12 years data) 2000 2005 2010 2015 2016 2017 2018 2019 2020 2021 2022 2023
	# 1year-model: Learning(11)-Target(1) > Testing(11)-Target(1)
	# 2year-model: Learning(10)-Target(1) > Testing(10)-Target(1)
	# 3year-model: Learning(9)-Target(1) > Testing(9)-Target(1)
	# 4year-model: Learning(8)-Target(1) > Testing(8)-Target(1)
	# 5year-model: Learning(7)-Target(1) > Testing(7)-Target(1)
	# 6year-model: Learning(6)-Target(1) > Testing(6)-Target(1)

	GRD_BUSNS_05 <- subset(GRD_BUSNS, YEAR == 2005)
	GRD_HSHD_05 <- subset(GRD_HSHD, YEAR == 2005)
	GRD_RSDNC_05 <- subset(GRD_RSDNC, YEAR == 2005)
	GRD_WRKRS_05 <- subset(GRD_WRKRS, YEAR == 2005)
	GRD_POPTN_05 <- subset(GRD_POPTN, YEAR == 2005)
	GRD_YNG_POP_05 <- subset(GRD_YNG_POP, YEAR == 2005)

	new_col_BUSNS <- c("gLC_B05", "gCT_B05", "gRT_B05", "gLM_B05", "gTg_B05", "gRM_B05", "gLB_B05", "gCB_B05", "gRB_B05", "YEAR")
	new_col_HSHD <- c("gLC_H05", "gCT_H05", "gRT_H05", "gLM_H05", "gTg_H05", "gRM_H05", "gLB_H05", "gCB_H05", "gRB_H05", "YEAR")
	new_col_RSDNC <- c("gLC_R05", "gCT_R05", "gRT_R05", "gLM_R05", "gTg_R05", "gRM_R05", "gLB_R05", "gCB_R05", "gRB_R05", "YEAR")
	new_col_WRKRS <- c("gLC_W05", "gCT_W05", "gRT_W05", "gLM_W05", "gTg_W05", "gRM_W05", "gLB_W05", "gCB_W05", "gRB_W05", "YEAR")
	new_col_POPTN <- c("gLC_P05", "gCT_P05", "gRT_P05", "gLM_P05", "gTg_P05", "gRM_P05", "gLB_P05", "gCB_P05", "gRB_P05", "YEAR")
	new_col_YNG_POP <- c("gLC_Y05", "gCT_Y05", "gRT_Y05", "gLM_Y05", "gTg_Y05", "gRM_Y05", "gLB_Y05", "gCB_Y05", "gRB_Y05", "YEAR")

	colnames(GRD_BUSNS_05) <- new_col_BUSNS; GRD_BUSNS_05$YEAR <- NULL
	colnames(GRD_HSHD_05) <- new_col_HSHD; GRD_HSHD_05$YEAR <- NULL
	colnames(GRD_RSDNC_05) <- new_col_RSDNC; GRD_RSDNC_05$YEAR <- NULL
	colnames(GRD_WRKRS_05) <- new_col_WRKRS; GRD_WRKRS_05$YEAR <- NULL
	colnames(GRD_POPTN_05) <- new_col_POPTN; GRD_POPTN_05$YEAR <- NULL
	colnames(GRD_YNG_POP_05) <- new_col_YNG_POP; GRD_YNG_POP_05$YEAR <- NULL



	GRD_BUSNS_10 <- subset(GRD_BUSNS, YEAR == 2010)
	GRD_HSHD_10 <- subset(GRD_HSHD, YEAR == 2010)
	GRD_RSDNC_10 <- subset(GRD_RSDNC, YEAR == 2010)
	GRD_WRKRS_10 <- subset(GRD_WRKRS, YEAR == 2010)
	GRD_POPTN_10 <- subset(GRD_POPTN, YEAR == 2010)
	GRD_YNG_POP_10 <- subset(GRD_YNG_POP, YEAR == 2010)

	new_col_BUSNS <- c("gLC_B10", "gCT_B10", "gRT_B10", "gLM_B10", "gTg_B10", "gRM_B10", "gLB_B10", "gCB_B10", "gRB_B10", "YEAR")
	new_col_HSHD <- c("gLC_H10", "gCT_H10", "gRT_H10", "gLM_H10", "gTg_H10", "gRM_H10", "gLB_H10", "gCB_H10", "gRB_H10", "YEAR")
	new_col_RSDNC <- c("gLC_R10", "gCT_R10", "gRT_R10", "gLM_R10", "gTg_R10", "gRM_R10", "gLB_R10", "gCB_R10", "gRB_R10", "YEAR")
	new_col_WRKRS <- c("gLC_W10", "gCT_W10", "gRT_W10", "gLM_W10", "gTg_W10", "gRM_W10", "gLB_W10", "gCB_W10", "gRB_W10", "YEAR")
	new_col_POPTN <- c("gLC_P10", "gCT_P10", "gRT_P10", "gLM_P10", "gTg_P10", "gRM_P10", "gLB_P10", "gCB_P10", "gRB_P10", "YEAR")
	new_col_YNG_POP <- c("gLC_Y10", "gCT_Y10", "gRT_Y10", "gLM_Y10", "gTg_Y10", "gRM_Y10", "gLB_Y10", "gCB_Y10", "gRB_Y10", "YEAR")

	colnames(GRD_BUSNS_10) <- new_col_BUSNS; GRD_BUSNS_10$YEAR <- NULL
	colnames(GRD_HSHD_10) <- new_col_HSHD; GRD_HSHD_10$YEAR <- NULL
	colnames(GRD_RSDNC_10) <- new_col_RSDNC; GRD_RSDNC_10$YEAR <- NULL
	colnames(GRD_WRKRS_10) <- new_col_WRKRS; GRD_WRKRS_10$YEAR <- NULL
	colnames(GRD_POPTN_10) <- new_col_POPTN; GRD_POPTN_10$YEAR <- NULL
	colnames(GRD_YNG_POP_10) <- new_col_YNG_POP; GRD_YNG_POP_10$YEAR <- NULL




	GRD_BUSNS_15 <- subset(GRD_BUSNS, YEAR == 2015)
	GRD_HSHD_15 <- subset(GRD_HSHD, YEAR == 2015)
	GRD_RSDNC_15 <- subset(GRD_RSDNC, YEAR == 2015)
	GRD_WRKRS_15 <- subset(GRD_WRKRS, YEAR == 2015)
	GRD_POPTN_15 <- subset(GRD_POPTN, YEAR == 2015)
	GRD_YNG_POP_15 <- subset(GRD_YNG_POP, YEAR == 2015)

	new_col_BUSNS <- c("gLC_B15", "gCT_B15", "gRT_B15", "gLM_B15", "gTg_B15", "gRM_B15", "gLB_B15", "gCB_B15", "gRB_B15", "YEAR")
	new_col_HSHD <- c("gLC_H15", "gCT_H15", "gRT_H15", "gLM_H15", "gTg_H15", "gRM_H15", "gLB_H15", "gCB_H15", "gRB_H15", "YEAR")
	new_col_RSDNC <- c("gLC_R15", "gCT_R15", "gRT_R15", "gLM_R15", "gTg_R15", "gRM_R15", "gLB_R15", "gCB_R15", "gRB_R15", "YEAR")
	new_col_WRKRS <- c("gLC_W15", "gCT_W15", "gRT_W15", "gLM_W15", "gTg_W15", "gRM_W15", "gLB_W15", "gCB_W15", "gRB_W15", "YEAR")
	new_col_POPTN <- c("gLC_P15", "gCT_P15", "gRT_P15", "gLM_P15", "gTg_P15", "gRM_P15", "gLB_P15", "gCB_P15", "gRB_P15", "YEAR")
	new_col_YNG_POP <- c("gLC_Y15", "gCT_Y15", "gRT_Y15", "gLM_Y15", "gTg_Y15", "gRM_Y15", "gLB_Y15", "gCB_Y15", "gRB_Y15", "YEAR")

	colnames(GRD_BUSNS_15) <- new_col_BUSNS; GRD_BUSNS_15$YEAR <- NULL
	colnames(GRD_HSHD_15) <- new_col_HSHD; GRD_HSHD_15$YEAR <- NULL
	colnames(GRD_RSDNC_15) <- new_col_RSDNC; GRD_RSDNC_15$YEAR <- NULL
	colnames(GRD_WRKRS_15) <- new_col_WRKRS; GRD_WRKRS_15$YEAR <- NULL
	colnames(GRD_POPTN_15) <- new_col_POPTN; GRD_POPTN_15$YEAR <- NULL
	colnames(GRD_YNG_POP_15) <- new_col_YNG_POP; GRD_YNG_POP_15$YEAR <- NULL



	GRD_BUSNS_16 <- subset(GRD_BUSNS, YEAR == 2016)
	GRD_HSHD_16 <- subset(GRD_HSHD, YEAR == 2016)
	GRD_RSDNC_16 <- subset(GRD_RSDNC, YEAR == 2016)
	GRD_WRKRS_16 <- subset(GRD_WRKRS, YEAR == 2016)
	GRD_POPTN_16 <- subset(GRD_POPTN, YEAR == 2016)
	GRD_YNG_POP_16 <- subset(GRD_YNG_POP, YEAR == 2016)

	new_col_BUSNS <- c("gLC_B16", "gCT_B16", "gRT_B16", "gLM_B16", "gTg_B16", "gRM_B16", "gLB_B16", "gCB_B16", "gRB_B16", "YEAR")
	new_col_HSHD <- c("gLC_H16", "gCT_H16", "gRT_H16", "gLM_H16", "gTg_H16", "gRM_H16", "gLB_H16", "gCB_H16", "gRB_H16", "YEAR")
	new_col_RSDNC <- c("gLC_R16", "gCT_R16", "gRT_R16", "gLM_R16", "gTg_R16", "gRM_R16", "gLB_R16", "gCB_R16", "gRB_R16", "YEAR")
	new_col_WRKRS <- c("gLC_W16", "gCT_W16", "gRT_W16", "gLM_W16", "gTg_W16", "gRM_W16", "gLB_W16", "gCB_W16", "gRB_W16", "YEAR")
	new_col_POPTN <- c("gLC_P16", "gCT_P16", "gRT_P16", "gLM_P16", "gTg_P16", "gRM_P16", "gLB_P16", "gCB_P16", "gRB_P16", "YEAR")
	new_col_YNG_POP <- c("gLC_Y16", "gCT_Y16", "gRT_Y16", "gLM_Y16", "gTg_Y16", "gRM_Y16", "gLB_Y16", "gCB_Y16", "gRB_Y16", "YEAR")

	colnames(GRD_BUSNS_16) <- new_col_BUSNS; GRD_BUSNS_16$YEAR <- NULL
	colnames(GRD_HSHD_16) <- new_col_HSHD; GRD_HSHD_16$YEAR <- NULL
	colnames(GRD_RSDNC_16) <- new_col_RSDNC; GRD_RSDNC_16$YEAR <- NULL
	colnames(GRD_WRKRS_16) <- new_col_WRKRS; GRD_WRKRS_16$YEAR <- NULL
	colnames(GRD_POPTN_16) <- new_col_POPTN; GRD_POPTN_16$YEAR <- NULL
	colnames(GRD_YNG_POP_16) <- new_col_YNG_POP; GRD_YNG_POP_16$YEAR <- NULL



	GRD_BUSNS_17 <- subset(GRD_BUSNS, YEAR == 2017)
	GRD_HSHD_17 <- subset(GRD_HSHD, YEAR == 2017)
	GRD_RSDNC_17 <- subset(GRD_RSDNC, YEAR == 2017)
	GRD_WRKRS_17 <- subset(GRD_WRKRS, YEAR == 2017)
	GRD_POPTN_17 <- subset(GRD_POPTN, YEAR == 2017)
	GRD_YNG_POP_17 <- subset(GRD_YNG_POP, YEAR == 2017)

	new_col_BUSNS <- c("gLC_B17", "gCT_B17", "gRT_B17", "gLM_B17", "gTg_B17", "gRM_B17", "gLB_B17", "gCB_B17", "gRB_B17", "YEAR")
	new_col_HSHD <- c("gLC_H17", "gCT_H17", "gRT_H17", "gLM_H17", "gTg_H17", "gRM_H17", "gLB_H17", "gCB_H17", "gRB_H17", "YEAR")
	new_col_RSDNC <- c("gLC_R17", "gCT_R17", "gRT_R17", "gLM_R17", "gTg_R17", "gRM_R17", "gLB_R17", "gCB_R17", "gRB_R17", "YEAR")
	new_col_WRKRS <- c("gLC_W17", "gCT_W17", "gRT_W17", "gLM_W17", "gTg_W17", "gRM_W17", "gLB_W17", "gCB_W17", "gRB_W17", "YEAR")
	new_col_POPTN <- c("gLC_P17", "gCT_P17", "gRT_P17", "gLM_P17", "gTg_P17", "gRM_P17", "gLB_P17", "gCB_P17", "gRB_P17", "YEAR")
	new_col_YNG_POP <- c("gLC_Y17", "gCT_Y17", "gRT_Y17", "gLM_Y17", "gTg_Y17", "gRM_Y17", "gLB_Y17", "gCB_Y17", "gRB_Y17", "YEAR")

	colnames(GRD_BUSNS_17) <- new_col_BUSNS; GRD_BUSNS_17$YEAR <- NULL
	colnames(GRD_HSHD_17) <- new_col_HSHD; GRD_HSHD_17$YEAR <- NULL
	colnames(GRD_RSDNC_17) <- new_col_RSDNC; GRD_RSDNC_17$YEAR <- NULL
	colnames(GRD_WRKRS_17) <- new_col_WRKRS; GRD_WRKRS_17$YEAR <- NULL
	colnames(GRD_POPTN_17) <- new_col_POPTN; GRD_POPTN_17$YEAR <- NULL
	colnames(GRD_YNG_POP_17) <- new_col_YNG_POP; GRD_YNG_POP_17$YEAR <- NULL



	GRD_BUSNS_18 <- subset(GRD_BUSNS, YEAR == 2018)
	GRD_HSHD_18 <- subset(GRD_HSHD, YEAR == 2018)
	GRD_RSDNC_18 <- subset(GRD_RSDNC, YEAR == 2018)
	GRD_WRKRS_18 <- subset(GRD_WRKRS, YEAR == 2018)
	GRD_POPTN_18 <- subset(GRD_POPTN, YEAR == 2018)
	GRD_YNG_POP_18 <- subset(GRD_YNG_POP, YEAR == 2018)

	new_col_BUSNS <- c("gLC_B18", "gCT_B18", "gRT_B18", "gLM_B18", "gTg_B18", "gRM_B18", "gLB_B18", "gCB_B18", "gRB_B18", "YEAR")
	new_col_HSHD <- c("gLC_H18", "gCT_H18", "gRT_H18", "gLM_H18", "gTg_H18", "gRM_H18", "gLB_H18", "gCB_H18", "gRB_H18", "YEAR")
	new_col_RSDNC <- c("gLC_R18", "gCT_R18", "gRT_R18", "gLM_R18", "gTg_R18", "gRM_R18", "gLB_R18", "gCB_R18", "gRB_R18", "YEAR")
	new_col_WRKRS <- c("gLC_W18", "gCT_W18", "gRT_W18", "gLM_W18", "gTg_W18", "gRM_W18", "gLB_W18", "gCB_W18", "gRB_W18", "YEAR")
	new_col_POPTN <- c("gLC_P18", "gCT_P18", "gRT_P18", "gLM_P18", "gTg_P18", "gRM_P18", "gLB_P18", "gCB_P18", "gRB_P18", "YEAR")
	new_col_YNG_POP <- c("gLC_Y18", "gCT_Y18", "gRT_Y18", "gLM_Y18", "gTg_Y18", "gRM_Y18", "gLB_Y18", "gCB_Y18", "gRB_Y18", "YEAR")

	colnames(GRD_BUSNS_18) <- new_col_BUSNS; GRD_BUSNS_18$YEAR <- NULL
	colnames(GRD_HSHD_18) <- new_col_HSHD; GRD_HSHD_18$YEAR <- NULL
	colnames(GRD_RSDNC_18) <- new_col_RSDNC; GRD_RSDNC_18$YEAR <- NULL
	colnames(GRD_WRKRS_18) <- new_col_WRKRS; GRD_WRKRS_18$YEAR <- NULL
	colnames(GRD_POPTN_18) <- new_col_POPTN; GRD_POPTN_18$YEAR <- NULL
	colnames(GRD_YNG_POP_18) <- new_col_YNG_POP; GRD_YNG_POP_18$YEAR <- NULL


	GRD_BUSNS_19 <- subset(GRD_BUSNS, YEAR == 2019)
	GRD_HSHD_19 <- subset(GRD_HSHD, YEAR == 2019)
	GRD_RSDNC_19 <- subset(GRD_RSDNC, YEAR == 2019)
	GRD_WRKRS_19 <- subset(GRD_WRKRS, YEAR == 2019)
	GRD_POPTN_19 <- subset(GRD_POPTN, YEAR == 2019)
	GRD_YNG_POP_19 <- subset(GRD_YNG_POP, YEAR == 2019)

	new_col_BUSNS <- c("gLC_B19", "gCT_B19", "gRT_B19", "gLM_B19", "gTg_B19", "gRM_B19", "gLB_B19", "gCB_B19", "gRB_B19", "YEAR")
	new_col_HSHD <- c("gLC_H19", "gCT_H19", "gRT_H19", "gLM_H19", "gTg_H19", "gRM_H19", "gLB_H19", "gCB_H19", "gRB_H19", "YEAR")
	new_col_RSDNC <- c("gLC_R19", "gCT_R19", "gRT_R19", "gLM_R19", "gTg_R19", "gRM_R19", "gLB_R19", "gCB_R19", "gRB_R19", "YEAR")
	new_col_WRKRS <- c("gLC_W19", "gCT_W19", "gRT_W19", "gLM_W19", "gTg_W19", "gRM_W19", "gLB_W19", "gCB_W19", "gRB_W19", "YEAR")
	new_col_POPTN <- c("gLC_P19", "gCT_P19", "gRT_P19", "gLM_P19", "gTg_P19", "gRM_P19", "gLB_P19", "gCB_P19", "gRB_P19", "YEAR")
	new_col_YNG_POP <- c("gLC_Y19", "gCT_Y19", "gRT_Y19", "gLM_Y19", "gTg_Y19", "gRM_Y19", "gLB_Y19", "gCB_Y19", "gRB_Y19", "YEAR")

	colnames(GRD_BUSNS_19) <- new_col_BUSNS; GRD_BUSNS_19$YEAR <- NULL
	colnames(GRD_HSHD_19) <- new_col_HSHD; GRD_HSHD_19$YEAR <- NULL
	colnames(GRD_RSDNC_19) <- new_col_RSDNC; GRD_RSDNC_19$YEAR <- NULL
	colnames(GRD_WRKRS_19) <- new_col_WRKRS; GRD_WRKRS_19$YEAR <- NULL
	colnames(GRD_POPTN_19) <- new_col_POPTN; GRD_POPTN_19$YEAR <- NULL
	colnames(GRD_YNG_POP_19) <- new_col_YNG_POP; GRD_YNG_POP_19$YEAR <- NULL



	GRD_BUSNS_20 <- subset(GRD_BUSNS, YEAR == 2020)
	GRD_HSHD_20 <- subset(GRD_HSHD, YEAR == 2020)
	GRD_RSDNC_20 <- subset(GRD_RSDNC, YEAR == 2020)
	GRD_WRKRS_20 <- subset(GRD_WRKRS, YEAR == 2020)
	GRD_POPTN_20 <- subset(GRD_POPTN, YEAR == 2020)
	GRD_YNG_POP_20 <- subset(GRD_YNG_POP, YEAR == 2020)

	new_col_BUSNS <- c("gLC_B20", "gCT_B20", "gRT_B20", "gLM_B20", "gTg_B20", "gRM_B20", "gLB_B20", "gCB_B20", "gRB_B20", "YEAR")
	new_col_HSHD <- c("gLC_H20", "gCT_H20", "gRT_H20", "gLM_H20", "gTg_H20", "gRM_H20", "gLB_H20", "gCB_H20", "gRB_H20", "YEAR")
	new_col_RSDNC <- c("gLC_R20", "gCT_R20", "gRT_R20", "gLM_R20", "gTg_R20", "gRM_R20", "gLB_R20", "gCB_R20", "gRB_R20", "YEAR")
	new_col_WRKRS <- c("gLC_W20", "gCT_W20", "gRT_W20", "gLM_W20", "gTg_W20", "gRM_W20", "gLB_W20", "gCB_W20", "gRB_W20", "YEAR")
	new_col_POPTN <- c("gLC_P20", "gCT_P20", "gRT_P20", "gLM_P20", "gTg_P20", "gRM_P20", "gLB_P20", "gCB_P20", "gRB_P20", "YEAR")
	new_col_YNG_POP <- c("gLC_Y20", "gCT_Y20", "gRT_Y20", "gLM_Y20", "gTg_Y20", "gRM_Y20", "gLB_Y20", "gCB_Y20", "gRB_Y20", "YEAR")

	colnames(GRD_BUSNS_20) <- new_col_BUSNS; GRD_BUSNS_20$YEAR <- NULL
	colnames(GRD_HSHD_20) <- new_col_HSHD; GRD_HSHD_20$YEAR <- NULL
	colnames(GRD_RSDNC_20) <- new_col_RSDNC; GRD_RSDNC_20$YEAR <- NULL
	colnames(GRD_WRKRS_20) <- new_col_WRKRS; GRD_WRKRS_20$YEAR <- NULL
	colnames(GRD_POPTN_20) <- new_col_POPTN; GRD_POPTN_20$YEAR <- NULL
	colnames(GRD_YNG_POP_20) <- new_col_YNG_POP; GRD_YNG_POP_20$YEAR <- NULL



	GRD_BUSNS_21 <- subset(GRD_BUSNS, YEAR == 2021)
	GRD_HSHD_21 <- subset(GRD_HSHD, YEAR == 2021)
	GRD_RSDNC_21 <- subset(GRD_RSDNC, YEAR == 2021)
	GRD_WRKRS_21 <- subset(GRD_WRKRS, YEAR == 2021)
	GRD_POPTN_21 <- subset(GRD_POPTN, YEAR == 2021)
	GRD_YNG_POP_21 <- subset(GRD_YNG_POP, YEAR == 2021)

	new_col_BUSNS <- c("gLC_B21", "gCT_B21", "gRT_B21", "gLM_B21", "gTg_B21", "gRM_B21", "gLB_B21", "gCB_B21", "gRB_B21", "YEAR")
	new_col_HSHD <- c("gLC_H21", "gCT_H21", "gRT_H21", "gLM_H21", "gTg_H21", "gRM_H21", "gLB_H21", "gCB_H21", "gRB_H21", "YEAR")
	new_col_RSDNC <- c("gLC_R21", "gCT_R21", "gRT_R21", "gLM_R21", "gTg_R21", "gRM_R21", "gLB_R21", "gCB_R21", "gRB_R21", "YEAR")
	new_col_WRKRS <- c("gLC_W21", "gCT_W21", "gRT_W21", "gLM_W21", "gTg_W21", "gRM_W21", "gLB_W21", "gCB_W21", "gRB_W21", "YEAR")
	new_col_POPTN <- c("gLC_P21", "gCT_P21", "gRT_P21", "gLM_P21", "gTg_P21", "gRM_P21", "gLB_P21", "gCB_P21", "gRB_P21", "YEAR")
	new_col_YNG_POP <- c("gLC_Y21", "gCT_Y21", "gRT_Y21", "gLM_Y21", "gTg_Y21", "gRM_Y21", "gLB_Y21", "gCB_Y21", "gRB_Y21", "YEAR")

	colnames(GRD_BUSNS_21) <- new_col_BUSNS; GRD_BUSNS_21$YEAR <- NULL
	colnames(GRD_HSHD_21) <- new_col_HSHD; GRD_HSHD_21$YEAR <- NULL
	colnames(GRD_RSDNC_21) <- new_col_RSDNC; GRD_RSDNC_21$YEAR <- NULL
	colnames(GRD_WRKRS_21) <- new_col_WRKRS; GRD_WRKRS_21$YEAR <- NULL
	colnames(GRD_POPTN_21) <- new_col_POPTN; GRD_POPTN_21$YEAR <- NULL
	colnames(GRD_YNG_POP_21) <- new_col_YNG_POP; GRD_YNG_POP_21$YEAR <- NULL

	TESTING_SET <- cbind(
	GRD_BUSNS_05, GRD_HSHD_05, GRD_RSDNC_05, GRD_WRKRS_05, GRD_POPTN_05, GRD_YNG_POP_05, 
	GRD_BUSNS_10, GRD_HSHD_10, GRD_RSDNC_10, GRD_WRKRS_10, GRD_POPTN_10, GRD_YNG_POP_10, 
	GRD_BUSNS_15, GRD_HSHD_15, GRD_RSDNC_15, GRD_WRKRS_15, GRD_POPTN_15, GRD_YNG_POP_15, 
	GRD_BUSNS_16, GRD_HSHD_16, GRD_RSDNC_16, GRD_WRKRS_16, GRD_POPTN_16, GRD_YNG_POP_16, 
	GRD_BUSNS_17, GRD_HSHD_17, GRD_RSDNC_17, GRD_WRKRS_17, GRD_POPTN_17, GRD_YNG_POP_17, 
	GRD_BUSNS_18, GRD_HSHD_18, GRD_RSDNC_18, GRD_WRKRS_18, GRD_POPTN_18, GRD_YNG_POP_18, 
	GRD_BUSNS_19, GRD_HSHD_19, GRD_RSDNC_19, GRD_WRKRS_19, GRD_POPTN_19, GRD_YNG_POP_19, 
	GRD_BUSNS_20, GRD_HSHD_20, GRD_RSDNC_20, GRD_WRKRS_20, GRD_POPTN_20, GRD_YNG_POP_20, 
	GRD_BUSNS_21, GRD_HSHD_21, GRD_RSDNC_21, GRD_WRKRS_21, GRD_POPTN_21, GRD_YNG_POP_21)

	return(TESTING_SET)
}




TESTING_data_TYPE_4 <- function(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP){


	# LEARNING FASHION] LEARNING > TESTING > TUNING (w/ STAT EST.)
	# Young population has only between 2014 - 2024
	#============================ YEARLY DESGIN for LEARNING FASHION =============================#
	#---------------------------------------------------------------------------------------------
	#---------------|-------------- LEARNING --------------|--------------- TESTING --------------
	#   PREDICTION  |      TRAINING-SET     |    TARGET    |      TRAINING-SET     |    TARGET   
	#---------------|-----------------------|--------------|-----------------------|--------------
	#  1year-model  |      2000 ~ 2022      |     2023     |      2005 ~ 2023      |     2025     
	#  2year-model  |      2000 ~ 2021      |     2023     |      2005 ~ 2022      |     2026     
	#  3year-model  |      2000 ~ 2020      |     2023     |      2005 ~ 2021      |     2027     
	#  4year-model  |      2000 ~ 2019      |     2023     |      2005 ~ 2020      |     2028     
	#  5year-model  |      2000 ~ 2018      |     2023     |      2005 ~ 2019      |     2029     
	#  6year-model  |      2000 ~ 2017      |     2023     |      2005 ~ 2018      |     2030     
	#----------------------------------------------------------------------------------------------

	# Total 12 years data) 2000 2005 2010 2015 2016 2017 2018 2019 2020 2021 2022 2023
	# 1year-model: Learning(11)-Target(1) > Testing(11)-Target(1)
	# 2year-model: Learning(10)-Target(1) > Testing(10)-Target(1)
	# 3year-model: Learning(9)-Target(1) > Testing(9)-Target(1)
	# 4year-model: Learning(8)-Target(1) > Testing(8)-Target(1)
	# 5year-model: Learning(7)-Target(1) > Testing(7)-Target(1)
	# 6year-model: Learning(6)-Target(1) > Testing(6)-Target(1)


	GRD_BUSNS_05 <- subset(GRD_BUSNS, YEAR == 2005)
	GRD_HSHD_05 <- subset(GRD_HSHD, YEAR == 2005)
	GRD_RSDNC_05 <- subset(GRD_RSDNC, YEAR == 2005)
	GRD_WRKRS_05 <- subset(GRD_WRKRS, YEAR == 2005)
	GRD_POPTN_05 <- subset(GRD_POPTN, YEAR == 2005)
	GRD_YNG_POP_05 <- subset(GRD_YNG_POP, YEAR == 2005)

	new_col_BUSNS <- c("gLC_B05", "gCT_B05", "gRT_B05", "gLM_B05", "gTg_B05", "gRM_B05", "gLB_B05", "gCB_B05", "gRB_B05", "YEAR")
	new_col_HSHD <- c("gLC_H05", "gCT_H05", "gRT_H05", "gLM_H05", "gTg_H05", "gRM_H05", "gLB_H05", "gCB_H05", "gRB_H05", "YEAR")
	new_col_RSDNC <- c("gLC_R05", "gCT_R05", "gRT_R05", "gLM_R05", "gTg_R05", "gRM_R05", "gLB_R05", "gCB_R05", "gRB_R05", "YEAR")
	new_col_WRKRS <- c("gLC_W05", "gCT_W05", "gRT_W05", "gLM_W05", "gTg_W05", "gRM_W05", "gLB_W05", "gCB_W05", "gRB_W05", "YEAR")
	new_col_POPTN <- c("gLC_P05", "gCT_P05", "gRT_P05", "gLM_P05", "gTg_P05", "gRM_P05", "gLB_P05", "gCB_P05", "gRB_P05", "YEAR")
	new_col_YNG_POP <- c("gLC_Y05", "gCT_Y05", "gRT_Y05", "gLM_Y05", "gTg_Y05", "gRM_Y05", "gLB_Y05", "gCB_Y05", "gRB_Y05", "YEAR")

	colnames(GRD_BUSNS_05) <- new_col_BUSNS; GRD_BUSNS_05$YEAR <- NULL
	colnames(GRD_HSHD_05) <- new_col_HSHD; GRD_HSHD_05$YEAR <- NULL
	colnames(GRD_RSDNC_05) <- new_col_RSDNC; GRD_RSDNC_05$YEAR <- NULL
	colnames(GRD_WRKRS_05) <- new_col_WRKRS; GRD_WRKRS_05$YEAR <- NULL
	colnames(GRD_POPTN_05) <- new_col_POPTN; GRD_POPTN_05$YEAR <- NULL
	colnames(GRD_YNG_POP_05) <- new_col_YNG_POP; GRD_YNG_POP_05$YEAR <- NULL



	GRD_BUSNS_10 <- subset(GRD_BUSNS, YEAR == 2010)
	GRD_HSHD_10 <- subset(GRD_HSHD, YEAR == 2010)
	GRD_RSDNC_10 <- subset(GRD_RSDNC, YEAR == 2010)
	GRD_WRKRS_10 <- subset(GRD_WRKRS, YEAR == 2010)
	GRD_POPTN_10 <- subset(GRD_POPTN, YEAR == 2010)
	GRD_YNG_POP_10 <- subset(GRD_YNG_POP, YEAR == 2010)

	new_col_BUSNS <- c("gLC_B10", "gCT_B10", "gRT_B10", "gLM_B10", "gTg_B10", "gRM_B10", "gLB_B10", "gCB_B10", "gRB_B10", "YEAR")
	new_col_HSHD <- c("gLC_H10", "gCT_H10", "gRT_H10", "gLM_H10", "gTg_H10", "gRM_H10", "gLB_H10", "gCB_H10", "gRB_H10", "YEAR")
	new_col_RSDNC <- c("gLC_R10", "gCT_R10", "gRT_R10", "gLM_R10", "gTg_R10", "gRM_R10", "gLB_R10", "gCB_R10", "gRB_R10", "YEAR")
	new_col_WRKRS <- c("gLC_W10", "gCT_W10", "gRT_W10", "gLM_W10", "gTg_W10", "gRM_W10", "gLB_W10", "gCB_W10", "gRB_W10", "YEAR")
	new_col_POPTN <- c("gLC_P10", "gCT_P10", "gRT_P10", "gLM_P10", "gTg_P10", "gRM_P10", "gLB_P10", "gCB_P10", "gRB_P10", "YEAR")
	new_col_YNG_POP <- c("gLC_Y10", "gCT_Y10", "gRT_Y10", "gLM_Y10", "gTg_Y10", "gRM_Y10", "gLB_Y10", "gCB_Y10", "gRB_Y10", "YEAR")

	colnames(GRD_BUSNS_10) <- new_col_BUSNS; GRD_BUSNS_10$YEAR <- NULL
	colnames(GRD_HSHD_10) <- new_col_HSHD; GRD_HSHD_10$YEAR <- NULL
	colnames(GRD_RSDNC_10) <- new_col_RSDNC; GRD_RSDNC_10$YEAR <- NULL
	colnames(GRD_WRKRS_10) <- new_col_WRKRS; GRD_WRKRS_10$YEAR <- NULL
	colnames(GRD_POPTN_10) <- new_col_POPTN; GRD_POPTN_10$YEAR <- NULL
	colnames(GRD_YNG_POP_10) <- new_col_YNG_POP; GRD_YNG_POP_10$YEAR <- NULL



	GRD_BUSNS_15 <- subset(GRD_BUSNS, YEAR == 2015)
	GRD_HSHD_15 <- subset(GRD_HSHD, YEAR == 2015)
	GRD_RSDNC_15 <- subset(GRD_RSDNC, YEAR == 2015)
	GRD_WRKRS_15 <- subset(GRD_WRKRS, YEAR == 2015)
	GRD_POPTN_15 <- subset(GRD_POPTN, YEAR == 2015)
	GRD_YNG_POP_15 <- subset(GRD_YNG_POP, YEAR == 2015)

	new_col_BUSNS <- c("gLC_B15", "gCT_B15", "gRT_B15", "gLM_B15", "gTg_B15", "gRM_B15", "gLB_B15", "gCB_B15", "gRB_B15", "YEAR")
	new_col_HSHD <- c("gLC_H15", "gCT_H15", "gRT_H15", "gLM_H15", "gTg_H15", "gRM_H15", "gLB_H15", "gCB_H15", "gRB_H15", "YEAR")
	new_col_RSDNC <- c("gLC_R15", "gCT_R15", "gRT_R15", "gLM_R15", "gTg_R15", "gRM_R15", "gLB_R15", "gCB_R15", "gRB_R15", "YEAR")
	new_col_WRKRS <- c("gLC_W15", "gCT_W15", "gRT_W15", "gLM_W15", "gTg_W15", "gRM_W15", "gLB_W15", "gCB_W15", "gRB_W15", "YEAR")
	new_col_POPTN <- c("gLC_P15", "gCT_P15", "gRT_P15", "gLM_P15", "gTg_P15", "gRM_P15", "gLB_P15", "gCB_P15", "gRB_P15", "YEAR")
	new_col_YNG_POP <- c("gLC_Y15", "gCT_Y15", "gRT_Y15", "gLM_Y15", "gTg_Y15", "gRM_Y15", "gLB_Y15", "gCB_Y15", "gRB_Y15", "YEAR")

	colnames(GRD_BUSNS_15) <- new_col_BUSNS; GRD_BUSNS_15$YEAR <- NULL
	colnames(GRD_HSHD_15) <- new_col_HSHD; GRD_HSHD_15$YEAR <- NULL
	colnames(GRD_RSDNC_15) <- new_col_RSDNC; GRD_RSDNC_15$YEAR <- NULL
	colnames(GRD_WRKRS_15) <- new_col_WRKRS; GRD_WRKRS_15$YEAR <- NULL
	colnames(GRD_POPTN_15) <- new_col_POPTN; GRD_POPTN_15$YEAR <- NULL
	colnames(GRD_YNG_POP_15) <- new_col_YNG_POP; GRD_YNG_POP_15$YEAR <- NULL



	GRD_BUSNS_16 <- subset(GRD_BUSNS, YEAR == 2016)
	GRD_HSHD_16 <- subset(GRD_HSHD, YEAR == 2016)
	GRD_RSDNC_16 <- subset(GRD_RSDNC, YEAR == 2016)
	GRD_WRKRS_16 <- subset(GRD_WRKRS, YEAR == 2016)
	GRD_POPTN_16 <- subset(GRD_POPTN, YEAR == 2016)
	GRD_YNG_POP_16 <- subset(GRD_YNG_POP, YEAR == 2016)

	new_col_BUSNS <- c("gLC_B16", "gCT_B16", "gRT_B16", "gLM_B16", "gTg_B16", "gRM_B16", "gLB_B16", "gCB_B16", "gRB_B16", "YEAR")
	new_col_HSHD <- c("gLC_H16", "gCT_H16", "gRT_H16", "gLM_H16", "gTg_H16", "gRM_H16", "gLB_H16", "gCB_H16", "gRB_H16", "YEAR")
	new_col_RSDNC <- c("gLC_R16", "gCT_R16", "gRT_R16", "gLM_R16", "gTg_R16", "gRM_R16", "gLB_R16", "gCB_R16", "gRB_R16", "YEAR")
	new_col_WRKRS <- c("gLC_W16", "gCT_W16", "gRT_W16", "gLM_W16", "gTg_W16", "gRM_W16", "gLB_W16", "gCB_W16", "gRB_W16", "YEAR")
	new_col_POPTN <- c("gLC_P16", "gCT_P16", "gRT_P16", "gLM_P16", "gTg_P16", "gRM_P16", "gLB_P16", "gCB_P16", "gRB_P16", "YEAR")
	new_col_YNG_POP <- c("gLC_Y16", "gCT_Y16", "gRT_Y16", "gLM_Y16", "gTg_Y16", "gRM_Y16", "gLB_Y16", "gCB_Y16", "gRB_Y16", "YEAR")

	colnames(GRD_BUSNS_16) <- new_col_BUSNS; GRD_BUSNS_16$YEAR <- NULL
	colnames(GRD_HSHD_16) <- new_col_HSHD; GRD_HSHD_16$YEAR <- NULL
	colnames(GRD_RSDNC_16) <- new_col_RSDNC; GRD_RSDNC_16$YEAR <- NULL
	colnames(GRD_WRKRS_16) <- new_col_WRKRS; GRD_WRKRS_16$YEAR <- NULL
	colnames(GRD_POPTN_16) <- new_col_POPTN; GRD_POPTN_16$YEAR <- NULL
	colnames(GRD_YNG_POP_16) <- new_col_YNG_POP; GRD_YNG_POP_16$YEAR <- NULL



	GRD_BUSNS_17 <- subset(GRD_BUSNS, YEAR == 2017)
	GRD_HSHD_17 <- subset(GRD_HSHD, YEAR == 2017)
	GRD_RSDNC_17 <- subset(GRD_RSDNC, YEAR == 2017)
	GRD_WRKRS_17 <- subset(GRD_WRKRS, YEAR == 2017)
	GRD_POPTN_17 <- subset(GRD_POPTN, YEAR == 2017)
	GRD_YNG_POP_17 <- subset(GRD_YNG_POP, YEAR == 2017)

	new_col_BUSNS <- c("gLC_B17", "gCT_B17", "gRT_B17", "gLM_B17", "gTg_B17", "gRM_B17", "gLB_B17", "gCB_B17", "gRB_B17", "YEAR")
	new_col_HSHD <- c("gLC_H17", "gCT_H17", "gRT_H17", "gLM_H17", "gTg_H17", "gRM_H17", "gLB_H17", "gCB_H17", "gRB_H17", "YEAR")
	new_col_RSDNC <- c("gLC_R17", "gCT_R17", "gRT_R17", "gLM_R17", "gTg_R17", "gRM_R17", "gLB_R17", "gCB_R17", "gRB_R17", "YEAR")
	new_col_WRKRS <- c("gLC_W17", "gCT_W17", "gRT_W17", "gLM_W17", "gTg_W17", "gRM_W17", "gLB_W17", "gCB_W17", "gRB_W17", "YEAR")
	new_col_POPTN <- c("gLC_P17", "gCT_P17", "gRT_P17", "gLM_P17", "gTg_P17", "gRM_P17", "gLB_P17", "gCB_P17", "gRB_P17", "YEAR")
	new_col_YNG_POP <- c("gLC_Y17", "gCT_Y17", "gRT_Y17", "gLM_Y17", "gTg_Y17", "gRM_Y17", "gLB_Y17", "gCB_Y17", "gRB_Y17", "YEAR")

	colnames(GRD_BUSNS_17) <- new_col_BUSNS; GRD_BUSNS_17$YEAR <- NULL
	colnames(GRD_HSHD_17) <- new_col_HSHD; GRD_HSHD_17$YEAR <- NULL
	colnames(GRD_RSDNC_17) <- new_col_RSDNC; GRD_RSDNC_17$YEAR <- NULL
	colnames(GRD_WRKRS_17) <- new_col_WRKRS; GRD_WRKRS_17$YEAR <- NULL
	colnames(GRD_POPTN_17) <- new_col_POPTN; GRD_POPTN_17$YEAR <- NULL
	colnames(GRD_YNG_POP_17) <- new_col_YNG_POP; GRD_YNG_POP_17$YEAR <- NULL



	GRD_BUSNS_18 <- subset(GRD_BUSNS, YEAR == 2018)
	GRD_HSHD_18 <- subset(GRD_HSHD, YEAR == 2018)
	GRD_RSDNC_18 <- subset(GRD_RSDNC, YEAR == 2018)
	GRD_WRKRS_18 <- subset(GRD_WRKRS, YEAR == 2018)
	GRD_POPTN_18 <- subset(GRD_POPTN, YEAR == 2018)
	GRD_YNG_POP_18 <- subset(GRD_YNG_POP, YEAR == 2018)

	new_col_BUSNS <- c("gLC_B18", "gCT_B18", "gRT_B18", "gLM_B18", "gTg_B18", "gRM_B18", "gLB_B18", "gCB_B18", "gRB_B18", "YEAR")
	new_col_HSHD <- c("gLC_H18", "gCT_H18", "gRT_H18", "gLM_H18", "gTg_H18", "gRM_H18", "gLB_H18", "gCB_H18", "gRB_H18", "YEAR")
	new_col_RSDNC <- c("gLC_R18", "gCT_R18", "gRT_R18", "gLM_R18", "gTg_R18", "gRM_R18", "gLB_R18", "gCB_R18", "gRB_R18", "YEAR")
	new_col_WRKRS <- c("gLC_W18", "gCT_W18", "gRT_W18", "gLM_W18", "gTg_W18", "gRM_W18", "gLB_W18", "gCB_W18", "gRB_W18", "YEAR")
	new_col_POPTN <- c("gLC_P18", "gCT_P18", "gRT_P18", "gLM_P18", "gTg_P18", "gRM_P18", "gLB_P18", "gCB_P18", "gRB_P18", "YEAR")
	new_col_YNG_POP <- c("gLC_Y18", "gCT_Y18", "gRT_Y18", "gLM_Y18", "gTg_Y18", "gRM_Y18", "gLB_Y18", "gCB_Y18", "gRB_Y18", "YEAR")

	colnames(GRD_BUSNS_18) <- new_col_BUSNS; GRD_BUSNS_18$YEAR <- NULL
	colnames(GRD_HSHD_18) <- new_col_HSHD; GRD_HSHD_18$YEAR <- NULL
	colnames(GRD_RSDNC_18) <- new_col_RSDNC; GRD_RSDNC_18$YEAR <- NULL
	colnames(GRD_WRKRS_18) <- new_col_WRKRS; GRD_WRKRS_18$YEAR <- NULL
	colnames(GRD_POPTN_18) <- new_col_POPTN; GRD_POPTN_18$YEAR <- NULL
	colnames(GRD_YNG_POP_18) <- new_col_YNG_POP; GRD_YNG_POP_18$YEAR <- NULL


	GRD_BUSNS_19 <- subset(GRD_BUSNS, YEAR == 2019)
	GRD_HSHD_19 <- subset(GRD_HSHD, YEAR == 2019)
	GRD_RSDNC_19 <- subset(GRD_RSDNC, YEAR == 2019)
	GRD_WRKRS_19 <- subset(GRD_WRKRS, YEAR == 2019)
	GRD_POPTN_19 <- subset(GRD_POPTN, YEAR == 2019)
	GRD_YNG_POP_19 <- subset(GRD_YNG_POP, YEAR == 2019)

	new_col_BUSNS <- c("gLC_B19", "gCT_B19", "gRT_B19", "gLM_B19", "gTg_B19", "gRM_B19", "gLB_B19", "gCB_B19", "gRB_B19", "YEAR")
	new_col_HSHD <- c("gLC_H19", "gCT_H19", "gRT_H19", "gLM_H19", "gTg_H19", "gRM_H19", "gLB_H19", "gCB_H19", "gRB_H19", "YEAR")
	new_col_RSDNC <- c("gLC_R19", "gCT_R19", "gRT_R19", "gLM_R19", "gTg_R19", "gRM_R19", "gLB_R19", "gCB_R19", "gRB_R19", "YEAR")
	new_col_WRKRS <- c("gLC_W19", "gCT_W19", "gRT_W19", "gLM_W19", "gTg_W19", "gRM_W19", "gLB_W19", "gCB_W19", "gRB_W19", "YEAR")
	new_col_POPTN <- c("gLC_P19", "gCT_P19", "gRT_P19", "gLM_P19", "gTg_P19", "gRM_P19", "gLB_P19", "gCB_P19", "gRB_P19", "YEAR")
	new_col_YNG_POP <- c("gLC_Y19", "gCT_Y19", "gRT_Y19", "gLM_Y19", "gTg_Y19", "gRM_Y19", "gLB_Y19", "gCB_Y19", "gRB_Y19", "YEAR")

	colnames(GRD_BUSNS_19) <- new_col_BUSNS; GRD_BUSNS_19$YEAR <- NULL
	colnames(GRD_HSHD_19) <- new_col_HSHD; GRD_HSHD_19$YEAR <- NULL
	colnames(GRD_RSDNC_19) <- new_col_RSDNC; GRD_RSDNC_19$YEAR <- NULL
	colnames(GRD_WRKRS_19) <- new_col_WRKRS; GRD_WRKRS_19$YEAR <- NULL
	colnames(GRD_POPTN_19) <- new_col_POPTN; GRD_POPTN_19$YEAR <- NULL
	colnames(GRD_YNG_POP_19) <- new_col_YNG_POP; GRD_YNG_POP_19$YEAR <- NULL



	GRD_BUSNS_20 <- subset(GRD_BUSNS, YEAR == 2020)
	GRD_HSHD_20 <- subset(GRD_HSHD, YEAR == 2020)
	GRD_RSDNC_20 <- subset(GRD_RSDNC, YEAR == 2020)
	GRD_WRKRS_20 <- subset(GRD_WRKRS, YEAR == 2020)
	GRD_POPTN_20 <- subset(GRD_POPTN, YEAR == 2020)
	GRD_YNG_POP_20 <- subset(GRD_YNG_POP, YEAR == 2020)

	new_col_BUSNS <- c("gLC_B20", "gCT_B20", "gRT_B20", "gLM_B20", "gTg_B20", "gRM_B20", "gLB_B20", "gCB_B20", "gRB_B20", "YEAR")
	new_col_HSHD <- c("gLC_H20", "gCT_H20", "gRT_H20", "gLM_H20", "gTg_H20", "gRM_H20", "gLB_H20", "gCB_H20", "gRB_H20", "YEAR")
	new_col_RSDNC <- c("gLC_R20", "gCT_R20", "gRT_R20", "gLM_R20", "gTg_R20", "gRM_R20", "gLB_R20", "gCB_R20", "gRB_R20", "YEAR")
	new_col_WRKRS <- c("gLC_W20", "gCT_W20", "gRT_W20", "gLM_W20", "gTg_W20", "gRM_W20", "gLB_W20", "gCB_W20", "gRB_W20", "YEAR")
	new_col_POPTN <- c("gLC_P20", "gCT_P20", "gRT_P20", "gLM_P20", "gTg_P20", "gRM_P20", "gLB_P20", "gCB_P20", "gRB_P20", "YEAR")
	new_col_YNG_POP <- c("gLC_Y20", "gCT_Y20", "gRT_Y20", "gLM_Y20", "gTg_Y20", "gRM_Y20", "gLB_Y20", "gCB_Y20", "gRB_Y20", "YEAR")

	colnames(GRD_BUSNS_20) <- new_col_BUSNS; GRD_BUSNS_20$YEAR <- NULL
	colnames(GRD_HSHD_20) <- new_col_HSHD; GRD_HSHD_20$YEAR <- NULL
	colnames(GRD_RSDNC_20) <- new_col_RSDNC; GRD_RSDNC_20$YEAR <- NULL
	colnames(GRD_WRKRS_20) <- new_col_WRKRS; GRD_WRKRS_20$YEAR <- NULL
	colnames(GRD_POPTN_20) <- new_col_POPTN; GRD_POPTN_20$YEAR <- NULL
	colnames(GRD_YNG_POP_20) <- new_col_YNG_POP; GRD_YNG_POP_20$YEAR <- NULL



	TESTING_SET <- cbind(
	GRD_BUSNS_05, GRD_HSHD_05, GRD_RSDNC_05, GRD_WRKRS_05, GRD_POPTN_05, GRD_YNG_POP_05, 
	GRD_BUSNS_10, GRD_HSHD_10, GRD_RSDNC_10, GRD_WRKRS_10, GRD_POPTN_10, GRD_YNG_POP_10, 
	GRD_BUSNS_15, GRD_HSHD_15, GRD_RSDNC_15, GRD_WRKRS_15, GRD_POPTN_15, GRD_YNG_POP_15, 
	GRD_BUSNS_16, GRD_HSHD_16, GRD_RSDNC_16, GRD_WRKRS_16, GRD_POPTN_16, GRD_YNG_POP_16, 
	GRD_BUSNS_17, GRD_HSHD_17, GRD_RSDNC_17, GRD_WRKRS_17, GRD_POPTN_17, GRD_YNG_POP_17, 
	GRD_BUSNS_18, GRD_HSHD_18, GRD_RSDNC_18, GRD_WRKRS_18, GRD_POPTN_18, GRD_YNG_POP_18, 
	GRD_BUSNS_19, GRD_HSHD_19, GRD_RSDNC_19, GRD_WRKRS_19, GRD_POPTN_19, GRD_YNG_POP_19, 
	GRD_BUSNS_20, GRD_HSHD_20, GRD_RSDNC_20, GRD_WRKRS_20, GRD_POPTN_20, GRD_YNG_POP_20)

	return(TESTING_SET)
}




TESTING_data_TYPE_5 <- function(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP){


	# LEARNING FASHION] LEARNING > TESTING > TUNING (w/ STAT EST.)
	# Young population has only between 2014 - 2024
	#============================ YEARLY DESGIN for LEARNING FASHION =============================#
	#---------------------------------------------------------------------------------------------
	#---------------|-------------- LEARNING --------------|--------------- TESTING --------------
	#   PREDICTION  |      TRAINING-SET     |    TARGET    |      TRAINING-SET     |    TARGET   
	#---------------|-----------------------|--------------|-----------------------|--------------
	#  1year-model  |      2000 ~ 2022      |     2023     |      2005 ~ 2023      |     2025     
	#  2year-model  |      2000 ~ 2021      |     2023     |      2005 ~ 2022      |     2026     
	#  3year-model  |      2000 ~ 2020      |     2023     |      2005 ~ 2021      |     2027     
	#  4year-model  |      2000 ~ 2019      |     2023     |      2005 ~ 2020      |     2028     
	#  5year-model  |      2000 ~ 2018      |     2023     |      2005 ~ 2019      |     2029     
	#  6year-model  |      2000 ~ 2017      |     2023     |      2005 ~ 2018      |     2030     
	#----------------------------------------------------------------------------------------------

	# Total 12 years data) 2000 2005 2010 2015 2016 2017 2018 2019 2020 2021 2022 2023
	# 1year-model: Learning(11)-Target(1) > Testing(11)-Target(1)
	# 2year-model: Learning(10)-Target(1) > Testing(10)-Target(1)
	# 3year-model: Learning(9)-Target(1) > Testing(9)-Target(1)
	# 4year-model: Learning(8)-Target(1) > Testing(8)-Target(1)
	# 5year-model: Learning(7)-Target(1) > Testing(7)-Target(1)
	# 6year-model: Learning(6)-Target(1) > Testing(6)-Target(1)


	GRD_BUSNS_05 <- subset(GRD_BUSNS, YEAR == 2005)
	GRD_HSHD_05 <- subset(GRD_HSHD, YEAR == 2005)
	GRD_RSDNC_05 <- subset(GRD_RSDNC, YEAR == 2005)
	GRD_WRKRS_05 <- subset(GRD_WRKRS, YEAR == 2005)
	GRD_POPTN_05 <- subset(GRD_POPTN, YEAR == 2005)
	GRD_YNG_POP_05 <- subset(GRD_YNG_POP, YEAR == 2005)

	new_col_BUSNS <- c("gLC_B05", "gCT_B05", "gRT_B05", "gLM_B05", "gTg_B05", "gRM_B05", "gLB_B05", "gCB_B05", "gRB_B05", "YEAR")
	new_col_HSHD <- c("gLC_H05", "gCT_H05", "gRT_H05", "gLM_H05", "gTg_H05", "gRM_H05", "gLB_H05", "gCB_H05", "gRB_H05", "YEAR")
	new_col_RSDNC <- c("gLC_R05", "gCT_R05", "gRT_R05", "gLM_R05", "gTg_R05", "gRM_R05", "gLB_R05", "gCB_R05", "gRB_R05", "YEAR")
	new_col_WRKRS <- c("gLC_W05", "gCT_W05", "gRT_W05", "gLM_W05", "gTg_W05", "gRM_W05", "gLB_W05", "gCB_W05", "gRB_W05", "YEAR")
	new_col_POPTN <- c("gLC_P05", "gCT_P05", "gRT_P05", "gLM_P05", "gTg_P05", "gRM_P05", "gLB_P05", "gCB_P05", "gRB_P05", "YEAR")
	new_col_YNG_POP <- c("gLC_Y05", "gCT_Y05", "gRT_Y05", "gLM_Y05", "gTg_Y05", "gRM_Y05", "gLB_Y05", "gCB_Y05", "gRB_Y05", "YEAR")

	colnames(GRD_BUSNS_05) <- new_col_BUSNS; GRD_BUSNS_05$YEAR <- NULL
	colnames(GRD_HSHD_05) <- new_col_HSHD; GRD_HSHD_05$YEAR <- NULL
	colnames(GRD_RSDNC_05) <- new_col_RSDNC; GRD_RSDNC_05$YEAR <- NULL
	colnames(GRD_WRKRS_05) <- new_col_WRKRS; GRD_WRKRS_05$YEAR <- NULL
	colnames(GRD_POPTN_05) <- new_col_POPTN; GRD_POPTN_05$YEAR <- NULL
	colnames(GRD_YNG_POP_05) <- new_col_YNG_POP; GRD_YNG_POP_05$YEAR <- NULL



	GRD_BUSNS_10 <- subset(GRD_BUSNS, YEAR == 2010)
	GRD_HSHD_10 <- subset(GRD_HSHD, YEAR == 2010)
	GRD_RSDNC_10 <- subset(GRD_RSDNC, YEAR == 2010)
	GRD_WRKRS_10 <- subset(GRD_WRKRS, YEAR == 2010)
	GRD_POPTN_10 <- subset(GRD_POPTN, YEAR == 2010)
	GRD_YNG_POP_10 <- subset(GRD_YNG_POP, YEAR == 2010)

	new_col_BUSNS <- c("gLC_B10", "gCT_B10", "gRT_B10", "gLM_B10", "gTg_B10", "gRM_B10", "gLB_B10", "gCB_B10", "gRB_B10", "YEAR")
	new_col_HSHD <- c("gLC_H10", "gCT_H10", "gRT_H10", "gLM_H10", "gTg_H10", "gRM_H10", "gLB_H10", "gCB_H10", "gRB_H10", "YEAR")
	new_col_RSDNC <- c("gLC_R10", "gCT_R10", "gRT_R10", "gLM_R10", "gTg_R10", "gRM_R10", "gLB_R10", "gCB_R10", "gRB_R10", "YEAR")
	new_col_WRKRS <- c("gLC_W10", "gCT_W10", "gRT_W10", "gLM_W10", "gTg_W10", "gRM_W10", "gLB_W10", "gCB_W10", "gRB_W10", "YEAR")
	new_col_POPTN <- c("gLC_P10", "gCT_P10", "gRT_P10", "gLM_P10", "gTg_P10", "gRM_P10", "gLB_P10", "gCB_P10", "gRB_P10", "YEAR")
	new_col_YNG_POP <- c("gLC_Y10", "gCT_Y10", "gRT_Y10", "gLM_Y10", "gTg_Y10", "gRM_Y10", "gLB_Y10", "gCB_Y10", "gRB_Y10", "YEAR")

	colnames(GRD_BUSNS_10) <- new_col_BUSNS; GRD_BUSNS_10$YEAR <- NULL
	colnames(GRD_HSHD_10) <- new_col_HSHD; GRD_HSHD_10$YEAR <- NULL
	colnames(GRD_RSDNC_10) <- new_col_RSDNC; GRD_RSDNC_10$YEAR <- NULL
	colnames(GRD_WRKRS_10) <- new_col_WRKRS; GRD_WRKRS_10$YEAR <- NULL
	colnames(GRD_POPTN_10) <- new_col_POPTN; GRD_POPTN_10$YEAR <- NULL
	colnames(GRD_YNG_POP_10) <- new_col_YNG_POP; GRD_YNG_POP_10$YEAR <- NULL



	GRD_BUSNS_15 <- subset(GRD_BUSNS, YEAR == 2015)
	GRD_HSHD_15 <- subset(GRD_HSHD, YEAR == 2015)
	GRD_RSDNC_15 <- subset(GRD_RSDNC, YEAR == 2015)
	GRD_WRKRS_15 <- subset(GRD_WRKRS, YEAR == 2015)
	GRD_POPTN_15 <- subset(GRD_POPTN, YEAR == 2015)
	GRD_YNG_POP_15 <- subset(GRD_YNG_POP, YEAR == 2015)

	new_col_BUSNS <- c("gLC_B15", "gCT_B15", "gRT_B15", "gLM_B15", "gTg_B15", "gRM_B15", "gLB_B15", "gCB_B15", "gRB_B15", "YEAR")
	new_col_HSHD <- c("gLC_H15", "gCT_H15", "gRT_H15", "gLM_H15", "gTg_H15", "gRM_H15", "gLB_H15", "gCB_H15", "gRB_H15", "YEAR")
	new_col_RSDNC <- c("gLC_R15", "gCT_R15", "gRT_R15", "gLM_R15", "gTg_R15", "gRM_R15", "gLB_R15", "gCB_R15", "gRB_R15", "YEAR")
	new_col_WRKRS <- c("gLC_W15", "gCT_W15", "gRT_W15", "gLM_W15", "gTg_W15", "gRM_W15", "gLB_W15", "gCB_W15", "gRB_W15", "YEAR")
	new_col_POPTN <- c("gLC_P15", "gCT_P15", "gRT_P15", "gLM_P15", "gTg_P15", "gRM_P15", "gLB_P15", "gCB_P15", "gRB_P15", "YEAR")
	new_col_YNG_POP <- c("gLC_Y15", "gCT_Y15", "gRT_Y15", "gLM_Y15", "gTg_Y15", "gRM_Y15", "gLB_Y15", "gCB_Y15", "gRB_Y15", "YEAR")

	colnames(GRD_BUSNS_15) <- new_col_BUSNS; GRD_BUSNS_15$YEAR <- NULL
	colnames(GRD_HSHD_15) <- new_col_HSHD; GRD_HSHD_15$YEAR <- NULL
	colnames(GRD_RSDNC_15) <- new_col_RSDNC; GRD_RSDNC_15$YEAR <- NULL
	colnames(GRD_WRKRS_15) <- new_col_WRKRS; GRD_WRKRS_15$YEAR <- NULL
	colnames(GRD_POPTN_15) <- new_col_POPTN; GRD_POPTN_15$YEAR <- NULL
	colnames(GRD_YNG_POP_15) <- new_col_YNG_POP; GRD_YNG_POP_15$YEAR <- NULL



	GRD_BUSNS_16 <- subset(GRD_BUSNS, YEAR == 2016)
	GRD_HSHD_16 <- subset(GRD_HSHD, YEAR == 2016)
	GRD_RSDNC_16 <- subset(GRD_RSDNC, YEAR == 2016)
	GRD_WRKRS_16 <- subset(GRD_WRKRS, YEAR == 2016)
	GRD_POPTN_16 <- subset(GRD_POPTN, YEAR == 2016)
	GRD_YNG_POP_16 <- subset(GRD_YNG_POP, YEAR == 2016)

	new_col_BUSNS <- c("gLC_B16", "gCT_B16", "gRT_B16", "gLM_B16", "gTg_B16", "gRM_B16", "gLB_B16", "gCB_B16", "gRB_B16", "YEAR")
	new_col_HSHD <- c("gLC_H16", "gCT_H16", "gRT_H16", "gLM_H16", "gTg_H16", "gRM_H16", "gLB_H16", "gCB_H16", "gRB_H16", "YEAR")
	new_col_RSDNC <- c("gLC_R16", "gCT_R16", "gRT_R16", "gLM_R16", "gTg_R16", "gRM_R16", "gLB_R16", "gCB_R16", "gRB_R16", "YEAR")
	new_col_WRKRS <- c("gLC_W16", "gCT_W16", "gRT_W16", "gLM_W16", "gTg_W16", "gRM_W16", "gLB_W16", "gCB_W16", "gRB_W16", "YEAR")
	new_col_POPTN <- c("gLC_P16", "gCT_P16", "gRT_P16", "gLM_P16", "gTg_P16", "gRM_P16", "gLB_P16", "gCB_P16", "gRB_P16", "YEAR")
	new_col_YNG_POP <- c("gLC_Y16", "gCT_Y16", "gRT_Y16", "gLM_Y16", "gTg_Y16", "gRM_Y16", "gLB_Y16", "gCB_Y16", "gRB_Y16", "YEAR")

	colnames(GRD_BUSNS_16) <- new_col_BUSNS; GRD_BUSNS_16$YEAR <- NULL
	colnames(GRD_HSHD_16) <- new_col_HSHD; GRD_HSHD_16$YEAR <- NULL
	colnames(GRD_RSDNC_16) <- new_col_RSDNC; GRD_RSDNC_16$YEAR <- NULL
	colnames(GRD_WRKRS_16) <- new_col_WRKRS; GRD_WRKRS_16$YEAR <- NULL
	colnames(GRD_POPTN_16) <- new_col_POPTN; GRD_POPTN_16$YEAR <- NULL
	colnames(GRD_YNG_POP_16) <- new_col_YNG_POP; GRD_YNG_POP_16$YEAR <- NULL



	GRD_BUSNS_17 <- subset(GRD_BUSNS, YEAR == 2017)
	GRD_HSHD_17 <- subset(GRD_HSHD, YEAR == 2017)
	GRD_RSDNC_17 <- subset(GRD_RSDNC, YEAR == 2017)
	GRD_WRKRS_17 <- subset(GRD_WRKRS, YEAR == 2017)
	GRD_POPTN_17 <- subset(GRD_POPTN, YEAR == 2017)
	GRD_YNG_POP_17 <- subset(GRD_YNG_POP, YEAR == 2017)

	new_col_BUSNS <- c("gLC_B17", "gCT_B17", "gRT_B17", "gLM_B17", "gTg_B17", "gRM_B17", "gLB_B17", "gCB_B17", "gRB_B17", "YEAR")
	new_col_HSHD <- c("gLC_H17", "gCT_H17", "gRT_H17", "gLM_H17", "gTg_H17", "gRM_H17", "gLB_H17", "gCB_H17", "gRB_H17", "YEAR")
	new_col_RSDNC <- c("gLC_R17", "gCT_R17", "gRT_R17", "gLM_R17", "gTg_R17", "gRM_R17", "gLB_R17", "gCB_R17", "gRB_R17", "YEAR")
	new_col_WRKRS <- c("gLC_W17", "gCT_W17", "gRT_W17", "gLM_W17", "gTg_W17", "gRM_W17", "gLB_W17", "gCB_W17", "gRB_W17", "YEAR")
	new_col_POPTN <- c("gLC_P17", "gCT_P17", "gRT_P17", "gLM_P17", "gTg_P17", "gRM_P17", "gLB_P17", "gCB_P17", "gRB_P17", "YEAR")
	new_col_YNG_POP <- c("gLC_Y17", "gCT_Y17", "gRT_Y17", "gLM_Y17", "gTg_Y17", "gRM_Y17", "gLB_Y17", "gCB_Y17", "gRB_Y17", "YEAR")

	colnames(GRD_BUSNS_17) <- new_col_BUSNS; GRD_BUSNS_17$YEAR <- NULL
	colnames(GRD_HSHD_17) <- new_col_HSHD; GRD_HSHD_17$YEAR <- NULL
	colnames(GRD_RSDNC_17) <- new_col_RSDNC; GRD_RSDNC_17$YEAR <- NULL
	colnames(GRD_WRKRS_17) <- new_col_WRKRS; GRD_WRKRS_17$YEAR <- NULL
	colnames(GRD_POPTN_17) <- new_col_POPTN; GRD_POPTN_17$YEAR <- NULL
	colnames(GRD_YNG_POP_17) <- new_col_YNG_POP; GRD_YNG_POP_17$YEAR <- NULL



	GRD_BUSNS_18 <- subset(GRD_BUSNS, YEAR == 2018)
	GRD_HSHD_18 <- subset(GRD_HSHD, YEAR == 2018)
	GRD_RSDNC_18 <- subset(GRD_RSDNC, YEAR == 2018)
	GRD_WRKRS_18 <- subset(GRD_WRKRS, YEAR == 2018)
	GRD_POPTN_18 <- subset(GRD_POPTN, YEAR == 2018)
	GRD_YNG_POP_18 <- subset(GRD_YNG_POP, YEAR == 2018)

	new_col_BUSNS <- c("gLC_B18", "gCT_B18", "gRT_B18", "gLM_B18", "gTg_B18", "gRM_B18", "gLB_B18", "gCB_B18", "gRB_B18", "YEAR")
	new_col_HSHD <- c("gLC_H18", "gCT_H18", "gRT_H18", "gLM_H18", "gTg_H18", "gRM_H18", "gLB_H18", "gCB_H18", "gRB_H18", "YEAR")
	new_col_RSDNC <- c("gLC_R18", "gCT_R18", "gRT_R18", "gLM_R18", "gTg_R18", "gRM_R18", "gLB_R18", "gCB_R18", "gRB_R18", "YEAR")
	new_col_WRKRS <- c("gLC_W18", "gCT_W18", "gRT_W18", "gLM_W18", "gTg_W18", "gRM_W18", "gLB_W18", "gCB_W18", "gRB_W18", "YEAR")
	new_col_POPTN <- c("gLC_P18", "gCT_P18", "gRT_P18", "gLM_P18", "gTg_P18", "gRM_P18", "gLB_P18", "gCB_P18", "gRB_P18", "YEAR")
	new_col_YNG_POP <- c("gLC_Y18", "gCT_Y18", "gRT_Y18", "gLM_Y18", "gTg_Y18", "gRM_Y18", "gLB_Y18", "gCB_Y18", "gRB_Y18", "YEAR")

	colnames(GRD_BUSNS_18) <- new_col_BUSNS; GRD_BUSNS_18$YEAR <- NULL
	colnames(GRD_HSHD_18) <- new_col_HSHD; GRD_HSHD_18$YEAR <- NULL
	colnames(GRD_RSDNC_18) <- new_col_RSDNC; GRD_RSDNC_18$YEAR <- NULL
	colnames(GRD_WRKRS_18) <- new_col_WRKRS; GRD_WRKRS_18$YEAR <- NULL
	colnames(GRD_POPTN_18) <- new_col_POPTN; GRD_POPTN_18$YEAR <- NULL
	colnames(GRD_YNG_POP_18) <- new_col_YNG_POP; GRD_YNG_POP_18$YEAR <- NULL


	GRD_BUSNS_19 <- subset(GRD_BUSNS, YEAR == 2019)
	GRD_HSHD_19 <- subset(GRD_HSHD, YEAR == 2019)
	GRD_RSDNC_19 <- subset(GRD_RSDNC, YEAR == 2019)
	GRD_WRKRS_19 <- subset(GRD_WRKRS, YEAR == 2019)
	GRD_POPTN_19 <- subset(GRD_POPTN, YEAR == 2019)
	GRD_YNG_POP_19 <- subset(GRD_YNG_POP, YEAR == 2019)

	new_col_BUSNS <- c("gLC_B19", "gCT_B19", "gRT_B19", "gLM_B19", "gTg_B19", "gRM_B19", "gLB_B19", "gCB_B19", "gRB_B19", "YEAR")
	new_col_HSHD <- c("gLC_H19", "gCT_H19", "gRT_H19", "gLM_H19", "gTg_H19", "gRM_H19", "gLB_H19", "gCB_H19", "gRB_H19", "YEAR")
	new_col_RSDNC <- c("gLC_R19", "gCT_R19", "gRT_R19", "gLM_R19", "gTg_R19", "gRM_R19", "gLB_R19", "gCB_R19", "gRB_R19", "YEAR")
	new_col_WRKRS <- c("gLC_W19", "gCT_W19", "gRT_W19", "gLM_W19", "gTg_W19", "gRM_W19", "gLB_W19", "gCB_W19", "gRB_W19", "YEAR")
	new_col_POPTN <- c("gLC_P19", "gCT_P19", "gRT_P19", "gLM_P19", "gTg_P19", "gRM_P19", "gLB_P19", "gCB_P19", "gRB_P19", "YEAR")
	new_col_YNG_POP <- c("gLC_Y19", "gCT_Y19", "gRT_Y19", "gLM_Y19", "gTg_Y19", "gRM_Y19", "gLB_Y19", "gCB_Y19", "gRB_Y19", "YEAR")

	colnames(GRD_BUSNS_19) <- new_col_BUSNS; GRD_BUSNS_19$YEAR <- NULL
	colnames(GRD_HSHD_19) <- new_col_HSHD; GRD_HSHD_19$YEAR <- NULL
	colnames(GRD_RSDNC_19) <- new_col_RSDNC; GRD_RSDNC_19$YEAR <- NULL
	colnames(GRD_WRKRS_19) <- new_col_WRKRS; GRD_WRKRS_19$YEAR <- NULL
	colnames(GRD_POPTN_19) <- new_col_POPTN; GRD_POPTN_19$YEAR <- NULL
	colnames(GRD_YNG_POP_19) <- new_col_YNG_POP; GRD_YNG_POP_19$YEAR <- NULL

	TESTING_SET <- cbind(
	GRD_BUSNS_05, GRD_HSHD_05, GRD_RSDNC_05, GRD_WRKRS_05, GRD_POPTN_05, GRD_YNG_POP_05,
	GRD_BUSNS_10, GRD_HSHD_10, GRD_RSDNC_10, GRD_WRKRS_10, GRD_POPTN_10, GRD_YNG_POP_10, 
	GRD_BUSNS_15, GRD_HSHD_15, GRD_RSDNC_15, GRD_WRKRS_15, GRD_POPTN_15, GRD_YNG_POP_15, 
	GRD_BUSNS_16, GRD_HSHD_16, GRD_RSDNC_16, GRD_WRKRS_16, GRD_POPTN_16, GRD_YNG_POP_16, 
	GRD_BUSNS_17, GRD_HSHD_17, GRD_RSDNC_17, GRD_WRKRS_17, GRD_POPTN_17, GRD_YNG_POP_17, 
	GRD_BUSNS_18, GRD_HSHD_18, GRD_RSDNC_18, GRD_WRKRS_18, GRD_POPTN_18, GRD_YNG_POP_18, 
	GRD_BUSNS_19, GRD_HSHD_19, GRD_RSDNC_19, GRD_WRKRS_19, GRD_POPTN_19, GRD_YNG_POP_19)

	return(TESTING_SET)
}




TESTING_data_TYPE_6 <- function(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP){


	# LEARNING FASHION] LEARNING > TESTING > TUNING (w/ STAT EST.)
	# Young population has only between 2014 - 2024
	#============================ YEARLY DESGIN for LEARNING FASHION =============================#
	#---------------------------------------------------------------------------------------------
	#---------------|-------------- LEARNING --------------|--------------- TESTING --------------
	#   PREDICTION  |      TRAINING-SET     |    TARGET    |      TRAINING-SET     |    TARGET   
	#---------------|-----------------------|--------------|-----------------------|--------------
	#  1year-model  |      2000 ~ 2022      |     2023     |      2005 ~ 2023      |     2025     
	#  2year-model  |      2000 ~ 2021      |     2023     |      2005 ~ 2022      |     2026     
	#  3year-model  |      2000 ~ 2020      |     2023     |      2005 ~ 2021      |     2027     
	#  4year-model  |      2000 ~ 2019      |     2023     |      2005 ~ 2020      |     2028     
	#  5year-model  |      2000 ~ 2018      |     2023     |      2005 ~ 2019      |     2029     
	#  6year-model  |      2000 ~ 2017      |     2023     |      2005 ~ 2018      |     2030     
	#----------------------------------------------------------------------------------------------

	# Total 12 years data) 2000 2005 2010 2015 2016 2017 2018 2019 2020 2021 2022 2023
	# 1year-model: Learning(11)-Target(1) > Testing(11)-Target(1)
	# 2year-model: Learning(10)-Target(1) > Testing(10)-Target(1)
	# 3year-model: Learning(9)-Target(1) > Testing(9)-Target(1)
	# 4year-model: Learning(8)-Target(1) > Testing(8)-Target(1)
	# 5year-model: Learning(7)-Target(1) > Testing(7)-Target(1)
	# 6year-model: Learning(6)-Target(1) > Testing(6)-Target(1)



	GRD_BUSNS_05 <- subset(GRD_BUSNS, YEAR == 2005)
	GRD_HSHD_05 <- subset(GRD_HSHD, YEAR == 2005)
	GRD_RSDNC_05 <- subset(GRD_RSDNC, YEAR == 2005)
	GRD_WRKRS_05 <- subset(GRD_WRKRS, YEAR == 2005)
	GRD_POPTN_05 <- subset(GRD_POPTN, YEAR == 2005)
	GRD_YNG_POP_05 <- subset(GRD_YNG_POP, YEAR == 2005)

	new_col_BUSNS <- c("gLC_B05", "gCT_B05", "gRT_B05", "gLM_B05", "gTg_B05", "gRM_B05", "gLB_B05", "gCB_B05", "gRB_B05", "YEAR")
	new_col_HSHD <- c("gLC_H05", "gCT_H05", "gRT_H05", "gLM_H05", "gTg_H05", "gRM_H05", "gLB_H05", "gCB_H05", "gRB_H05", "YEAR")
	new_col_RSDNC <- c("gLC_R05", "gCT_R05", "gRT_R05", "gLM_R05", "gTg_R05", "gRM_R05", "gLB_R05", "gCB_R05", "gRB_R05", "YEAR")
	new_col_WRKRS <- c("gLC_W05", "gCT_W05", "gRT_W05", "gLM_W05", "gTg_W05", "gRM_W05", "gLB_W05", "gCB_W05", "gRB_W05", "YEAR")
	new_col_POPTN <- c("gLC_P05", "gCT_P05", "gRT_P05", "gLM_P05", "gTg_P05", "gRM_P05", "gLB_P05", "gCB_P05", "gRB_P05", "YEAR")
	new_col_YNG_POP <- c("gLC_Y05", "gCT_Y05", "gRT_Y05", "gLM_Y05", "gTg_Y05", "gRM_Y05", "gLB_Y05", "gCB_Y05", "gRB_Y05", "YEAR")

	colnames(GRD_BUSNS_05) <- new_col_BUSNS; GRD_BUSNS_05$YEAR <- NULL
	colnames(GRD_HSHD_05) <- new_col_HSHD; GRD_HSHD_05$YEAR <- NULL
	colnames(GRD_RSDNC_05) <- new_col_RSDNC; GRD_RSDNC_05$YEAR <- NULL
	colnames(GRD_WRKRS_05) <- new_col_WRKRS; GRD_WRKRS_05$YEAR <- NULL
	colnames(GRD_POPTN_05) <- new_col_POPTN; GRD_POPTN_05$YEAR <- NULL
	colnames(GRD_YNG_POP_05) <- new_col_YNG_POP; GRD_YNG_POP_05$YEAR <- NULL



	GRD_BUSNS_10 <- subset(GRD_BUSNS, YEAR == 2010)
	GRD_HSHD_10 <- subset(GRD_HSHD, YEAR == 2010)
	GRD_RSDNC_10 <- subset(GRD_RSDNC, YEAR == 2010)
	GRD_WRKRS_10 <- subset(GRD_WRKRS, YEAR == 2010)
	GRD_POPTN_10 <- subset(GRD_POPTN, YEAR == 2010)
	GRD_YNG_POP_10 <- subset(GRD_YNG_POP, YEAR == 2010)

	new_col_BUSNS <- c("gLC_B10", "gCT_B10", "gRT_B10", "gLM_B10", "gTg_B10", "gRM_B10", "gLB_B10", "gCB_B10", "gRB_B10", "YEAR")
	new_col_HSHD <- c("gLC_H10", "gCT_H10", "gRT_H10", "gLM_H10", "gTg_H10", "gRM_H10", "gLB_H10", "gCB_H10", "gRB_H10", "YEAR")
	new_col_RSDNC <- c("gLC_R10", "gCT_R10", "gRT_R10", "gLM_R10", "gTg_R10", "gRM_R10", "gLB_R10", "gCB_R10", "gRB_R10", "YEAR")
	new_col_WRKRS <- c("gLC_W10", "gCT_W10", "gRT_W10", "gLM_W10", "gTg_W10", "gRM_W10", "gLB_W10", "gCB_W10", "gRB_W10", "YEAR")
	new_col_POPTN <- c("gLC_P10", "gCT_P10", "gRT_P10", "gLM_P10", "gTg_P10", "gRM_P10", "gLB_P10", "gCB_P10", "gRB_P10", "YEAR")
	new_col_YNG_POP <- c("gLC_Y10", "gCT_Y10", "gRT_Y10", "gLM_Y10", "gTg_Y10", "gRM_Y10", "gLB_Y10", "gCB_Y10", "gRB_Y10", "YEAR")

	colnames(GRD_BUSNS_10) <- new_col_BUSNS; GRD_BUSNS_10$YEAR <- NULL
	colnames(GRD_HSHD_10) <- new_col_HSHD; GRD_HSHD_10$YEAR <- NULL
	colnames(GRD_RSDNC_10) <- new_col_RSDNC; GRD_RSDNC_10$YEAR <- NULL
	colnames(GRD_WRKRS_10) <- new_col_WRKRS; GRD_WRKRS_10$YEAR <- NULL
	colnames(GRD_POPTN_10) <- new_col_POPTN; GRD_POPTN_10$YEAR <- NULL
	colnames(GRD_YNG_POP_10) <- new_col_YNG_POP; GRD_YNG_POP_10$YEAR <- NULL



	GRD_BUSNS_15 <- subset(GRD_BUSNS, YEAR == 2015)
	GRD_HSHD_15 <- subset(GRD_HSHD, YEAR == 2015)
	GRD_RSDNC_15 <- subset(GRD_RSDNC, YEAR == 2015)
	GRD_WRKRS_15 <- subset(GRD_WRKRS, YEAR == 2015)
	GRD_POPTN_15 <- subset(GRD_POPTN, YEAR == 2015)
	GRD_YNG_POP_15 <- subset(GRD_YNG_POP, YEAR == 2015)

	new_col_BUSNS <- c("gLC_B15", "gCT_B15", "gRT_B15", "gLM_B15", "gTg_B15", "gRM_B15", "gLB_B15", "gCB_B15", "gRB_B15", "YEAR")
	new_col_HSHD <- c("gLC_H15", "gCT_H15", "gRT_H15", "gLM_H15", "gTg_H15", "gRM_H15", "gLB_H15", "gCB_H15", "gRB_H15", "YEAR")
	new_col_RSDNC <- c("gLC_R15", "gCT_R15", "gRT_R15", "gLM_R15", "gTg_R15", "gRM_R15", "gLB_R15", "gCB_R15", "gRB_R15", "YEAR")
	new_col_WRKRS <- c("gLC_W15", "gCT_W15", "gRT_W15", "gLM_W15", "gTg_W15", "gRM_W15", "gLB_W15", "gCB_W15", "gRB_W15", "YEAR")
	new_col_POPTN <- c("gLC_P15", "gCT_P15", "gRT_P15", "gLM_P15", "gTg_P15", "gRM_P15", "gLB_P15", "gCB_P15", "gRB_P15", "YEAR")
	new_col_YNG_POP <- c("gLC_Y15", "gCT_Y15", "gRT_Y15", "gLM_Y15", "gTg_Y15", "gRM_Y15", "gLB_Y15", "gCB_Y15", "gRB_Y15", "YEAR")

	colnames(GRD_BUSNS_15) <- new_col_BUSNS; GRD_BUSNS_15$YEAR <- NULL
	colnames(GRD_HSHD_15) <- new_col_HSHD; GRD_HSHD_15$YEAR <- NULL
	colnames(GRD_RSDNC_15) <- new_col_RSDNC; GRD_RSDNC_15$YEAR <- NULL
	colnames(GRD_WRKRS_15) <- new_col_WRKRS; GRD_WRKRS_15$YEAR <- NULL
	colnames(GRD_POPTN_15) <- new_col_POPTN; GRD_POPTN_15$YEAR <- NULL
	colnames(GRD_YNG_POP_15) <- new_col_YNG_POP; GRD_YNG_POP_15$YEAR <- NULL



	GRD_BUSNS_16 <- subset(GRD_BUSNS, YEAR == 2016)
	GRD_HSHD_16 <- subset(GRD_HSHD, YEAR == 2016)
	GRD_RSDNC_16 <- subset(GRD_RSDNC, YEAR == 2016)
	GRD_WRKRS_16 <- subset(GRD_WRKRS, YEAR == 2016)
	GRD_POPTN_16 <- subset(GRD_POPTN, YEAR == 2016)
	GRD_YNG_POP_16 <- subset(GRD_YNG_POP, YEAR == 2016)

	new_col_BUSNS <- c("gLC_B16", "gCT_B16", "gRT_B16", "gLM_B16", "gTg_B16", "gRM_B16", "gLB_B16", "gCB_B16", "gRB_B16", "YEAR")
	new_col_HSHD <- c("gLC_H16", "gCT_H16", "gRT_H16", "gLM_H16", "gTg_H16", "gRM_H16", "gLB_H16", "gCB_H16", "gRB_H16", "YEAR")
	new_col_RSDNC <- c("gLC_R16", "gCT_R16", "gRT_R16", "gLM_R16", "gTg_R16", "gRM_R16", "gLB_R16", "gCB_R16", "gRB_R16", "YEAR")
	new_col_WRKRS <- c("gLC_W16", "gCT_W16", "gRT_W16", "gLM_W16", "gTg_W16", "gRM_W16", "gLB_W16", "gCB_W16", "gRB_W16", "YEAR")
	new_col_POPTN <- c("gLC_P16", "gCT_P16", "gRT_P16", "gLM_P16", "gTg_P16", "gRM_P16", "gLB_P16", "gCB_P16", "gRB_P16", "YEAR")
	new_col_YNG_POP <- c("gLC_Y16", "gCT_Y16", "gRT_Y16", "gLM_Y16", "gTg_Y16", "gRM_Y16", "gLB_Y16", "gCB_Y16", "gRB_Y16", "YEAR")

	colnames(GRD_BUSNS_16) <- new_col_BUSNS; GRD_BUSNS_16$YEAR <- NULL
	colnames(GRD_HSHD_16) <- new_col_HSHD; GRD_HSHD_16$YEAR <- NULL
	colnames(GRD_RSDNC_16) <- new_col_RSDNC; GRD_RSDNC_16$YEAR <- NULL
	colnames(GRD_WRKRS_16) <- new_col_WRKRS; GRD_WRKRS_16$YEAR <- NULL
	colnames(GRD_POPTN_16) <- new_col_POPTN; GRD_POPTN_16$YEAR <- NULL
	colnames(GRD_YNG_POP_16) <- new_col_YNG_POP; GRD_YNG_POP_16$YEAR <- NULL



	GRD_BUSNS_17 <- subset(GRD_BUSNS, YEAR == 2017)
	GRD_HSHD_17 <- subset(GRD_HSHD, YEAR == 2017)
	GRD_RSDNC_17 <- subset(GRD_RSDNC, YEAR == 2017)
	GRD_WRKRS_17 <- subset(GRD_WRKRS, YEAR == 2017)
	GRD_POPTN_17 <- subset(GRD_POPTN, YEAR == 2017)
	GRD_YNG_POP_17 <- subset(GRD_YNG_POP, YEAR == 2017)

	new_col_BUSNS <- c("gLC_B17", "gCT_B17", "gRT_B17", "gLM_B17", "gTg_B17", "gRM_B17", "gLB_B17", "gCB_B17", "gRB_B17", "YEAR")
	new_col_HSHD <- c("gLC_H17", "gCT_H17", "gRT_H17", "gLM_H17", "gTg_H17", "gRM_H17", "gLB_H17", "gCB_H17", "gRB_H17", "YEAR")
	new_col_RSDNC <- c("gLC_R17", "gCT_R17", "gRT_R17", "gLM_R17", "gTg_R17", "gRM_R17", "gLB_R17", "gCB_R17", "gRB_R17", "YEAR")
	new_col_WRKRS <- c("gLC_W17", "gCT_W17", "gRT_W17", "gLM_W17", "gTg_W17", "gRM_W17", "gLB_W17", "gCB_W17", "gRB_W17", "YEAR")
	new_col_POPTN <- c("gLC_P17", "gCT_P17", "gRT_P17", "gLM_P17", "gTg_P17", "gRM_P17", "gLB_P17", "gCB_P17", "gRB_P17", "YEAR")
	new_col_YNG_POP <- c("gLC_Y17", "gCT_Y17", "gRT_Y17", "gLM_Y17", "gTg_Y17", "gRM_Y17", "gLB_Y17", "gCB_Y17", "gRB_Y17", "YEAR")

	colnames(GRD_BUSNS_17) <- new_col_BUSNS; GRD_BUSNS_17$YEAR <- NULL
	colnames(GRD_HSHD_17) <- new_col_HSHD; GRD_HSHD_17$YEAR <- NULL
	colnames(GRD_RSDNC_17) <- new_col_RSDNC; GRD_RSDNC_17$YEAR <- NULL
	colnames(GRD_WRKRS_17) <- new_col_WRKRS; GRD_WRKRS_17$YEAR <- NULL
	colnames(GRD_POPTN_17) <- new_col_POPTN; GRD_POPTN_17$YEAR <- NULL
	colnames(GRD_YNG_POP_17) <- new_col_YNG_POP; GRD_YNG_POP_17$YEAR <- NULL



	GRD_BUSNS_18 <- subset(GRD_BUSNS, YEAR == 2018)
	GRD_HSHD_18 <- subset(GRD_HSHD, YEAR == 2018)
	GRD_RSDNC_18 <- subset(GRD_RSDNC, YEAR == 2018)
	GRD_WRKRS_18 <- subset(GRD_WRKRS, YEAR == 2018)
	GRD_POPTN_18 <- subset(GRD_POPTN, YEAR == 2018)
	GRD_YNG_POP_18 <- subset(GRD_YNG_POP, YEAR == 2018)

	new_col_BUSNS <- c("gLC_B18", "gCT_B18", "gRT_B18", "gLM_B18", "gTg_B18", "gRM_B18", "gLB_B18", "gCB_B18", "gRB_B18", "YEAR")
	new_col_HSHD <- c("gLC_H18", "gCT_H18", "gRT_H18", "gLM_H18", "gTg_H18", "gRM_H18", "gLB_H18", "gCB_H18", "gRB_H18", "YEAR")
	new_col_RSDNC <- c("gLC_R18", "gCT_R18", "gRT_R18", "gLM_R18", "gTg_R18", "gRM_R18", "gLB_R18", "gCB_R18", "gRB_R18", "YEAR")
	new_col_WRKRS <- c("gLC_W18", "gCT_W18", "gRT_W18", "gLM_W18", "gTg_W18", "gRM_W18", "gLB_W18", "gCB_W18", "gRB_W18", "YEAR")
	new_col_POPTN <- c("gLC_P18", "gCT_P18", "gRT_P18", "gLM_P18", "gTg_P18", "gRM_P18", "gLB_P18", "gCB_P18", "gRB_P18", "YEAR")
	new_col_YNG_POP <- c("gLC_Y18", "gCT_Y18", "gRT_Y18", "gLM_Y18", "gTg_Y18", "gRM_Y18", "gLB_Y18", "gCB_Y18", "gRB_Y18", "YEAR")

	colnames(GRD_BUSNS_18) <- new_col_BUSNS; GRD_BUSNS_18$YEAR <- NULL
	colnames(GRD_HSHD_18) <- new_col_HSHD; GRD_HSHD_18$YEAR <- NULL
	colnames(GRD_RSDNC_18) <- new_col_RSDNC; GRD_RSDNC_18$YEAR <- NULL
	colnames(GRD_WRKRS_18) <- new_col_WRKRS; GRD_WRKRS_18$YEAR <- NULL
	colnames(GRD_POPTN_18) <- new_col_POPTN; GRD_POPTN_18$YEAR <- NULL
	colnames(GRD_YNG_POP_18) <- new_col_YNG_POP; GRD_YNG_POP_18$YEAR <- NULL

	TESTING_SET <- cbind(
	GRD_BUSNS_05, GRD_HSHD_05, GRD_RSDNC_05, GRD_WRKRS_05, GRD_POPTN_05, GRD_YNG_POP_05,
	GRD_BUSNS_10, GRD_HSHD_10, GRD_RSDNC_10, GRD_WRKRS_10, GRD_POPTN_10, GRD_YNG_POP_10, 
	GRD_BUSNS_15, GRD_HSHD_15, GRD_RSDNC_15, GRD_WRKRS_15, GRD_POPTN_15, GRD_YNG_POP_15, 
	GRD_BUSNS_16, GRD_HSHD_16, GRD_RSDNC_16, GRD_WRKRS_16, GRD_POPTN_16, GRD_YNG_POP_16, 
	GRD_BUSNS_17, GRD_HSHD_17, GRD_RSDNC_17, GRD_WRKRS_17, GRD_POPTN_17, GRD_YNG_POP_17, 
	GRD_BUSNS_18, GRD_HSHD_18, GRD_RSDNC_18, GRD_WRKRS_18, GRD_POPTN_18, GRD_YNG_POP_18)

	return(TESTING_SET)
}

save.image(paste0(dir, "/STEP_3_LEARING_DATA.RData"))


#rm(TRAINING_SET_1, TRAINING_SET_2, TRAINING_SET_3, TRAINING_SET_4, TRAINING_SET_5, TRAINING_SET_6, TESTING_SET_1, TESTING_SET_2, TESTING_SET_3, TESTING_SET_4, TESTING_SET_5, TESTING_SET_6)



load(paste0(dir, "/STEP_3_LEARING_DATA.RData"))

TRAINING_SET_1 <- TRAINING_data_TYPE_1(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TRAINING_SET_2 <- TRAINING_data_TYPE_2(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TRAINING_SET_3 <- TRAINING_data_TYPE_3(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TRAINING_SET_4 <- TRAINING_data_TYPE_4(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TRAINING_SET_5 <- TRAINING_data_TYPE_5(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TRAINING_SET_6 <- TRAINING_data_TYPE_6(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)

TESTING_SET_1 <- TESTING_data_TYPE_1(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TESTING_SET_2 <- TESTING_data_TYPE_2(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TESTING_SET_3 <- TESTING_data_TYPE_3(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TESTING_SET_4 <- TESTING_data_TYPE_4(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TESTING_SET_5 <- TESTING_data_TYPE_5(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TESTING_SET_6 <- TESTING_data_TYPE_6(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)


save(TRAINING_SET_1, TRAINING_SET_2, TRAINING_SET_3, TRAINING_SET_4, TRAINING_SET_5, TRAINING_SET_6, 
	TESTING_SET_1, TESTING_SET_2, TESTING_SET_3, TESTING_SET_4, TESTING_SET_5, TESTING_SET_6,
	file = paste0(dir, "/LEARING_SET.RData"))



	# LEARNING FASHION] LEARNING > TESTING > TUNING (w/ STAT EST.)
	# Young population has only between 2014 - 2024
	#============================ YEARLY DESGIN for LEARNING FASHION =============================#
	#---------------------------------------------------------------------------------------------
	#---------------|-------------- LEARNING --------------|--------------- TESTING --------------
	#   PREDICTION  |      TRAINING-SET     |    TARGET    |      TRAINING-SET     |    TARGET   
	#---------------|-----------------------|--------------|-----------------------|--------------
	#  1year-model  |      2000 ~ 2022      |     2023     |      2005 ~ 2023      |     2025     
	#  2year-model  |      2000 ~ 2021      |     2023     |      2005 ~ 2022      |     2026     
	#  3year-model  |      2000 ~ 2020      |     2023     |      2005 ~ 2021      |     2027     
	#  4year-model  |      2000 ~ 2019      |     2023     |      2005 ~ 2020      |     2028     
	#  5year-model  |      2000 ~ 2018      |     2023     |      2005 ~ 2019      |     2029     
	#  6year-model  |      2000 ~ 2017      |     2023     |      2005 ~ 2018      |     2030     
	#----------------------------------------------------------------------------------------------

	# Total 12 years data) 2000 2005 2010 2015 2016 2017 2018 2019 2020 2021 2022 2023
	# 1year-model: Learning(11)-Target(1) > Testing(11)-Target(1)
	# 2year-model: Learning(10)-Target(1) > Testing(10)-Target(1)
	# 3year-model: Learning(9)-Target(1) > Testing(9)-Target(1)
	# 4year-model: Learning(8)-Target(1) > Testing(8)-Target(1)
	# 5year-model: Learning(7)-Target(1) > Testing(7)-Target(1)
	# 6year-model: Learning(6)-Target(1) > Testing(6)-Target(1)



con <- file(paste0(dir, "/OUT/TRAINING_1.csv"), encoding="UTF-8"); write.csv(TRAINING_SET_1, con, row.names = FALSE);
con <- file(paste0(dir, "/OUT/TRAINING_2.csv"), encoding="UTF-8"); write.csv(TRAINING_SET_2, con, row.names = FALSE);
con <- file(paste0(dir, "/OUT/TRAINING_3.csv"), encoding="UTF-8"); write.csv(TRAINING_SET_3, con, row.names = FALSE);
con <- file(paste0(dir, "/OUT/TRAINING_4.csv"), encoding="UTF-8"); write.csv(TRAINING_SET_4, con, row.names = FALSE);
con <- file(paste0(dir, "/OUT/TRAINING_5.csv"), encoding="UTF-8"); write.csv(TRAINING_SET_5, con, row.names = FALSE);
con <- file(paste0(dir, "/OUT/TRAINING_6.csv"), encoding="UTF-8"); write.csv(TRAINING_SET_6, con, row.names = FALSE);


con <- file(paste0(dir, "/OUT/TESTING_1.csv"), encoding="UTF-8"); write.csv(TESTING_SET_1, con, row.names = FALSE);
con <- file(paste0(dir, "/OUT/TESTING_2.csv"), encoding="UTF-8"); write.csv(TESTING_SET_2, con, row.names = FALSE);
con <- file(paste0(dir, "/OUT/TESTING_3.csv"), encoding="UTF-8"); write.csv(TESTING_SET_3, con, row.names = FALSE);
con <- file(paste0(dir, "/OUT/TESTING_4.csv"), encoding="UTF-8"); write.csv(TESTING_SET_4, con, row.names = FALSE);
con <- file(paste0(dir, "/OUT/TESTING_5.csv"), encoding="UTF-8"); write.csv(TESTING_SET_5, con, row.names = FALSE);
con <- file(paste0(dir, "/OUT/TESTING_6.csv"), encoding="UTF-8"); write.csv(TESTING_SET_6, con, row.names = FALSE);

colnames(GRD_YNG_POP_TG) <- c("GRID", "YEAR", "gTg"); GRD_YNG_POP_TG$YEAR <- NULL
con <- file(paste0(dir, "/OUT/TARGET.csv"), encoding="UTF-8"); write.csv(GRD_YNG_POP_TG, con, row.names = FALSE);




Run_Prediction <- function(TRAINING_SET_X, target, dir, TYPE){
	cat("randomforest run code has initiated...\n")

	target$GRID <- NULL
	TRAINING_SET_X <- as.matrix(TRAINING_SET_X)
	target <- as.matrix(target)
	TRAINING_SET_X[is.na(TRAINING_SET_X)] <- 0 
	target[is.na(target)] <- 0 
	tA <- tuneRF(TRAINING_SET_X, target, improve = 0.0001, stepFactor=1.5, plot=TRUE, trace=TRUE, doBest=TRUE);
	set_RF <- tA$mtry
	cat("tuneRF has updated\n")
	print(set_RF)		# 54
	gc()

	NofTrees=980
	event.rf<-randomForest(x=TRAINING_SET_X, y=target, 
		ntree=NofTrees, mtry=set_RF, replace=FALSE, samplesize=ceiling(.632*nrow(TRAINING_SET_X)), 
		importance=TRUE, do.trace=TRUE, keep.forest=TRUE)
	cat("initial RF model has updated...\n")

	gc()

	#------ Find best number of trees
	Fount_trr=min(event.rf$mse);
	for (i in 1:NofTrees){
		if (event.rf$mse[i]==Fount_trr){NofTrees=i}}						#------ 'set_RF' is best number of myry
	remove('i','Fount_trr')										#------ clearning unneccery variables
	print(NofTrees)		# 911
	#save.image(paste0(dir, "/results/rf_model_draft.RData"))

	event.rf<-randomForest(x=TRAINING_SET_X, y=target, 
		ntree=NofTrees, mtry=set_RF, replace=FALSE, samplesize=ceiling(.632*nrow(TRAINING_SET_X)), 
		importance=TRUE, do.trace=TRUE, keep.forest=TRUE)
	cat("RF model has finalized...\n")


	save.image(paste0(dir, "/OUT/", TYPE, ".RData"))
	cat("Save a checkpoint at RF_OUT...\n")

	gc()

	return(event.rf)
}







TYPE_1_RF <- Run_Prediction(TRAINING_SET_1, GRD_YNG_POP_TG, dir, "TYPE_1")
TYPE_2_RF <- Run_Prediction(TRAINING_SET_2, GRD_YNG_POP_TG, dir, "TYPE_2")
TYPE_3_RF <- Run_Prediction(TRAINING_SET_3, GRD_YNG_POP_TG, dir, "TYPE_3")
TYPE_4_RF <- Run_Prediction(TRAINING_SET_4, GRD_YNG_POP_TG, dir, "TYPE_4")
TYPE_5_RF <- Run_Prediction(TRAINING_SET_5, GRD_YNG_POP_TG, dir, "TYPE_5")
TYPE_6_RF <- Run_Prediction(TRAINING_SET_6, GRD_YNG_POP_TG, dir, "TYPE_6")


GRD_YNG_POP_TS <- GRD_YNG_POP[,c("gTg", "YEAR")]
GRD_YNG_POP_TS <- cbind(subset(GRD_YNG_POP_TS, YEAR == 2005), subset(GRD_YNG_POP_TS, YEAR == 2010),
						subset(GRD_YNG_POP_TS, YEAR == 2015), subset(GRD_YNG_POP_TS, YEAR == 2016),
						subset(GRD_YNG_POP_TS, YEAR == 2017), subset(GRD_YNG_POP_TS, YEAR == 2018),
						subset(GRD_YNG_POP_TS, YEAR == 2019), subset(GRD_YNG_POP_TS, YEAR == 2020),
						subset(GRD_YNG_POP_TS, YEAR == 2021), subset(GRD_YNG_POP_TS, YEAR == 2022),
						subset(GRD_YNG_POP_TS, YEAR == 2023))


colnames(GRD_YNG_POP_TS) <- c("gTg_05", "YEAR_05", "gTg_10", "YEAR_10", "gTg_15", "YEAR_15", "gTg_16", "YEAR_16",
							  "gTg_17", "YEAR_17", "gTg_18", "YEAR_18", "gTg_19", "YEAR_19", "gTg_20", "YEAR_20",
							  "gTg_21", "YEAR_21", "gTg_22", "YEAR_22", "gTg_23", "YEAR_23")

GRD_YNG_POP_TS <- GRD_YNG_POP_TS[,c("gTg_05", "gTg_10", "gTg_15", "gTg_16", "gTg_17", 
						"gTg_18", "gTg_19", "gTg_20", "gTg_21", "gTg_22", "gTg_23")]



# --- Start of the core trend analysis and prediction code ---

# 1. Define the years for which we have data and the years we want to predict
# Extract years from the existing column names (e.g., "gTg_05" -> 5)
existing_years <- as.numeric(gsub("gTg_", "", names(GRD_YNG_POP_TS)))

# Define the future years for which we want to get estimations
prediction_years <- 24:30

# 2. Prepare the new column names for the predicted values
predicted_col_names <- paste0("gTg_", prediction_years)

# 3. Create a new data frame to store the original data plus the predictions
GRD_YNG_POP_TS_with_predictions <- GRD_YNG_POP_TS # Copy the original data
# Add the new columns, initialized with NA
GRD_YNG_POP_TS_with_predictions[predicted_col_names] <- NA

# 4. Loop through each row of the data frame to perform individual trend analysis
for (i in 1:nrow(GRD_YNG_POP_TS)) {

  # Extract the population values for the current row
  population_values_row <- as.numeric(GRD_YNG_POP_TS[i, ])

  # Create a temporary data frame suitable for linear regression (year vs. population)
  # It's good practice to only include observations where population is meaningful (e.g., > 0)
  # This avoids fitting trends to long stretches of zeros that might not represent a trend.
  # If you want to include all zeros in the trend, remove the filter below.
  valid_observations_indices <- which(population_values_row > 0)

  # Check if there are enough valid data points to fit a linear model (minimum 2 points)
  if (length(valid_observations_indices) < 2) {
    # If not enough data, set predictions for this row to 0 (or NA, based on preference)
    #message(paste0("Row ", i, ": Not enough non-zero data points (need at least 2) to fit a trend. Setting predictions to 0."))
    GRD_YNG_POP_TS_with_predictions[i, predicted_col_names] <- 0
    next # Move to the next row
  }

  # Create the data frame for the linear model for the current row
  model_data_current_row <- data.frame(
    year = existing_years[valid_observations_indices],
    population = population_values_row[valid_observations_indices]
  )

  # Fit the simple linear regression model
  # The formula 'population ~ year' means 'population is a linear function of year'
  trend_model <- lm(population ~ year, data = model_data_current_row)

  # Create a new data frame with the years for which we want predictions
  new_data_for_prediction <- data.frame(year = prediction_years)

  # Use the fitted model to predict population values for the future years
  predicted_population <- predict(trend_model, newdata = new_data_for_prediction)

  # Population cannot be negative, so set any negative predictions to 0
  predicted_population[predicted_population < 0] <- 0

  # Round the predicted population to whole numbers as population is discrete
  predicted_population_rounded <- round(predicted_population)

  # Store the predicted values back into the new columns of the main data frame
  GRD_YNG_POP_TS_with_predictions[i, predicted_col_names] <- predicted_population_rounded
}

# --- End of the core trend analysis and prediction code ---

# Display the first few rows of the data frame with the new predictions
print("Original data with estimated future population:")
print(head(GRD_YNG_POP_TS_with_predictions))




GRD_YNG_POP_EST <- cbind(Index_grid_SGG, GRD_YNG_POP_TS_with_predictions) 

GRD_shp <- st_read(paste0(dir, "/NGII/POP_2023/020001028_202310.shp"))
GRD_shp$LBL <- NULL; GRD_shp$VAL <- NULL;

GRD_shp_YNG <- left_join(GRD_shp, GRD_YNG_POP_EST, by = c("GID"="GRID_1K_CD"))
st_write(GRD_shp_YNG, paste0(dir, "/0_TRND_shp/shp/GRD_TRND_YNG.shp"), delete_layer = TRUE)


con <- file(paste0(dir, "/0_TRND_shp/shp/GRD_TRND_YNG.csv"), encoding="UTF-8"); write.csv(GRD_YNG_POP_EST, con, row.names = FALSE);





# Initialize data frame for model performance metrics (optional, if you want to store them)
model_metrics <- data.frame(
  row_id = 1:nrow(GRD_YNG_POP_TS),
  r_squared = NA,
  rmse = NA,
  mae = NA
)

# Loop through each row again to collect metrics
for (i in 1:nrow(GRD_YNG_POP_TS)) {
  population_values_row <- as.numeric(GRD_YNG_POP_TS[i, ])
  valid_observations_indices <- which(population_values_row > 0)

  if (length(valid_observations_indices) < 2) {
    # Cannot fit a model, so metrics are NA
    next
  }

  model_data_current_row <- data.frame(
    year = existing_years[valid_observations_indices],
    population = population_values_row[valid_observations_indices]
  )

  trend_model <- lm(population ~ year, data = model_data_current_row)
  model_summary <- summary(trend_model)

  # --- Extract R-squared ---
  model_metrics$r_squared[i] <- model_summary$r.squared

  # --- Calculate RMSE ---
  # Get fitted values from the model for the historical data
  fitted_values <- predict(trend_model, newdata = model_data_current_row)
  # Calculate residuals (actual - fitted)
  residuals <- model_data_current_row$population - fitted_values
  model_metrics$rmse[i] <- sqrt(mean(residuals^2))

  # --- Calculate MAE ---
  model_metrics$mae[i] <- mean(abs(residuals))
}

# Display some of the calculated metrics
print("Model Performance Metrics (first few rows with valid models):")
print(head(model_metrics[!is.na(model_metrics$r_squared), ]))

# You could also summarize the overall distribution of metrics
print("\nSummary of R-squared across all models:")
print(summary(model_metrics$r_squared))



# [1] "Model Performance Metrics (first few rows with valid models):"
# > print(head(model_metrics[!is.na(model_metrics$r_squared), ]))
#    row_id r_squared       rmse       mae
# 11     11 0.1743031 10.1853108 7.6346125
# 12     12 0.5776345  7.4835537 6.8353453
# 18     18 0.6655753  0.9294785 0.8338308
# 21     21 0.7944292  5.9018573 4.9242003
# 36     36 0.5602542  3.9217597 3.3995652
# 43     43 0.7500000  0.2357023 0.2222222
# > 
# > # You could also summarize the overall distribution of metrics
# > print("\nSummary of R-squared across all models:")
# [1] "\nSummary of R-squared across all models:"
# > print(summary(model_metrics$r_squared))
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#    0.00    0.31    0.57    0.54    0.77    1.00   49368 


print(summary(model_metrics[!is.na(model_metrics$r_squared), ]))
     row_id         r_squared           rmse                mae          
 Min.   :    11   Min.   :0.0000   Min.   :   0.0000   Min.   :   0.000  
 1st Qu.: 25436   1st Qu.:0.3087   1st Qu.:   0.4899   1st Qu.:   0.440  
 Median : 45483   Median :0.5714   Median :   1.6011   Median :   1.308  
 Mean   : 49309   Mean   :0.5368   Mean   :  20.5846   Mean   :  17.481  
 3rd Qu.: 72410   3rd Qu.:0.7715   3rd Qu.:   3.7151   3rd Qu.:   3.101  
 Max.   :107433   Max.   :1.0000   Max.   :2969.7787   Max.   :2734.953  












run_xbg_by_TYPE <- function(TRAINING_SET_X, GRD_YNG_POP_TG, TESTING_SET_X, Index_grid_SGG, dir, folder_X, save_name){
	set.seed(123) # For reproducibility


	# Convert data frames to matrices for XGBoost
	X_train <- as.matrix(TRAINING_SET_X)
	y_train <- GRD_YNG_POP_TG$gTg

	X_test <- as.matrix(TESTING_SET_X)
	colnames(X_test) <- colnames(TRAINING_SET_X)

	# Convert to xgb.DMatrix (XGBoost's optimized data format)
	dtrain <- xgb.DMatrix(data = X_train, label = y_train)
	dtest <- xgb.DMatrix(data = X_test)




	message("Starting XGBoost model training...")

	# XGBoost parameters for regression
	params <- list(
	  objective = "reg:squarederror", # Specifies regression task aiming to minimize squared error
	  eval_metric = "rmse",           # Root Mean Squared Error for evaluation during training
	  eta = 0.03,                     # Learning rate (controls step size at each boosting iteration)
	  max_depth = 8,                  # Maximum depth of a tree (controls model complexity)
	  subsample = 0.7,                # Subsample ratio of the training instance for each tree
	  colsample_bytree = 0.7,         # Subsample ratio of columns when constructing each tree
	  min_child_weight = 1,           # Minimum sum of instance weight needed in a child
	  seed = 42                       # For reproducibility
	)

	nrounds <- 500 # Maximum number of boosting rounds (trees)

	# Use xgb.cv for cross-validation. This helps in tuning and prevents overfitting.
	message("Performing cross-validation to find optimal boosting rounds...")
	cv_model <- xgb.cv(
	  params = params,
	  data = dtrain,
	  nrounds = nrounds,
	  nfold = 5,                      # 5-fold cross-validation
	  showsd = TRUE,                  # Show standard deviation of metric scores
	  verbose = FALSE,                # Suppress verbose output during CV
	  print_every_n = 50,             # Print progress every 50 rounds
	  early_stopping_rounds = 50,     # Stop if validation RMSE doesn't improve for 50 rounds
	  maximize = FALSE                # For RMSE, we want to minimize it
	)

	# Get the best iteration (number of trees) found by cross-validation
	best_nrounds <- cv_model$best_iteration
	cat("\nBest number of boosting rounds (trees) found by CV:", best_nrounds, "\n")

	# Train the final model using the best number of rounds found by CV
	message(paste0("Training final model with ", best_nrounds, " rounds..."))
	xgb_model <- xgb.train(
	  params = params,
	  data = dtrain,
	  nrounds = best_nrounds,
	  verbose = 0 # Set to 1 for more detailed output during training
	)

	message("XGBoost model training complete.")

	cat("\n--- Cross-Validation Performance ---\n")
	cat("Best RMSE on training folds:", cv_model$evaluation_log$train_rmse_mean[best_nrounds], "\n")
	cat("Best RMSE on test (validation) folds:", cv_model$evaluation_log$test_rmse_mean[best_nrounds], "\n")
	cat("Standard Deviation of RMSE on test folds:", cv_model$evaluation_log$test_rmse_std[best_nrounds], "\n")






	message("Predicting gTg for TESTING_SET...")

	# Make predictions using the trained model on the test data
	predictions_gTg <- predict(xgb_model, dtest)

	# Post-process predictions:
	# 1. Ensure population counts are not negative (set to 0 if they are).
	# 2. Round to the nearest whole number, as population is discrete.
	predictions_gTg[predictions_gTg < 0] <- 0
	predictions_gTg <- round(predictions_gTg)

	# Store the predictions in a new data frame
	TESTING_SET_predicted_gTg <- data.frame(
	  gTg_25 = predictions_gTg
	)

	message("Prediction for gTg complete.")

	GRD_YNG_POP_EST <- cbind(Index_grid_SGG, TESTING_SET_predicted_gTg) 

	GRD_shp <- st_read(paste0(dir, "/NGII/POP_2023/020001028_202310.shp"))
	GRD_shp$LBL <- NULL; GRD_shp$VAL <- NULL;

	GRD_shp_YNG <- left_join(GRD_shp, GRD_YNG_POP_EST, by = c("GID"="GRID_1K_CD"))
	st_write(GRD_shp_YNG, paste0(dir, "/OUT/", folder_X, "/GRD_XGB_", save_name, ".shp"), delete_layer = TRUE)

	con <- file(paste0(dir, "/OUT/", folder_X, "/GRD_XGB_", save_name, ".csv"), encoding="UTF-8"); 
	write.csv(GRD_YNG_POP_EST, con, row.names = FALSE);

	save(GRD_YNG_POP_EST, GRD_shp_YNG, cv_model, xgb_model, file = paste0(dir, "/OUT/", folder_X, "/GRD_XGB_", save_name, ".RData"))

	# Calculate RMSE
	rmse_test <- sqrt(mean((y_train - predictions_gTg)^2))
	# Calculate MAE
	mae_test <- mean(abs(y_train - predictions_gTg))

	cat("\n--- Performance on Testing Set ---\n")
	cat(paste0("Test RMSE for gTg_", save_name, ":", rmse_test, "\n"))
	cat(paste0("Test MAE for gTg_23", save_name, ":", mae_test, "\n"))


	return(xgb_model)
}


xgb_model_25 <- run_xbg_by_TYPE(TRAINING_SET_1, GRD_YNG_POP_TG, TESTING_SET_1, Index_grid_SGG, dir, "1_XGB_shp", "25")
xgb_model_26 <- run_xbg_by_TYPE(TRAINING_SET_2, GRD_YNG_POP_TG, TESTING_SET_2, Index_grid_SGG, dir, "2_XGB_shp", "26")
xgb_model_27 <- run_xbg_by_TYPE(TRAINING_SET_3, GRD_YNG_POP_TG, TESTING_SET_3, Index_grid_SGG, dir, "3_XGB_shp", "27")
xgb_model_28 <- run_xbg_by_TYPE(TRAINING_SET_4, GRD_YNG_POP_TG, TESTING_SET_4, Index_grid_SGG, dir, "4_XGB_shp", "28")
xgb_model_29 <- run_xbg_by_TYPE(TRAINING_SET_5, GRD_YNG_POP_TG, TESTING_SET_5, Index_grid_SGG, dir, "5_XGB_shp", "29")
xgb_model_30 <- run_xbg_by_TYPE(TRAINING_SET_6, GRD_YNG_POP_TG, TESTING_SET_6, Index_grid_SGG, dir, "6_XGB_shp", "30")





load(paste0(dir, "/STEP_3_LEARING_DATA.RData"))
colnames(GRD_YNG_POP_TG) <- c("GRID", "YEAR", "gTg"); GRD_YNG_POP_TG$YEAR <- NULL

TRAINING_SET_1 <- TRAINING_data_TYPE_1(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TRAINING_SET_2 <- TRAINING_data_TYPE_2(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TRAINING_SET_3 <- TRAINING_data_TYPE_3(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TRAINING_SET_4 <- TRAINING_data_TYPE_4(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TRAINING_SET_5 <- TRAINING_data_TYPE_5(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TRAINING_SET_6 <- TRAINING_data_TYPE_6(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)

TESTING_SET_1 <- TESTING_data_TYPE_1(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TESTING_SET_2 <- TESTING_data_TYPE_2(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TESTING_SET_3 <- TESTING_data_TYPE_3(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TESTING_SET_4 <- TESTING_data_TYPE_4(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TESTING_SET_5 <- TESTING_data_TYPE_5(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
TESTING_SET_6 <- TESTING_data_TYPE_6(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)




for (save_name in 25:30){
	dir <- "C:/Users/johny/Dropbox/Working/Project/2025/KISDI/data/"; setwd(dir);
	load(paste0(dir, "/OUT/", (save_name-24), "_XGB_shp/GRD_XGB_", save_name, ".RData"))

	# Calculate RMSE
	rmse_test <- sqrt(mean((GRD_YNG_POP_TG$gTg - GRD_YNG_POP_EST$gTg_25)^2))
	# Calculate MAE
	mae_test <- mean(abs(GRD_YNG_POP_TG$gTg - GRD_YNG_POP_EST$gTg_25))
	cat(paste0("Test RMSE for gTg_", save_name, ":", rmse_test, "\n"))
	cat(paste0("Test MAE for gTg_", save_name, ":", mae_test, "\n"))
}



# TRENDLINE:
Test RMSE for gTg_25: 20.5846
Test MAE for gTg_25: 17.481  

Test RMSE for gTg_25: 9.84141013458962
Test MAE for gTg_25: 1.05173023584818

Test RMSE for gTg_26: 28.2721885474006
Test MAE for gTg_26: 5.0940321289626

Test RMSE for gTg_27: 34.7745573460051
Test MAE for gTg_27: 6.12231715716387

Test RMSE for gTg_28: 40.2843954191543
Test MAE for gTg_28: 6.90198432642728

Test RMSE for gTg_29: 51.6631854814344
Test MAE for gTg_29: 8.72971463673424

Test RMSE for gTg_30: 75.0790190757563
Test MAE for gTg_30: 12.397274808734




# Ensure you have these libraries installed:
# install.packages("keras")
# install.packages("tensorflow")
# You might need to run: tensorflow::install_tensorflow() if TensorFlow backend isn't set up.
library(keras)
library(Matrix) # Used for matrix operations, not directly by keras but good to have
library(dplyr)  # For left_join
library(sf)     # For st_write (spatial data operations)


# --- MLNN Function Definition ---
run_mlnn_by_TYPE <- function(TRAINING_SET_X, GRD_YNG_POP_TG, TESTING_SET_X, Index_grid_SGG, dir, folder_X, save_name){
  set.seed(123) # For reproducibility


	GRD_shp <- st_read(paste0(dir, "/NGII/POP_2023/020001028_202310.shp"))
	GRD_shp$LBL <- NULL; GRD_shp$VAL <- NULL;

	# --- Define Robust Min-Max Scaling Functions ---
	# Modified to handle constant columns and all-NA columns more gracefully.
	normalize_min_max <- function(x, min_val = NULL, max_val = NULL) {
	  # Handle all NA column
	  if (all(is.na(x))) {
	    # If all values are NA, scaled values will also be NA
	    scaled_x <- rep(NA_real_, length(x))
	    min_val_out <- NA_real_
	    max_val_out <- NA_real_
	  } else {
	    # Calculate min/max, ignoring NAs
	    if (is.null(min_val)) min_val_out <- min(x, na.rm = TRUE)
	    else min_val_out <- min_val

	    if (is.null(max_val)) max_val_out <- max(x, na.rm = TRUE)
	    else max_val_out <- max_val

	    if (max_val_out - min_val_out == 0) {
	      # If the column is constant, scale it to 0.5 (or 0) to avoid division by zero.
	      # 0.5 keeps it in the middle of the [0,1] range, which can be useful for NNs.
	      scaled_x <- rep(0.5, length(x))
	    } else {
	      scaled_x <- (x - min_val_out) / (max_val_out - min_val_out)
	    }
	  }
	  return(list(scaled = scaled_x, min_val = min_val_out, max_val = max_val_out))
	}

	inverse_normalize_min_max <- function(scaled_x, min_val, max_val) {
	  original_x <- scaled_x * (max_val - min_val) + min_val
	  return(original_x)
	}


  message(paste0("--- Starting MLNN for save_name: ", save_name, " ---"))

  # 1. Prepare Data for MLNN
  # Convert data frames to matrices
  X_train_raw <- as.matrix(TRAINING_SET_X)
  y_train_raw <- GRD_YNG_POP_TG$gTg # Assuming gTg is the target column name in GRD_YNG_POP_TG
  X_test_raw <- as.matrix(TESTING_SET_X)
  
  # Ensure colnames match between training and testing data for consistent scaling
  colnames(X_test_raw) <- colnames(X_train_raw)


  # 2. Data Preprocessing (Robust Scaling)
  message("Scaling features and target variable...")

  # Initialize scaled matrices with correct dimensions and column names
  X_train_scaled <- matrix(NA_real_, nrow = nrow(X_train_raw), ncol = ncol(X_train_raw))
  colnames(X_train_scaled) <- colnames(X_train_raw)

  X_test_scaled <- matrix(NA_real_, nrow = nrow(X_test_raw), ncol = ncol(X_test_raw))
  colnames(X_test_scaled) <- colnames(X_test_raw)

  # Store scaler parameters (min/max for each column)
  X_scaler_params <- list()

  # Process X_train columns for scaling and store parameters
  for (j in 1:ncol(X_train_raw)) {
    col_name <- colnames(X_train_raw)[j]
    col_data <- X_train_raw[, j]
    
    scaled_info <- normalize_min_max(col_data)
    X_train_scaled[, j] <- scaled_info$scaled
    X_scaler_params[[col_name]] <- list(min_val = scaled_info$min_val, max_val = scaled_info$max_val)
  }

  # Process X_test columns using parameters learned from X_train
  for (j in 1:ncol(X_test_raw)) {
    col_name <- colnames(X_test_raw)[j]
    col_data <- X_test_raw[, j]
    
    min_val <- X_scaler_params[[col_name]]$min_val
    max_val <- X_scaler_params[[col_name]]$max_val
    
    # Apply scaling: robustly handle cases where min/max might be NA or the range is zero (constant column)
    if (is.na(min_val) || is.na(max_val) || (max_val - min_val == 0)) {
        # If the training column was constant or all NA, apply the same constant value (0.5) to test
        X_test_scaled[, j] <- rep(0.5, length(col_data))
    } else {
        X_test_scaled[, j] <- (col_data - min_val) / (max_val - min_val)
    }
  }

  # Scale y_train and store min/max values for inverse scaling predictions
  y_train_scaled_info <- normalize_min_max(y_train_raw)
  y_train_scaled <- y_train_scaled_info$scaled
  y_min_val <- y_train_scaled_info$min_val
  y_max_val <- y_train_scaled_info$max_val

  message("Data scaling complete.")

  # 3. Define MLNN Architecture
  message("Defining Neural Network model architecture...")

  model <- keras_model_sequential() %>%
    layer_dense(units = 256, activation = "relu", input_shape = ncol(X_train_scaled)) %>%
    layer_dropout(rate = 0.2) %>%
    layer_dense(units = 128, activation = "relu") %>%
    layer_dropout(rate = 0.2) %>%
    layer_dense(units = 64, activation = "relu") %>%
    layer_dense(units = 1) # Output layer for regression (single neuron, linear activation by default)

  # 4. Compile Model
  message("Compiling Neural Network model...")
  model %>% compile(
    optimizer = optimizer_adam(learning_rate = 0.001),
    loss = "mse",
    metrics = c("mae")
  )
  message("Model compilation complete.")

  # 5. Train Model
  message("Training Neural Network model...")

  callbacks_list <- list(
    callback_early_stopping(
      monitor = "val_loss",
      patience = 20,
      restore_best_weights = TRUE
    )
  )

  history <- model %>% fit(
    x = X_train_scaled,
    y = y_train_scaled,
    epochs = 200,
    batch_size = 32,
    validation_split = 0.2,
    callbacks = callbacks_list,
    verbose = 0
  )

  message("Neural Network training complete.")

  # 6. Predict gTg
  message(paste0("Predicting gTg for TESTING_SET (Target year: ", save_name, ")..."))

  predictions_gTg_scaled <- model %>% predict(X_test_scaled)

  # Inverse scale predictions
  predictions_gTg_raw <- inverse_normalize_min_max(
    predictions_gTg_scaled,
    min_val = y_min_val,
    max_val = y_max_val
  )

  # Post-process: Ensure non-negative population and round to integer
  predictions_gTg_raw[predictions_gTg_raw < 0] <- 0
  predictions_gTg <- round(predictions_gTg_raw)

  # Store predictions in a data frame
  TESTING_SET_predicted_gTg <- data.frame(
    # Column name will be dynamic, e.g., gTg_25, gTg_26, etc.
    "gTg" = predictions_gTg # Using "gTg" as the internal column name, save_name will be external suffix
  )
  # Set the actual column name to gTg_XX based on save_name
  colnames(TESTING_SET_predicted_gTg) <- paste0("gTg_", save_name)

  message(paste0("Prediction for gTg_", save_name, " complete."))

  # 7. Performance Measures
  cat("\n--- Neural Network Model Performance (Validation Set) ---\n")
  final_val_loss <- tail(history$metrics$val_loss, 1)
  final_val_rmse <- sqrt(final_val_loss)
  final_val_mae <- tail(history$metrics$val_mae, 1)

  cat("Final Validation RMSE:", final_val_rmse, "\n")
  cat("Final Validation MAE:", final_val_mae, "\n")
  cat("Best Epoch:", length(history$metrics$val_loss), "\n") # Length of history implies the last epoch run

  # 8. Output and Saving Results
  # Combine grid index with predictions
  GRD_YNG_POP_EST <- cbind(Index_grid_SGG, TESTING_SET_predicted_gTg)

  # Join with spatial data and write shapefile
  GRD_shp_YNG <- left_join(GRD_shp, GRD_YNG_POP_EST, by = c("GID"="GRID_1K_CD"))
  
  # Ensure output directory exists
  output_dir <- paste0(dir, "/OUT/", folder_X)
  if (!dir.exists(output_dir)) {
    dir.create(output_dir, recursive = TRUE)
  }

  st_write(GRD_shp_YNG, paste0(output_dir, "/GRD_MLNN_", save_name, ".shp"), delete_layer = TRUE)

  # Write CSV
  con <- file(paste0(output_dir, "/GRD_MLNN_", save_name, ".csv"), encoding="UTF-8");
  write.csv(GRD_YNG_POP_EST, con, row.names = FALSE);
  close(con)

  # Save RData
  save(GRD_YNG_POP_EST, GRD_shp_YNG, model, history, file = paste0(output_dir, "/GRD_MLNN_", save_name, ".RData"))

  message(paste0("--- MLNN for save_name: ", save_name, " complete ---"))

  return(model)
}

# --- Example Usage (similar to your XGBoost calls) ---
# Ensure your data loading and manipulation for TRAINING_SET_X and TESTING_SET_X
# (e.g., TRAINING_data_TYPE_1, TESTING_data_TYPE_1 functions) are set up correctly before these calls.
# Also ensure GRD_YNG_POP_TG, GRD_shp, Index_grid_SGG, and dir are defined in your environment.

# Example of how you would call this function (assuming your data setup from previous code)
# load(paste0(dir, "/STEP_3_LEARING_DATA.RData")) # Load your data processing results

# # Adjust GRD_YNG_POP_TG to match expected column name "gTg"
# colnames(GRD_YNG_POP_TG) <- c("GRID", "YEAR", "gTg"); GRD_YNG_POP_TG$YEAR <- NULL

# # Define your TRAINING_SET and TESTING_SET functions
# # TRAINING_SET_1 <- TRAINING_data_TYPE_1(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
# # TESTING_SET_1 <- TESTING_data_TYPE_1(GRD_BUSNS, GRD_HSHD, GRD_RSDNC, GRD_WRKRS, GRD_POPTN, GRD_YNG_POP)
# # ... and so on for SET_2 to SET_6

# Example calls for 2025 to 2030
mlnn_model_25 <- run_mlnn_by_TYPE(TRAINING_SET_1, GRD_YNG_POP_TG, TESTING_SET_1, Index_grid_SGG, dir, "1_MLNN_shp", "25")
mlnn_model_26 <- run_mlnn_by_TYPE(TRAINING_SET_2, GRD_YNG_POP_TG, TESTING_SET_2, Index_grid_SGG, dir, "2_MLNN_shp", "26")
mlnn_model_27 <- run_mlnn_by_TYPE(TRAINING_SET_3, GRD_YNG_POP_TG, TESTING_SET_3, Index_grid_SGG, dir, "3_MLNN_shp", "27")
mlnn_model_28 <- run_mlnn_by_TYPE(TRAINING_SET_4, GRD_YNG_POP_TG, TESTING_SET_4, Index_grid_SGG, dir, "4_MLNN_shp", "28")
mlnn_model_29 <- run_mlnn_by_TYPE(TRAINING_SET_5, GRD_YNG_POP_TG, TESTING_SET_5, Index_grid_SGG, dir, "5_MLNN_shp", "29")
mlnn_model_30 <- run_mlnn_by_TYPE(TRAINING_SET_6, GRD_YNG_POP_TG, TESTING_SET_6, Index_grid_SGG, dir, "6_MLNN_shp", "30")

# --- Loop for Performance Measures (Example, similar to your XGBoost loop) ---
# Assuming you want to compare predictions for gTg_25 to gTg_30 against a single GRD_YNG_POP_TG
# If GRD_YNG_POP_TG is your 'true' gTg_23, then comparing predicted gTg_25, gTg_26 etc. to it
# directly as a 'performance measure' (RMSE/MAE) implies you are expecting the model to predict
# gTg_23 using different feature sets.
# If you are using GRD_YNG_POP_TG for each save_name call, it means each TRAINING_SET_X
# is paired with the same gTg_23 target.
# And each TESTING_SET_X is predicting a future gTg_XX using the same model, which makes
# the RMSE/MAE comparison against gTg_23 not a 'future' accuracy measure, but how well
# these different feature sets (TRAINING_SET_X) map to gTg_23.

# For a true comparison, you would need true future gTg_XX values for each TESTING_SET_X.
# However, if your setup uses GRD_YNG_POP_TG as the only available "truth" (gTg_23),
# and each TRAINING_SET_X/TESTING_SET_X pair represents different feature scenarios
# trying to predict that same gTg_23, then the RMSE/MAE against GRD_YNG_POP_TG is valid.

# Example of performance evaluation loop for MLNN (if GRD_YNG_POP_TG represents truth for comparison)
# for (save_name in 25:30){
# 	dir <- "C:/Users/johny/Dropbox/Working/Project/2025/KISDI/data/"; setwd(dir);
# 	load(paste0(dir, "/OUT/", (save_name-24), "_MLNN_shp/GRD_MLNN_", save_name, ".RData"))

# 	# Ensure the predicted column name matches the loaded GRD_YNG_POP_EST
#   # It will be "gTg_XX" (e.g., "gTg_25")
# 	predicted_col_name <- paste0("gTg_", save_name)

# 	# Calculate RMSE
# 	rmse_test <- sqrt(mean((GRD_YNG_POP_TG$gTg - GRD_YNG_POP_EST[[predicted_col_name]])^2))
# 	# Calculate MAE
# 	mae_test <- mean(abs(GRD_YNG_POP_TG$gTg - GRD_YNG_POP_EST[[predicted_col_name]]))
# 	cat(paste0("MLNN Test RMSE for gTg_", save_name, ":", rmse_test, "\n"))
# 	cat(paste0("MLNN Test MAE for gTg_", save_name, ":", mae_test, "\n"))

# }

