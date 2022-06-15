# Khai bao thu vien
install.packages("ggplot2", lib="C:\\Users\\acer\\Downloads\\R\\win-library\\3.3")
update.packages("ggplot2")
install.packages("plotly")
library(tidyverse)
library(plotly)
library(dplyr)
library(ggplot2)

# Doc du lieu
setwd("C:\\Users\\acer\\Nhahang\\Thong_tin_nha_hang\\R_unit_value")
dt <- read.csv("Res_infomation_50.csv",encoding = "UTF-8" , header = T, stringsAsFactors = F) 
dt


#Tong quan ve du lieu
summary(dt)

# Tao cac list chua tong cua tung du lieu trong tap du lieu
sum_dt <- c(sum(dt$R_evaluate),
            sum(dt$R_rank_province),
            sum(dt$R_km),
            sum(dt$R_picture),
            sum(dt$R_ratings))

sum_dt_names <- c("R_evaluate",
                  "R_rank_province",
                  "R_km",
                  "R_picture",
                  "R_ratings")

#Tao data frame tu 2 list tren
dt_1 <- data.frame(sum_dt, sum_dt_names)

# BD1: Bieu do cot
ggplot(dt_1, aes(x = sum_dt_names, y = sum_dt, fill = sum_dt_names)) +
  geom_col(position = "stack") +
  geom_text(aes(label=sum_dt), vjust=0) +
  scale_y_log10() +
  labs(title="TONG GIA TRI CUA DU LIEU DINH LUONG",
       x = "Columns",
       y = "Count")
# BD2: Bieu do cot
ggplot(dt, aes(x=R_evaluate, y=R_name))  + 
  geom_col(aes(fill =R_evaluate)) + 
  xlab("s??? phi???u dánh giá nhà hàng")+
  ylab("nhà bán hàng")+
  labs(title="DO THI THE HIEN TONG SO PHIEU DANH GIA CUA NHA HANG  ")
theme(axis.text.x = element_text(size = 8, angle = 90))
      
# BD3: Bieu do diem  
ggplot(dt, aes(y= R_name,x= R_picture ))+
  geom_point(aes(color = R_picture, ))+
  ylab(" nhà bán hàng")+
  xlab("s??? lu???ng hình ???nh")+
  labs(title="BIEU DO THE HIEN SO LUONG HINH ANH DOI VOI NHA HANG ")
  
# BD4: Bieu do cot
ggplot(dt, aes(y = R_name , x=R_ratings, fill = R_name  )) +
  geom_col() + 
  labs(title = "BIEU DO THE HIEN XEP HANG CUA NHA BAN HANG ")


