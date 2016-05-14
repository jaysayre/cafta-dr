
# coding: utf-8

# Jay Sayre - sayrejay (at) Gmai|,
# 
# Purpose: 
# 
# Used to take HS6 tariff data from the WTO, provided in seperate excel files, and merge into one csv file, and take the already processed CAFTA-DR treaty categories (DRTariff.csv created using CAFTAtariffschedulecleaning.py), and compute estimated Dominican tariffs on U.S. imports for 2007-on. Then, the script merges together the WTO and CAFTA treaty data.
# 
# INPUTS - 
# 
# "Tariffs/HS6/" - folder containing WTO tariff database excel files from 1996-2014 at the Harmonized System six digit level
# 
# "Tariff Conversion/HS2002 to HS1996.xls" - from unstats.un.org/unsd/trade/conversions/
# 
# "Treaties/DRTariff.csv" - cleaned CAFTA treaty data, processed using CAFTAtariffschedulecleaning.py
# 
# INTERMEDIATE DATA - 
# "Treaties/Intermediate_Data/DRTariffallyears.csv" - Estimated cafta duties for each harmonized system 8 digit code based upon duty phase-out information in CAFTA treaty document
# 
# 'TariffsCombined.csv' - Merged WTO tariff database files, tariffs provided in HS2002 system converted to HS1996
# 
# 'Treaties/Intermediate_Data/Tariffsagg.csv' - Estimated CAFTA-DR duties (i.e. 2007-present) for each harmonized system 6 digit code
# 
# OUTPUT - 
# "cafta-dr/Output/wtoandcaftahstariff.csv" - HS6 level tariff data
# from 1996-2015 from both WTO data and CAFTA treaty text
# 
# "cafta-dr/Output/tariffhs2.csv" - HS2 level tariff data
# from 1996-2015 from both WTO data and CAFTA treaty text
# 

# In[1]:

import os 
import pandas as pd
import string
import xlrd
import csv
from openpyxl import load_workbook
## If this throws an error, run pip install unidecode at cmd line
from unidecode import unidecode 

if os.name == 'nt':
    tdir = "D:/Dropbox/Dropbox (Personal)/College/DR_Paper/"
    
else:
    tdir ="/home/j/Dropbox/College/DR_Paper/"
    
# Directory containing yearly HS6 tariffs for the Dominican Republic
wtohs6dir = tdir+"Tariffs/HS6/" 
    
## INPUTS
hs02to96 = tdir + 'cafta-dr/Tariff_Conversion/HS2002-HS1996/HS2002 to HS1996.xls' # Conversion table
## Processed by CAFTAtariffschedulecleaning.py
rawcaftadata = tdir+"cafta-dr/Treaties/Intermediate_Data/DRTariff.csv" 

## INTERMEDIATE DATA
## Calculates estimated CAFTA duty from 2007-2015 at HS8 level
caftadutyhs8 = tdir+"cafta-dr/Treaties/Intermediate_Data/DRTariffallyears.csv"
wtotariffscombined = wtohs6dir+'TariffsCombined.csv' #Merged WTO data
tariffsagg =tdir+'cafta-dr/Treaties/Intermediate_Data/Tariffsagg.csv' #Estimated CAFTA duty at hs6 level

## OUTPUTS
wtoandcaftaoutput = tdir+"cafta-dr/Output/wtoandcaftahstariff.csv"
tariffhs2 = tdir+"cafta-dr/Output/tariffhs2.csv"


# In[2]:

# Build tariff conversion dictionary from HS 1996 to HS 2002
texcelfile = pd.ExcelFile(hs02to96)
tcdf = texcelfile.parse("Conversion Table",header=1,
                        converters={'HS 2002': lambda x: str(x),
                                    'HS 1996': lambda x: str(x)})


tconv = dict(zip(tcdf['HS 2002'],tcdf['HS 1996']))
tconv.update({'710820':'710820','711890':'711890','070513':'070513',
             '090510':'090510','090590':'090590','090710':'090710',
             '090790':'090790','121290':'121290','200999':'200999',
             '293490':'293490','370192':'370192','390312':'390312',
             '620362':'620362','701091':'701091','701092':'701092',
             '701093':'701093','701094':'701094','731430':'731430',
             '851740':'851740','852840':'852840'})
hs6 = list(tcdf['HS 1996'].unique())
hs6.extend(['711890','710820'])

#HS6 WTO Tariff Data
maindf = pd.DataFrame(hs6, columns=['HS6'])
maindf['DutyCode'] = "02'"

