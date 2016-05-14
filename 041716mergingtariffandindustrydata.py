
# coding: utf-8

# ## mergingtariffandindustrydata.py
# 
# ### Jay Sayre - sayrejay (at) Gmai|,
# 
# ### Purpose: 
# Converts tariff data (processed by wtoandcaftatariffcleaning.py)
# to ISIC two digit averages
# 
# Also combines tariff data (processed by wtoandcaftatariffcleaning.py) and estimated shares of industrial activity in a given municipality (processed by compute_regional_employment.py)
# 
# ## INPUTS -
# 
# 'Tariff Conversion/HS1996toISIC3/HS1996toISIC3.csv' - Not sure
# who made this, source seems to be 
# http://wits.worldbank.org/product_concordance.html
# 
# firmconcentration2002.csv - Estimates occupation concentration within a municipality at the ISIC 2-digit level for 2002 (using D.R. empresa and IPUMS data) processed by compute_regional_employment.py
# 
# firmconcentration2010.csv - Estimates occupation concentration within a municipality at the ISIC 2-digit level for 2010 processed by compute_regional_employment.py
# 
# industryactivityisic4dig2010.csv - Produces estimated number of workers in each ISIC 4 digit code using solely D.R. empresa data, updated on 2/13/16, processed by compute_regional_employment.py
# 
# "cafta-dr/Output/wtoandcaftahstariff.csv" - Harmonized system 6-digit level tariff data from 1996-2015 from both WTO data and CAFTA treaty text processed by wtoandcaftatariffcleaning.py
# 
# ## INTERMEDIATE DATA -
# 
# tariffisic2dig = base_dir+'cafta-dr/Plots/tariffisic2.csv'
# 
# tariffisic4dig = base_dir+'cafta-dr/Plots/tariffisic4.csv' - Both of these are used for plots, and processed by the script datavisualization.R
# 
# ## OUTPUTS - 
# 
# "cafta-dr/Output/ISICtwodigitleveltariffs.csv" - tariff averages at the ISIC 2-digit level for 2002 and 2013
# 
# "cafta-dr/Output/municipalityaverageisic4dig.csv" - municipality level tariff averages using ISIC 4 digit codes for the D.R. in 2013, using empresas data produced by the script compute_regional_employment.py, updated on 2/13/16
#     
# "cafta-dr/Output/municipalityaveragetariff2002.csv" - municipality level tariff averages (for import competing industries, where import competing is considered harmonized system goods that correspond to ISIC
# codes based upon conversion table) for the D.R. in 2002, using estimated industrial activity in a municipality for 2002 produced by the script compute_regional_employment.py
# 
# "cafta-dr/Output/municipalityaveragetariff2010.csv" - municipality level tariff averages (for import competing industries, where import competing is considered harmonized system goods that correspond to ISIC
# codes based upon conversion table) for the D.R. in 2010, using estimated industrial activity in a municipality for 2010 produced by the script compute_regional_employment.py
# 
# "cafta-dr/Output/municipalityaveragetariff2013.csv" - municipality level tariff averages (for import competing industries, where import competing is considered harmonized system goods that correspond to ISIC
# codes based upon conversion table) for the D.R. in 2013, using estimated industrial activity in a municipality for 2010 produced by the script compute_regional_employment.py

# In[1]:

import pandas as pd
import os

if os.name == 'nt':
    base_dir = "D:/Dropbox/Dropbox (Personal)/College/DR_Paper/"
else:
    base_dir = "/home/j/Dropbox/College/DR_Paper/"

## INPUTS
hs96isic3 = base_dir + 'cafta-dr/Tariff_Conversion/HS1996toISIC3/HS1996toISIC3.csv'
wtoandcaftadata = base_dir +"cafta-dr/Output/wtoandcaftahstariff.csv"
industry2002 = base_dir+'cafta-dr/Output/firmconcentration2002.csv'
industry2010 = base_dir+'cafta-dr/Output/firmconcentration2010.csv'
industryisic4digit2010 = base_dir+'cafta-dr/Output/industryactivityisic4dig2010.csv'

## INTERMEDIATE DATA

