
# coding: utf-8

# cleanuptextable.py
# Jay Sayre - sayrejay (at) gmai|
# 
# Written to clean up tex (and tikz) output tables produced by R (namely, by the scripts datavisualization.R and exploratoryanalysis.R) so I can rerun regressions and quickly have my tables in the right format for putting them directly in my paper

# In[6]:

import os

if os.name == 'nt':
    tdir = "D:/Dropbox/Dropbox (Personal)/College/DR_Paper/cafta-dr/Plots/"
    mapdir = "D:/Dropbox/Dropbox (Personal)/College/DR_Paper/cafta-dr/Maps/"
else:
    tdir ="/home/j/Dropbox/College/DR_Paper/cafta-dr/Plots/"
    mapdir ="/home/j/Dropbox/College/DR_Paper/cafta-dr/Maps/"

def repwords(codeline):
    repldict = {'Num. obs.':'N        ','R$^2$':'$R^2$',
               'chngtrf':'Change in tariff','chngwrk':'Change in employment',
               '\begin{table}\n':'','(Intercept)':'Intercept',
               "Change in tariff:":r'$\Delta \log(t+1) \times$',
               "Change in tariff":"$\Delta \log(t+1)$",
               "firmconc":"occupationconc"}
                
    
    for txt in repldict.keys():
        codeline = codeline.replace(txt, repldict[txt])
    return codeline

for fl in os.listdir(tdir):
    if fl.endswith(".tex") and "cleaned" not in fl and "summarytable" not in fl:
        f1 = open(tdir+fl, 'r')
        f2 = open(tdir+'cleaned'+fl, 'w')
        if 'TIKZ' in fl:
            count = 0
            for line in f1:
                count += 1
                if count <= 12:
                    pass
                elif "\end{document}" in line:
                    pass
                else:
                    f2.write(line)
        else:
            count, numcols, fe = 0, 0, 0
            for line in f1:
                count += 1
                if count == 7:
                    numcols = len(line.split('&'))-1
                    f2.write(repwords(line))
                elif "Adj. R" in line:
                    pass
                elif "RMSE" in line:
                    pass
                elif "center" in line:
                    pass
                elif "hline" in line and count >= 9 and fe == 0:
                    f2.write(line.replace("\hline","\hline\nFE          "+
                        numcols*"&                "+"\\\ \n\hline"))
                    fe = 1
                elif "label{table:" in line:
                    pass
                elif "table" in line:
                    pass
                elif "caption" in line:
                    pass
                elif "\multicolumn" in line:
                    f2.write(line.replace("}}",", Clustered-robust standard errors in parentheses}}"))
                else:
                    f2.write(repwords(line))

        f1.close()
        os.remove(tdir+fl)
        f2.close()

for fl in os.listdir(mapdir):
    if fl.endswith(".tex") and "cleaned" not in fl and "summarytable" not in fl:
        f1 = open(mapdir+fl, 'r')
        f2 = open(mapdir+'cleaned'+fl, 'w')
        count = 0
        for line in f1:
            count += 1
            if count <= 12:
                pass
            elif "\end{document}" in line:
                pass
            else:
                f2.write(line)

        f1.close()
        os.remove(mapdir+fl)
        f2.close()


# In[ ]:



