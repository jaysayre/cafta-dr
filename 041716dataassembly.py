
# coding: utf-8

# ## dataassembly.py
# ### Jay Sayre - sayrejay (at) Gm@i|, 
# 
# ### Purpose: Combines various datasets and preps code for analysis (see exploratoryanalysis.R script)
# 
# ## Inputs:
# 
# ### Produced by mergingtariffandindustrydata.py:
# 
# "cafta-dr/Output/ISICtwodigitleveltariffs.csv" - tariff averages at the ISIC 2-digit level for 2002 and 2013
# 
# "cafta-dr/Output/municipalityaverageisic4dig.csv" - municipality level tariff averages using ISIC 4 digit codes for the D.R. in 2013, using empresas data produced by the script compute_regional_employment.py, updated on 2/13/16
#     
# "cafta-dr/Output/municipalityaveragetariff2002.csv" - municipality level tariff averages (for import competing industries, where import competing is considered harmonized system goods that correspond to ISIC
# codes based upon conversion table) for the D.R. in 2002, using estimated industrial activity in a municipality for 2002 produced by the script mergingtariffandindustrydata.py
# 
# "cafta-dr/Output/municipalityaveragetariff2010.csv" - municipality level tariff averages (for import competing industries, where import competing is considered harmonized system goods that correspond to ISIC
# codes based upon conversion table) for the D.R. in 2010, using estimated industrial activity in a municipality for 2010 produced by the script compute_regional_employment.py
# 
# "cafta-dr/Output/municipalityaveragetariff2013.csv" - municipality level tariff averages (for import competing industries, where import competing is considered harmonized system goods that correspond to ISIC
# codes based upon conversion table) for the D.R. in 2013, using estimated industrial activity in a municipality for 2010 produced by the script mergingtariffandindustrydata.py
# 
# #### Produced by DHSdataaggregation.py:
# 
# "averageincomebymunicipality2013.csv" - Average income in each D.R. municipality for 2013
# 
# "averageincomebyoccmun2013.csv" - Average income in each D.R. municipality and occupation for 2013
# 
# "averageoccincmun2013highskill.csv" - Average income in each D.R. municipality and occupation for 2013, for workers with 9 or more years of education
# 
# "averageoccincmun2013lowskill.csv" - Average income in each D.R. municipality and occupation for 2013, for workers with less than 9 years of education
# 
# ### Produced by IPUMSdataaggregation.py:
# 
# 'averageincomebymunicipality2002.csv' - IPUMS 2002 information on the average income of workers in the private sector for a given D.R. municipality
# 
# 'averageincomebyoccmun2002.csv' - IPUMS 2002 information on the average income of workers in a given ISIC occupation code for a given D.R. municipality
# 
# 'averageoccincmun2002highskill.csv' - IPUMS 2002 information on the average income of workers in a given ISIC occupation code for a given D.R. municipality, for workers with 9 or more years of education
# 
# 'averageoccincmun2002lowskill.csv' - IPUMS 2002 information on the average income of workers in a given ISIC occupation code for a given D.R. municipality, for workers with less than 9 years of education
# 
# ### Produced by compute_regional_employment.py:
# 
# estmunicipalindustryactivity2002.csv - Combines D.R. empresa data and IPUMS data at the ISIC 2-digit level for 2002
# 
# estmunicipalindustryactivity2010.csv - Combines D.R. empresa data and IPUMS data at the ISIC 2-digit level for 2010
# 
# "cafta-dr/Output/firmconcentration2002.csv" - Measure of occupation concentration within a municipality for 2002
# 
# "cafta-dr/Output/firmconcentration2010.csv" - Measure of occupation concentration within a municipality for 2010
# 
# ### Downloaded directly from ONE, Dominican Republic:
# 
# "DR_Codigos/Input/municipalitystatistics.xls" - Contains data on population, work force, and similar statistics for 2002 and 2010 in the Dominican Republic
# 
# ## Outputs:
# 
# 'mun_level_isic4dig_DATASET.csv' - contains income and tariff levels at
# for 2002 and 2013 at the municipality level (using ISIC four digit, just empresas), to be analyzed later in R
# or STATA
# 
# 'municipality_level_DATASET.csv' - contains income and tariff levels at
# for 2002 and 2013 at the municipality level (using ISIC two digit, IPUMS+empresas), to be analyzed later in R
# or STATA
# 
# 'municipality_occupation_level_DATASET.csv' - contains income and tariff levels for 2002 and 2013 at the municipality and occupational level, to be analyzed later in R or STATA
# 
# 'municipality_hiskill_occupation_DATASET.csv' - Same as above, but for workers with 9 or more years of education
# 
# 'municipality_loskill_occupation_DATASET.csv' - Same as above, but for workers with less than 9 years of education
# 
# 'municipality_migration_DATASET.csv' - contains contains population estimates for 2002 and 2010 and tariff levels for 2002 and 2010 at the municipality level

