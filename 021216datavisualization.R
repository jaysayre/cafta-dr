
library(ggplot2)
library(texreg)
library(tikzDevice)

setwd("~/Dropbox/College/DR_Paper/cafta-dr/Output/")
#setwd("D:/Dropbox/Dropbox (Personal)/College/DR_Paper/")
plotdir <- "../Plots/"

## INPUTS
munoccdf <- read.csv("municipality_occupation_level_DATASET.csv")
isic2tariff <- read.csv(paste(plotdir,"tariffisic2.csv",sep=""))
isic4tariff <- read.csv(paste(plotdir,"tariffisic4.csv",sep=""))
hs6tariff <- read.csv("wtoandcaftahstariff.csv")
hs2tariff <- read.csv("tariffhs2.csv")

## OUTPUTS 
hs2timetikz <- paste(plotdir,"hstwodigittrfsTIKZ.tex",sep="")
isic2tariffchangetikz <- paste(plotdir,"tariffisic2digTIKZ.tex",sep="")
isic4tariffchangetikz <- paste(plotdir,"tariffisic4digTIKZ.tex",sep="")
hs6tariffchangetikz <- paste(plotdir, "tariffhs6decreaseTIKZ.tex",sep="")
hs2tariffchangetikz <- paste(plotdir, "tariffhs2decreaseTIKZ.tex",sep="")

### Clean up input data

## CLean up HS6 level tariff data set
hs6tariff$chngtrf <- hs6tariff$duty2013-hs6tariff$X2002AvgRate
hs6tariff$HS6 <- factor(hs6tariff$HS6)

## Cleanup variables in municipality/occupation level dataset
munoccdf$chnginc2 <- munoccdf$grossalary13-munoccdf$inc02
munoccdf$chngtrf <- munoccdf$duty13-munoccdf$duty02
munoccdf$chngwrk <- munoccdf$numworkers10-munoccdf$numworkers02
munoccdf$occ <- factor(munoccdf$occ)

## Cleanup variables in ISIC 4 digit tariff data set
isic4tariff$ISIC <- factor(isic4tariff$ISIC)
isic4tariff$chngtrf <- isic4tariff$duty2013-isic4tariff$X2002AvgRate

## Cleanup variables in ISIC 2 digit tariff data set
isic2tariff$isic <- factor(isic2tariff$isic)
isic2tariff$chngtrf <- isic2tariff$duty2013-isic2tariff$X2002AvgRate

## Plot ISIC 4 digit tariff level in 2002 compared to tariff change
bf <- lm(isic4tariff$chngtrf~isic4tariff$X2002AvgRate)
rsq <- summary(bf)$r.squared
rsq <- signif(rsq,4)
beta1 <- coef(summary(bf))[2,"Estimate"]
beta1 <- signif(beta1,4)
se1 <- coef(summary(bf))[2,"Std. Error"]
se1 <- signif(se1,4)
numobs <- summary(bf)$df[2]
line <- paste("Coefficient Estimate: ", beta1,
              ", se: ",se1, 
              ", R^2: ",rsq,", N: ",numobs,sep="")

