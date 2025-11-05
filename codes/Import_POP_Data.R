dir <- "Z:/Working/2025/KISDI/data/POP_MOVES/"
setwd(dir)
install.packages("dplyr")
library(dplyr)

mdis <- read.table(paste0(dir, "2023_인구관련연간자료_20250531_09339.csv"), header=FALSE, sep=",", colClasses = c("character"
, "character", "character", "character", "character", "character", "character", "character", "character", "character", "character", "numeric", "character", "character", "numeric", "character", "character", "numeric", "character", "character", "numeric"
, "character", "character", "numeric", "character", "character", "numeric", "character", "character", "numeric", "character", "character", "numeric", "character", "character", "numeric", "character", "character", "numeric", "character", "character"
), na.string=c("*","**","***","****","*****","******","*******","********","*********","**********","."))

gc()

mdis_2001 <- mdis
mdis_2002 <- mdis
mdis_2003 <- mdis
mdis_2004 <- mdis
mdis_2005 <- mdis
mdis_2006 <- mdis
mdis_2007 <- mdis
mdis_2008 <- mdis
mdis_2009 <- mdis
mdis_2010 <- mdis
mdis_2011 <- mdis
mdis_2012 <- mdis
mdis_2013 <- mdis
mdis_2014 <- mdis
mdis_2015 <- mdis
mdis_2016 <- mdis
mdis_2017 <- mdis
mdis_2018 <- mdis
mdis_2019 <- mdis
mdis_2020 <- mdis
mdis_2021 <- mdis
mdis_2022 <- mdis
mdis_2023 <- mdis
mdis_2024 <- mdis

save(mdis_2001, mdis_2002, mdis_2003, mdis_2004, mdis_2005, mdis_2006, mdis_2007, mdis_2008, mdis_2009, 
     mdis_2010, mdis_2011, mdis_2012, mdis_2013, mdis_2014, mdis_2015, mdis_2016, mdis_2017, mdis_2018, 
     mdis_2019, mdis_2020,mdis_2021, mdis_2022, mdis_2023, mdis_2024, file = paste0(dir, "/POP_Move_raw_DATA_2001_24.RData"))

rm(mdis)









STAT_CNT <- function(mdis_data){
  # Entire Country
  
  Entire_CNT  <- nrow(mdis_data) + nrow(subset(mdis_data, !is.na(mdis_data$전입자2_만연령))) + 
    nrow(subset(mdis_data, !is.na(mdis_data$전입자3_만연령))) + nrow(subset(mdis_data, !is.na(mdis_data$전입자4_만연령))) + 
    nrow(subset(mdis_data, !is.na(mdis_data$전입자5_만연령))) + nrow(subset(mdis_data, !is.na(mdis_data$전입자6_만연령))) + 
    nrow(subset(mdis_data, !is.na(mdis_data$전입자7_만연령))) + nrow(subset(mdis_data, !is.na(mdis_data$전입자8_만연령))) + 
    nrow(subset(mdis_data, !is.na(mdis_data$전입자9_만연령))) + nrow(subset(mdis_data, !is.na(mdis_data$전입자10_만연령)))

  
  #SIDO <- c("서울특별시", "부산광역시", "대구광역시", "인천광역시", "광주광역시", "대전광역시", "울산광역시", "세종특별자치시",
  #      "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주특별자치도")
  
  SIDO = unique(mdis_data$전입행정구역_시도코드)
  
  for (loop_sido in SIDO){
    Sub_CNT <- subset(mdis_data, mdis_data$전입행정구역_시도코드==loop_sido)
    
    tmp <- nrow(Sub_CNT) + nrow(subset(Sub_CNT, !is.na(Sub_CNT$전입자2_만연령))) + 
        nrow(subset(Sub_CNT, !is.na(Sub_CNT$전입자3_만연령))) + nrow(subset(Sub_CNT, !is.na(Sub_CNT$전입자4_만연령))) + 
        nrow(subset(Sub_CNT, !is.na(Sub_CNT$전입자5_만연령))) + nrow(subset(Sub_CNT, !is.na(Sub_CNT$전입자6_만연령))) + 
        nrow(subset(Sub_CNT, !is.na(Sub_CNT$전입자7_만연령))) + nrow(subset(Sub_CNT, !is.na(Sub_CNT$전입자8_만연령))) + 
        nrow(subset(Sub_CNT, !is.na(Sub_CNT$전입자9_만연령))) + nrow(subset(Sub_CNT, !is.na(Sub_CNT$전입자10_만연령)))
    
    if(loop_sido == "서울특별시"){CNT_A <- tmp}
    if(loop_sido == "부산광역시"){CNT_B <- tmp}
    if(loop_sido == "대구광역시"){CNT_C <- tmp}
    if(loop_sido == "인천광역시"){CNT_D <- tmp}
    if(loop_sido == "광주광역시"){CNT_E <- tmp}
    if(loop_sido == "대전광역시"){CNT_F <- tmp}
    if(loop_sido == "울산광역시"){CNT_G <- tmp}
    if(loop_sido == "세종특별자치시"){CNT_H <- tmp}
    if(loop_sido == "경기도"){CNT_I <- tmp}
    if(loop_sido == "강원도"){CNT_J <- tmp}
    if(loop_sido == "충청북도"){CNT_K <- tmp}
    if(loop_sido == "충청남도"){CNT_L <- tmp}
    if(loop_sido == "전라북도"){CNT_M <- tmp}
    if(loop_sido == "전라남도"){CNT_N <- tmp}
    if(loop_sido == "경상북도"){CNT_O <- tmp}
    if(loop_sido == "경상남도"){CNT_P <- tmp}
    if(loop_sido == "제주특별자치도"){CNT_Q <- tmp}
    print(tmp)
  }
  
  STAT_CNT = data.frame(
    전출지별 = c("전국", SIDO), 
#    전입지별 = c(Entire_CNT, 서울특별시, 부산광역시, 대구광역시, 인천광역시, 광주광역시, 대전광역시, 울산광역시, 
#            세종특별자치시, 경기도, 강원도, 충청북도, 충청남도, 전라북도, 전라남도, 경상북도, 경상남도, 제주특별자치도)
    전입지별 = c(Entire_CNT, CNT_A, CNT_B, CNT_C, CNT_D, CNT_E, CNT_F, CNT_G, CNT_H, 
             CNT_I, CNT_J, CNT_K, CNT_L, CNT_M, CNT_N, CNT_O, CNT_P, CNT_Q))
  rm(Entire_CNT, SIDO, loop_sido, Sub_CNT, tmp, CNT_A, CNT_B, CNT_C, CNT_D, 
     CNT_E, CNT_F, CNT_G, CNT_H, CNT_I, CNT_J, CNT_K, CNT_L, CNT_M, CNT_N, CNT_O, CNT_P, CNT_Q)
  return(STAT_CNT)
}
  
  
  