# In[1]:

import pandas as pd
import os

if os.name == 'nt':
    basedir ="D:/Dropbox/Dropbox (Personal)/College/DR_Paper/cafta-dr/"
else:
    basedir ="/home/j/Dropbox/College/DR_Paper/cafta-dr/"

outputdir = basedir+'Output/'
    
## INPUTS
isictariffs = outputdir+'ISICtwodigitleveltariffs.csv' #MUN/OCC
muntariffisic4dig = outputdir+'municipalityaverageisic4dig.csv' # MUN/ISIC 4 DIG
muntariff2002 = outputdir+'municipalityaveragetariff2002.csv' #MUN
muntariff2010 = outputdir+'municipalityaveragetariff2010.csv' #MUN/MIG
muntariff2013 = outputdir+'municipalityaveragetariff2013.csv' #MUN
munavginc2002 = outputdir+'averageincomebymunicipality2002.csv' #MUN
munavginc2013 = outputdir+'averageincomebymunicipality2013.csv' #MUN
munavgincocc2002 = outputdir+'averageincomebyoccmun2002.csv' #MUN/OCC
munavgincocc2013 = outputdir+'averageincomebyoccmun2013.csv' #MUN/OCC
hiskillmunavgincocc2002 = outputdir+'averageoccincmun2002highskill.csv' #MUN/OCC (High skill)
hiskillmunavgincocc2013 = outputdir+'averageoccincmun2013highskill.csv' #MUN/OCC (High skill)
loskillmunavgincocc2002 = outputdir+'averageoccincmun2002lowskill.csv' #MUN/OCC (Low skill)
loskillmunavgincocc2013 = outputdir+'averageoccincmun2013lowskill.csv' #MUN/OCC (Low skill)
industry2002 = outputdir+'estmunicipalindustryactivity2002.csv' #MUN/OCC
industry2010 = outputdir+'estmunicipalindustryactivity2010.csv' #MUN/OCC
firmconc2002 = outputdir+"firmconcentration2002.csv" #MUN/OCC
firmconc2010 = outputdir+"firmconcentration2010.csv" #MUN/OCC
munpopulationest = basedir+"DR_Codigos/Input/municipalitystatistics.xls" #MUN/MIG

## OUTPUTS
munisic4output = outputdir+'mun_level_isic4dig_DATASET.csv'
munoutput = outputdir+'municipality_level_DATASET.csv'
munoccoutput = outputdir+'municipality_occupation_level_DATASET.csv'
hisklmunoccoutput = outputdir+'municipality_hiskill_occupation_DATASET.csv'
losklmunoccoutput = outputdir+'municipality_loskill_occupation_DATASET.csv'
munmigroutput = outputdir+'municipality_migration_DATASET.csv' 

