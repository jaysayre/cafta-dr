
# coding: utf-8

# ## summarystatistics.py 
# 
# ### Jay Sayre - sayrejay (at) gmai|
# 
# Computes basic summary statistics in python for use in my paper
# 
# ## Inputs:
# 
# 'IPUMS/ipumsclean.csv' - cleaned IPUMS data  (by 01182016ipumscleaning.ipynb) for DR in 2002 and 2010
# 
# "../DHS/2013Standard/geo/merge2013clust.csv" - DHS 2013 Dominican Republic geospatial data corresponding to geo-tagged keys in DHS 2013 dataset, compiled by extractoneshapefiletopoint.py
# 
# "../DHS/2013Standard/hhmember/DRPR61FL.csv" - DHS 2013 Dominican Republic Household Member Dataset (converted to csv by DHS/DHSbuild.R script)
# 
# "/cafta-dr/DHS/DHSoccupationsISIC.xlsx" - Code for converting DHS occupation categories into ISIC occupation codes
# 
# usd2013todrXXpesos - Nominal conversion rate from 2013 USD to 20XX RD.
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
# 'municipality_migration_DATASET.csv' - contains contains population estimates for 2002 and 2010 and tariff levels for 2002 and 2010 at the municipality level
# 
# 'muncorrespondence.xlsx' - Used to match up province names to codes
# 
# ## Outputs:
# 
# 'cafta-dr/Plots/summarytable.tex' - Summary statistics at municipality level
# 
# 'cafta-dr/Plots/provsummarytable.tex' - Summary statistics for each province, split up into several tables
# 

# In[1]:

import pandas as pd
import os

if os.name == 'nt':
    basedir ="D:/Dropbox/Dropbox (Personal)/College/DR_Paper/"
else:
    basedir ="/home/j/Dropbox/College/DR_Paper/"

## INPUTS
munisic4output = basedir+'cafta-dr/Output/mun_level_isic4dig_DATASET.csv'
munoutput = basedir+'cafta-dr/Output/municipality_level_DATASET.csv'
munoccoutput = basedir+'cafta-dr/Output/municipality_occupation_level_DATASET.csv'
ipumsinputdata = basedir+'IPUMS/ipumsclean.csv'
dhs_geoclust_2013 = basedir + "DHS/2013Standard/geo/merge2013clust.csv"
dhs_hhmember_2013 = basedir + "DHS/2013Standard/hhmember/DRPR61FL.csv" # Converted to csv by DHSbuild.R in  main directory
dhs_occupations_conversion = basedir+"cafta-dr/DHS/DHSoccupationsISIC.xlsx"
munmigroutput = basedir+'cafta-dr/Output/municipality_migration_DATASET.csv' 
province_names = basedir+'cafta-dr/DR_Codigos/Output/muncorrespondence.csv'

## Conversion rate from RD to 2013 USD 
usd2013todr13pesos = 41.8081439153#*(0.985) ## Later term is so currency is wrt to 2010 constant USD, from World Bank
usd2013todr02pesos = 18.609825#*(0.975)

## OUTPUT 
summarytable = basedir+'cafta-dr/Plots/summarytable.tex'
provsumtable1 = basedir+'cafta-dr/Plots/provsummarytable1.tex'
provsumtable2 = basedir+'cafta-dr/Plots/provsummarytable2.tex'

## Helper function to rename columns 
def rename_columns(col):
    if col == 'inc02': return 'income2002'
    elif col == 'edu02': return 'edu2002'
    elif col == 'grossalary13': return 'income2013'
    elif col == 'occinc13': return 'income2013'
    elif col == 'frstsourcinc13': return 'income2013'
    elif col == 'edu10': return 'edu2010'
    elif col == 'edu13': return 'edu2013'
    elif col == 'duty02': return 'duty2002'
    elif col == 'duty10': return 'duty2010'
    elif col == 'duty13': return 'duty2013'
    elif col == 'pop02': return 'pop2002'
    elif col == 'pop10': return 'pop2010'
    elif col == 'PROV': return 'prov'
    elif col == 'PROVNAME': return 'Province'
    elif col == 'empop02': return 'empop2002'
    elif col == 'empop10': return 'empop2010'
    elif col == 'workagepop02': return 'workagepop2002'
    elif col == 'workagepop10': return 'workagepop2010'
    elif col == 'numworkers02': return 'employment2002'
    elif col == 'numworkers10': return 'employment2010'
    elif col == 'firmconc02': return 'occconcentration2002'
    elif col == 'firmconc10': return 'occconcentration2010'
    else: return col

