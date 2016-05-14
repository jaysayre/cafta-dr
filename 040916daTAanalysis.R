
library(ggplot2)
library(texreg)
library(tikzDevice)

## Directory information
setwd("~/Dropbox/College/DR_Paper/cafta-dr/Output/")
#setwd("D:/Dropbox/Dropbox (Personal)/College/DR_Paper/")
plotdir <- "../Plots/"

## INPUTS
mundf <- read.csv("municipality_level_DATASET.csv")
munisic4df <- read.csv("mun_level_isic4dig_DATASET.csv")
munoccdf <- read.csv("municipality_occupation_level_DATASET.csv")
hisklmunoccdf <- read.csv('municipality_hiskill_occupation_DATASET.csv')
losklmunoccdf <- read.csv('municipality_loskill_occupation_DATASET.csv')
munmigdf <- read.csv("municipality_migration_DATASET.csv")

## OUTPUTS 
munlevelresults <- paste(plotdir,"munregs.tex",sep="")
mun4diglevelresults <- paste(plotdir,"mun4digregs.tex",sep="")
occupationlevelresults <- paste(plotdir,"munoccregs.tex",sep="")
hiskloccupationlevelresults <- paste(plotdir,"hisklmunoccregs.tex",sep="")
loskloccupationlevelresults <- paste(plotdir,"losklmunoccregs.tex",sep="")
migresults <- paste(plotdir,"migregs.tex",sep="")


### For clustered standard errors
### http://www.r-bloggers.com/texreg-a-package-for-beautiful-and-easily-customizable-latex-regression-tables-from-r/
                    
robust.se <- function(model, cluster){
  require(sandwich)
  M <- length(unique(cluster))
  N <- length(cluster)
  K <- model$rank
  dfc <- (M/(M - 1)) * ((N - 1)/(N - K))
  uj <- apply(estfun(model), 2, function(x) tapply(x, cluster, sum));
  rcse.cov <- dfc * sandwich(model, meat = crossprod(uj)/N)
  rcse.se <- coeftest(model, rcse.cov)
  return(list(rcse.cov, rcse.se))
}
                        
coeftest <- function(x, vcov. = NULL, df = NULL, ...)
{
  UseMethod("coeftest")
}

coeftest.default <- function(x, vcov. = NULL, df = NULL, ...)
{
  ## use S4 methods if loaded
  coef0 <- if("stats4" %in% loadedNamespaces()) stats4::coef else coef
  vcov0 <- if("stats4" %in% loadedNamespaces()) stats4::vcov else vcov

  ## extract coefficients and standard errors
  est <- coef0(x)
  if(is.null(vcov.)) se <- vcov0(x) else {
      if(is.function(vcov.)) se <- vcov.(x)
        else se <- vcov.
  }
  se <- sqrt(diag(se))

  ## match using names and compute t/z statistics
  if(!is.null(names(est)) && !is.null(names(se))) {
    if(length(unique(names(est))) == length(names(est)) && length(unique(names(se))) == length(names(se))) {
      anames <- names(est)[names(est) %in% names(se)]
      est <- est[anames]
      se <- se[anames]
    }
  }  
  tval <- as.vector(est)/se

  ## apply central limit theorem
  if(is.null(df)) {
    df <- try(df.residual(x), silent = TRUE)
    if(inherits(df, "try-error")) df <- NULL
  }
  if(is.null(df)) df <- 0

  if(is.finite(df) && df > 0) {
    pval <- 2 * pt(abs(tval), df = df, lower.tail = FALSE)
    cnames <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)")
    mthd <- "t"
  } else {
    pval <- 2 * pnorm(abs(tval), lower.tail = FALSE)
    cnames <- c("Estimate", "Std. Error", "z value", "Pr(>|z|)")
    mthd <- "z"
  }
  rval <- cbind(est, se, tval, pval)
  colnames(rval) <- cnames
  class(rval) <- "coeftest"
  attr(rval, "method") <- paste(mthd, "test of coefficients")
  ##  dQuote(class(x)[1]), "object", sQuote(deparse(substitute(x))))
  return(rval)
} 

