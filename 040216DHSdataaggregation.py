
# coding: utf-8

# ## DHSdataaggregation.py - Takes DHS data and aggregates the variables in the files (most importantly income and wage data) to the occupation and municipality level, after making necessary cleaning and merging steps
# 
# ### Jay Sayre - sayrejay (at) gmai|,
# 
# ## Inputs: 
# 
# "../DHS/2013Standard/geo/merge2013clust.csv" - DHS 2013 Dominican Republic geospatial data corresponding to geo-tagged keys in DHS 2013 dataset, compiled by extractoneshapefiletopoint.py
# 
# "../DHS/2013Standard/hhmember/DRPR61FL.csv" - DHS 2013 Dominican Republic Household Member Dataset (converted to csv by DHS/DHSbuild.R script)
# 
# Ditto for DHS 2007 data (don't think I'm using this)
# 
# "/cafta-dr/DHS/DHSoccupationsISIC.xlsx" - Code for converting DHS occupation categories into ISIC occupation codes, compiled by author (me!)
# 
# usd2013todr13pesos - Nominal conversion rate from 2013 USD to 2013 RD, times a weighted factor wrt to 
# current 2010 USD (to make this in real terms).
# 
# ## Outputs: 
# "averageincomebymunicipality2013.csv" - Average income in each D.R. municipality for 2013
# 
# "averageincomebyoccmun2013.csv" - Average income in each D.R. municipality and occupation for 2013
# 
# "averageoccincmun2013highskill.csv" - Average income in each D.R. municipality and occupation for 2013 for high skill subsample (9 years of education or more)
# 
# "averageoccincmun2013lowskill.csv" - Average income in each D.R. municipality and occupation for 2013 for high skill subsample (less than 9 years of education)

# In[1]:

import pandas as pd
import os

if os.name == 'nt':
    base_dir = "D:/Dropbox/Dropbox (Personal)/College/DR_Paper/"
else:
    base_dir = "/home/j/Dropbox/College/DR_Paper/"
    
## INPUTS
dhs_geoclust_2007 = base_dir + "DHS/2007Standard/geo/merge2007clust.csv"
dhs_hhmember_2007 = base_dir + "DHS/2007Standard/hhmember/DRPR52FL.csv" # Converted to csv by DHSbuild.R in  main directory
dhs_geoclust_2013 = base_dir + "DHS/2013Standard/geo/merge2013clust.csv"
dhs_hhmember_2013 = base_dir + "DHS/2013Standard/hhmember/DRPR61FL.csv" # Converted to csv by DHSbuild.R in  main directory
dhs_occupations_conversion = base_dir+"cafta-dr/DHS/DHSoccupationsISIC.xlsx"
## Conversion rate from 2013 RD to 2013 USD 
usd2013todr13pesos = 41.8081439153#*(0.985) ## Later term is so currency is wrt to 2010 constant USD, from World Bank

## OUTPUTS
averageincmun = base_dir + "cafta-dr/Output/averageincomebymunicipality2013.csv" ## Comment this out if creating ho/lo skill subsample
#averageincmun = base_dir + "cafta-dr/Output/deleteme.csv" ## Comment this out if creating full sample
averageincmunocc = base_dir + "cafta-dr/Output/averageincomebyoccmun2013.csv" ## Comment this out if creating ho/lo skill subsample
#averageincmunocc = base_dir+'cafta-dr/Output/averageoccincmun2013highskill.csv' ## Comment this out if creating full sample 
#averageincmunocc = base_dir+'cafta-dr/Output/averageoccincmun2013lowskill.csv' ## Comment this out if creating full sample 


# Takes the DHS geocluster csvs (merged with ONE municipality codes by 091215extractoneshapefiletopoint.py and converted to csvs by 091215dbftodata.py) and merges them with DHS samples
# 
# Number of DHS clusters incorrectly marked in another province: 53

# In[2]:

geo_df_2007 = pd.read_csv(dhs_geoclust_2007)
dhs_data_2007 = pd.read_csv(dhs_hhmember_2007)
geo_df_2013 = pd.read_csv(dhs_geoclust_2013, encoding='latin_1')
dhs_data_2013 = pd.read_csv(dhs_hhmember_2013, encoding='latin_1')
dhs_data_2013.drop('Unnamed: 0',1,inplace=True)

## Subset geocluster datasets down to relevant variables
geo_keep_cols = ['ADM1DHS','ALT_DEM',"DHSCLUST","MUN","PROV","REG","URBAN_RURA"]
geo_df_2007 = geo_df_2007[geo_keep_cols]
geo_df_2013 = geo_df_2013[geo_keep_cols]
## Merge geodata with DHS data
dhs_data_2007 = dhs_data_2007.merge(geo_df_2007, left_on="hv001", right_on="DHSCLUST", how="left")
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
print "Total observations", len(dhs_data_2013['sg110'])
print "Observations with occcupation data", len(dhs_data_2013[dhs_data_2013['sg110'] != '99'])

## Subset down to workers employed in the private sector 
## NOT SURE IF I'M  DOING THIS, BUT I DID IT IN IPUMS DATA 
##Do I want to include the 162 some employers here? 'employer'
print "Observations classified as having a private employer", len(dhs_data_2013[dhs_data_2013['sg111'] == "private employee"])
#dhs_data_2013 = dhs_data_2013[dhs_data_2013['sg111'] == "private employee"] 

### Convert income to unified period, convert to 2013 USD
## Convert income to correct periodicity, defaults to assuming pay is monthly since it is most common
grosssalary_period_conv = {"monthly":12,'by weekly':26,'weekly':52,'yearly':1,"don't know":12}
frstsourcinc_period_conv = {"monthly":12,'by weekly':26,'weekly':52,'yearly':1,"don't know":12}