## Removing accents in province names
import unicodedata
def remove_accents(input_str):
    nfkd_form = unicodedata.normalize('NFKD', input_str)
    return u"".join([c for c in nfkd_form if not unicodedata.combining(c)])


# In[2]:

### Summary statistics really need to be calculated at survey level
### Code copied from DHSaggregation.py and IPUMSaggregation.py


### IPUMS
ipumsdf = pd.read_csv(ipumsinputdata, encoding='utf-8')
ipumsdf = ipumsdf[ipumsdf["geo2_dox"] != 'El Carril']
## Clean up years of education in both data sets (2002 and 2010)
def years_edu(edu):
    if edu == 0: return None
    elif edu == 100: return 0.0
    elif edu == 201: return 0.25
    elif edu == 202: return 0.50
    elif edu == 203: return 0.75
    elif edu == 301: return 1.0
    elif edu == 302: return 2.0
    elif edu == 303: return 3.0
    elif edu == 304: return 4.0
    elif edu == 305: return 5.0
    elif edu == 306: return 6.0
    elif edu == 307: return 7.0
    elif edu == 308: return 8.0
    elif edu == 411: return 9.0
    elif edu == 412: return 10.0
    elif edu == 413: return 11.0
    elif edu == 414: return 12.0
    elif edu == 501: return 13.0
    elif edu == 502: return 14.0
    elif edu == 503: return 15.0
    elif edu == 504: return 16.0
    elif edu == 505: return 16.25
    elif edu == 506: return 16.5
    elif edu == 511: return 17.0
    elif edu == 512: return 17.25
    elif edu == 521: return 17.0
    elif edu == 522: return 18.0    
    elif edu == 523: return 19.0
    elif edu == 531: return 19.0
    elif edu == 532: return 20.0
    elif edu == 533: return 21.0
    elif edu == 534: return 22.0
    elif edu == 998: return None
    else: return None
ipumsdf['educdo'] = ipumsdf['educdo'].apply(lambda x: years_edu(x))

## Drops columns I don't currently need to increase the speed of the script
ipumsdropcols = ['country','sample','serial','persons','hhwt','subsamp','strata',
                 'urban','regionw','geolev1','geo1_do','geo1_dox','subrdo','age',
                 'sex','nativity','bplcountry','bpldo','yrimm','yrsimm','school','lit',
                 'edattain','edattaind','empstat','empstatd','occisco','indgen','ind', 
                 'classwkd','empsect','migrate5','migctry5','migdo','disabled','disemp']
ipumsdf.drop(ipumsdropcols,1, inplace=True)

## Subset to only workers employed in the private sector
ipumsdf = ipumsdf[ipumsdf['classwk'] == 2]

## Split data set into 2002 and 2010 sections, we primarily care about 2002
df2002, df2010 = ipumsdf[ipumsdf['year']==2002], ipumsdf[ipumsdf['year']==2010]

## Relabel variables if I am also including 2010 variables
df2010['edu10'] = df2010['educdo']
df2010.drop('educdo',1,inplace=True)

## Subsetting down to only obs with available (and nonzero) income data for 2002
incdf = df2002[df2002['inctot']!= 9999998]
incdf = incdf[incdf['inctot']!= 9999999]
incdf = incdf[incdf['inctot']!= 0]
## Convert income as measured in monthly 2002 RD to weekly 2013 USD
incdf['inctot'] = incdf['inctot']/(usd2013todr02pesos*4.33)

## Convert weekly income into estimated hourly wage based upon average working hours for each occupation category
## For information on where these numbers come from, please see:
## cafta-dr/DR_Codigos/Input/DRCentralBankAverageHoursWorkedbyOccupation.xls
def avgworkhrs02(occ):
    if occ in range(1,3+1):     return 38.38
    elif occ in range(5,9+1):   return 44.51
    elif occ in range(10,33+1): return 44.20
    elif occ in range(35,39+1): return 44.14
    elif occ in range(41,43+1): return 43.13
    elif occ in range(45,47+1): return 44.54 #Not sure about my translation here
    elif occ in range(55,56+1): return 41.51
    elif occ in range(49,53+1): return 47.61
    elif occ in range(58,63+1): return 47.61
    elif occ in range(64,66+1): return 40.52
    elif occ in range(77,84+1): return 41.53
    elif occ == 84:             return 41.53
    elif occ in range(94,96+1): return 38.11
    else:                       return 41.85
    
incdf['hrsworked']=incdf['occ'].apply(lambda x: avgworkhrs02(x))
incdf['inctot'] = incdf['inctot']/incdf['hrsworked']

### DHS
geo_df_2013 = pd.read_csv(dhs_geoclust_2013, encoding='latin_1')
dhs_data_2013 = pd.read_csv(dhs_hhmember_2013, encoding='latin_1')

