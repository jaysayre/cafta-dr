
# coding: utf-8

# ## compute_regional_employment.py
# 
# ### Jay Sayre - sayrejay (at) gmai|,
# 
# Computes estimated share of employment in each municipality of the Dominican Republic in a given ISIC (International Standard Industrial Classification) code using data provided by IPUMS international at the ISIC 2-digit level on workers' occupations and data provided by the DR's ONE (Oficina Nacional de Estadística) at the ISIC 4-digit level on companies (empresas) registered in the D.R.
# 
# ### Inputs:
# DirectoryofCompaniesandEstablishments/data/mergedprov.csv - D.R. provided information on the companies (and their sizes and industrial classifications) in each municipality. Merged together from separate files in "data/" folder using a UNIX one-liner.
# 
# "DR_Codigos/Input/municipalitystatistics.xls" - Contains data on population, work force, and similar statistics for 2002 and 2010 in the Dominican Republic. Downloaded directly from ONE, Dominican Republic.
# 
# occupationbymunicipality2002.csv, occupationbymunicipality2010.csv - Result of IPUMSdataaggregation.py. See file for more details.
# 
# ### Intermediate data:
# DirectoryofCompaniesandEstablishments/companiesandsizesbymunicipality.csv - Clean and aggegrate input companies data (mergedprov.csv) to the municipality level, computing number of companies of a given size in a given industry
# 
# DirectoryofCompaniesandEstablishments/municipalitycodecorrespondence.csv - Takes input data, strips data of ll information except for geocodes and corresponding province/municipality names
# 
# ### Outputs:
# 
# estmunicipalindustryactivity2002.csv - Combines D.R. empresa data and IPUMS data at the ISIC 2-digit level for 2002 
# 
# estmunicipalindustryactivity2010.csv - Combines D.R. empresa data and IPUMS data at the ISIC 2-digit level for 2010
# 
# industryactivityisic4dig2010.csv - Produces estimated number of workers in each ISIC 4 digit code using solely D.R. empresa data, updated on 2/13/16
# 
# "cafta-dr/Output/firmconcentration2002.csv" - Measure of occupation concentration within a municipality for 2002
# 
# "cafta-dr/Output/firmconcentration2010.csv" - Measure of occupation concentration within a municipality for 2010
# 

# In[1]:

import pandas as pd
import os

if os.name == 'nt':
    tdir ="D:/Dropbox/Dropbox (Personal)/College/DR_Paper/cafta-dr/"
else:
    tdir ="/home/j/Dropbox/College/DR_Paper/cafta-dr/"
sndlvl = "DirectoryofCompaniesandEstablishments/"
    
## Inputs
empresadata = tdir+sndlvl+"Inputs/mergedprov.csv"
occu2002 = tdir+'Output/IPUMSoccupationbymunicipality2002.csv'
occu2010 = tdir+'Output/IPUMSoccupationbymunicipality2010.csv'
munpopulationest = tdir+"DR_Codigos/Input/municipalitystatistics.xls"

## Intermediate Data
muncodecorres = tdir+sndlvl+'IntermediateData/municipalitycodecorrespondence.csv'
companiesbysize = tdir+sndlvl+'IntermediateData/companiesandsizesbymunicipality.csv'

## Outputs
industry2002 = tdir+'Output/estmunicipalindustryactivity2002.csv'
industry2010 = tdir+'Output/estmunicipalindustryactivity2010.csv'
industryisic4digit2010 = tdir+'Output/industryactivityisic4dig2010.csv'
firmconc2002 = tdir+"Output/firmconcentration2002.csv"
firmconc2010 = tdir+"Output/firmconcentration2010.csv"

## Custom functions
def whereindf(item,dataframe,column='mun'):
    return list(dataframe[column]).index(item)