for path, dirs, files in os.walk(wtohs6dir):
    for inputfl in sorted(files)[:]:
        if '.xls' in inputfl:
            year = inputfl.split('_')[0]
            if int(year) < 2007:
                excelfile = pd.ExcelFile(wtohs6dir+inputfl)
                df = excelfile.parse("DutyDetails")

                dropcols = [u'Base Nomenclature',u'Query Name',u'Classification',u'Reporter',u'Reporter Code',
                            u'Partner',u'Specific Duty Rate',u'Duty Description',
                            u'Sub Heading',u'Duty National Description',
                           'Minimum Rate','Maximum Rate']
                            #'Number Of Lines',Duty Status','Duty Type/Code']
                df = df.drop(dropcols,1)

                df.columns = [#year+'HSYr',
                              'HS6','DutyCode', 
                              #year+'MinRate',year+'MaxRate',
                              year+'AvgRate', year+'NumLines','DutyStatus']
                
                df['DutyStatus'] = df['DutyStatus'].apply(lambda x: 1 if x=="Dutiable" else 0)
                #df.to_csv(wtohs6dir+inputfl.split('.')[0]+'.csv',index=False)
                df['HS6']=df['HS6'].apply(lambda x: x.replace("'",""))
                                
                #Split table into duty free and dutiable items
                dutyfree = df[df['DutyStatus'] == 0]
                dutyfree = dutyfree.drop([year+'AvgRate','DutyStatus'],1)
                dutyfree.columns = ['HS6', 'DutyCode', year+'DFLines']
                df = df[df['DutyStatus'] == 1]
                df = df.drop(['DutyStatus'],1)
                
                if 2003 <= int(year) < 2007:
                    df['HS6']=df['HS6'].apply(lambda x: tconv[x])
                    dutyfree['HS6']=dutyfree['HS6'].apply(lambda x: tconv[x])
                    
                    comdf = df.groupby(['HS6','DutyCode'], as_index=False)[year+'AvgRate'].mean()
                    linesdf = df.groupby(['HS6','DutyCode'], as_index=False)[year+'NumLines'].sum()
                    df = comdf.merge(linesdf, on=['HS6','DutyCode'], how='left')
                    
                    dutyfree = dutyfree.groupby(['HS6','DutyCode'], as_index=False)[year+'DFLines'].sum()
                
                maindf = maindf.merge(dutyfree, on=['HS6','DutyCode'], how='left')
                maindf = maindf.merge(df, on=['HS6','DutyCode'], how='left')

maindf = maindf.sort(columns=['HS6'])
maindf['HS6'] = maindf['HS6'].apply(lambda x: "'"+str(x))
maindf.to_csv(wtotariffscombined,index=False)    


# In[3]:

# CAFTA-DR Tariff Calculation
caftadf = pd.read_csv(rawcaftadata,encoding="utf-8")

def reductionform(base,numstages,year):
    rbase=base/float(numstages+1)
    return base - (year+1)*rbase

def ctariff(base,year,category):
    if category == "A":
        return 0 # Tariff is now duty free for all years forward
    
    elif category == "B":
        if year < 5:
            return reductionform(base,5,year) # Reduced in 5 equal stages
        else:
            return 0 # Good is duty free by 2012
        
    elif category == "C":
        if year < 10:
            return reductionform(base,10,year) #Reduced in 10 equal stages
        else:
            return 0 # Good is duty free by 2017
    
    elif category == "D":
        if year < 15:
            return reductionform(base,15,year) #Reduced in 15 equal stages
        else:
            return 0 # Good is duty free by 2022
    
    elif category == "G":
        if base != 0:
            raise Exception
        return 0 # Good remains duty free, throw error if not the case
    
    elif category == "M": #NEED TO UNIT TEST THIS
        if year < 2:
            rbase = base*(.02)
            return base - (year+1)*rbase
        elif year < 8:
            rbase = base*(.08)
            return ((.96)*base)-((year-1)*rbase)
        elif year < 10:
            return ((.32)*base)-((year-8)*(.16)*base)
        else:
            return 0 # Good is duty free by 2017
        
    elif category == "N":
        if year < 12:
            return reductionform(base,12,year) #Reduced in 12 equal stages
        else:
            return 0 # Good is duty free by 2019
    
    elif category == "SP":
        return "SP" # Specific conditions outlined in appendix; i.e. quotas
    
    elif category == "V":
        return base # Remains at base rate until 2017, not coding this
        
    elif category == "W":
        if year < 4:
            return reductionform(base,4,year) # Reduced in 4 equal stages
        else:
            return 0 # Good is duty free by 2011
        
    elif category == "X":
        if year == 0:
            return base
        elif year < 5:
            return reductionform(base,4,year-1) # Reduced in 4 equal stages
        else:
            return 0 # Good is duty free by 2012
        
    elif category == "Y": #NEED TO UNIT TEST THIS
        if year < 5:
            rbase = base*(.15)
            return base - (year+1)*rbase
        elif year < 10:
            rbase = base*(.05)
            return ((.25)*base)-((year-4)*rbase)
        else:
            return 0 # Good is duty free by 2017
    
    else:
        raise Exception # Raise exception if category not recognized

