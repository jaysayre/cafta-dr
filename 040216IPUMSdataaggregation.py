
# coding: utf-8

# ## 012616IPUMSdataaggregation.py - Takes cleaned IPUMS data (cleaned by IPUMS/01182016ipumscleaning.py) and aggregates the variables in the files to the provincial and municipal level, after merging geolevel with universal key
# ### Jay Sayre - sayrejay (at) gm@i|
# 
# 
# ## Inputs: 
# 'IPUMS/ipumsclean.csv' - cleaned IPUMS data  (by 01182016ipumscleaning.ipynb) for DR in 2002 and 2010
# 'DR Codigos/muncorrespondence.csv' - file which provides a correspondence between IPUMS geo2 names and D.R. municipality codes
# 
# usd2013todr02pesos - Nominal conversion rate from 2013 USD to 2002(2003?) RD, times a weighted factor wrt to 
# current 2010 USD (to make this in real terms).
# 
# ## Intermediate Files: 
# 
# 'occupationbymunicipality2002.csv' - IPUMS 2002 information on the share of workers with reported ISIC 2-digit occupation in a given D.R. municipality, used by compute_regional_employment.py
# 
# 'occupationbymunicipality2010.csv'  - IPUMS 2010 information on the share of workers with reported ISIC 2-digit occupation in a given D.R. municipality, used by compute_regional_employment.py
# 
# 
# ## Outputs:
# 
# 'averageincomebymunicipality2002.csv' - IPUMS 2002 information on the average income of workers in the private sector for a given D.R. municipality
# 
# 'averageincomebyoccmun2002.csv' - IPUMS 2002 information on the average income of workers in a given ISIC occupation code for a given D.R. municipality
# 
# 'averageoccincmun2002lowskill.csv' - IPUMS 2002 information on the average income of workers in a given ISIC occupation code for a given D.R. municipality for low skill subsample (less than 9 years of education)
# 
# 'averageoccincmun2002highskill.csv' - IPUMS 2002 information on the average income of workers in a given ISIC occupation code for a given D.R. municipality for high skill subsample (9 years of education or more)
# 

# In[1]:

import pandas as pd
import os

if os.name == 'nt':
    base_dir = "D:/Dropbox/Dropbox (Personal)/College/DR_Paper/"
else:
    base_dir = "/home/j/Dropbox/College/DR_Paper/"

## INPUTS
ipumsinputdata = base_dir+'IPUMS/ipumsclean.csv'
geocodefl = base_dir+'cafta-dr/DR_Codigos/Output/muncorrespondence.csv'


## Conversion rate from 2002 RD to 2013 USD 
usd2013todr02pesos = 18.609825#*(0.975)
## If I feel 2003 exchange rate is more appropriate since survey occured
## on October 19th, 2002
#usd2013todr02pesos = 30.8307083333*(0.975)
### Weighted average of both, come back and find monthly exchange rate
#usd2013todr02pesos = ((18.609825*0.17)+(30.8307083333*0.83))*(0.975)

## INTERMEDIATE DATA
occumunoutput2002 = base_dir+'cafta-dr/Output/IPUMSoccupationbymunicipality2002.csv'
occumunoutput2010 = base_dir+'cafta-dr/Output/IPUMSoccupationbymunicipality2010.csv'
## OUTPUTS
munincoutput = base_dir+'cafta-dr/Output/averageincomebymunicipality2002.csv'
munincoccoutput = base_dir+'cafta-dr/Output/averageincomebyoccmun2002.csv'
losklmunincoccoutput = base_dir+'cafta-dr/Output/averageoccincmun2002lowskill.csv' #(Low skill)
hisklmunincoccoutput = base_dir+'cafta-dr/Output/averageoccincmun2002highskill.csv' #(High skill)

## Read in input files
ipumsdf = pd.read_csv(ipumsinputdata, encoding='utf-8')
geodf = pd.read_csv(geocodefl, encoding='utf-8')

## Merge IPUMS data with geographic key

## Make list of IPUMS names that correspond to more than one municipality
tempc = geodf.set_index('CODIGO')['IPUMS'].to_dict()
codesnames = {}
for a,b in tempc.items():
    if b not in codesnames.keys():
        codesnames[b] = [a]
    else:
        codesnames[b].extend([a])
        
