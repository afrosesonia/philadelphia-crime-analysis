install.packages(c("tidyverse", "lubridate", "ggplot2"))

library(tidyverse)
library(lubridate)
library(ggplot2)

setwd("C:/Users/Sonia Afrose/Documents/RProject/PhiladelphiaProjectbyR/KaggleData/crime.csv")

#DataDescription
alldata <- read.csv("crime.csv", sep = ",", header = TRUE)
alldata
summary(alldata)
str(alldata)
colnames(alldata)

#################################################################################
##Convert Date and Filter Year 2006 to 2016
crime_clean <- alldata %>%
  mutate(
    Dispatch_Date_Time = ymd_hms(Dispatch_Date_Time),
    Year = year(Dispatch_Date_Time),
    Month = month(Dispatch_Date_Time, label = TRUE)
  ) %>%
  filter(Year >= 2006 & Year <= 2016)