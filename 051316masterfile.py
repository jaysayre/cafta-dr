
# coding: utf-8

# ### Jay Sayre - sayrejay (at) gmai|
# 
# 
# This is the master script for my CAFTA-DR paper. If I end up caring enough, you should be able to simply run this script, which will run the others. If not, this will simply provide a reference for the workflow of my project.

# ### Build correspondence table for IPUMS/DHS municipalities
# There is really no need to replicate this, but is done by
# DR_Cogidos/buildcorrespondence.py
# 
# ### WTO/CAFTA-DR tariff cleaning
# 
# Inputs - Treaties/Treaty_Text (OCR files therein, to duplicate you need to open DRTARIFFSCHEDULE.ods and save it as .xls file)
# 
# CAFTAtariffschedulecleaning.py - Cleans up OCR'ed duty table
# 
# wtoandcaftatariffcleaning.py - Takes WTO HS6 tariff data (provided in separate excel files) and combines it into one dataset. Also takes CAFTA-DR treaty data and computes the expected tariff rate from 2007-on based upon treaty laws.
# 
# 
# ### IPUMS cleaning
# Inputs - IPUMS dataset containing all variables for Dominican Republic
# in both 2002 and 2010
# ../IPUMS/ipumscleaning.py or using modified IPUMS provided do file (modifications are changing the names of some municipalities)
# IPUMSdataaggregation.py
# 
# ### DHS cleaning
# Inputs - DHS datset for 2013 Dominican Republic containing the household member dataset + the geocoding clusters
# 
# DHSmakevariablekey.R - In no way necessary for this process, but makes a csv file for each DHS dataset and dta file, in case you don't have access to Stata
# 
# Run a script to convert dta file to csv's. I believe I used Stata, 
# but one can also use "DHS/DHSexplore.R"
# 
# DHS/extractoneshapefiletopoint.py - Using the python ArcGIS extension, extract ONE municipality polygons/information to DHS geo-clusters, picking which municipality is closest to each cluster
# 
# DHS/dbftodata.py - Script to convert merged geoclust and D.R. municipality shapefiles to usable csvs
# 
# DHSdataaggregation.py
# 
# ### Compute estimate of industrial activity within region
# Inputs - IPUMS estimates of workers in each occupation + Directory of Companies + Establishments provided by Dominican Republic ONE
# 
# compute_regional_employment.py - Computes estimated share of employment in each municipality of the Dominican Republic for a given ISIC code
# 
# 
# ### Compute estimates of average tariffs for a municipality
# Inputs - other than those produced by other scripts, uses a HS -> ISIC correspondence table provided by World Bank
# 
# mergingtariffandindustrydata.py - converts tariff data from HS to ISIC and computes the average tariff for a municipality (if applicable)
# 
# ### Final data cleaning 
# 
# dataassembly.py - Combines various datasets for analysis, produced by earlier scripts
# 
# ### Data Analysis 
# 
# daTAanalysis.R - Main data analysis script, produces main tex tables
# 
# datavisualization.R - Produces main plots and line graphs
# 
# summarystatistics.py - Proudces main summary tables
# 
# cleanuptextable.py - Cleans up tex tables and tikz plots produced by exploratoryanalysis.R and datavisualization.R scripts for paper
# 
# makedominicanrepublicmap.R - Makes GIS plots of variables and saves them to pdf (tikz files are way too big)
# 

# In[ ]:

## Quick script written to automate process
## Note that this does not call all necessary programs to run, see
## documentation above for more information

import subprocess, os

if os.name == 'nt':
    tdir = "D:/Dropbox/Dropbox (Personal)/College/DR_Paper/cafta-dr"    
else:
    tdir ="/home/j/Dropbox/College/DR_Paper/cafta-dr"

scripts = []
for path, dirs, files in os.walk(tdir):
    pth = path.replace(tdir,'')
    if '.git' not in pth and 'checkpoints' not in pth:
        for fl in files:
            if ".py" in fl or ".R" in fl:
                if ".Rhistory" not in fl and ".R~" not in fl:
                    if ".ipynb" not in fl and ".py~" not in fl:
                        scripts.append(pth+'/'+fl)

                       
keywords = ["tariffschedulecleaning","wtoandcafta","ipumscleaning",
           "IPUMSdataaggregation","DHSdataaggregation",
           "compute_regional_employment","mergingtariffandindustrydata",
           "dataassembly","daTAanalysis","datavisualization",
            "summarystatistics", "cleanuptextable","makedominicanrepublicmap"]
            
scripths = [[tdir+fl for fl in scripts if key in fl][0] for key in keywords]

for scripth in scripths:
    if '.R' in scripth:
        subprocess.call(['R', scripth])
    elif '.py' in scripth:
        subprocess.call(['python', scripth])
    else:
        raise Exception