## Weighting by company size
def csize(word):
    if word == u'050 a 099':
        #return "50-99"
        return 75
    elif word == u'010 a 049':
        #return "10-49"
        return 30
    elif word == u'001 a 009':
        #return "1-9"
        return 5
    elif word == u'250 o m\xe1s':
        #return "250-"
        return 300
    elif word == u'100 a 249':
        #return "100-249"
        return 175
    else:
        return word

## Create correspondence table of municis to codes found in Empresa data
## Only need to run this once
'''
provlistdf = pd.read_csv(empresadata,encoding='utf-8')
provlistdf['ISIC'] = provlistdf['CLASS'].apply(lambda x: "'"+x[-4:])
provdrops = [u'SECT',u'DIV',u'GROUP',u'CLASS',u'SECT_DESC',
            u'DIV_DESC',u'GROUP_DESC',u'CLASS_DESC',u'GEOCODE',
            u'PROVINCE_DESC', u'MUNICIPIO_DESC']
provdrops.remove(u'PROVINCE_DESC')
provdrops.remove(u'MUNICIPIO_DESC')
provdrops.extend(['ISIC'])
provlistdf = provlistdf.drop(provdrops, 1)
provlistdf = provlistdf.groupby(['PROVINCE','MUNICIPIO','PROVINCE_DESC', 'MUNICIPIO_DESC'], as_index=False).sum()
provlistdf = provlistdf.drop('EMPRESAS', 1)

provlistdf.to_csv(muncodecorres,index=False,encoding="utf-8")
'''
# In[2]:

## Read in data
empresadf = pd.read_csv(empresadata,encoding='utf-8') ## Directory of Empresas
occudf2002 = pd.read_csv(occu2002) #IPUMS Data on # workers in each occ
occudf2010 = pd.read_csv(occu2010) #IPUMS Data on # workers in each occ
munpopest = pd.read_excel(munpopulationest,skiprows=[156,157,158]) # ONE population estimates

## Calculate share of companies in a industry of a given size in each mun
empresadf['ISIC'] = empresadf['CLASS'].apply(lambda x: "'"+x[-4:])
dropcols = [u'SECT',u'DIV',u'GROUP',u'CLASS',u'SECT_DESC',
            u'DIV_DESC',u'GROUP_DESC',u'CLASS_DESC',u'GEOCODE',
            u'PROVINCE_DESC', u'MUNICIPIO_DESC']

empresadf.drop(dropcols, 1, inplace=True)
## Weighting by company size
empresadf['SIZE'] = empresadf['SIZE'].apply(lambda x: csize(x))

## Group Empresas by Municipality, ISIC Code, and size
empresadf = empresadf.groupby(['PROVINCE','MUNICIPIO','ISIC','SIZE'], as_index=False).sum()

## Calculate total number of companies by size in province and municipality
municidf = empresadf.groupby(['PROVINCE','MUNICIPIO','SIZE'], as_index=False).sum()
provdf = empresadf.groupby(['PROVINCE','SIZE'], as_index=False)['EMPRESAS'].sum()
municidf.columns = ['PROVINCE','MUNICIPIO','SIZE','MUNICINUM']
provdf.columns = ['PROVINCE','SIZE','PROVNUM']

empresadf = empresadf.merge(municidf, on=['PROVINCE','MUNICIPIO','SIZE'], how='left')
empresadf = empresadf.merge(provdf, on=['PROVINCE','SIZE'], how='left')

## Saving intermediate data
#empresadf.to_csv(companiesbysize,index=False)

## Group D.R. Empresa data down to the ISIC two digit level
empresadf['ISICtwodig'] = empresadf['ISIC'].apply(lambda x: str(int(x[1:3])))
empresa2digdf = empresadf.drop(['ISIC','MUNICINUM','PROVNUM','PROVINCE'], 1)
empresa2digdf['ISICtwodig'].unique()
empresa2digdf = empresa2digdf.groupby(['MUNICIPIO','ISICtwodig','SIZE'], as_index=False).sum()