coeftest.glm <- function(x, vcov. = NULL, df = Inf, ...)
  coeftest.default(x, vcov. = vcov., df = df, ...)  

coeftest.mlm <- function(x, vcov. = NULL, df = NULL, ...)
{
  ## obtain vcov
  v <- if(is.null(vcov.)) vcov(x) else if(is.function(vcov.)) vcov.(x) else vcov.

  ## nasty hack: replace coefficients so that their names match the vcov() method
  x$coefficients <- structure(as.vector(x$coefficients), .Names = colnames(vcov(x)))

  ## call default method
  coeftest.default(x, vcov. = v, df = df, ...)
}

coeftest.survreg <- function(x, vcov. = NULL, df = Inf, ...)
{
  if(is.null(vcov.)) v <- vcov(x) else {
      if(is.function(vcov.)) v <- vcov.(x)
  	else v <- vcov.
  }
  if(length(x$coefficients) < NROW(x$var)) {
    x$coefficients <- c(x$coefficients, "Log(scale)" = log(x$scale))
  }
  coeftest.default(x, vcov. = v, df = df, ...)  
} 

coeftest.breakpointsfull <- function(x, vcov. = NULL, df = NULL, ...)
{
  est <- coef(x, ...)
  if(is.null(df)) {
    df <- df.residual(x, ...)
    df <- as.vector(rep(df, rep(NCOL(est), length(df))))
  }  

  rnames <- as.vector(t(outer(rownames(est), colnames(est), paste)))
  est <- as.vector(t(est))
  
  se <- vcov(x, vcov. = vcov., ...)

  se <- as.vector(sapply(seq(along = se), function(x) sqrt(diag(se[[x]]))))
  tval <- est/se

  if(any(is.finite(df) && df > 0)) {
    pval <- 2 * pt(abs(tval), df = df, lower.tail = FALSE)
    cnames <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)")
    mthd <- "t"
  } else {
    pval <- 2 * pnorm(abs(tval), lower.tail = FALSE)
    cnames <- c("Estimate", "Std. Error", "z value", "Pr(>|z|)")
    mthd <- "z"
  }
  rval <- cbind(est, se, tval, pval)
  colnames(rval) <- cnames
  rownames(rval) <- rnames
  class(rval) <- "coeftest"
  attr(rval, "method") <- paste(mthd, "test of coefficients")
  ##  dQuote(class(x)[1]), "object", sQuote(deparse(substitute(x))))
  return(rval)
} 

print.coeftest <- function(x, ...)
{
  mthd <- attr(x, "method")
  if(is.null(mthd)) mthd <- "Test of coefficients"
  cat(paste("\n", mthd,":\n\n", sep = ""))
  printCoefmat(x, ...)
  cat("\n")
  invisible(x)
}

### Prepare variables in municipality level dataset
mundf$chnginc1 <- log(mundf$grossalary13)-log(mundf$inc02)
mundf$chnginc2 <- mundf$frstsourcinc13-mundf$inc02
mundf$chnginc3 <- mundf$occinc13-mundf$inc02
mundf$chngedu <- mundf$edu10-mundf$edu02
mundf$prov <- factor(mundf$prov)
mundf$chngtrf <- log(mundf$duty13+1)-log(mundf$duty02+1)

### Prepare variables in municipality level (ISIC 4) dataset
munisic4df$chnginc1 <- munisic4df$occinc13-munisic4df$inc02
munisic4df$chnginc2 <- log(1+munisic4df$grossalary13)-log(1+munisic4df$inc02)
munisic4df$chnginc3 <- munisic4df$frstsourcinc13-munisic4df$inc02
munisic4df$prov <- factor(munisic4df$prov)
munisic4df$chngtrf <- munisic4df$duty13-munisic4df$duty02