tariffisic2dig = base_dir+'cafta-dr/Plots/tariffisic2.csv'
tariffisic4dig = base_dir+'cafta-dr/Plots/tariffisic4.csv'

## OUTPUTS
isictariffavg = base_dir+"cafta-dr/Output/ISICtwodigitleveltariffs.csv"
isic4digtariffavg = base_dir+"cafta-dr/Output/municipalityaverageisic4dig.csv"
munavgtariff2002 = base_dir+"cafta-dr/Output/municipalityaveragetariff2002.csv"
munavgtariff2010 = base_dir+"cafta-dr/Output/municipalityaveragetariff2010.csv"
munavgtariff2013 = base_dir+"cafta-dr/Output/municipalityaveragetariff2013.csv"


# In[2]:

### Convert wtoandcaftadata from Harmonized System 1996 to ISIC four digit codes

## Build table to convert HS1996 to ISIC3 data
isic3 = pd.read_csv(hs96isic3, 
                    converters={'HS 1996 Product Code': lambda x: str(x),
                                'ISIC Revision 3 Product Code': lambda x: str(x)})
isic3.columns=['HS96', 'HSdesc', 'ISIC3', 'ISICdesc']
isic3 = isic3[['HS96', 'ISIC3']]

isic3conv = dict(zip(isic3['HS96'],isic3['ISIC3']))

## Convert tariff data from HS1996 to ISIC3
tariffdf = pd.read_csv(wtoandcaftadata)
#Convert HS1996 codes in tariff data into ISIC3 codes
tariffdf['isic'] = tariffdf['HS6'].apply(lambda x: "'"+isic3conv[x.replace("'","")])
## Keep only columns that need to be merged with industrial activity data
tariffdrops = set(tariffdf.columns)-set(['isic','2002AvgRate','duty2010','duty2013'])
tariffdf.drop(list(tariffdrops),1,inplace=True)

## Save a copy of tariff data at the ISIC four digit level
tariffdf4dig = tariffdf.groupby('isic', as_index=False)[['2002AvgRate','duty2013']].mean()
tariffdf4dig = tariffdf4dig[tariffdf4dig['isic'] != "'9999"]

### Group tariff data down to the ISIC two digit level
## This is a really unsophisticated way to group data
tariffdf['isic'] = tariffdf['isic'].apply(lambda x: str(int(x[1:3])))
tariffdf = tariffdf.groupby('isic', as_index=False)[['2002AvgRate','duty2010','duty2013']].mean()
## We don't want ISIC code 99, serves as a catchall term in conversion
tariffdf = tariffdf[tariffdf['isic'] != '99']
tariffdf.to_csv(tariffisic2dig,index=False)  ## Intermediate file

### SETS NONTRADED GOODS PRICE TO ZERO AND INCLUDES A INDICATOR OF THIS, called nontraded
indusdf2002  =  pd.read_csv(industry2002)
indusdf2010  =  pd.read_csv(industry2010)
allcodes = list(set(list(indusdf2010.columns)).intersection(list(indusdf2002.columns)))
allcodes.remove('mun')
allcodes = [a for a in allcodes if a not in list(tariffdf['isic'])]
othercodesdf= pd.DataFrame()
othercodesdf['isic']=allcodes
othercodesdf['2002AvgRate']=0
othercodesdf['duty2013']=0
tariffdf['nontraded'] = 0
othercodesdf['nontraded']=1
tariffdf = tariffdf.append(othercodesdf)
tariffdf = tariffdf.reset_index()
tariffdf.drop('index',1,inplace=True)


# In[3]:

### Merge tariff data with municipality level ISIC two digit occupation data
### Used to compute municipality level average of import competing tariff (doesn't include occupations set to zero)
indusdf2002  =  pd.read_csv(industry2002)
indusdf2010  =  pd.read_csv(industry2010) 

## Pivot municipality level occupation data.
indusdf2002 = indusdf2002.set_index('mun').T.reset_index()
indusdf2010 = indusdf2010.set_index('mun').T.reset_index()
indusdf2002.rename(columns={'index':'isic'},inplace=True)
indusdf2010.rename(columns={'index':'isic'},inplace=True)