## Subset geocluster datasets down to relevant variables
geo_keep_cols = ['ADM1DHS','ALT_DEM',"DHSCLUST","MUN","PROV","REG","URBAN_RURA"]
geo_df_2013 = geo_df_2013[geo_keep_cols]

## Merge geodata with DHS data
dhs_data_2013 = dhs_data_2013.merge(geo_df_2013, left_on="hv001", right_on="DHSCLUST", how="left")

### Clean 2013 DHS data

## Convert occupations provided in espanol to ISIC two digit code
## Build conversion dictionary
occonversion = pd.read_excel(dhs_occupations_conversion,encoding='latin_1')
occonversion['isic2digitV3']=occonversion['isic2digitV3'].astype(str)
occonversion['isic2digitV3']=occonversion['isic2digitV3'].apply(lambda x: x.split(','))
occonversion = dict(zip(occonversion['espanol'],occonversion['isic2digitV3']))
occonversion['missing'] = '99'
## Take steps necessary to convert occupations in 2013
dhs_data_2013['sg110'] = dhs_data_2013['sg110'].fillna('missing')
dhs_data_2013['sg110'] = dhs_data_2013['sg110'].apply(lambda x: occonversion[x.rstrip()])

### Convert income to unified period, convert to 2013 USD
## Convert income to correct periodicity, defaults to assuming pay is monthly since it is most common
grosssalary_period_conv = {"monthly":12,'by weekly':26,'weekly':52,'yearly':1,"don't know":12}
frstsourcinc_period_conv = {"monthly":12,'by weekly':26,'weekly':52,'yearly':1,"don't know":12}

dhs_data_2013['sg112a'] = dhs_data_2013['sg112a'].apply(lambda x: x if x != 999998 else 0)
dhs_data_2013['sg112b'] = dhs_data_2013['sg112b'].apply(lambda x: grosssalary_period_conv.get(x,12))
dhs_data_2013['sg117b'] = dhs_data_2013['sg117b'].apply(lambda x: frstsourcinc_period_conv.get(x,12))

## Convert income measured in DR 2013 (at different periods) to weekly 2013 USD
dhs_data_2013['grossalary'] = (dhs_data_2013['sg112a']*dhs_data_2013['sg112b'])/(usd2013todr13pesos*52.0)
dhs_data_2013['frstsourcinc'] = (dhs_data_2013['sg117a']*dhs_data_2013['sg117b'])/(usd2013todr13pesos*52.0)
dhs_data_2013['occinc'] = (dhs_data_2013['singresoo']*12)/(usd2013todr13pesos*52.0)

## Convert weekly income into estimated hourly wage based upon average working hours for each occupation category
## For information on where these numbers come from, please see:
## cafta-dr/DR_Codigos/Input/DRCentralBankAverageHoursWorkedbyOccupation.xls
def avgworkhrs13(occ):
    ## Checks to see if occ is a list
    ## Has to be a better way to do this
    try:
        occ.sort()
        occ = int(occ[0])
    except:
        pass
    
    if occ in range(1,3+1):     return 39.62
    elif occ in range(5,9+1):   return 44.95
    elif occ in range(10,33+1): return 44.23
    elif occ in range(35,39+1): return 43.33
    elif occ in range(41,43+1): return 41.97
    elif occ in range(45,47+1): return 42.57 #Not sure about my translation here
    elif occ in range(55,56+1): return 42.03
    elif occ in range(49,53+1): return 45.38
    elif occ in range(58,63+1): return 45.38
    elif occ in range(64,66+1): return 41.30
    elif occ in range(77,84+1): return 40.70
    elif occ == 84:             return 40.70
    elif occ in range(94,96+1): return 38.49
    else:                       return 41.28

dhs_data_2013['hrsworked'] = dhs_data_2013['sg110'].apply(lambda x: avgworkhrs13(x))
dhs_data_2013['grossalary'] = dhs_data_2013['grossalary']/dhs_data_2013['hrsworked']
dhs_data_2013['frstsourcinc'] = dhs_data_2013['frstsourcinc']/dhs_data_2013['hrsworked']
dhs_data_2013['occinc'] = dhs_data_2013['occinc']/dhs_data_2013['hrsworked']

## Clean up education data
dhs_data_2013['yearsedu']=dhs_data_2013['hv108'].apply(lambda x: x if x != 98 else None)

## Remove entries with null income data   
dhs_data_2013 = dhs_data_2013[dhs_data_2013['grossalary'].astype(str) != 'nan']

## Remove entries with unknown occupations
dhs_data_2013 =  dhs_data_2013[dhs_data_2013['sg110'] != '99']