p1 <- ggplot(isic4tariff, aes(x=X2002AvgRate, y=chngtrf)) +
  coord_equal() + geom_jitter(aes(colour=ISIC),size=.75) + #geom_point(shape=1) +
  #geom_text(aes(label=occ)) + # Could do this perhaps
  ggtitle("Tariff Changes 2002-2013 based on Pre-CAFTA Tariff Levels
  \n(ISIC 4 digit Import Competing Occupation)") + geom_smooth(method=lm)+ 
  xlab("2002 pre-CAFTA duty") + ylab("Decrease in duty rate") +
  theme_classic() + theme(legend.position = "none")
tikz(file=isic4tariffchangetikz,standAlone=TRUE,sanitize=TRUE)
plot.new()
print(p1)
mtext(line,line=-38)
dev.off()

## Plot ISIC 2 digit tariff level in 2002 compared to tariff change
bf <- lm(isic2tariff$chngtrf~isic2tariff$X2002AvgRate)
rsq <- summary(bf)$r.squared
rsq <- signif(rsq,4)
beta1 <- coef(summary(bf))[2,"Estimate"]
beta1 <- signif(beta1,4)
se1 <- coef(summary(bf))[2,"Std. Error"]
se1 <- signif(se1,4)
numobs <- summary(bf)$df[2]
line <- paste("Coefficient Estimate: ", beta1,
              ", se: ",se1, 
              ", R^2: ",rsq,", N: ",numobs,sep="")

p6 <- ggplot(isic2tariff, aes(x=X2002AvgRate, y=chngtrf)) +
  coord_equal() + geom_jitter(aes(colour=isic),size=.75) + #geom_point(shape=1) +
  #geom_text(aes(label=occ)) + # Could do this perhaps
  ggtitle("Tariff Changes 2002-2013 based on Pre-CAFTA Tariff Levels
  \n(ISIC 2 digit Import Competing Occupation)") + geom_smooth(method=lm)+ 
  xlab("2002 pre-CAFTA duty") + ylab("Decrease in duty rate") +
  theme_classic()
tikz(file=isic2tariffchangetikz,standAlone=TRUE,sanitize=TRUE)
plot.new()
print(p6)
mtext(line,line=-37)
dev.off()

## Do same as above but at HS6 level
bf <- lm(hs6tariff$chngtrf~hs6tariff$X2002AvgRate)
rsq <- summary(bf)$r.squared
rsq <- signif(rsq,4)
beta1 <- coef(summary(bf))[2,"Estimate"]
beta1 <- signif(beta1,4)
se1 <- coef(summary(bf))[2,"Std. Error"]
se1 <- signif(se1,4)
numobs <- summary(bf)$df[2]
line <- paste("Coefficient Estimate: ", beta1,
              ", se: ",se1,", R^2: ",rsq,", N=",numobs,sep="")

p2 <- ggplot(hs6tariff, aes(x=X2002AvgRate, y=chngtrf))+
  coord_equal() + geom_jitter(aes(colour=HS6),size=.75) + #geom_point(shape=1) +
  ggtitle("Tariff Changes 2002-2013 based on Pre-CAFTA Tariff Levels\n(HS6 Code)") +
  geom_smooth(method=lm)+
  xlab("2002 pre-CAFTA duty") + ylab("Decrease in duty rate") +
  theme_classic()+ theme(legend.position = "none")
tikz(file=hs6tariffchangetikz,standAlone=TRUE,sanitize=TRUE) 
plot.new()
print(p2)
mtext(line,line=-36)
dev.off()
## Do same as above but at HS2 level
hs2tariff$HS2 <- factor(hs2tariff$HS2)
bf <- lm(hs2tariff$chngtrf~hs2tariff$X2002AvgRate)
rsq <- summary(bf)$r.squared
rsq <- signif(rsq,4)
beta1 <- coef(summary(bf))[2,"Estimate"]
beta1 <- signif(beta1,4)
se1 <- coef(summary(bf))[2,"Std. Error"]
se1 <- signif(se1,4)
numobs <- summary(bf)$df[2]
line <- paste("Coefficient Estimate: ", beta1,
              ", se: ",se1,", R^2: ",rsq,", N=",numobs,sep="")

p3 <- ggplot(hs2tariff, aes(x=X2002AvgRate, y=chngtrf))+
  coord_equal() + geom_point(shape=1) +
  ggtitle("Tariff Changes 2002-2013 based on Pre-CAFTA Tariff Levels\n(HS2 Code)") +
  geom_smooth(method=lm)+
  xlab("2002 pre-CAFTA duty") + ylab("Decrease in duty rate") +
  theme_classic()
tikz(file=hs2tariffchangetikz,standAlone=TRUE,sanitize=TRUE) 
plot.new()
print(p3)
mtext(line,line=-36)
dev.off()
## Plot HS2 average tariffs from 1996-2006
hs2tariff$HS2 <- factor(hs2tariff$HS2)

p4 <- ggplot(data=hs2tariff, aes(x=year, y=duty, group=HS2)) +
    geom_line(aes(colour=HS2)) +
    geom_point(aes(colour=HS2)) +
    xlab("Year") + ylab("Tariff Rate") +
    theme_classic() + ylim(0,20) +
    theme(legend.position = "none") +
    ggtitle("Tariff Changes pre-CAFTA (HS 2 digit level)")
tikz(file=hs2timetikz,standAlone=TRUE,sanitize=TRUE) 
print(p4)
dev.off()