## Manually add "other municipalities" categories
codesnames.update({'Other municipalities in Peravia':[1701,1702],
 'Other municipalities in Monte Plata':[2901,2902,2903,2904,2905],
 'Other municipalities in La Altagracia':[1101,1102],
 'Other municipalities in Duarte':[601,602,603,604,605,606,607],
 'Other municipalities in Maria Trinidad':[1401,1402,1403,1404],
 'Other municipalities in Hermanas Mirabal':[1901,1902,1903],
 'Other municipalities in La Vega':[1301,1302,1303,1304],
 u'Other municipalities in Monse\xf1or Nouel':[2801,2802,2803],
 'Other municipalities in Espaillat':[901,902,903,904],
 'Other municipalities in Puerto Plata':[1801,1802,1803,1804,1805,1806,1807,1808,1809],
 'Other municipalities in Monte Cristi':[1501,1502,1503,1504,1505,1506],
 'Other municipalities in Valverde':[2701,2702,2703],
 'Other municipalities in San Juan':[2201,2202,2203,2204,2205,2206],
 ##Since I can't determine where "El Carril" is, dropping obs from data set 
 #'El Carril':[]
    })
#Drop 'El Carril' observations
withelcarril = len(ipumsdf)
ipumsdf = ipumsdf[ipumsdf["geo2_dox"] != 'El Carril']
print "Number of El Carril observations", withelcarril-len(ipumsdf)

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

## Subset to only workers employed in the private sector
incdf = incdf[incdf['classwk'] == 2]

## Subsetting down to only workers employed in the private sector for 2010
workers2010df = df2010[df2010['classwk'] == 2]


# In[2]:

## Subset data into high skill (years of education greater or equal to 9) and low skill (educational attainment less than 9)
## Before running this process, be sure to change name of output file below to high or low skill respectively
## Also comment out everything except for munoccinc dataset to save to in the last line

#incdf = incdf[incdf['educdo'] >= 9.0] ##high skill
#incdf = incdf[incdf['educdo'] < 9.0] ##low skill


# cols = ['COUNTRY', 'YEAR', 'SAMPLE', 'SERIAL', 'PERSONS', 'HHWT', 'SUBSAMP', 'STRATA', 'URBAN', 'REGIONW', 'GEOLEV1', 'GEO1_DO', 'GEO1_DOX', 'GEO2_DOX', 'SUBRDO', 'AGE', 'SEX', 'NATIVITY', 'BPLCOUNTRY', 'BPLDO', 'YRIMM', 'YRSIMM', 'SCHOOL', 'LIT', 'EDATTAIN', 'EDATTAIND', 'YRSCHOOL', 'EDUCDO', 'EMPSTAT', 'EMPSTATD', 'OCCISCO', 'OCC', 'INDGEN', 'IND', 'CLASSWK', 'CLASSWKD', 'EMPSECT', 'INCTOT', 'MIGRATE5', 'MIGCTRY5', 'MIGDO', 'DISABLED', 'DISEMP']

# In[3]:

### Calculate average income at the municipality level for 2002

## Calculate number of observations for each municipality code originating from each IPUMS geoname 
## Create dict with number of observations from a given municipality for each municipio codigo
munshares = {}
munobs = incdf.groupby('geo2_dox')['year'].count()
munobs = dict(zip(munobs.index,munobs))
for mun in munobs.keys():
    for muncode in codesnames[mun]:
        if muncode in munshares.keys():
            munshares[muncode][mun] = munobs[mun]
        else:
            munshares[muncode] = {mun:munobs[mun]}
            
## Weight municipality according to num of obs from each category
codigos = [str(b) for b in list(geodf['CODIGO'])]
for muncode in munshares.keys():
    if len(munshares[muncode]) == 1:
        munshares[muncode] = [1]
    else:
        othermuns = float(len([a for a in codigos if str(muncode)[:2] in a[:2]]))
        totalcount = 0
        for munname in munshares[muncode].keys():
                if 'Other municipalities' in munname:
                    totalcount += munshares[muncode][munname]/othermuns
                    othermuncount = munshares[muncode][munname]/othermuns
                else:
                    totalcount += munshares[muncode][munname]
                    frstmuncount = munshares[muncode][munname]
        munshares[muncode] = [frstmuncount/totalcount, othermuncount/totalcount]
        
## Quick program to find row according to each municipality
def whereindf(item,dataframe,column='mun'):
    return list(dataframe[column]).index(item)

