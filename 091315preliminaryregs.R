library(ggplot2)

#setwd("~/Dropbox/College/DR_Paper/")
setwd("D:/Dropbox/Dropbox (Personal)/College/DR_Paper/Old")

mundf <- read.csv("municitarincocc.csv")
provdf <- read.csv("provtarincocc.csv")

mundf$chnginc <- mundf$INC13-mundf$INC07
mundf$d2013 <- mundf$wmtrduty2013
mundf$d2007 <- mundf$wmtrduty2007  
mundf$Base <- mundf$wmtrBase
mundf$chngtrf <- mundf$d2007-mundf$d2013

provdf$chnginc <- provdf$INC13-provdf$INC07
provdf$d2013 <- provdf$wptrduty2013
provdf$d2007 <- provdf$wptrduty2007
provdf$d2006 <- provdf$wptr2006AvgRate
provdf$Base <- provdf$wptrBase
provdf$chngtrf <- provdf$d2007-provdf$d2013

reg1 <- lm(provdf$chnginc~log(provdf$chngtrf))
summary(reg1)
plot(provdf$chnginc,log(provdf$chngtrf))

reg2 <- lm(mundf$chnginc~log(mundf$chngtrf+1))
summary(reg2)
plot(mundf$chnginc,log(mundf$chngtrf+1))