### Compute survey level averages
grossalary13 = dhs_data_2013['grossalary'].mean()
frstinc13 = dhs_data_2013['frstsourcinc'].mean()
occinc13 = dhs_data_2013['occinc'].mean()
edu13 = dhs_data_2013['yearsedu'].mean()

inc02 = incdf['inctot'].mean()
edu02 = incdf['educdo'].mean()
edu10 = df2010['edu10'].mean()


# In[3]:

## Read in migration table

munmigdf = pd.read_csv(munmigroutput)
munmigdf.drop(['mun','prov'],1,inplace=True)
munmigdf.columns = [rename_columns(a) for a in munmigdf.columns]
migcols = munmigdf.columns
munmigdf['group'] = 1 
munmigdf = munmigdf.groupby('group',as_index=False)[migcols].mean()
munmigdf = pd.wide_to_long(munmigdf,['duty','pop','empop','workagepop'],i='group',j='year').reset_index()
munmigdf.drop('group',1,inplace=True)
munmigdf


# In[4]:

## Create a provincial level summary table

provdf = pd.read_csv(munoutput)
provdf.drop(['mun','occinc13','frstsourcinc13','edu10'],1,inplace=True)
provdf.columns = [rename_columns(a) for a in provdf.columns]
provdf = provdf.groupby('prov',as_index=False).mean()
popdf = pd.read_csv(munmigroutput,encoding='utf-8')
popdf.drop(['mun','duty02','duty10'],1,inplace=True)
popdf.columns = [rename_columns(a) for a in popdf.columns]
popdf = popdf.groupby('prov',as_index=False).sum()
popdf['emprate2002'] = popdf['empop2002']/popdf['workagepop2002']
popdf['emprate2010'] = popdf['empop2010']/popdf['workagepop2010']
popdf.drop(['workagepop2002','workagepop2010'],1,inplace=True)
provdf = provdf.merge(popdf,on='prov',how='left')
## Merge in names of provinces
munnamedf = pd.read_csv(province_names,encoding='utf-8')
munnamedf.columns = [rename_columns(a) for a in munnamedf.columns]
munnamedf = munnamedf[['prov','Province']]
munnamedf = munnamedf.groupby('prov',as_index=False).first()
provdf = provdf.merge(munnamedf,on='prov',how='left')
provdf = provdf[['prov','Province']+sorted(list(provdf.columns)[1:-1])]
provdf['Province'] = provdf['Province'].apply(lambda x: remove_accents(x).title())

provdf1 = provdf[['Province','duty2002','duty2013','edu2002','edu2013','pop2002']]
provdf2 = provdf[['Province','emprate2002','emprate2010','income2002',
                  'income2013','pop2010']]

provdf1.to_latex(provsumtable1, escape=False, index=False)
provdf2.to_latex(provsumtable2, escape=False, index=False)


# In[5]:

## Summary table at the municipality level, used temporarily

mundf = pd.read_csv(munoutput)
mundf.drop(['prov','occinc13','grossalary13'],1,inplace=True)
mundf['group'] = 1 

mundf.columns = [rename_columns(a) for a in mundf.columns]
mundf = mundf.groupby('group',as_index=False)[mundf.columns].mean()
mundf = pd.wide_to_long(mundf,['duty','income','edu'],i='group',j='year').reset_index()
mundf.drop(['group','mun'],1,inplace=True)



# In[6]:

## Summary table at the municipality level

munoccdf = pd.read_csv(munoccoutput)
munoccdf.drop(['munocc','occ','occinc13','grossalary13','nontraded','firmconc02','firmconc10'],1,inplace=True)
munoccdf['group'] = 1 

munoccdf.columns = [rename_columns(a) for a in munoccdf.columns]
munoccdf = munoccdf.groupby('group',as_index=False)[munoccdf.columns].mean()
munoccdf = pd.wide_to_long(munoccdf,['duty','income','employment','edu'],i='group',j='year').reset_index()
munoccdf.drop('group',1,inplace=True)

## Adds variables calculated at the survey level. May want to take a more sophisicated approach here.
munoccdf.loc[0,'edu'] = edu02
munoccdf.loc[1,'edu'] = edu10
munoccdf.loc[2,'edu'] = edu13
munoccdf.loc[0,'income'] = inc02
munoccdf.loc[2,'income'] = frstinc13
munoccdf.loc[0,'duty'] = mundf.loc[0,'duty']
munoccdf.loc[2,'duty'] = mundf.loc[1,'duty']
munoccdf['pop']=munmigdf['pop']
munoccdf['empop']=munmigdf['empop']
munoccdf.drop('employment',1,inplace=True)

munoccdf.to_latex(summarytable, escape=False, index=False)
munoccdf