### Prepare variables in municipality/occupation level dataset
munoccdf$chnginc1 <- munoccdf$frstsourcinc13-munoccdf$inc02
munoccdf$chnginc2 <- log(munoccdf$grossalary13)-log(munoccdf$inc02)
munoccdf$chnginc3 <- munoccdf$occinc13-munoccdf$inc02
munoccdf$chngtrf <- log(munoccdf$duty13+1)-log(munoccdf$duty02+1)
munoccdf$chngwrk <- munoccdf$numworkers10-munoccdf$numworkers02
munoccdf$occ <- factor(munoccdf$occ)
munoccdf$munocc <- factor(munoccdf$munocc)

## Subset down to observations without missing variables
munoccdf <- munoccdf[!is.na(munoccdf$chnginc2),]
munoccdf <- munoccdf[!is.nan(munoccdf$chnginc2),]
munoccdf <- munoccdf[!is.infinite(munoccdf$chnginc2),]
munoccdf <- munoccdf[!is.na(munoccdf$chngtrf),]
munoccdf <- munoccdf[!is.nan(munoccdf$chngtrf),]
munoccdf <- munoccdf[!is.infinite(munoccdf$chngtrf),]
munoccdf <- munoccdf[!is.na(munoccdf$munocc), ]
NROW(munoccdf)
## Make a different dataset with only occupations producing tradables
tradedsectordf <- subset(munoccdf, nontraded == 0) 
NROW(tradedsectordf)

### Prepare variables in municipality/occupation level dataset (high skill)
hisklmunoccdf$chnginc1 <- hisklmunoccdf$frstsourcinc13-hisklmunoccdf$inc02
hisklmunoccdf$chnginc2 <- log(hisklmunoccdf$grossalary13)-log(hisklmunoccdf$inc02)
hisklmunoccdf$chnginc3 <- hisklmunoccdf$occinc13-hisklmunoccdf$inc02
hisklmunoccdf$chngtrf <- log(hisklmunoccdf$duty13+1)-log(hisklmunoccdf$duty02+1)
hisklmunoccdf$chngwrk <- hisklmunoccdf$numworkers10-hisklmunoccdf$numworkers02
hisklmunoccdf$occ <- factor(hisklmunoccdf$occ)
hisklmunoccdf$munocc <- factor(hisklmunoccdf$munocc)

## Subset down to observations without missing variables
hisklmunoccdf <- hisklmunoccdf[!is.na(hisklmunoccdf$chnginc2),]
hisklmunoccdf <- hisklmunoccdf[!is.nan(hisklmunoccdf$chnginc2),]
hisklmunoccdf <- hisklmunoccdf[!is.infinite(hisklmunoccdf$chnginc2),]
hisklmunoccdf <- hisklmunoccdf[!is.na(hisklmunoccdf$chngtrf),]
hisklmunoccdf <- hisklmunoccdf[!is.nan(hisklmunoccdf$chngtrf),]
hisklmunoccdf <- hisklmunoccdf[!is.infinite(hisklmunoccdf$chngtrf),]
hisklmunoccdf <- hisklmunoccdf[!is.na(hisklmunoccdf$munocc), ]

## Make a different dataset with only occupations producing tradables
hiskltradedsectordf <- subset(hisklmunoccdf, nontraded == 0) 

### Prepare variables in municipality/occupation level dataset (low skill)
losklmunoccdf$chnginc1 <- losklmunoccdf$frstsourcinc13-losklmunoccdf$inc02
losklmunoccdf$chnginc2 <- log(losklmunoccdf$grossalary13)-log(losklmunoccdf$inc02)
losklmunoccdf$chnginc3 <- losklmunoccdf$occinc13-losklmunoccdf$inc02
losklmunoccdf$chngtrf <- log(losklmunoccdf$duty13+1)-log(losklmunoccdf$duty02+1)
losklmunoccdf$chngwrk <- losklmunoccdf$numworkers10-losklmunoccdf$numworkers02
losklmunoccdf$occ <- factor(losklmunoccdf$occ)
losklmunoccdf$munocc <- factor(losklmunoccdf$munocc)