for year in range(2007,2015+1):
    caftadf['duty'+str(year)] = 0
    for i in caftadf.index:
        caftadf.loc[i,'duty'+str(year)]=ctariff(caftadf['Base'][i],year-2007,caftadf['Cat'][i])

caftadf['HS1996']=caftadf['HS6'].apply(lambda x: "'"+tconv[x.replace("'","")])
caftadf.to_csv(caftadutyhs8,encoding="utf-8", index=False) 

#Merges together equal HS6 
caftadf = caftadf[caftadf['Cat'] != "SP"]
dropcols = [u'HS8', u'Description',u'Category',u'HS4',u'HS6',u'Cat']
caftadf = caftadf.drop(dropcols,1)

cols = list(caftadf.columns)
cols.remove('HS1996')
for col in cols:
    caftadf[col]=caftadf[col].apply(lambda x: float(x))

caftadf = caftadf.groupby(['HS1996'], as_index=False)[cols].mean()

caftadf.to_csv(tariffsagg,index=False)


# In[4]:

## Merge together WTO provided data and CAFTA DR treaty data
wtocaftadf = maindf.merge(caftadf, left_on='HS6', right_on='HS1996', how='left')
wtocaftadf = wtocaftadf.drop(['HS1996','DutyCode'],1)

cols = list(wtocaftadf.columns)
for col in cols:
    if 'AvgRate' in col:
        wtocaftadf[col] = wtocaftadf[col].apply(lambda x: 0 if str(x)=='nan' else x)

## Clean data to remove 99s and fix abnormally high post-2007 tariffs
## (as in tariffs that were higher than before 2007)
wtocaftadf.loc[360,'duty2013'] = 14
wtocaftadf.loc[363,'duty2013'] = 20
wtocaftadf.loc[215,'duty2013'] = 25
wtocaftadf.loc[216,'duty2013'] = 25
wtocaftadf.loc[529,'duty2013'] = 14
wtocaftadf.loc[530,'duty2013'] = 20
wtocaftadf.loc[531,'duty2013'] = 20
wtocaftadf.loc[532,'duty2013'] = 20
wtocaftadf.loc[430,'2002AvgRate'] = 20 # Went up a year later to 20
wtocaftadf.loc[1604,'2002AvgRate'] = 16.6 # Went up a year later to 16.6
wtocaftadf.loc[1617,'2002AvgRate'] = 5.5  # Went up a year later to 5.5
wtocaftadf.loc[4593,'2002AvgRate'] = 20 # Only labeled 0 in 2002, wierd
wtocaftadf.loc[4736,'2002AvgRate'] = 11.5 # Went up a year later
wtocaftadf.loc[4915,'2002AvgRate'] = 11.5 # Went up a year later

wtocaftadf.to_csv(wtoandcaftaoutput,index=False)


# In[5]:

### Build HS2 level data set for trend analysis
trfhs2df = wtocaftadf
trfhs2df['HS2'] = wtocaftadf['HS6'].apply(lambda x: x[1:3])
lines = [a for a in trfhs2df.columns if 'Lines' in a] 
duties = [a for a in trfhs2df.columns if 'duty' in a] 
trfhs2df.drop(duties, 1, inplace=True)
trfhs2df.drop(lines, 1, inplace=True)
trfhs2df.drop(['HS6','Base'],1, inplace=True)
trfhs2df = trfhs2df.groupby('HS2', as_index=False).mean()
renamcols = [a.replace("AvgRate","") for a in trfhs2df.columns]
trfhs2df.columns = renamcols
trfhs2df = trfhs2df.set_index('HS2').stack().reset_index()
trfhs2df.columns = ['HS2', 'year', 'duty']

trfhs2df.to_csv(tariffhs2,index=False)

