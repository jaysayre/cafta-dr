### makedominicanrepublicmap.R
### Jay Sayre - sayrejay (at) gmai|

library(sp)
#library(maps)
#library(maptools)
#library(ggmap)
library(ggplot2)
library(rgdal)
library(plyr)
library(tikzDevice)

## INPUTS
setwd("D:/Dropbox/Dropbox (Personal)/College/DR_Paper/")
basedf <- read.csv("cafta-dr/Output/municipality_level_DATASET.csv")
gisdir <- "GIS/ShapeFilesCenso2010"
shpfl <- "MUNCenso2010"

## OUTPUT DIR FOR PLOTS
outputdir <- "cafta-dr/Maps/"


## Clean up municipality level dataset
basedf$prov <- NULL
basedf$mun <- as.factor(basedf$mun)
basedf$tariffchng <- basedf$duty13-basedf$duty02
basedf$incchng <- basedf$firstsourceofincome13-basedf$inc02

## Read in map
drmunshp <- readOGR(gisdir, layer=shpfl)
drmunshp@data$id <- rownames(drmunshp@data) ## Save row names for later
## Clean up variables
drmunshp$CODIGO <- paste(drmunshp$PROV,drmunshp$MUN,sep="")
drmunshp$CODIGO <- as.factor(as.numeric(drmunshp$CODIGO))
drmunshp$PROV <- NULL
drmunshp$MUN <- NULL
drmunshp$REG <- NULL
drmunshp$TOPONIMIA <- NULL
## Merge with input data
drmunshp <- merge(drmunshp, basedf, by.x="CODIGO", by.y="mun", all.x=TRUE)
drmunshp.df <- fortify(drmunshp)
drmunshp.df <- join(drmunshp.df, drmunshp@data, by="id")

## Plot numerical variables
#colnames(drmunshp.df)[c(10:18)]
numvars <- c(10:18)
lapply(numvars , function(i) {
  varname <- colnames(drmunshp.df)[i]
  mapdata <-  drmunshp.df[, c("long","lat",varname,"group","CODIGO")]
  colnames(mapdata)[3] <- "var"

  provmap <- ggplot() +
    geom_polygon(data=mapdata, aes(x=long, y=lat, group=group, fill=var), alpha=1) +
    ggtitle(paste("Map of:",varname, sep=" ")) +
    scale_fill_continuous(name=varname)

  #flname = paste(outputdir,"dr",varname,".tex",sep="")
  #tikz(file=flname,standAlone=TRUE,sanitize=TRUE)
  #plot.new()
  #print(provmap)
  #dev.off()
  ggsave(filename=paste("dr",varname,".pdf",sep=""), plot=provmap, path = outputdir, width=8, height=8)
})

