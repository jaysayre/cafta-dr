library(foreign)
#library(readstata13)
#library(plyr)

setwd("~/Dropbox/College/DR_Paper/")

drhh13 <- read.dta("DHS/2013Standard/household/DRHR61FL.DTA")
dr13labels <- attr(drhh13,"var.labels")
dr13key <- data.frame(var.name=names(drhh13),dr13labels)
write.csv(file="DHS/2013Standard/householdkey.csv",dr13key)

drhh07 <- read.dta("DHS/2007Standard/household/DRHR52FL.DTA")
dr07labels <- attr(drhh07,"var.labels")
dr07key <- data.frame(var.name=names(drhh07),dr07labels)
write.csv(file="DHS/2007Standard/householdkey.csv",dr07key)

drhh02 <- read.dta("DHS/2002/household/DRHR4AFL.DTA")
dr02labels <- attr(drhh02,"var.labels")
dr02key <- data.frame(var.name=names(drhh02),dr02labels)
write.csv(file="DHS/2002/householdkey.csv",dr02key)

drhm13 <- read.dta("DHS/2013Standard/hhmember/DRPR61FL.DTA")
drhm13labels <- attr(drhm13,"var.labels")
drhm13key <- data.frame(var.name=names(drhm13),drhm13labels)
write.csv(file="DHS/2013Standard/hhmemberkey.csv",drhm13key)

drhm07 <- read.dta("DHS/2007Standard/hhmember/DRPR52FL.DTA")
drhm07labels <- attr(drhm07,"var.labels")
drhm07key <- data.frame(var.name=names(drhm07),drhm07labels)
write.csv(file="DHS/2007Standard/hhmemberkey.csv",drhm07key)

drhm02 <- read.dta("DHS/2002/hhmember/DRPR4AFL.DTA")
drhm02labels <- attr(drhm02,"var.labels")
drhm02key <- data.frame(var.name=names(drhm02),drhm02labels)
write.csv(file="DHS/2002/hhmemberkey.csv",drhm02key)
