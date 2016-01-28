## Please run extractoneshapefiletopoint.py first!

# Used to convert DHS 2007 and 2013 geo clusters into csvs
##  Inputs: DHS/2007Standard/geo/DRGE52FL.dbf 
##  and DHS/2013Standard/geo/DRGE61FL.dbf

## Outputs: DRGE**FL.csv in each respective folder

import pandas as pd
import pysal as ps
import os

#filedir = "/home/j/Dropbox/College/DR_Paper/DHS/"
filedir = "D:/Dropbox/Dropbox (Personal)/College/DR_Paper/DHS/"

geo2007 = filedir + "2007Standard/geo/DRGE52FL.dbf"
geo2013 = filedir + "2013Standard/geo/DRGE61FL.dbf"
mrg2007 = filedir + "2007Standard/geo/merge2007clust.dbf"
mrg2013 = filedir + "2013Standard/geo/merge2013clust.dbf"

dbffiles = [geo2007, geo2013, mrg2007, mrg2013]
for dbfile in dbffiles:
    output = dbfile[:-4] + '.csv'
    dbf = ps.open(dbfile)
    d = {col: dbf.by_col(col) for col in dbf.header}
    df = pd.DataFrame(d)
    df.to_csv(output, index=False, encoding="utf-8")

