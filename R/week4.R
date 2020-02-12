# R Studio API Code
setwd("/Users/zhan5449/Google Drive/Data Science/Week 4/Week-4-Project")


# Data Import
library(tidyverse)
week4_df <- read_delim("Data/week4.dat",delim=c("-"),col_names=c("casenum","parnum","stimver","datadate","qs"))
glimpse(week4_df)
week4_df <- separate(week4_df,qs,c(paste0("q",1:5)),sep=" - ")
week4_df[,c(paste0("q",1:5))] <- sapply(week4_df[,c(paste0("q",1:5))],as.numeric)
week4_df[,c(paste0("q",1:5))][week4_df[,c(paste0("q",1:5))]==0] <- NA




library(lubridate)
week4_df$datadate <- mdy_hms(week4_df$datadate)

# Data Analysis
q2_over_time_df <- spread(week4_df[,c("parnum","stimver","q2")],key=stimver,value=q2)
sum(!complete.cases(q2_over_time_df))/nrow(q2_over_time_df)