## Subset down to observations without missing variables
losklmunoccdf <- losklmunoccdf[!is.na(losklmunoccdf$chnginc2),]
losklmunoccdf <- losklmunoccdf[!is.nan(losklmunoccdf$chnginc2),]
losklmunoccdf <- losklmunoccdf[!is.infinite(losklmunoccdf$chnginc2),]
losklmunoccdf <- losklmunoccdf[!is.na(losklmunoccdf$chngtrf),]
losklmunoccdf <- losklmunoccdf[!is.nan(losklmunoccdf$chngtrf),]
losklmunoccdf <- losklmunoccdf[!is.infinite(losklmunoccdf$chngtrf),]
losklmunoccdf <- losklmunoccdf[!is.na(losklmunoccdf$munocc), ]

## Make a different dataset with only occupations producing tradables
loskltradedsectordf <- subset(losklmunoccdf, nontraded == 0) 

### Prepare variables in migration dataset
munmigdf$chngtrf <- log(munmigdf$duty10+1)-log(munmigdf$duty02+1)
munmigdf$chngpop <- log(munmigdf$pop10)-log(munmigdf$pop02)
munmigdf$chngempop <- log(munmigdf$empop10)-log(munmigdf$empop02)
munmigdf$mun <- factor(munmigdf$mun)
munmigdf$prov <- factor(munmigdf$prov)
munmigdf$emprate02 <- munmigdf$empop02/munmigdf$workagepop02
munmigdf$emprate10 <- munmigdf$empop10/munmigdf$workagepop10
munmigdf$chngemprate <- log(munmigdf$emprate10)-log(munmigdf$emprate02)

### Municipality level regressions
colnames(mundf)
munreg1 <- lm(chnginc1~chngtrf, data = mundf)
munreg2 <- lm(chnginc1~chngtrf+prov, data = mundf)
munreg3 <- lm(chnginc1~chngtrf+edu02+edu10, data = mundf)
munreg4 <- lm(chnginc1~chngtrf+edu02+edu10+edu13+prov, data = mundf)
munreg5 <- lm(chnginc1~chngtrf+chngedu+prov, data = mundf)
munreg6 <- lm(chnginc1~chngtrf+chngedu*chngtrf+prov, data = mundf)
munreg7 <- lm(chnginc1~chngtrf+edu02+edu10+edu13+chngedu*chngtrf+prov, data = mundf)
munreg8 <- lm(chnginc1~chngtrf+edu02+chngtrf*edu10+edu13+prov, data = mundf)
robmunreg1 <- robust.se(munreg1, mundf$prov)[[2]]
robmunreg2 <- robust.se(munreg2, mundf$prov)[[2]]
robmunreg3 <- robust.se(munreg3, mundf$prov)[[2]]
robmunreg4 <- robust.se(munreg4, mundf$prov)[[2]]
robmunreg5 <- robust.se(munreg5, mundf$prov)[[2]]
robmunreg6 <- robust.se(munreg6, mundf$prov)[[2]]
robmunreg7 <- robust.se(munreg7, mundf$prov)[[2]]
robmunreg8 <- robust.se(munreg8, mundf$prov)[[2]]

#summary(munreg1)
#plot(mundf$chnginc3,mundf$chngtrf)