dhs_data_2013['sg112a'] = dhs_data_2013['sg112a'].apply(lambda x: x if x != 999998 else 0)
dhs_data_2013['sg112b'] = dhs_data_2013['sg112b'].apply(lambda x: float(grosssalary_period_conv.get(x,12)))
dhs_data_2013['sg117b'] = dhs_data_2013['sg117b'].apply(lambda x: float(frstsourcinc_period_conv.get(x,12)))

## Convert income measured in DR 2013 (at different periods) to weekly 2013 USD
dhs_data_2013['grossalary'] = (dhs_data_2013['sg112a']*dhs_data_2013['sg112b'])/(usd2013todr13pesos*52.0)
dhs_data_2013['frstsourcinc'] = (dhs_data_2013['sg117a']*dhs_data_2013['sg117b'])/(usd2013todr13pesos*52.0)
dhs_data_2013['occinc'] = (dhs_data_2013['singresoo']*12)/(usd2013todr13pesos*52.0)

##Check average income numbers for DR and if they match up with GDP P.C.
##2013 -  5,968.7, 2002 - 3,008.5 
#print "Observations with occ. income data", len(dhs_data_2013[dhs_data_2013['occinc'].astype(str) != 'nan'])
#print "Observations with salary data", len(dhs_data_2013[dhs_data_2013['grossalary'].astype(str) != 'nan'])
#print "Observations with first source of inc.", len(dhs_data_2013[dhs_data_2013['frstsourcinc'].astype(str) != 'nan'])

print dhs_data_2013['occinc'].mean()
print dhs_data_2013['grossalary'].mean()
print dhs_data_2013['frstsourcinc'].mean()

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


# In[3]:

## Subset data into high skill (years of education greater or equal to 9) and low skill (educational attainment less than 9)
## Before running this process, be sure to change name of output file above to high or low skill respectively

#dhs_data_2013 = dhs_data_2013[dhs_data_2013['yearsedu'] >= 9] ## high skill
#dhs_data_2013 = dhs_data_2013[dhs_data_2013['yearsedu'] < 9] ## low skill


# In[4]:

### Clean 2007 DHS data

## 2007 income data

#['gs21a'] salary
#['gs21b'] periodicitiy
#gs27a - frst source of income
#gs27b - periodicity
#ingoo - occupational income

### Convert occupations - TO DO

### Convert income to unified period, convert to 2013 USD
## Convert income to correct periodicity, defaults to assuming pay is monthly since it is most common
#dhs_data_2007['gs21b'].unique()


# In[5]:

def codigo(prov):
    prov = str(prov)
    if len(prov) == 1:
        return '0'+prov
    else:
        return prov

## Remove entries with null income data   
# dhs_data_2007 = dhs_data_2007[dhs_data_2007['ingoo'].astype(str) != 'nan']
dhs_data_2013 = dhs_data_2013[dhs_data_2013['grossalary'].astype(str) != 'nan']
columnstoaggregate = ['grossalary','occinc','frstsourcinc','yearsedu']

## Remove entries with unknown occupations
## Once you subset down to only entries with income data, this only reduces entries by 57 or so 
print "Number of N/A occupations:", len(dhs_data_2013)-len(dhs_data_2013[dhs_data_2013['sg110'] != '99'])
dhs_data_2013 =  dhs_data_2013[dhs_data_2013['sg110'] != '99']

## Aggregate income, other variables at the municipality level
### COULD SUBSET THIS DOWN TO ONLY ENTRIES WITH OCCUPATION DATA, AS BELOW
muninc2013 = dhs_data_2013.groupby(['PROV','MUN'], as_index=False)[columnstoaggregate].mean()
muninc2013['PROV'] = muninc2013['PROV'].astype(str)
muninc2013['MUN'] = muninc2013['MUN'].apply(lambda x: codigo(x))
muninc2013['CODIGO'] = muninc2013['PROV']+muninc2013['MUN']
muninc2013.to_csv(averageincmun, index=False)

## Aggregate income at the municipality and occupation level
## Duplicate rows into different occupation categories
dhs_data_2013 = dhs_data_2013.reset_index()
dhs_data_2013.drop('index',1,inplace=True)
origrows = list(dhs_data_2013.index)
for i in origrows:
    numisics = len(dhs_data_2013.loc[i,'sg110'])
    if numisics != 1:
        updaterows = []
        for j in range(numisics)[1:]:
            newrow = dict(dhs_data_2013.loc[i,:])
            newrow['sg110']=dhs_data_2013.loc[i,'sg110'][j]
            updaterows.append(newrow)
        
        dhs_data_2013 = dhs_data_2013.append(updaterows)
        dhs_data_2013 = dhs_data_2013.reset_index()
        dhs_data_2013.drop('index',1,inplace=True)
    
    dhs_data_2013.loc[i,'sg110'] = dhs_data_2013.loc[i,'sg110'][0]

dhs_data_2013 = dhs_data_2013.groupby(['PROV','MUN','sg110'], as_index=False)[columnstoaggregate].mean()
dhs_data_2013['PROV'] = dhs_data_2013['PROV'].astype(str)
dhs_data_2013['MUN'] = dhs_data_2013['MUN'].apply(lambda x: codigo(x))
dhs_data_2013['CODIGO'] = dhs_data_2013['PROV']+dhs_data_2013['MUN']
dhs_data_2013.to_csv(averageincmunocc, index=False)

