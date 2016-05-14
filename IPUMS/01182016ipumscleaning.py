
# coding: utf-8

# ## IPUMScleaning.py
# ### Jay Sayre - sayrejay (at) gmai| 
# 
# Cleans up the IPUMS provided .dta file and converts it to a useable csv

# In[7]:

import pandas as pd
import unicodedata
import os

if os.name == 'nt':
    tdir = "D:/Dropbox/Dropbox (Personal)/College/DR_Paper/"
else:
    tdir = "/home/j/Dropbox/College/DR_Paper/"

def deaccent(word):
    return unicodedata.normalize('NFKD', word).encode('ascii', 'ignore')

inputfl = tdir + 'IPUMS/ipumsi_00007.csv'
outputfl = tdir + 'IPUMS/ipumsclean.csv'


# In[8]:

## Used to clean IPUMS input data. 
## Not sure if this is better to do in Stata
## If you want to use Stata, use zip file ipumsi_00008.dta

#df = pd.read_stata(tdir+inputfl)#, encoding='utf-8')
df = pd.read_csv(inputfl)

#cols = ['cntry','year','sample','serial','persons','wthh','subsamp',
#'GEOLEV1','GEO1A_DO','GEO1B_DO','GEO2B_DO','subrdo','ownrshp',
#'remitt','hhtype','famunit','famsize','nchild','relate', 'age',
#'sex','nativty','bplctry','bpldo','yrimm','yrsimm','school',
#'lit','edattan','yrschl','empstat','empstatd','occisco','occ',
#'ind','indgen','classwk','classwkd','empsect','inctot','incwage','MGCTRY2',
#'migdo','disemp']

cols = ['COUNTRY', 'YEAR', 'SAMPLE', 'SERIAL', 'PERSONS', 'HHWT',
       'SUBSAMP', 'STRATA', 'URBAN', 'REGIONW', 'GEOLEV1', 'GEO1_DO',
       'GEO1_DOX', 'GEO2_DOX', 'SUBRDO', 'AGE', 'SEX', 'NATIVITY', 
       'BPLCOUNTRY', 'BPLDO', 'YRIMM', 'YRSIMM', 'SCHOOL', 'LIT', 
       'EDATTAIN', 'EDATTAIND', 'YRSCHOOL', 'EDUCDO', 'EMPSTAT', 
       'EMPSTATD', 'OCCISCO', 'OCC', 'INDGEN', 'IND', 'CLASSWK', 
       'CLASSWKD', 'EMPSECT', 'INCTOT', 'MIGRATE5', 'MIGCTRY5', 
       'MIGDO', 'DISABLED', 'DISEMP']