## Aggregate 2002 variables at the municipality level
colstoagg = ['inctot','educdo']
muninc = incdf.groupby('geo2_dox', as_index=False)[colstoagg].mean()
munincdf = pd.DataFrame({'mun':list(geodf['CODIGO'])+['MEAN']})
for col in colstoagg:
    munincdf[col] = 0
    mundatadict = dict(zip(muninc['geo2_dox'],muninc[col]))
    for municiname in mundatadict.keys():
        for municicode in codesnames[municiname]:
            ## If there's only municipio code corresponding to municipality name, weight that fully
            if len(munshares[municicode]) == 1:
                munincdf.loc[whereindf(municicode,munincdf),col] = mundatadict[municiname]
            else:
                if 'Other municipalities' in municiname:
                    munincdf.loc[whereindf(municicode,munincdf),col] += munshares[municicode][1]*mundatadict[municiname]
                else:
                    munincdf.loc[whereindf(municicode,munincdf),col] += munshares[municicode][0]*mundatadict[municiname]

    munincdf.loc[whereindf('MEAN',munincdf),col] = munincdf[col].mean()

## Municipality code 2508 (Province Santiago, Municipality Puñal) has no corresponding IPUMS municipalities
## So this drops zero entries
munincdf = munincdf[munincdf['inctot'] != 0]


# In[4]:

### Compute average education at the municipality level for 2010  and merge into above data set

colstoagg2010 = ['edu10']
edu2010 = df2010.groupby('geo2_dox', as_index=False)[colstoagg2010].mean()
edu2010df = pd.DataFrame({'mun':list(geodf['CODIGO'])+['MEAN']})
munsinotherdata = list(munincdf['mun'])
for col in colstoagg2010:
    edu2010df[col] = 0
    mundatadict = dict(zip(edu2010['geo2_dox'],edu2010[col]))
    for municiname in mundatadict.keys():
        for municicode in codesnames[municiname]:
            if municicode in munsinotherdata:
                if len(munshares[municicode]) == 1:
                    edu2010df.loc[whereindf(municicode,edu2010df),col] = mundatadict[municiname]
                else:
                    if 'Other municipalities' in municiname:
                        edu2010df.loc[whereindf(municicode,edu2010df),col] += munshares[municicode][1]*mundatadict[municiname]
                    else:
                        edu2010df.loc[whereindf(municicode,edu2010df),col] += munshares[municicode][0]*mundatadict[municiname]

    edu2010df.loc[whereindf('MEAN',edu2010df),col] = edu2010df[col].mean()

munincdf = pd.merge(munincdf,edu2010df, on='mun', how='left')


# In[5]:

### Calculate average income, education at the municipality and occupation level for 2002

colstoagg = ['inctot','educdo']
munoccinc = incdf.groupby(['occ','geo2_dox'], as_index=False)[colstoagg].mean()
munoccinc['mun'] = munoccinc['geo2_dox'].apply(lambda x: codesnames[x])
## Create duplicate entries for each municipality code (note that for each, 'geo2_dox' will differ)
origrows = list(munoccinc.index)
for i in origrows:
    nummuns = len(munoccinc.loc[i,'mun'])
    if nummuns != 1:
        updaterows = []
        for j in range(nummuns)[1:]:
            newrow = dict(munoccinc.loc[i,:])
            newrow['mun']=munoccinc.loc[i,'mun'][j]
            updaterows.append(newrow)
        munoccinc = munoccinc.append(updaterows)
        munoccinc = munoccinc.reset_index()
        munoccinc.drop('index',1,inplace=True)
    
    munoccinc.loc[i,'mun'] = munoccinc.loc[i,'mun'][0]

## Sort on municipality and occupation for testing, don't delete this though
munoccinc.sort_values(['mun','occ'], inplace=True)
munoccinc = munoccinc.reset_index()
munoccinc.drop('index',1,inplace=True)

## Create dict with number of observations for a given municipality code in a certain occupation
munoccinc['munocc'] = munoccinc['mun'].astype(str)+"  "+munoccinc['occ'].astype(str)
munoccobs = munoccinc.groupby('munocc')['geo2_dox'].count()
munoccobs = munoccobs.reset_index()
occandmuncounts = dict(zip(munoccobs['munocc'],munoccobs['geo2_dox']))

## Weight income by munshares dictionary, and then sum on municipality
munoccinc['munocc'] = munoccinc['munocc'].apply(lambda x: occandmuncounts[x])
for i in munoccinc.index:
    if munoccinc.loc[i,'munocc'] != 1:
        for col in colstoagg:
            if 'Other municipalities' in munoccinc.loc[i,'geo2_dox']:
                munoccinc.loc[i,col]=munoccinc.loc[i,col]*munshares[munoccinc.loc[i,'mun']][1]
            else:
                munoccinc.loc[i,col]=munoccinc.loc[i,col]*munshares[munoccinc.loc[i,'mun']][0]
            
munoccinc = munoccinc.groupby(['occ','mun'], as_index=False)[colstoagg].sum()


# In[6]:

### Compute average education at the municipality/occupation level for 2010  and merge into above data set

colstoagg2010 = ['edu10']
eduocc2010df = df2010.groupby(['occ','geo2_dox'], as_index=False)[colstoagg2010].mean()
eduocc2010df['mun'] = eduocc2010df['geo2_dox'].apply(lambda x: codesnames[x])
origrows2010 = list(eduocc2010df.index)
for i in origrows2010:
    nummuns = len(eduocc2010df.loc[i,'mun'])
    if nummuns != 1:
        updaterows = []
        for j in range(nummuns)[1:]:
            newrow = dict(eduocc2010df.loc[i,:])
            newrow['mun']=eduocc2010df.loc[i,'mun'][j]
            updaterows.append(newrow)
        eduocc2010df = eduocc2010df.append(updaterows)
        eduocc2010df = eduocc2010df.reset_index()
        eduocc2010df.drop('index',1,inplace=True)
    
    eduocc2010df.loc[i,'mun'] = eduocc2010df.loc[i,'mun'][0]

## Create dict with number of observations for a given municipality code in a certain occupation
eduocc2010df['munocc'] = eduocc2010df['mun'].astype(str)+"  "+eduocc2010df['occ'].astype(str)
eduocc2010obs = eduocc2010df.groupby('munocc')['geo2_dox'].count()
eduocc2010obs = eduocc2010obs.reset_index()
occandmuncounts2010 = dict(zip(eduocc2010obs['munocc'],eduocc2010obs['geo2_dox']))

## Weight income by munshares dictionary, and then sum on municipality
eduocc2010df['munocc'] = eduocc2010df['munocc'].apply(lambda x: occandmuncounts2010[x])
for i in eduocc2010df.index:
    if eduocc2010df.loc[i,'munocc'] != 1:
        for col in colstoagg2010:
            if 'Other municipalities' in eduocc2010df.loc[i,'geo2_dox']:
                eduocc2010df.loc[i,col]=eduocc2010df.loc[i,col]*munshares[eduocc2010df.loc[i,'mun']][1]
            else:
                eduocc2010df.loc[i,col]=eduocc2010df.loc[i,col]*munshares[eduocc2010df.loc[i,'mun']][0]
            
eduocc2010df = eduocc2010df.groupby(['occ','mun'], as_index=False)[colstoagg2010].sum()    
munoccinc = pd.merge(munoccinc,eduocc2010df, on=['occ','mun'], how='left')


# In[7]:

## Figure out proportion of occupations in each municipality for 2002 data
occudf = pd.DataFrame({'mun':list(geodf['CODIGO'])})
occupationcodes = sorted(incdf['occ'].unique())
## Create columns in dataframe according to each occupation code
for occ in occupationcodes:
    occudf[occ] = 0    
## Construct data set
munocc = incdf.groupby('occ', as_index=False)['geo2_dox'].groups
for occ in occupationcodes:
    for dfindex in munocc[occ]:
        municiname = incdf['geo2_dox'][dfindex]
        for municicode in codesnames[municiname]:
            occudf.loc[whereindf(municicode,occudf),occ] += 1


# In[8]:

## Figure out proportion of occupations in each municipality for 2010 data
## This code is literally a direct copy of code above

occudf2010 = pd.DataFrame({'mun':list(geodf['CODIGO'])})
occodes2010 = sorted(workers2010df['occ'].unique())
## Create columns in dataframe according to each occupation code
for occ in occodes2010:
    occudf2010[occ] = 0    
## Construct data set
munocc2010 = workers2010df.groupby('occ', as_index=False)['geo2_dox'].groups
for occ in occodes2010:
    for dfindex in munocc2010[occ]:
        municiname = workers2010df['geo2_dox'][dfindex]
        for municicode in codesnames[municiname]:
            occudf2010.loc[whereindf(municicode,occudf2010),occ] += 1


# In[9]:

### Write each file to csv
## INTERMEDIATES
occudf.to_csv(occumunoutput2002,index=False) ## Comment this out if creating high/low skill subsample
occudf2010.to_csv(occumunoutput2010,index=False) ## Comment this out if creating high/low skill subsample

## OUTPUTS
munincdf.to_csv(munincoutput,index=False) ## Comment this out if creating high/low skill subsample
munoccinc.to_csv(munincoccoutput,index=False) ## Comment this out if creating high/low skill subsample
#munoccinc.to_csv(hisklmunincoccoutput,index=False) ## Comment this out if creating full sample 
#munoccinc.to_csv(losklmunincoccoutput,index=False) ## Comment this out if creating full sample 