def rename_columns(col):
    if col == 'inctot': return 'inc02'
    elif col == 'educdo': return 'edu02'
    elif col == 'grossalary': return 'grossalary13'
    elif col == 'occinc': return 'occinc13'
    elif col == 'frstsourcinc': return 'frstsourcinc13'
    elif col == 'yearsedu': return 'edu13'
    elif col == 'CODIGO': return 'mun'
    elif col == 'sg110': return 'occ'
    elif col == 'population2002': return 'pop02'
    elif col == 'population2010': return 'pop10'
    elif col == 'employedpop2002': return 'empop02'
    elif col == 'employedpop2010': return 'empop10'
    elif col == 'Population of working age 2002': return 'workagepop02'
    elif col == 'Population of working age 2010': return 'workagepop10'
    elif col == '2002AvgRate': return 'duty02'
    elif col == 'duty2010': return 'duty10'
    elif col == 'duty2013': return 'duty13'
    elif col == 'isic': return 'occ'
    else: return col


# In[2]:

### Build municipality level tariff/income data set aka #MUN

tariffdf02 = pd.read_csv(muntariff2002)
tariffdf13 = pd.read_csv(muntariff2013)
avgincdf02 = pd.read_csv(munavginc2002)
avgincdf13 = pd.read_csv(munavginc2013)

tariffdf02.columns = ['mun','duty02']
tariffdf13.columns = ['mun','duty13']
avgincdf02.columns = [rename_columns(a) for a in avgincdf02.columns]
avgincdf13.drop(['PROV','MUN'],1,inplace=True)
avgincdf13.columns = [rename_columns(a) for a in avgincdf13.columns]
avgincdf13['mun']=avgincdf13['mun'].astype(str)

mundf = tariffdf02.merge(tariffdf13,on='mun')
mundf['mun']=mundf['mun'].astype(str)
mundf = mundf.merge(avgincdf02,on='mun')
mundf = mundf.merge(avgincdf13,on='mun')
mundf['prov'] = mundf['mun'].apply(lambda x: x[:1] if len(x)==3 else x[:2])


# In[3]:

### Build municipality level tariff/income data set aka #MUN/ISIC 4 dig

tariff4digdf = pd.read_csv(muntariffisic4dig)
avgincdf02 = pd.read_csv(munavginc2002)
avgincdf13 = pd.read_csv(munavginc2013)

tariff4digdf.columns = ['mun','duty02','duty13']
tariff4digdf['mun']=tariff4digdf['mun'].astype(str)
avgincdf02.columns = [rename_columns(a) for a in avgincdf02.columns]
avgincdf13.drop(['PROV','MUN'],1,inplace=True)
avgincdf13.columns = [rename_columns(a) for a in avgincdf13.columns]
avgincdf13['mun']=avgincdf13['mun'].astype(str)

mun4digdf = tariff4digdf.merge(avgincdf02,on='mun')
mun4digdf = mun4digdf.merge(avgincdf13,on='mun')
mun4digdf['prov'] = mun4digdf['mun'].apply(lambda x: x[:1] if len(x)==3 else x[:2])


# In[4]:

### Build municipality and occupation level tariff/income data set aka #MUN/OCC

munoccdf02 = pd.read_csv(munavgincocc2002)
munoccdf13 = pd.read_csv(munavgincocc2013)
isictwodig = pd.read_csv(isictariffs)
industryact02 = pd.read_csv(industry2002)
industryact10 = pd.read_csv(industry2010)
firmconcdf02 = pd.read_csv(firmconc2002)
firmconcdf10 = pd.read_csv(firmconc2010)

## Prepare data for merging
munoccdf13.drop(['PROV','MUN'],1,inplace=True)
munoccdf02.columns = [rename_columns(a) for a in munoccdf02.columns]
munoccdf13.columns = [rename_columns(a) for a in munoccdf13.columns]
isictwodig.columns = [rename_columns(a) for a in isictwodig.columns]
industryact02 = industryact02.set_index('mun').stack().reset_index()
industryact10 = industryact10.set_index('mun').stack().reset_index()
industryact02.columns=['mun','occ','numworkers02']
industryact10.columns=['mun','occ','numworkers10']
firmconcdf02 = firmconcdf02.set_index('mun').stack().reset_index()
firmconcdf10 = firmconcdf10.set_index('mun').stack().reset_index()
firmconcdf02.columns=['mun','occ','firmconc02']
firmconcdf10.columns=['mun','occ','firmconc10']