mcode = {"101":"Santo Domingo de Guzman","201":"Azua and Pueblo Viejo",
           "204":"Padre las Casas and Sabana Yegua",
           "205":
           "Peralta, Las Charcas, Palmar de Ocoa, Villarpando, and  Estebanía",
           "208":"Tábara Arriba, Las Yayas de Viajama, and Guayabal",
           "213":"Puerto Viejo","214":"Jose Trujillo Valdez",
           "301":"Neiba, Galvan, Villa Jaragua, and Los Ríos",
           "306":"Uvilla, Tamayo, and El Palmar",
           "401":"Barahona, La Cienaga, El Peñon, Pescadería and Fundación",
           "402":"Cabral, Las Salinas, El Cachón, and Polo",
           "404":"Paraiso and Enriquillo",
           "405":"Vicente Noble, Canoa and Jaquimeyes",
           "501":"Dajabón",
           "502":"Loma de Cabrera, Partido, Restauración, and El Pino",
           "601":"San Francisco de Macorís",
           "603":"Castillo and Eugenio María de Hostos",
           "604":"Pimentel and Las Guáranas","605":"Villa Riva and Arenoso",
           "609":"Other municipalities in Duarte",
           "701":"Comendador, Banica, and Pedro Santana",
           "704":"Hondo Valle, Juan Santiago, and El Llano","801":"El Seibo",
           "802":"Miches and Pedro Sánchez","901":"Moca and Cayetano Germosén",
           "903":"Gaspar Hernández and Jamao al Norte",
           #"909":"Moca and Cayetano Germosén",
           "909":"Other municipalities in Espaillat",
           "1000":"Municipalities in Independencia province","1101":"Higüey",
           "1102":"San Rafael del Yuma",
           #"1109":"Higüey",
           "1109":"Other municipalities in La Altagracia",
           "1201":"La Romana and Guaymate","1203":"Villa Hermosa",
           "1301":"La Vega",
           "1302":"Constanza","1303":"Jarabacoa","1304":"Jima Abajo",
           "1309":"Other municipalities in La Vega","1401":"Nagua",
           "1402":"Cabrera and Río San Juan","1403":"El Factor",
           "1409":"Other municipalities in Maria Trinidad",
           "1501":"Monte Cristi and Pepillo Salcedo",
           "1502":"Castañuelas and Villa Vásquez",
           "1503":"Guayubín and Las Matas de Santa Cruz",
           #"1509":"Monte Cristi and Pepillo Salcedo",
           "1509":"Other municipalities in Monte Cristi",
           "1600":"Municipalities in Pedernales Province","1701":"Baní",
           "1702":"Nizao",#"1709":"Baní",
           "1709":"Other municipalities in Peravia",
           "1801":"Puerto Plata","1802":"Altamira and Guananico",
           "1804":"Imbert",
           "1806":"Villa Isabela, Los Hidalgos, and Luperón",
           "1807":"Sosúa and Villa Montellano",
           "1810":"Other municipalities in Puerto Plata","1901":"Salcedo",
           "1902":"Tenares","1903":"Villa Tapia",
           #"1909":"Salcedo",
           "1909":"Other municipalities in Hermanas Mirabal",
           "2001":"Samaná",
           "2002":"Sánchez and  Las Terrenas","2101":"San Cristóbal",
           "2102":"Sabana Grande de Palenque and Los Cacaos",
           "2103":"Bajos de Haina",
           "2104":"Cambita Garabitos","2105":"Villa Altagracia",
           "2106":"Yaguate",
           "2107":"San Gregorio de Nigua",
           "2109":"El Carril", # Feel like this one is a coding error
           "2201":"San Juan, Juan de Herrera, and Bohechío",
           "2203":"El Cercado and Vallejuelo","2205":"Las Matas de Farfán",
           "2209":"Other municipalities in San Juan",
           "2301":"San Pedro de Macorís and Ramón Santana",
           "2302":"Los Llanos, Quisqueya, and Guayacanes",
           #"2309":"San Juan, Juan de Herrera, and Bohechío",
           "2309":"Other municipalities in San Pedro de Macorís",
           "2401":"Cotuí and Cevicos","2403":"Fantino",
           "2404":"La Mata and La Cueva",
           "2501":"Santiago","2502":"Bisonó","2503":"Jánico and Sabana Iglesia",
           "2504":"Licey Al Medio","2505":"San José de las Matas",
           "2506":"Tamboril", "2507":"Villa González","2508":"Puñal",
           "2509":"Other municipalities in Santiago",
           "2600":"Municipalities in Santiago Rodríguez province",
           "2701":"Mao",
           "2702":"Esperanza","2703":"Laguna Salada and La Caya",
           #"2709":"Mao",
           "2709":"Other municipalities in Valverde",
           "2801":"Bonao",
           "2803":"Piedra Blanca and Maimón",
           "2809":"Other municipalities in Monseñor Nouel","2901":"Monte Plata",
           "2902":"Bayaguana","2903":"Sabana Grande de Boya","2904":"Yamasá",
           "2905":"Peralvillo",
           #"2909":"Monte Plata",
           "2909":"Other municipalities in Monte Plata",
           "3001":"Hato Mayor and Yerba Buena",
           "3009":"Other municipalities in Hato Mayor",
           "3101":"San José de Ocoa and La Cienaga (San José de Ocoa)",
           "3109":"Other municipalities in San José de Ocoa",
           "3201":"Santo Domingo Este","3202":"Santo Domingo oeste",
           "3203":"Santo Domingo Norte","3204":"Boca Chica",
           "3205":"San Antonio de Guerra","3206":"Los Alcarrizos",
           "3207":"Pedro Brand",
           #"3208":"La Victoria"  ## Changed to Santo Domingo  Norte
           "3208":"Santo Domingo Norte"}

df = df[cols]
cols = [item.lower() for item in cols]
df.columns = cols
df['geo2_dox'] = df['geo2_dox'].astype(str)
df['geo2_dox'] = df['geo2_dox'].apply(lambda x: mcode[x])

df.to_csv(tdir+outputfl, encoding='utf8', index=False)


# In[4]:

## Check number of observations in each year
print df.groupby('year').size()