texreg(list(munreg1,munreg2,munreg3,munreg4,munreg5,munreg6,munreg7,munreg8),
        file=munlevelresults,
        stars = c(0.01, 0.05,0.10),
        caption="Municipality level regressions",
        caption.above = TRUE, 
        override.se=list(robmunreg1[,2],robmunreg2[,2],
                         robmunreg3[,2],robmunreg4[,2],
                         robmunreg5[,2],robmunreg6[,2],
                         robmunreg7[,2],robmunreg8[,2]),
        override.pval=list(robmunreg1[,4],robmunreg2[,4],
                           robmunreg3[,4],robmunreg4[,4],
                           robmunreg5[,4],robmunreg6[,4],
                           robmunreg7[,4],robmunreg8[,4]),
        omit.coef="prov",
        custom.model.names=c("(1)","(2)","(3)","(4)","(5)","(6)","(7)","(8)"))


### Municipality level (ISIC 4 digit) regressions
#colnames(mundf)
mun4reg1 <- lm(chnginc2~chngtrf, data = munisic4df)
mun4reg2 <- lm(chnginc2~chngtrf+prov, data = munisic4df)
mun4reg3 <- lm(chnginc3~chngtrf+prov, data = munisic4df)
robmun4reg1 <- robust.se(mun4reg1, munisic4df$prov)[[2]]
robmun4reg2 <- robust.se(mun4reg2, munisic4df$prov)[[2]]
robmun4reg3 <- robust.se(mun4reg3, munisic4df$prov)[[2]]

#summary(mun4reg1)

texreg(list(mun4reg1,mun4reg2,mun4reg3),
        file=mun4diglevelresults,
        stars = c(0.01, 0.05,0.10),
        caption="Municipality level regressions",
        caption.above = TRUE, 
        override.se=list(robmun4reg1[,2],robmun4reg2[,2],robmun4reg3[,2]),
        override.pval=list(robmun4reg1[,4],robmun4reg2[,4],robmun4reg3[,4]),
        omit.coef="prov",
        custom.model.names=c("(1)","(2)","(3)"))

### Municipality/occupation level regressions
colnames(munoccdf)

reg1 <- lm(chnginc2~chngtrf,data = tradedsectordf)
reg2 <- lm(chnginc2~chngtrf,data = munoccdf)
reg3 <- lm(chnginc2~chngtrf+munocc,data = tradedsectordf)
reg4 <- lm(chnginc2~chngtrf+munocc,data = munoccdf)
reg5 <- lm(chnginc2~chngtrf+munocc+nontraded,data = munoccdf)
reg6 <- lm(chnginc2~chngtrf+firmconc02+munocc,data = tradedsectordf)
reg7 <- lm(chnginc2~chngtrf+firmconc02*chngtrf+munocc,data = tradedsectordf)
reg8 <- lm(chnginc2~chngtrf+numworkers02*chngtrf+munocc,data = tradedsectordf)
reg9 <- lm(chnginc2~chngtrf+nontraded+numworkers10*chngtrf+munocc,data = munoccdf)
robreg1 <- robust.se(reg1, tradedsectordf$munocc)[[2]]
robreg2 <- robust.se(reg2, munoccdf$munocc)[[2]]
robreg3 <- robust.se(reg3, tradedsectordf$munocc)[[2]]
robreg4 <- robust.se(reg4, munoccdf$munocc)[[2]]
robreg5 <- robust.se(reg5, munoccdf$munocc)[[2]]
robreg6 <- robust.se(reg6, tradedsectordf$munocc)[[2]]
robreg7 <- robust.se(reg7, tradedsectordf$munocc)[[2]]
robreg8 <- robust.se(reg8, tradedsectordf$munocc)[[2]]
robreg9 <- robust.se(reg9, munoccdf$munocc)[[2]]

#summary(reg1)
#plot(munoccdf$chnginc2,munoccdf$chngtrf)