## Make sure all merge columns are of the same type
## This shouldn't be necessary, but I couldn't fix merge issues otherwise
## Whatever, it only means code is longer than it has to be.. oh well
munoccdf02['munocc']=munoccdf02['mun'].astype(str)+'  '+munoccdf02['occ'].astype(str)
munoccdf13['munocc']=munoccdf13['mun'].astype(str)+'  '+munoccdf13['occ'].astype(str)
industryact02['munocc']=industryact02['mun'].astype(str)+'  '+industryact02['occ'].astype(str)
industryact10['munocc']=industryact10['mun'].astype(str)+'  '+industryact10['occ'].astype(str)
firmconcdf02['munocc']=firmconcdf02['mun'].astype(str)+'  '+firmconcdf02['occ'].astype(str)
firmconcdf10['munocc']=firmconcdf10['mun'].astype(str)+'  '+firmconcdf10['occ'].astype(str)
munoccdf02.drop(['mun','occ'],1,inplace=True)
munoccdf13.drop(['mun','occ'],1,inplace=True)
industryact02.drop(['mun','occ'],1,inplace=True)
industryact10.drop(['mun','occ'],1,inplace=True)
firmconcdf02.drop(['mun','occ'],1,inplace=True)
firmconcdf10.drop(['mun','occ'],1,inplace=True)
isictwodig['occ']=isictwodig['occ'].astype(str)

## Merge all files together
munoccdf = munoccdf02.merge(munoccdf13,on='munocc')
munoccdf = munoccdf.merge(industryact02,on='munocc', how='left')
munoccdf = munoccdf.merge(industryact10,on='munocc', how='left')
munoccdf = munoccdf.merge(firmconcdf02,on='munocc', how='left')
munoccdf = munoccdf.merge(firmconcdf10,on='munocc', how='left')

munoccdf['occ'] = munoccdf['munocc'].apply(lambda x: x.split('  ')[1])
munoccdf['munocc'] = munoccdf['munocc'].apply(lambda x: x.split(' ')[0])
munoccdf = munoccdf.merge(isictwodig,on='occ')


# In[5]:

### Build municipality and occupation level tariff/income data set aka #MUN/OCC (for high skill sample)

hisklmunoccdf02 = pd.read_csv(hiskillmunavgincocc2002)
hisklmunoccdf13 = pd.read_csv(hiskillmunavgincocc2013)

## Prepare data for merging
hisklmunoccdf13.drop(['PROV','MUN'],1,inplace=True)
hisklmunoccdf02.columns = [rename_columns(a) for a in hisklmunoccdf02.columns]
hisklmunoccdf13.columns = [rename_columns(a) for a in hisklmunoccdf13.columns]
## Make sure all merge columns are of the same type
hisklmunoccdf02['munocc']=hisklmunoccdf02['mun'].astype(str)+'  '+hisklmunoccdf02['occ'].astype(str)
hisklmunoccdf13['munocc']=hisklmunoccdf13['mun'].astype(str)+'  '+hisklmunoccdf13['occ'].astype(str)
hisklmunoccdf02.drop(['mun','occ'],1,inplace=True)
hisklmunoccdf13.drop(['mun','occ'],1,inplace=True)
## Merge all files together
hisklmunoccdf = hisklmunoccdf02.merge(hisklmunoccdf13,on='munocc')
hisklmunoccdf = hisklmunoccdf.merge(industryact02,on='munocc', how='left')
hisklmunoccdf = hisklmunoccdf.merge(industryact10,on='munocc', how='left')
hisklmunoccdf = hisklmunoccdf.merge(firmconcdf02,on='munocc', how='left')
hisklmunoccdf = hisklmunoccdf.merge(firmconcdf10,on='munocc', how='left')

