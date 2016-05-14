
# coding: utf-8

# Inputs: OCR'ed table of DR Tariff Schedule (DRTARIFFSCHEDULE.xls or DRTARIFFSCHEDULE.ods, from DRTARIFFSCHEDULE.pdf)
# 
# Outputs: Cleaned and merged csv table of DR Tariff Schedule (DRTariff.csv) 

# In[35]:

import os 
import pandas as pd
import string
import xlrd
import csv
from openpyxl import load_workbook
from unidecode import unidecode

if os.name == 'nt':
    tdir ="D:/Dropbox/Dropbox (Personal)/College/DR_Paper/cafta-dr/Treaties/"
else:
    tdir ="/home/j/Dropbox/College/DR_Paper/cafta-dr/Treaties/"

## INPUTS
inputfl = tdir+"Treaty_Text/OCR/DRTARIFFSCHEDULE.xls"
## OUTPUTS
outputfl = tdir+"Intermediate_Data/DRTariff.csv"


maindf = pd.DataFrame()
excelfile = pd.ExcelFile(inputfl)

for tab in excelfile.sheet_names[:]:
    df = excelfile.parse(tab)
    droprows = []
    
    for i in reversed(df.index):
        try:
            if str(unidecode(df['Description'][i])) != "nan":
                df.loc[i,'Description'] = df['Description'][i].replace(',',';')
            if str(df['Category'][i]) != "nan":
                df.loc[i,'Category'] = df['Category'][i].replace(',',';')
        except:
            pass
        
        if str(df["HS8"][i]) == "nan":
            droprows.append(i)
            
            try:
                if str(unidecode(df['Description'][i])) != "nan":
                    df.loc[i-1,'Description'] = df['Description'][i-1]+' '+df['Description'][i]
                if str(df['Category'][i]) != "nan":
                    df.loc[i-1,'Category'] = df['Category'][i-1]+' '+df['Category'][i]
            except:
                pass
                    
    for row in droprows:
        df = df.drop(row)
    
    maindf = maindf.append(df)
    
maindf = maindf.drop("Unnamed: 2",1)
cols = ['HS8', 'Description', 'Base', 'Category']
maindf = maindf[cols]

# Check for any missing base tariffs
maindf.index = range(len(maindf))
#for i in maindf.index:
#    if str(maindf['Base'][i]) == "nan":
#        print i
        
maindf.loc[6826,'Base'] = 20
maindf.loc[6832,'Base'] = 20
maindf.loc[950,'HS8']=20092100
maindf.loc[5467,'HS8']=84709020

maindf['HS8'] = maindf['HS8'].apply(lambda x: int(x))
maindf['HS4'] = maindf['HS8'].apply(lambda x: "'0"+str(x)[:3] if len(str(x)) == 7 else "'"+str(x)[:4])
maindf['HS6'] = maindf['HS8'].apply(lambda x: "'0"+str(x)[:5] if len(str(x)) == 7 else "'"+str(x)[:6])
maindf['Cat'] = maindf['Category'].apply(lambda x: "SP" if "Appendix" in x else x)
maindf['Cat'] = maindf['Cat'].apply(lambda x: "D" if "D/1" == x else x)

maindf.to_csv(outputfl,encoding="utf-8",index=False)


# In[14]:

print maindf.groupby('Cat').size()