## Used to compute estimated workers in each isic two digit
empresa2digdf['ESTWORKERS']=empresa2digdf['SIZE']*empresa2digdf['EMPRESAS']
## Group down to solely ISIC 2 digit, and not company size
empresa2digdf = empresa2digdf.drop(['SIZE','EMPRESAS'], 1)
empresa2digdf = empresa2digdf.groupby(['MUNICIPIO','ISICtwodig'], as_index=False).sum()

## Used to compute estimated workers in each isic four digit
empresa4digdf= empresadf.drop(['PROVNUM','MUNICINUM','PROVINCE','ISICtwodig'], 1)
empresa4digdf['ESTWORKERS']=empresa4digdf['SIZE']*empresa4digdf['EMPRESAS']
## Group down to solely ISIC 4 digit, and not company size
empresa4digdf = empresa4digdf.drop(['SIZE','EMPRESAS'], 1)
empresa4digdf = empresa4digdf.groupby(['MUNICIPIO','ISIC'], as_index=False).sum()

## Calibrate above data with IPUMS industry data for 2002 and 2010
## Combines IPUMS and D.R. estimates at ISIC 2 digit for workers in a given sector
## Determines relative weighting of IPUMS and D.R. data
wht_empresa_data = 1

dataframes = [occudf2002,occudf2010]
for df in dataframes:
    for i in empresa2digdf.index:
        isiccode = empresa2digdf.loc[i,'ISICtwodig']
        if isiccode not in df.columns:
            df[isiccode] = 0    
        muncode = empresa2digdf.loc[i,'MUNICIPIO']
        estworkers = empresa2digdf.loc[i,'ESTWORKERS'] * wht_empresa_data
        occudfindex = whereindf(muncode,df)
        df.loc[occudfindex,isiccode] += estworkers 
        
    ##Compute total number of sample of workers in given municipality
    dfcodes = [a for a in df.columns if 'mun' not in a]
    df['MUNTOTAL']=0
    for col in dfcodes:
        df['MUNTOTAL'] += df[col]
    ## Compute share of occupation in a given municipality
    for col in dfcodes:
        df[col] = df[col]/df['MUNTOTAL']
    df.drop('MUNTOTAL',1,inplace=True)
        
## Save occupation concentration files to outputs before moving on
occudf2002.to_csv(firmconc2002,index=False)
occudf2010.to_csv(firmconc2010,index=False)

### Combine occupation concentration numbers with population information from ONE
## Subset down to necessary columns
munpopest['munname']=munpopest['mun']
munpopest.drop('mun',1,inplace=True) ## mun here isn't the municipality code but name, which I don't need
munpopest['mun']=munpopest['CODIGO']
popdfkeepcols = ['mun','employedpop2002','employedpop2010']
munpopest = munpopest[popdfkeepcols]

## Fill in one row with NA's (municipality 2508)
occudf2002.fillna(0,inplace=True)
occudf2010.fillna(0,inplace=True)

## Complete merges
occudf2002codes = [a for a in occudf2002.columns if 'mun' not in a]
occudf2010codes = [a for a in occudf2010.columns if 'mun' not in a]
occudf2002 = occudf2002.merge(munpopest,on='mun',how='left')
occudf2010 = occudf2010.merge(munpopest,on='mun',how='left')

## Multiply municipality level population by share of municipality employed in that sector
for col in occudf2002codes:
    occudf2002[col] = occudf2002[col]*occudf2002['employedpop2002']
    occudf2002[col] = occudf2002[col].astype(int)
for col in occudf2010codes:
    occudf2010[col] = occudf2010[col]*occudf2010['employedpop2010']
    occudf2010[col] = occudf2010[col].astype(int)

occudf2002.drop(['employedpop2002','employedpop2010'],1,inplace=True)
occudf2010.drop(['employedpop2002','employedpop2010'],1,inplace=True)


# In[3]:

## Save outputs to file
occudf2002.to_csv(industry2002,index=False)
occudf2010.to_csv(industry2010,index=False) 
empresa4digdf.to_csv(industryisic4digit2010,index=False)