hisklmunoccdf['occ'] = hisklmunoccdf['munocc'].apply(lambda x: x.split('  ')[1])
hisklmunoccdf['munocc'] = hisklmunoccdf['munocc'].apply(lambda x: x.split(' ')[0])
hisklmunoccdf = hisklmunoccdf.merge(isictwodig,on='occ')


# In[6]:

### Build municipality and occupation level tariff/income data set aka #MUN/OCC (for low skill sample)

losklmunoccdf02 = pd.read_csv(loskillmunavgincocc2002)
losklmunoccdf13 = pd.read_csv(loskillmunavgincocc2013)

## Prepare data for merging
losklmunoccdf13.drop(['PROV','MUN'],1,inplace=True)
losklmunoccdf02.columns = [rename_columns(a) for a in losklmunoccdf02.columns]
losklmunoccdf13.columns = [rename_columns(a) for a in losklmunoccdf13.columns]
## Make sure all merge columns are of the same type
losklmunoccdf02['munocc']=losklmunoccdf02['mun'].astype(str)+'  '+losklmunoccdf02['occ'].astype(str)
losklmunoccdf13['munocc']=losklmunoccdf13['mun'].astype(str)+'  '+losklmunoccdf13['occ'].astype(str)
losklmunoccdf02.drop(['mun','occ'],1,inplace=True)
losklmunoccdf13.drop(['mun','occ'],1,inplace=True)
## Merge all files together
losklmunoccdf = losklmunoccdf02.merge(losklmunoccdf13,on='munocc')
losklmunoccdf = losklmunoccdf.merge(industryact02,on='munocc', how='left')
losklmunoccdf = losklmunoccdf.merge(industryact10,on='munocc', how='left')
losklmunoccdf = losklmunoccdf.merge(firmconcdf02,on='munocc', how='left')
losklmunoccdf = losklmunoccdf.merge(firmconcdf10,on='munocc', how='left')

losklmunoccdf['occ'] = losklmunoccdf['munocc'].apply(lambda x: x.split('  ')[1])
losklmunoccdf['munocc'] = losklmunoccdf['munocc'].apply(lambda x: x.split(' ')[0])
losklmunoccdf = losklmunoccdf.merge(isictwodig,on='occ')


# In[7]:

### Build municipality level tariff/population data set aka #MUN/MIG
tardf02 = pd.read_csv(muntariff2002)
tardf10 = pd.read_csv(muntariff2010) ## Never mind, I want 2010 data
munpopest = pd.read_excel(munpopulationest,skiprows=[156,157,158])

munpopest['munname']=munpopest['mun']
munpopest.drop('mun',1,inplace=True) ## mun here isn't the municipality code but name, which I don't need
munpopest.columns = [rename_columns(a) for a in munpopest.columns]
munpopest['mun'] = munpopest['mun'].astype(str)
tardf02.columns = ['mun','duty02']
tardf10.columns = ['mun','duty10']

munmigdf = tardf02.merge(tardf10,on='mun')
munmigdf['mun']=munmigdf['mun'].astype(str)
munmigdf = munmigdf.merge(munpopest,on='mun')

## Subset down to only relevant columns, can add additional data later
keepcols = ['mun','munname','duty02','duty10','pop02','pop10','empop02',
            'empop10','workagepop02','workagepop10']
munmigdf = munmigdf[keepcols]
munmigdf['prov'] = munmigdf['mun'].apply(lambda x: x[:1] if len(x) == 3 else x[:2])


# In[8]:

### Write outputs to file
mundf.to_csv(munoutput,index=False)
mun4digdf.to_csv(munisic4output,index=False)
munoccdf.to_csv(munoccoutput,index=False)
hisklmunoccdf.to_csv(hisklmunoccoutput,index=False)
losklmunoccdf.to_csv(losklmunoccoutput,index=False)
munmigdf.to_csv(munmigroutput,index=False,encoding='utf-8')