texreg(list(reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9),
        file=occupationlevelresults,
        stars = c(0.01, 0.05,0.10),
        caption="Municipality/occupation level regressions",
        caption.above = TRUE,
        override.se=list(robreg1[,2],robreg2[,2],robreg3[,2],
                        robreg4[,2],robreg5[,2],robreg6[,2],
                        robreg7[,2],robreg8[,2],robreg9[,2]),
        override.pval=list(robreg1[,4],robreg2[,4],robreg3[,4],
                          robreg4[,4],robreg5[,4],robreg6[,4],
                          robreg7[,4],robreg8[,4],robreg9[,4]),
        omit.coef="munocc|z",
        custom.model.names=c("(1)","(2)","(3)","(4)","(5)","(6)",
                             "(7)","(8)","(9)"))


summary(reg6)

### Municipality/occupation level regressions (hiskl)

reg1 <- lm(chnginc2~chngtrf,data = hisklmunoccdf)
reg2 <- lm(chnginc2~chngtrf+nontraded,data = hisklmunoccdf)
reg3 <- lm(chnginc2~chngtrf+munocc,data = hisklmunoccdf)
reg4 <- lm(chnginc2~chngtrf+munocc+edu02+nontraded,data = hisklmunoccdf)
reg5 <- lm(chnginc2~chngtrf+munocc+edu13+nontraded,data = hisklmunoccdf)
reg6 <- lm(chnginc2~chngtrf+nontraded+chngwrk+munocc,data = hisklmunoccdf)
reg7 <- lm(chnginc2~chngtrf+edu13*nontraded+munocc,data = hisklmunoccdf)
reg8 <- lm(chnginc2~chngtrf+edu02+numworkers02*chngtrf+munocc,data = hisklmunoccdf)
reg9 <- lm(chnginc2~chngtrf+nontraded+edu13+numworkers10*chngtrf+munocc,data = hisklmunoccdf)
robreg1 <- robust.se(reg1, hisklmunoccdf$munocc)[[2]]
robreg2 <- robust.se(reg2, hisklmunoccdf$munocc)[[2]]
robreg3 <- robust.se(reg3, hisklmunoccdf$munocc)[[2]]
robreg4 <- robust.se(reg4, hisklmunoccdf$munocc)[[2]]
robreg5 <- robust.se(reg5, hisklmunoccdf$munocc)[[2]]
robreg6 <- robust.se(reg6, hisklmunoccdf$munocc)[[2]]
robreg7 <- robust.se(reg7, hisklmunoccdf$munocc)[[2]]
robreg8 <- robust.se(reg8, hisklmunoccdf$munocc)[[2]]
robreg9 <- robust.se(reg9, hisklmunoccdf$munocc)[[2]]

texreg(list(reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9),
        file=hiskloccupationlevelresults,
        stars = c(0.01, 0.05,0.10),
        caption="Municipality/occupation level regressions for high skill sample",
        caption.above = TRUE,
        override.se=list(robreg1[,2],robreg2[,2],robreg3[,2],
                        robreg4[,2],robreg5[,2],robreg6[,2],
                        robreg7[,2],robreg8[,2],robreg9[,2]),
        override.pval=list(robreg1[,4],robreg2[,4],robreg3[,4],
                          robreg4[,4],robreg5[,4],robreg6[,4],
                          robreg7[,4],robreg8[,4],robreg9[,4]),
        omit.coef="munocc|z",
        custom.model.names=c("(1)","(2)","(3)","(4)","(5)","(6)",
                             "(7)","(8)","(9)"))

### Municipality/occupation level regressions (loskl)