## Merge
indusdf2002 = indusdf2002.merge(tariffdf, on='isic',how='left')
indusdf2010 = indusdf2010.merge(tariffdf, on='isic',how='left')
indusdf2002.drop('nontraded',1,inplace=True)
indusdf2010.drop('nontraded',1,inplace=True)

## Compute average tariff in 2002 and 2013 for a given municipality
cols02=set(list(indusdf2002.columns))-set(['isic','2002AvgRate','duty2010','duty2013'])
cols10=set(list(indusdf2010.columns))-set(['isic','2002AvgRate','duty2010','duty2013'])
cols02 = sorted(list(cols02))
cols10 = sorted(list(cols10))
for col in cols02:
    indusdf2002[str(col)+'duty2002']=indusdf2002[col]*indusdf2002['2002AvgRate']
for col in cols10:    
    indusdf2010[str(col)+'duty2013']=indusdf2010[col]*indusdf2010['duty2013']
    indusdf2010[str(col)+'duty2010']=indusdf2010[col]*indusdf2010['duty2010']
    
    
dropcols02=cols02+['isic','2002AvgRate','duty2010','duty2013']
dropcols10=cols10+['isic','2002AvgRate','duty2010','duty2013']
indusdf2002.drop(dropcols02,1,inplace=True)
indusdf2010.drop(dropcols10,1,inplace=True)
indusdf2002 = indusdf2002.sum()
indusdf2010 = indusdf2010.sum()
indusdf2002 = indusdf2002.reset_index()
indusdf2002.columns = ['mun','tariff']
indusdf2002['mun'] = indusdf2002['mun'].apply(lambda x: x.replace('duty2002',''))
indusdf10 = pd.DataFrame(indusdf2010).T
indus10keeps = [a for a in indusdf10.columns if "duty2010" in a]
indus13keeps = [a for a in indusdf10.columns if "duty2013" in a]
indusdf2013 = indusdf10[indus13keeps].T.reset_index()
indusdf2010 = indusdf10[indus10keeps].T.reset_index()
indusdf2010.columns = ['mun','tariff']
indusdf2013.columns = ['mun','tariff']
indusdf2010['mun'] = indusdf2010['mun'].apply(lambda x: x.replace('duty2010',''))
indusdf2013['mun'] = indusdf2013['mun'].apply(lambda x: x.replace('duty2013',''))


# In[4]:

### Merge ISIC 4 digit tariff data with municipality level empresas data at the ISIC 4 digit level
### Same as above, but at ISIC 4 digit

indusfourdig = pd.read_csv(industryisic4digit2010)
tariffdf4dig.columns = ['ISIC','2002AvgRate','duty2013']
indusfourdig = indusfourdig.merge(tariffdf4dig,on='ISIC',how='inner')

## Compute weighted average of municipality tariff according to number of workers in occupation
indusfourdig['2002AvgRate']=indusfourdig['2002AvgRate']*indusfourdig['ESTWORKERS']
indusfourdig['duty2013']=indusfourdig['duty2013']*indusfourdig['ESTWORKERS']
indusfourdig.drop('ISIC',1,inplace=True)
indusfourdig = indusfourdig.groupby('MUNICIPIO', as_index=False)[["2002AvgRate","duty2013","ESTWORKERS"]].sum()
indusfourdig['2002AvgRate']=indusfourdig['2002AvgRate']/indusfourdig['ESTWORKERS']
indusfourdig['duty2013']=indusfourdig['duty2013']/indusfourdig['ESTWORKERS']
indusfourdig.drop('ESTWORKERS',1,inplace=True)


# In[5]:

### Save outputs to file

## Intermediate files
tariffdf4dig.to_csv(tariffisic4dig,index=False)

## Output files
indusfourdig.to_csv(isic4digtariffavg,index=False)
tariffdf.to_csv(isictariffavg,index=False)
indusdf2002.to_csv(munavgtariff2002,index=False)
indusdf2010.to_csv(munavgtariff2010,index=False)
indusdf2013.to_csv(munavgtariff2013,index=False)

