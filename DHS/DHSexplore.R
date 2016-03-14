library(ggplot2)
library(plyr)

setwd("~/Dropbox/College/DR_Paper/")
drhm13 <- read.dta("DHS/2013Standard/hhmember/DRPR61FL.DTA")
#drhm13geo <- read.csv("DHS/2013Standard/geo/DRGE61FL.csv")
drhm07 <- read.dta("DHS/2007Standard/hhmember/DRPR52FL.DTA")
#drhm07geo <- read.csv("DHS/2007Standard/geo/DRGE52FL.csv")
# Geomerging
#drhm07 <- merge(drhm07, drhm07geo, by.x="hv001", by.y="DHSCLUST", all.x=TRUE)
#drhm13 <- merge(drhm13, drhm13geo, by.x="hv001", by.y="DHSCLUST", all.x=TRUE)
write.csv(drhm07, "DHS/2007Standard/hhmember/DRPR52FL.csv")
write.csv(drhm13, "DHS/2013Standard/hhmember/DRPR61FL.csv")

#drhm02 <- read.dta("DHS/2002/hhmember/DRPR4AFL.DTA")
#write.csv(drhm02, "DHS/2002/hhmember/DRPR4AFL.csv")

incocc <- drhm13$singresoo # Income from occupation
occ <- drhm13$sg111 # Occupation categories
specocc <- drhm13$sg110 # Detailed occupation categories
gsalary <- drhm13$sg112a # What is your gross salary?
hhhead <- ifelse(drhm13$hv218 == drhm13$hvidx, 1, 0)

incocc <- drhm07$ingoo # Income from occupation
inkindocc <- drhm07$ingoe # Occupation income in-kind
occ <- drhm07$gs16 # Occupation categories
specocc <- drhm07$gs14 # Detailed occupation categories
comprod <- drhm07$gs18 # Type of business
numworkers <-drhm07$gs17 # Number of workers
daysworked <- drhm07$gs19 # Days worked
gsalary <- drhm07$gs21a # What is your gross salary?
hhhead <- ifelse(drhm07$hv218 == drhm07$hvidx, 1, 0)

inc <- drhm02$sg12a # Income NULL
occ <-drhm02$sg11 # Occupation categories
specocc <-  drhm02$sg08 # NULL
comprod <- drhm02$sg09 # Type of business
numworkers <-drhm02$gs17 # Number of workers
daysworked <- drhm02$sg13 # Days worked
hoursworked <- drhm02$sg10a # Hours worked
hhhead <- ifelse(drhm02$hv218 == drhm02$hvidx, 1, 0)