reg1 <- lm(chnginc2~chngtrf,data = losklmunoccdf)
reg2 <- lm(chnginc2~chngtrf+nontraded,data = losklmunoccdf)
reg3 <- lm(chnginc2~chngtrf+munocc,data = losklmunoccdf)
reg4 <- lm(chnginc2~chngtrf+munocc+edu02+nontraded,data = losklmunoccdf)
reg5 <- lm(chnginc2~chngtrf+munocc+edu13+nontraded,data = losklmunoccdf)
reg6 <- lm(chnginc2~chngtrf+nontraded+chngwrk+munocc,data = losklmunoccdf)
reg7 <- lm(chnginc2~chngtrf+edu13*nontraded+munocc,data = losklmunoccdf)
reg8 <- lm(chnginc2~chngtrf+edu02+numworkers02*chngtrf+munocc,data = losklmunoccdf)
reg9 <- lm(chnginc2~chngtrf+nontraded+edu13+numworkers10*chngtrf+munocc,data = losklmunoccdf)
robreg1 <- robust.se(reg1, losklmunoccdf$munocc)[[2]]
robreg2 <- robust.se(reg2, losklmunoccdf$munocc)[[2]]
robreg3 <- robust.se(reg3, losklmunoccdf$munocc)[[2]]
robreg4 <- robust.se(reg4, losklmunoccdf$munocc)[[2]]
robreg5 <- robust.se(reg5, losklmunoccdf$munocc)[[2]]
robreg6 <- robust.se(reg6, losklmunoccdf$munocc)[[2]]
robreg7 <- robust.se(reg7, losklmunoccdf$munocc)[[2]]
robreg8 <- robust.se(reg8, losklmunoccdf$munocc)[[2]]
robreg9 <- robust.se(reg9, losklmunoccdf$munocc)[[2]]

texreg(list(reg1,reg2,reg3,reg4,reg5,reg6,reg7,reg8,reg9),
        file=loskloccupationlevelresults,
        stars = c(0.01, 0.05,0.10),
        caption="Municipality/occupation level regressions for low skill sample",
        caption.above = TRUE,
        override.se=list(robreg1[,2],robreg2[,2],robreg3[,2],
                        robreg4[,2],robreg5[,2],robreg6[,2],
                        robreg7[,2],robreg8[,2],robreg9[,2]),
        override.pval=list(robreg1[,4],robreg2[,4],robreg3[,4],
                          robreg4[,4],robreg5[,4],robreg6[,4],
                          robreg7[,4],robreg8[,4],robreg9[,4]),
        omit.coef="munocc|z",
        custom.model.names=c("(1)","(2)","(3)","(4)","(5)","(6)",
                             "(7)","(8)","(9)"))

### Municipality migration regressions
colnames(munmigdf)

reg1 <- lm(chngpop~chngtrf,data = munmigdf)
reg2 <- lm(chngpop~chngtrf+prov,data = munmigdf)
reg3 <- lm(chngempop~chngtrf,data = munmigdf)
reg4 <- lm(chngempop~chngtrf+prov,data = munmigdf)
reg5 <- lm(chngemprate~chngtrf,data = munmigdf)
reg6 <- lm(chngemprate~chngtrf+prov,data = munmigdf)
robreg1 <- robust.se(reg1, munmigdf$prov)[[2]]
robreg2 <- robust.se(reg2, munmigdf$prov)[[2]]
robreg3 <- robust.se(reg3, munmigdf$prov)[[2]]
robreg4 <- robust.se(reg4, munmigdf$prov)[[2]]
robreg5 <- robust.se(reg5, munmigdf$prov)[[2]]
robreg6 <- robust.se(reg6, munmigdf$prov)[[2]]

texreg(list(reg1,reg2,reg3,reg4,reg5,reg6),
        file=migresults,
        stars = c(0.01, 0.05,0.10),
        caption="Municipality level migration/workforce regressions",
        caption.above = TRUE,
        override.se=list(robreg1[,2],robreg2[,2],robreg3[,2],
                        robreg4[,2],robreg5[,2],robreg6[,2]),
        override.pval=list(robreg1[,4],robreg2[,4],robreg3[,4],
                        robreg4[,4],robreg5[,4],robreg6[,4]),
        omit.coef="prov|z",
        custom.model.names=c("Log Change in","Population",
                             "Log Change in","Employed Workers",
                             "Log Change in","Employment Rate"))
