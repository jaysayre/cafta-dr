* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

set more off

clear
quietly infix                  ///
  int     country     1-3      ///
  int     year        4-7      ///
  double  sample      8-16     ///
  double  serial      17-26    ///
  int     persons     27-29    ///
  float   hhwt        30-37    ///
  byte    subsamp     38-39    ///
  double  strata      40-51    ///
  byte    urban       52-52    ///
  byte    regionw     53-54    ///
  long    geolev1     55-60    ///
  long    geo1_do     61-66    ///
  byte    geo1_dox    67-68    ///
  int     geo2_dox    69-72    ///
  byte    subrdo      73-74    ///
  byte    ownership   75-75    ///
  int     ownershipd  76-78    ///
  byte    intmig1     79-80    ///
  byte    remitt      81-81    ///
  byte    electric    82-82    ///
  byte    watsup      83-84    ///
  byte    sewage      85-86    ///
  byte    fuelcook    87-88    ///
  byte    phone       89-89    ///
  byte    cell        90-90    ///
  byte    internet    91-91    ///
  byte    trash       92-93    ///
  byte    autos       94-94    ///
  byte    aircon      95-96    ///
  byte    computer    97-97    ///
  byte    washer      98-98    ///
  byte    refrig      99-99    ///
  byte    tv          100-101  ///
  byte    radio       102-102  ///
  byte    rooms       103-104  ///
  byte    bedrooms    105-106  ///
  byte    kitchen     107-108  ///
  byte    toilet      109-110  ///
  int     floor       111-113  ///
  int     wall        114-116  ///
  byte    roof        117-118  ///
  byte    hhtype      119-120  ///
  byte    nfams       121-121  ///
  byte    ncouples    122-122  ///
  byte    nmothers    123-123  ///
  byte    nfathers    124-124  ///
  int     headloc     125-127  ///
  int     pernum      128-130  ///
  float   perwt       131-138  ///
  byte    relate      139-139  ///
  int     related     140-143  ///
  int     age         144-146  ///
  byte    age2        147-148  ///
  byte    sex         149-149  ///
  byte    marst       150-150  ///
  int     marstd      151-153  ///
  byte    consens     154-154  ///
  int     birthyr     155-158  ///
  byte    birthmo     159-160  ///
  byte    nativity    161-161  ///
  long    bplcountry  162-166  ///
  int     bpldo       167-170  ///
  int     yrimm       171-174  ///
  byte    yrsimm      175-176  ///
  byte    yrsimm2     177-177  ///
  byte    school      178-178  ///
  byte    lit         179-179  ///
  byte    edattain    180-180  ///
  int     edattaind   181-183  ///
  byte    yrschool    184-185  ///
  int     educdo      186-188  ///
  byte    leftsch     189-190  ///
  byte    empstat     191-191  ///
  int     empstatd    192-194  ///
  byte    occisco     195-196  ///
  int     occ         197-200  ///
  int     indgen      201-203  ///
  long    ind         204-208  ///
  byte    classwk     209-209  ///
  int     classwkd    210-212  ///
  byte    empsect     213-214  ///
  long    inctot      215-221  ///
  byte    migrate5    222-223  ///
  long    migctry5    224-228  ///
  int     migdo       229-232  ///
  byte    disabled    233-233  ///
  byte    disemp      234-234  ///
  byte    disblnd     235-235  ///
  byte    disdeaf     236-236  ///
  byte    dismute     237-237  ///
  byte    dislowr     238-238  ///
  byte    disuppr     239-239  ///
  byte    dismntl     240-240  ///
  byte    dispsyc     241-241  ///
  byte    disorig     242-243  ///
  using `"ipumsi_00008.dat"'

replace hhwt       = hhwt       / 100
replace perwt      = perwt      / 100

format sample     %9.0f
format serial     %10.0f
format hhwt       %8.2f
format strata     %12.0f
format perwt      %8.2f

label var country    `"Country"'
label var year       `"Year"'
label var sample     `"IPUMS sample identifier"'
label var serial     `"Household serial number"'
label var persons    `"Number of person records in the household"'
label var hhwt       `"Household weight"'
label var subsamp    `"Subsample number"'
label var strata     `"Strata identifier"'
label var urban      `"Urban-rural status"'
label var regionw    `"Continent and region of country"'
label var geolev1    `"1st subnational geographic level, world [consistent boundaries over time]"'
label var geo1_do    `"Dominican Republic, Province 1960 - 2010 [Level 1; consistent boundaries, GIS]"'
label var geo1_dox   `"Dominican Republic, Province 1960 - 2010 [Level 1; inconsistent boundaries, harm"'
label var geo2_dox   `"Dominican Republic, Municipality 1960 - 2010 [Level 2; inconsistent boundaries, "'
label var subrdo     `"Dominican Republic, Subregions"'
label var ownership  `"Ownership of dwelling [general version]"'
label var ownershipd `"Ownership of dwelling [detailed version]"'
label var intmig1    `"Number of international migrants"'
label var remitt     `"Receives remittances"'
label var electric   `"Electricity"'
label var watsup     `"Water supply"'
label var sewage     `"Sewage"'
label var fuelcook   `"Cooking fuel"'
label var phone      `"Telephone availability"'
label var cell       `"Cellular phone availability"'
label var internet   `"Internet access"'
label var trash      `"Trash disposal"'
label var autos      `"Automobiles available"'
label var aircon     `"Air conditioning"'
label var computer   `"Computer"'
label var washer     `"Clothes washing machine"'
label var refrig     `"Refrigerator"'
label var tv         `"Television set"'
label var radio      `"Radio in household"'
label var rooms      `"Number of rooms"'
label var bedrooms   `"Number of bedrooms"'
label var kitchen    `"Kitchen or cooking facilities"'
label var toilet     `"Toilet"'
label var floor      `"Floor material"'
label var wall       `"Wall or building material"'
label var roof       `"Roof material"'
label var hhtype     `"Household classification"'
label var nfams      `"Number of families in household"'
label var ncouples   `"Number of married couples in household"'
label var nmothers   `"Number of mothers in household"'
label var nfathers   `"Number of fathers in household"'
label var headloc    `"Head's location in household"'
label var pernum     `"Person number"'
label var perwt      `"Person weight"'
label var relate     `"Relationship to household head [general version]"'
label var related    `"Relationship to household head [detailed version]"'
label var age        `"Age"'
label var age2       `"Age, grouped into intervals"'
label var sex        `"Sex"'
label var marst      `"Marital status [general version]"'
label var marstd     `"Marital status [detailed version]"'
label var consens    `"Consensual union"'
label var birthyr    `"Year of birth"'
label var birthmo    `"Month of birth"'
label var nativity   `"Nativity status"'
label var bplcountry `"Country of birth"'
label var bpldo      `"Municipality of birth, Dominican Republic"'
label var yrimm      `"Year of immigration"'
label var yrsimm     `"Years since immigrated"'
label var yrsimm2    `"Years since immigrated, categorized"'
label var school     `"School attendance"'
label var lit        `"Literacy"'
label var edattain   `"Educational attainment, international recode [general version]"'
label var edattaind  `"Educational attainment, international recode [detailed version]"'
label var yrschool   `"Years of schooling"'
label var educdo     `"Educational attainment, DominicanRepublic"'
label var leftsch    `"Reason for leaving school"'
label var empstat    `"Activity status (employment status) [general version]"'
label var empstatd   `"Activity status (employment status) [detailed version]"'
label var occisco    `"Occupation, ISCO general"'
label var occ        `"Occupation, unrecoded"'
label var indgen     `"Industry, general recode"'
label var ind        `"Industry, unrecoded"'
label var classwk    `"Status in employment (class of worker) [general version]"'
label var classwkd   `"Status in employment (class of worker) [detailed version]"'
label var empsect    `"Sector of employment"'
label var inctot     `"Total income"'
label var migrate5   `"Migration status, 5 years"'
label var migctry5   `"Country of residence 5 years ago"'
label var migdo      `"Municipality of residence 5 years ago, Dominican Republic"'
label var disabled   `"Disability status"'
label var disemp     `"Employment disability"'
label var disblnd    `"Blind or vision-impaired"'
label var disdeaf    `"Deaf or hearing-impaired"'
label var dismute    `"Mute or speech impaired"'
label var dislowr    `"Disability affecting lower extremities"'
label var disuppr    `"Disability affecting upper extremities"'
label var dismntl    `"Mental disability"'
label var dispsyc    `"Psychological disability"'
label var disorig    `"Origin of disability"'

label define country_lbl 032 `"Argentina"'
label define country_lbl 051 `"Armenia"', add
label define country_lbl 040 `"Austria"', add
label define country_lbl 050 `"Bangladesh"', add
label define country_lbl 112 `"Belarus"', add
label define country_lbl 068 `"Bolivia"', add
label define country_lbl 076 `"Brazil"', add
label define country_lbl 854 `"Burkina Faso"', add
label define country_lbl 116 `"Cambodia"', add
label define country_lbl 120 `"Cameroon"', add
label define country_lbl 124 `"Canada"', add
label define country_lbl 152 `"Chile"', add
label define country_lbl 156 `"China"', add
label define country_lbl 170 `"Colombia"', add
label define country_lbl 188 `"Costa Rica"', add
label define country_lbl 192 `"Cuba"', add
label define country_lbl 214 `"Dominican Republic"', add
label define country_lbl 218 `"Ecuador"', add
label define country_lbl 818 `"Egypt"', add
label define country_lbl 222 `"El Salvador"', add
label define country_lbl 231 `"Ethiopia"', add
label define country_lbl 242 `"Fiji"', add
label define country_lbl 250 `"France"', add
label define country_lbl 276 `"Germany"', add
label define country_lbl 288 `"Ghana"', add
label define country_lbl 300 `"Greece"', add
label define country_lbl 324 `"Guinea"', add
label define country_lbl 332 `"Haiti"', add
label define country_lbl 348 `"Hungary"', add
label define country_lbl 356 `"India"', add
label define country_lbl 360 `"Indonesia"', add
label define country_lbl 364 `"Iran"', add
label define country_lbl 368 `"Iraq"', add
label define country_lbl 372 `"Ireland"', add
label define country_lbl 376 `"Israel"', add
label define country_lbl 380 `"Italy"', add
label define country_lbl 388 `"Jamaica"', add
label define country_lbl 400 `"Jordan"', add
label define country_lbl 404 `"Kenya"', add
label define country_lbl 417 `"Kyrgyz Republic"', add
label define country_lbl 430 `"Liberia"', add
label define country_lbl 454 `"Malawi"', add
label define country_lbl 458 `"Malaysia"', add
label define country_lbl 466 `"Mali"', add
label define country_lbl 484 `"Mexico"', add
label define country_lbl 496 `"Mongolia"', add
label define country_lbl 504 `"Morocco"', add
label define country_lbl 508 `"Mozambique"', add
label define country_lbl 524 `"Nepal"', add
label define country_lbl 528 `"Netherlands"', add
label define country_lbl 558 `"Nicaragua"', add
label define country_lbl 566 `"Nigeria"', add
label define country_lbl 586 `"Pakistan"', add
label define country_lbl 275 `"Palestine"', add
label define country_lbl 591 `"Panama"', add
label define country_lbl 600 `"Paraguay"', add
label define country_lbl 604 `"Peru"', add
label define country_lbl 608 `"Philippines"', add
label define country_lbl 620 `"Portugal"', add
label define country_lbl 630 `"Puerto Rico"', add
label define country_lbl 642 `"Romania"', add
label define country_lbl 646 `"Rwanda"', add
label define country_lbl 662 `"Saint Lucia"', add
label define country_lbl 686 `"Senegal"', add
label define country_lbl 694 `"Sierra Leone"', add
label define country_lbl 705 `"Slovenia"', add
label define country_lbl 710 `"South Africa"', add
label define country_lbl 728 `"South Sudan"', add
label define country_lbl 724 `"Spain"', add
label define country_lbl 729 `"Sudan"', add
label define country_lbl 756 `"Switzerland"', add
label define country_lbl 834 `"Tanzania"', add
label define country_lbl 764 `"Thailand"', add
label define country_lbl 792 `"Turkey"', add
label define country_lbl 800 `"Uganda"', add
label define country_lbl 804 `"Ukraine"', add
label define country_lbl 826 `"United Kingdom"', add
label define country_lbl 840 `"United States"', add
label define country_lbl 858 `"Uruguay"', add
label define country_lbl 862 `"Venezuela"', add
label define country_lbl 704 `"Vietnam"', add
label define country_lbl 894 `"Zambia"', add
label values country country_lbl

label define year_lbl 1960 `"1960"'
label define year_lbl 1962 `"1962"', add
label define year_lbl 1963 `"1963"', add
label define year_lbl 1964 `"1964"', add
label define year_lbl 1966 `"1966"', add
label define year_lbl 1968 `"1968"', add
label define year_lbl 1969 `"1969"', add
label define year_lbl 1970 `"1970"', add
label define year_lbl 1971 `"1971"', add
label define year_lbl 1972 `"1972"', add
label define year_lbl 1973 `"1973"', add
label define year_lbl 1974 `"1974"', add
label define year_lbl 1975 `"1975"', add
label define year_lbl 1976 `"1976"', add
label define year_lbl 1977 `"1977"', add
label define year_lbl 1979 `"1979"', add
label define year_lbl 1980 `"1980"', add
label define year_lbl 1981 `"1981"', add
label define year_lbl 1982 `"1982"', add
label define year_lbl 1983 `"1983"', add
label define year_lbl 1984 `"1984"', add
label define year_lbl 1985 `"1985"', add
label define year_lbl 1986 `"1986"', add
label define year_lbl 1987 `"1987"', add
label define year_lbl 1989 `"1989"', add
label define year_lbl 1990 `"1990"', add
label define year_lbl 1991 `"1991"', add
label define year_lbl 1992 `"1992"', add
label define year_lbl 1993 `"1993"', add
label define year_lbl 1994 `"1994"', add
label define year_lbl 1995 `"1995"', add
label define year_lbl 1996 `"1996"', add
label define year_lbl 1997 `"1997"', add
label define year_lbl 1998 `"1998"', add
label define year_lbl 1999 `"1999"', add
label define year_lbl 2000 `"2000"', add
label define year_lbl 2001 `"2001"', add
label define year_lbl 2002 `"2002"', add
label define year_lbl 2003 `"2003"', add
label define year_lbl 2004 `"2004"', add
label define year_lbl 2005 `"2005"', add
label define year_lbl 2006 `"2006"', add
label define year_lbl 2007 `"2007"', add
label define year_lbl 2008 `"2008"', add
label define year_lbl 2009 `"2009"', add
label define year_lbl 2010 `"2010"', add
label define year_lbl 2011 `"2011"', add
label values year year_lbl

label define sample_lbl 032197001 `"Argentina 1970"'
label define sample_lbl 032219801 `"Argentina 1980"', add
label define sample_lbl 032199101 `"Argentina 1991"', add
label define sample_lbl 032200101 `"Argentina 2001"', add
label define sample_lbl 032201001 `"Argentina 2010"', add
label define sample_lbl 051200101 `"Armenia 2001"', add
label define sample_lbl 051201101 `"Armenia 2011"', add
label define sample_lbl 040197101 `"Austria 1971"', add
label define sample_lbl 040198101 `"Austria 1981"', add
label define sample_lbl 040199101 `"Austria 1991"', add
label define sample_lbl 040200101 `"Austria 2001"', add
label define sample_lbl 040201101 `"Austria 2011"', add
label define sample_lbl 050199101 `"Bangladesh 1991"', add
label define sample_lbl 050200101 `"Bangladesh 2001"', add
label define sample_lbl 050201101 `"Bangladesh 2011"', add
label define sample_lbl 112199901 `"Belarus 1999"', add
label define sample_lbl 068197601 `"Bolivia 1976"', add
label define sample_lbl 068199201 `"Bolivia 1992"', add
label define sample_lbl 068200101 `"Bolivia 2001"', add
label define sample_lbl 076196001 `"Brazil 1960"', add
label define sample_lbl 076197001 `"Brazil 1970"', add
label define sample_lbl 076198001 `"Brazil 1980"', add
label define sample_lbl 076199101 `"Brazil 1991"', add
label define sample_lbl 076200001 `"Brazil 2000"', add
label define sample_lbl 076201001 `"Brazil 2010"', add
label define sample_lbl 854198501 `"Burkina Faso 1985"', add
label define sample_lbl 854199601 `"Burkina Faso 1996"', add
label define sample_lbl 854200601 `"Burkina Faso 2006"', add
label define sample_lbl 116199801 `"Cambodia 1998"', add
label define sample_lbl 116200801 `"Cambodia 2008"', add
label define sample_lbl 120197601 `"Cameroon 1976"', add
label define sample_lbl 120198701 `"Cameroon 1987"', add
label define sample_lbl 120200501 `"Cameroon 2005"', add
label define sample_lbl 124197101 `"Canada 1971"', add
label define sample_lbl 124198101 `"Canada 1981"', add
label define sample_lbl 124199101 `"Canada 1991"', add
label define sample_lbl 124200101 `"Canada 2001"', add
label define sample_lbl 152196001 `"Chile 1960"', add
label define sample_lbl 152197001 `"Chile 1970"', add
label define sample_lbl 152198201 `"Chile 1982"', add
label define sample_lbl 152199201 `"Chile 1992"', add
label define sample_lbl 152200201 `"Chile 2002"', add
label define sample_lbl 156198201 `"China 1982"', add
label define sample_lbl 156199001 `"China 1990"', add
label define sample_lbl 170196401 `"Colombia 1964"', add
label define sample_lbl 170197301 `"Colombia 1973"', add
label define sample_lbl 170198501 `"Colombia 1985"', add
label define sample_lbl 170199301 `"Colombia 1993"', add
label define sample_lbl 170200501 `"Colombia 2005"', add
label define sample_lbl 188196301 `"Costa Rica 1963"', add
label define sample_lbl 188197301 `"Costa Rica 1973"', add
label define sample_lbl 188198401 `"Costa Rica 1984"', add
label define sample_lbl 188200001 `"Costa Rica 2000"', add
label define sample_lbl 188201101 `"Costa Rica 2011"', add
label define sample_lbl 192200201 `"Cuba 2002"', add
label define sample_lbl 214196001 `"Dominican Republic 1960"', add
label define sample_lbl 214197001 `"Dominican Republic 1970"', add
label define sample_lbl 214198101 `"Dominican Republic 1981"', add
label define sample_lbl 214200201 `"Dominican Republic 2002"', add
label define sample_lbl 214201001 `"Dominican Republic 2010"', add
label define sample_lbl 218196201 `"Ecuador 1962"', add
label define sample_lbl 218197401 `"Ecuador 1974"', add
label define sample_lbl 218198201 `"Ecuador 1982"', add
label define sample_lbl 218199001 `"Ecuador 1990"', add
label define sample_lbl 218200101 `"Ecuador 2001"', add
label define sample_lbl 218201001 `"Ecuador 2010"', add
label define sample_lbl 818199601 `"Egypt 1996"', add
label define sample_lbl 818200601 `"Egypt 2006"', add
label define sample_lbl 222199201 `"El Salvador 1992"', add
label define sample_lbl 222200701 `"El Salvador 2007"', add
label define sample_lbl 231198401 `"Ethiopia 1984"', add
label define sample_lbl 231199401 `"Ethiopia 1994"', add
label define sample_lbl 231200701 `"Ethiopia 2007"', add
label define sample_lbl 242196601 `"Fiji 1966"', add
label define sample_lbl 242197601 `"Fiji 1976"', add
label define sample_lbl 242198601 `"Fiji 1986"', add
label define sample_lbl 242199601 `"Fiji 1996"', add
label define sample_lbl 242200701 `"Fiji 2007"', add
label define sample_lbl 250196201 `"France 1962"', add
label define sample_lbl 250196801 `"France 1968"', add
label define sample_lbl 250197501 `"France 1975"', add
label define sample_lbl 250198201 `"France 1982"', add
label define sample_lbl 250199001 `"France 1990"', add
label define sample_lbl 250199901 `"France 1999"', add
label define sample_lbl 250200601 `"France 2006"', add
label define sample_lbl 250201101 `"France 2011"', add
label define sample_lbl 276197001 `"Germany 1970 (West)"', add
label define sample_lbl 276197101 `"Germany 1971 (East)"', add
label define sample_lbl 276198101 `"Germany 1981 (East)"', add
label define sample_lbl 276198701 `"Germany 1987 (West)"', add
label define sample_lbl 288198401 `"Ghana 1984"', add
label define sample_lbl 288200001 `"Ghana 2000"', add
label define sample_lbl 288201001 `"Ghana 2010"', add
label define sample_lbl 300197101 `"Greece 1971"', add
label define sample_lbl 300198101 `"Greece 1981"', add
label define sample_lbl 300199101 `"Greece 1991"', add
label define sample_lbl 300200101 `"Greece 2001"', add
label define sample_lbl 324198301 `"Guinea 1983"', add
label define sample_lbl 324199601 `"Guinea 1996"', add
label define sample_lbl 332197101 `"Haiti 1971"', add
label define sample_lbl 332198201 `"Haiti 1982"', add
label define sample_lbl 332200301 `"Haiti 2003"', add
label define sample_lbl 348197001 `"Hungary 1970"', add
label define sample_lbl 348198001 `"Hungary 1980"', add
label define sample_lbl 348199001 `"Hungary 1990"', add
label define sample_lbl 348200101 `"Hungary 2001"', add
label define sample_lbl 356198341 `"India 1983"', add
label define sample_lbl 356198741 `"India 1987"', add
label define sample_lbl 356199341 `"India 1993"', add
label define sample_lbl 356199941 `"India 1999"', add
label define sample_lbl 356200441 `"India 2004"', add
label define sample_lbl 360197101 `"Indonesia 1971"', add
label define sample_lbl 360197601 `"Indonesia 1976"', add
label define sample_lbl 360198001 `"Indonesia 1980"', add
label define sample_lbl 360198501 `"Indonesia 1985"', add
label define sample_lbl 360199001 `"Indonesia 1990"', add
label define sample_lbl 360199501 `"Indonesia 1995"', add
label define sample_lbl 360200001 `"Indonesia 2000"', add
label define sample_lbl 360200501 `"Indonesia 2005"', add
label define sample_lbl 360201001 `"Indonesia 2010"', add
label define sample_lbl 364200601 `"Iran 2006"', add
label define sample_lbl 368199701 `"Iraq 1997"', add
label define sample_lbl 372197101 `"Ireland 1971"', add
label define sample_lbl 372197901 `"Ireland 1979"', add
label define sample_lbl 372198101 `"Ireland 1981"', add
label define sample_lbl 372198601 `"Ireland 1986"', add
label define sample_lbl 372199101 `"Ireland 1991"', add
label define sample_lbl 372199601 `"Ireland 1996"', add
label define sample_lbl 372200201 `"Ireland 2002"', add
label define sample_lbl 372200601 `"Ireland 2006"', add
label define sample_lbl 372201101 `"Ireland 2011"', add
label define sample_lbl 376197201 `"Israel 1972"', add
label define sample_lbl 376198301 `"Israel 1983"', add
label define sample_lbl 376199501 `"Israel 1995"', add
label define sample_lbl 380200101 `"Italy 2001"', add
label define sample_lbl 388198201 `"Jamaica 1982"', add
label define sample_lbl 388199101 `"Jamaica 1991"', add
label define sample_lbl 388200101 `"Jamaica 2001"', add
label define sample_lbl 400200401 `"Jordan 2004"', add
label define sample_lbl 404196901 `"Kenya 1969"', add
label define sample_lbl 404197901 `"Kenya 1979"', add
label define sample_lbl 404198901 `"Kenya 1989"', add
label define sample_lbl 404199901 `"Kenya 1999"', add
label define sample_lbl 404200901 `"Kenya 2009"', add
label define sample_lbl 417199901 `"Kyrgyz Republic 1999"', add
label define sample_lbl 417200901 `"Kyrgyz Republic 2009"', add
label define sample_lbl 430197401 `"Liberia 1974"', add
label define sample_lbl 430200801 `"Liberia 2008"', add
label define sample_lbl 454198701 `"Malawi 1987"', add
label define sample_lbl 454199801 `"Malawi 1998"', add
label define sample_lbl 454200801 `"Malawi 2008"', add
label define sample_lbl 458197001 `"Malaysia 1970"', add
label define sample_lbl 458198001 `"Malaysia 1980"', add
label define sample_lbl 458199101 `"Malaysia 1991"', add
label define sample_lbl 458200001 `"Malaysia 2000"', add
label define sample_lbl 466198701 `"Mali 1987"', add
label define sample_lbl 466199801 `"Mali 1998"', add
label define sample_lbl 466200901 `"Mali 2009"', add
label define sample_lbl 484196001 `"Mexico 1960"', add
label define sample_lbl 484197001 `"Mexico 1970"', add
label define sample_lbl 484199001 `"Mexico 1990"', add
label define sample_lbl 484199501 `"Mexico 1995"', add
label define sample_lbl 484200001 `"Mexico 2000"', add
label define sample_lbl 484200501 `"Mexico 2005"', add
label define sample_lbl 484201001 `"Mexico 2010"', add
label define sample_lbl 496198901 `"Mongolia 1989"', add
label define sample_lbl 496200001 `"Mongolia 2000"', add
label define sample_lbl 504198201 `"Morocco 1982"', add
label define sample_lbl 504199401 `"Morocco 1994"', add
label define sample_lbl 504200401 `"Morocco 2004"', add
label define sample_lbl 508199701 `"Mozambique 1997"', add
label define sample_lbl 508200701 `"Mozambique 2007"', add
label define sample_lbl 524200101 `"Nepal 2001"', add
label define sample_lbl 528196001 `"Netherlands 1960"', add
label define sample_lbl 528197101 `"Netherlands 1971"', add
label define sample_lbl 528200101 `"Netherlands 2001"', add
label define sample_lbl 558197101 `"Nicaragua 1971"', add
label define sample_lbl 558199501 `"Nicaragua 1995"', add
label define sample_lbl 558200501 `"Nicaragua 2005"', add
label define sample_lbl 566200621 `"Nigeria 2006"', add
label define sample_lbl 566200721 `"Nigeria 2007"', add
label define sample_lbl 566200821 `"Nigeria 2008"', add
label define sample_lbl 566200921 `"Nigeria 2009"', add
label define sample_lbl 566201021 `"Nigeria 2010"', add
label define sample_lbl 586197301 `"Pakistan 1973"', add
label define sample_lbl 586198101 `"Pakistan 1981"', add
label define sample_lbl 586199801 `"Pakistan 1998"', add
label define sample_lbl 275199701 `"Palestine 1997"', add
label define sample_lbl 275200701 `"Palestine 2007"', add
label define sample_lbl 591196001 `"Panama 1960"', add
label define sample_lbl 591197001 `"Panama 1970"', add
label define sample_lbl 591198001 `"Panama 1980"', add
label define sample_lbl 591199001 `"Panama 1990"', add
label define sample_lbl 591200001 `"Panama 2000"', add
label define sample_lbl 591201001 `"Panama 2010"', add
label define sample_lbl 600196201 `"Paraguay 1962"', add
label define sample_lbl 600197201 `"Paraguay 1972"', add
label define sample_lbl 600198201 `"Paraguay 1982"', add
label define sample_lbl 600199201 `"Paraguay 1992"', add
label define sample_lbl 600200201 `"Paraguay 2002"', add
label define sample_lbl 604199301 `"Peru 1993"', add
label define sample_lbl 604200701 `"Peru 2007"', add
label define sample_lbl 608199001 `"Philippines 1990"', add
label define sample_lbl 608199501 `"Philippines 1995"', add
label define sample_lbl 608200001 `"Philippines 2000"', add
label define sample_lbl 620198101 `"Portugal 1981"', add
label define sample_lbl 620199101 `"Portugal 1991"', add
label define sample_lbl 620200101 `"Portugal 2001"', add
label define sample_lbl 620201101 `"Portugal 2011"', add
label define sample_lbl 630197001 `"Puerto Rico 1970"', add
label define sample_lbl 630198001 `"Puerto Rico 1980"', add
label define sample_lbl 630199001 `"Puerto Rico 1990"', add
label define sample_lbl 630200001 `"Puerto Rico 2000"', add
label define sample_lbl 630200501 `"Puerto Rico 2005"', add
label define sample_lbl 630201001 `"Puerto Rico 2010"', add
label define sample_lbl 642197701 `"Romania 1977"', add
label define sample_lbl 642199201 `"Romania 1992"', add
label define sample_lbl 642200201 `"Romania 2002"', add
label define sample_lbl 646199101 `"Rwanda 1991"', add
label define sample_lbl 646200201 `"Rwanda 2002"', add
label define sample_lbl 662198001 `"Saint Lucia 1980"', add
label define sample_lbl 662199101 `"Saint Lucia 1991"', add
label define sample_lbl 686198801 `"Senegal 1988"', add
label define sample_lbl 686200201 `"Senegal 2002"', add
label define sample_lbl 694200401 `"Sierra Leone 2004"', add
label define sample_lbl 705200201 `"Slovenia 2002"', add
label define sample_lbl 710199601 `"South Africa 1996"', add
label define sample_lbl 710200101 `"South Africa 2001"', add
label define sample_lbl 710200701 `"South Africa 2007"', add
label define sample_lbl 710201101 `"South Africa 2011"', add
label define sample_lbl 724198101 `"Spain 1981"', add
label define sample_lbl 724199101 `"Spain 1991"', add
label define sample_lbl 724200101 `"Spain 2001"', add
label define sample_lbl 724201101 `"Spain 2011"', add
label define sample_lbl 728200801 `"South Sudan 2008"', add
label define sample_lbl 729200801 `"Sudan 2008"', add
label define sample_lbl 756197001 `"Switzerland 1970"', add
label define sample_lbl 756198001 `"Switzerland 1980"', add
label define sample_lbl 756199001 `"Switzerland 1990"', add
label define sample_lbl 756200001 `"Switzerland 2000"', add
label define sample_lbl 834198801 `"Tanzania 1988"', add
label define sample_lbl 834200201 `"Tanzania 2002"', add
label define sample_lbl 764197001 `"Thailand 1970"', add
label define sample_lbl 764198001 `"Thailand 1980"', add
label define sample_lbl 764199001 `"Thailand 1990"', add
label define sample_lbl 764200001 `"Thailand 2000"', add
label define sample_lbl 792198501 `"Turkey 1985"', add
label define sample_lbl 792199001 `"Turkey 1990"', add
label define sample_lbl 792200001 `"Turkey 2000"', add
label define sample_lbl 800199101 `"Uganda 1991"', add
label define sample_lbl 800200201 `"Uganda 2002"', add
label define sample_lbl 804200101 `"Ukraine 2001"', add
label define sample_lbl 826199101 `"United Kingdom 1991"', add
label define sample_lbl 826200101 `"United Kingdom 2001"', add
label define sample_lbl 840196001 `"United States 1960"', add
label define sample_lbl 840197001 `"United States 1970"', add
label define sample_lbl 840198001 `"United States 1980"', add
label define sample_lbl 840199001 `"United States 1990"', add
label define sample_lbl 840200001 `"United States 2000"', add
label define sample_lbl 840200501 `"United States 2005"', add
label define sample_lbl 840201001 `"United States 2010"', add
label define sample_lbl 858196301 `"Uruguay 1963"', add
label define sample_lbl 858197501 `"Uruguay 1975"', add
label define sample_lbl 858198501 `"Uruguay 1985"', add
label define sample_lbl 858199601 `"Uruguay 1996"', add
label define sample_lbl 858200621 `"Uruguay 2006"', add
label define sample_lbl 858201101 `"Uruguay 2011"', add
label define sample_lbl 862197101 `"Venezuela 1971"', add
label define sample_lbl 862198101 `"Venezuela 1981"', add
label define sample_lbl 862199001 `"Venezuela 1990"', add
label define sample_lbl 862200101 `"Venezuela 2001"', add
label define sample_lbl 704198901 `"Vietnam 1989"', add
label define sample_lbl 704199901 `"Vietnam 1999"', add
label define sample_lbl 704200901 `"Vietnam 2009"', add
label define sample_lbl 894199001 `"Zambia 1990"', add
label define sample_lbl 894200001 `"Zambia 2000"', add
label define sample_lbl 894201001 `"Zambia 2010"', add
label values sample sample_lbl

label define subsamp_lbl 00 `"1st 1% subsample"'
label define subsamp_lbl 01 `"2nd 1% subsample"', add
label define subsamp_lbl 02 `"3rd 1% subsample"', add
label define subsamp_lbl 03 `"4th 1% subsample"', add
label define subsamp_lbl 04 `"5th 1% subsample"', add
label define subsamp_lbl 05 `"6th 1% subsample"', add
label define subsamp_lbl 06 `"7th 1% subsample"', add
label define subsamp_lbl 07 `"8th 1% subsample"', add
label define subsamp_lbl 08 `"9th 1% subsample"', add
label define subsamp_lbl 09 `"10th 1% subsample"', add
label define subsamp_lbl 10 `"11th 1% subsample"', add
label define subsamp_lbl 11 `"12th 1% subsample"', add
label define subsamp_lbl 12 `"13th 1% subsample"', add
label define subsamp_lbl 13 `"14th 1% subsample"', add
label define subsamp_lbl 14 `"15th 1% subsample"', add
label define subsamp_lbl 15 `"16th 1% subsample"', add
label define subsamp_lbl 16 `"17th 1% subsample"', add
label define subsamp_lbl 17 `"18th 1% subsample"', add
label define subsamp_lbl 18 `"19th 1% subsample"', add
label define subsamp_lbl 19 `"20th 1% subsample"', add
label define subsamp_lbl 20 `"21st 1% subsample"', add
label define subsamp_lbl 21 `"22nd 1% subsample"', add
label define subsamp_lbl 22 `"23rd 1% subsample"', add
label define subsamp_lbl 23 `"24th 1% subsample"', add
label define subsamp_lbl 24 `"25th 1% subsample"', add
label define subsamp_lbl 25 `"26th 1% subsample"', add
label define subsamp_lbl 26 `"27th 1% subsample"', add
label define subsamp_lbl 27 `"28th 1% subsample"', add
label define subsamp_lbl 28 `"29th 1% subsample"', add
label define subsamp_lbl 29 `"30th 1% subsample"', add
label define subsamp_lbl 30 `"31st 1% subsample"', add
label define subsamp_lbl 31 `"32nd 1% subsample"', add
label define subsamp_lbl 32 `"33rd 1% subsample"', add
label define subsamp_lbl 33 `"34th 1% subsample"', add
label define subsamp_lbl 34 `"35th 1% subsample"', add
label define subsamp_lbl 35 `"36th 1% subsample"', add
label define subsamp_lbl 36 `"37th 1% subsample"', add
label define subsamp_lbl 37 `"38th 1% subsample"', add
label define subsamp_lbl 38 `"39th 1% subsample"', add
label define subsamp_lbl 39 `"40th 1% subsample"', add
label define subsamp_lbl 40 `"41st 1% subsample"', add
label define subsamp_lbl 41 `"42nd 1% subsample"', add
label define subsamp_lbl 42 `"43rd 1% subsample"', add
label define subsamp_lbl 43 `"44th 1% subsample"', add
label define subsamp_lbl 44 `"45th 1% subsample"', add
label define subsamp_lbl 45 `"46th 1% subsample"', add
label define subsamp_lbl 46 `"47th 1% subsample"', add
label define subsamp_lbl 47 `"48th 1% subsample"', add
label define subsamp_lbl 48 `"49th 1% subsample"', add
label define subsamp_lbl 49 `"50th 1% subsample"', add
label define subsamp_lbl 50 `"51st 1% subsample"', add
label define subsamp_lbl 51 `"52nd 1% subsample"', add
label define subsamp_lbl 52 `"53rd 1% subsample"', add
label define subsamp_lbl 53 `"54th 1% subsample"', add
label define subsamp_lbl 54 `"55th 1% subsample"', add
label define subsamp_lbl 55 `"56th 1% subsample"', add
label define subsamp_lbl 56 `"57th 1% subsample"', add
label define subsamp_lbl 57 `"58th 1% subsample"', add
label define subsamp_lbl 58 `"59th 1% subsample"', add
label define subsamp_lbl 59 `"60th 1% subsample"', add
label define subsamp_lbl 60 `"61st 1% subsample"', add
label define subsamp_lbl 61 `"62nd 1% subsample"', add
label define subsamp_lbl 62 `"63rd 1% subsample"', add
label define subsamp_lbl 63 `"64th 1% subsample"', add
label define subsamp_lbl 64 `"65th 1% subsample"', add
label define subsamp_lbl 65 `"66th 1% subsample"', add
label define subsamp_lbl 66 `"67th 1% subsample"', add
label define subsamp_lbl 67 `"68th 1% subsample"', add
label define subsamp_lbl 68 `"69th 1% subsample"', add
label define subsamp_lbl 69 `"70th 1% subsample"', add
label define subsamp_lbl 70 `"71st 1% subsample"', add
label define subsamp_lbl 71 `"72nd 1% subsample"', add
label define subsamp_lbl 72 `"73rd 1% subsample"', add
label define subsamp_lbl 73 `"74th 1% subsample"', add
label define subsamp_lbl 74 `"75th 1% subsample"', add
label define subsamp_lbl 75 `"76th 1% subsample"', add
label define subsamp_lbl 76 `"77th 1% subsample"', add
label define subsamp_lbl 77 `"78th 1% subsample"', add
label define subsamp_lbl 78 `"79th 1% subsample"', add
label define subsamp_lbl 79 `"80th 1% subsample"', add
label define subsamp_lbl 80 `"81st 1% subsample"', add
label define subsamp_lbl 81 `"82nd 1% subsample"', add
label define subsamp_lbl 82 `"83rd 1% subsample"', add
label define subsamp_lbl 83 `"84th 1% subsample"', add
label define subsamp_lbl 84 `"85th 1% subsample"', add
label define subsamp_lbl 85 `"86th 1% subsample"', add
label define subsamp_lbl 86 `"87th 1% subsample"', add
label define subsamp_lbl 87 `"88th 1% subsample"', add
label define subsamp_lbl 88 `"89th 1% subsample"', add
label define subsamp_lbl 89 `"90th 1% subsample"', add
label define subsamp_lbl 90 `"91st 1% subsample"', add
label define subsamp_lbl 91 `"92nd 1% subsample"', add
label define subsamp_lbl 92 `"93rd 1% subsample"', add
label define subsamp_lbl 93 `"94th 1% subsample"', add
label define subsamp_lbl 94 `"95th 1% subsample"', add
label define subsamp_lbl 95 `"96th 1% subsample"', add
label define subsamp_lbl 96 `"97th 1% subsample"', add
label define subsamp_lbl 97 `"98th 1% subsample"', add
label define subsamp_lbl 98 `"99th 1% subsample"', add
label define subsamp_lbl 99 `"100th 1% subsample"', add
label values subsamp subsamp_lbl

label define urban_lbl 1 `"Rural"'
label define urban_lbl 2 `"Urban"', add
label define urban_lbl 9 `"Unknown"', add
label values urban urban_lbl

label define regionw_lbl 11 `"Eastern Africa"'
label define regionw_lbl 12 `"Middle Africa"', add
label define regionw_lbl 13 `"Northern Africa"', add
label define regionw_lbl 14 `"Southern Africa"', add
label define regionw_lbl 15 `"Western Africa"', add
label define regionw_lbl 21 `"Caribbean"', add
label define regionw_lbl 22 `"Central America"', add
label define regionw_lbl 23 `"North America"', add
label define regionw_lbl 24 `"South America"', add
label define regionw_lbl 31 `"Central Asia"', add
label define regionw_lbl 32 `"Eastern Asia"', add
label define regionw_lbl 33 `"Southern Asia"', add
label define regionw_lbl 34 `"South-Eastern Asia"', add
label define regionw_lbl 35 `"Western Asia"', add
label define regionw_lbl 41 `"Eastern Europe"', add
label define regionw_lbl 42 `"Northern Europe"', add
label define regionw_lbl 43 `"Southern Europe"', add
label define regionw_lbl 44 `"Western Europe"', add
label define regionw_lbl 51 `"Australia and New Zealand"', add
label define regionw_lbl 52 `"Melanesia"', add
label define regionw_lbl 53 `"Micronesia"', add
label define regionw_lbl 54 `"Polynesia"', add
label values regionw regionw_lbl

label define geolev1_lbl 032002 `"City of Buenos Aires [Province: Argentina]"'
label define geolev1_lbl 032006 `"Buenos Aires province [Province: Argentina]"', add
label define geolev1_lbl 032010 `"Catamarca [Province: Argentina]"', add
label define geolev1_lbl 032014 `"Córdoba [Province: Argentina]"', add
label define geolev1_lbl 032018 `"Corrientes [Province: Argentina]"', add
label define geolev1_lbl 032022 `"Chaco [Province: Argentina]"', add
label define geolev1_lbl 032026 `"Chubut [Province: Argentina]"', add
label define geolev1_lbl 032030 `"Entre Ríos [Province: Argentina]"', add
label define geolev1_lbl 032034 `"Formosa [Province: Argentina]"', add
label define geolev1_lbl 032038 `"Jujuy [Province: Argentina]"', add
label define geolev1_lbl 032042 `"La Pampa [Province: Argentina]"', add
label define geolev1_lbl 032046 `"La Rioja [Province: Argentina]"', add
label define geolev1_lbl 032050 `"Mendoza [Province: Argentina]"', add
label define geolev1_lbl 032054 `"Misiones [Province: Argentina]"', add
label define geolev1_lbl 032058 `"Neuquén [Province: Argentina]"', add
label define geolev1_lbl 032062 `"Río Negro [Province: Argentina]"', add
label define geolev1_lbl 032066 `"Salta [Province: Argentina]"', add
label define geolev1_lbl 032070 `"San Juan [Province: Argentina]"', add
label define geolev1_lbl 032074 `"San Luis [Province: Argentina]"', add
label define geolev1_lbl 032078 `"Santa Cruz [Province: Argentina]"', add
label define geolev1_lbl 032082 `"Santa Fe [Province: Argentina]"', add
label define geolev1_lbl 032086 `"Santiago del Estero [Province: Argentina]"', add
label define geolev1_lbl 032090 `"Tucumán [Province: Argentina]"', add
label define geolev1_lbl 032094 `"Tierra del Fuego [Province: Argentina]"', add
label define geolev1_lbl 032099 `"Unknown [Province: Argentina]"', add
label define geolev1_lbl 040011 `"Burgenland [State: Austria]"', add
label define geolev1_lbl 040012 `"Niederösterreich [State: Austria]"', add
label define geolev1_lbl 040013 `"Wien [State: Austria]"', add
label define geolev1_lbl 040021 `"Kärnten [State: Austria]"', add
label define geolev1_lbl 040022 `"Steiermark [State: Austria]"', add
label define geolev1_lbl 040031 `"Oberösterreich [State: Austria]"', add
label define geolev1_lbl 040032 `"Salzburg [State: Austria]"', add
label define geolev1_lbl 040033 `"Tirol [State: Austria]"', add
label define geolev1_lbl 040034 `"Vorarlberg [State: Austria]"', add
label define geolev1_lbl 050010 `"Barisal [Division, Bangladesh]"', add
label define geolev1_lbl 050020 `"Chittagong [Division, Bangladesh]"', add
label define geolev1_lbl 050030 `"Dhaka [Division, Bangladesh]"', add
label define geolev1_lbl 050040 `"Khulna [Division, Bangladesh]"', add
label define geolev1_lbl 050050 `"Rajshahi, Rangpur [Division, Bangladesh]"', add
label define geolev1_lbl 050060 `"Sylhet [Division, Bangladesh]"', add
label define geolev1_lbl 051901 `"Yerevan [Province: Armenia]"', add
label define geolev1_lbl 051902 `"Aragatsotn [Province: Armenia]"', add
label define geolev1_lbl 051903 `"Ararat [Province: Armenia]"', add
label define geolev1_lbl 051904 `"Armavir [Province: Armenia]"', add
label define geolev1_lbl 051905 `"Gegharkunik [Province: Armenia]"', add
label define geolev1_lbl 051906 `"Lori [Province: Armenia]"', add
label define geolev1_lbl 051907 `"Kotayk [Province: Armenia]"', add
label define geolev1_lbl 051908 `"Shirak [Province: Armenia]"', add
label define geolev1_lbl 051909 `"Syunik [Province: Armenia]"', add
label define geolev1_lbl 051910 `"Vayots Dzor [Province: Armenia]"', add
label define geolev1_lbl 051911 `"Tavush [Province: Armenia]"', add
label define geolev1_lbl 068001 `"Chuquisaca [Department: Bolivia]"', add
label define geolev1_lbl 068002 `"La Paz [Department: Bolivia]"', add
label define geolev1_lbl 068003 `"Cochabamba [Department: Bolivia]"', add
label define geolev1_lbl 068004 `"Oruro [Department: Bolivia]"', add
label define geolev1_lbl 068005 `"Potosí [Department: Bolivia]"', add
label define geolev1_lbl 068006 `"Tarija [Department: Bolivia]"', add
label define geolev1_lbl 068007 `"Santa Cruz [Department: Bolivia]"', add
label define geolev1_lbl 068008 `"Beni [Department: Bolivia]"', add
label define geolev1_lbl 068009 `"Pando [Department: Bolivia]"', add
label define geolev1_lbl 076011 `"Rondonia [State: Brazil]"', add
label define geolev1_lbl 076012 `"Acre [State: Brazil]"', add
label define geolev1_lbl 076013 `"Amazonas [State: Brazil]"', add
label define geolev1_lbl 076014 `"Roraima [State: Brazil]"', add
label define geolev1_lbl 076015 `"Pará [State: Brazil]"', add
label define geolev1_lbl 076016 `"Amapa [State: Brazil]"', add
label define geolev1_lbl 076021 `"Maranhao [State: Brazil]"', add
label define geolev1_lbl 076022 `"Piauí [State: Brazil]"', add
label define geolev1_lbl 076023 `"Ceará [State: Brazil]"', add
label define geolev1_lbl 076024 `"Rio Grande do Norte [State: Brazil]"', add
label define geolev1_lbl 076025 `"Paraiba [State: Brazil]"', add
label define geolev1_lbl 076026 `"Pernambuco [State: Brazil]"', add
label define geolev1_lbl 076027 `"Alagoas [State: Brazil]"', add
label define geolev1_lbl 076028 `"Sergipe [State: Brazil]"', add
label define geolev1_lbl 076029 `"Bahia [State: Brazil]"', add
label define geolev1_lbl 076031 `"Minas Gerais [State: Brazil]"', add
label define geolev1_lbl 076032 `"Espírito Santo [State: Brazil]"', add
label define geolev1_lbl 076033 `"Rio de Janeiro [State: Brazil]"', add
label define geolev1_lbl 076035 `"São Paulo [State: Brazil]"', add
label define geolev1_lbl 076041 `"Parana [State: Brazil]"', add
label define geolev1_lbl 076042 `"Santa Catarina [State: Brazil]"', add
label define geolev1_lbl 076043 `"Rio Grande do Sul [State: Brazil]"', add
label define geolev1_lbl 076051 `"Mato Grosso, Mato Grosso do Sul [State: Brazil]"', add
label define geolev1_lbl 076052 `"Goiás and Tocantins [State: Brazil]"', add
label define geolev1_lbl 076053 `"Distrito Federal [State: Brazil]"', add
label define geolev1_lbl 112001 `"Brest [Region: Belarus]"', add
label define geolev1_lbl 112002 `"Vitebsk [Region: Belarus]"', add
label define geolev1_lbl 112003 `"Gomel [Region: Belarus]"', add
label define geolev1_lbl 112004 `"Grodno [Region: Belarus]"', add
label define geolev1_lbl 112005 `"Minsk [Region: Belarus]"', add
label define geolev1_lbl 112006 `"Mogilev [Region: Belarus]"', add
label define geolev1_lbl 116001 `"Banteay Meanchey [Province: Cambodia]"', add
label define geolev1_lbl 116002 `"Battambang [Province: Cambodia]"', add
label define geolev1_lbl 116003 `"Kampong Cham [Province: Cambodia]"', add
label define geolev1_lbl 116004 `"Kampong Chhnang [Province: Cambodia]"', add
label define geolev1_lbl 116005 `"Kampong Speu [Province: Cambodia]"', add
label define geolev1_lbl 116006 `"Kampong Thom [Province: Cambodia]"', add
label define geolev1_lbl 116007 `"Kampot [Province: Cambodia]"', add
label define geolev1_lbl 116008 `"Kandal [Province: Cambodia]"', add
label define geolev1_lbl 116009 `"Koh Kong [Province: Cambodia]"', add
label define geolev1_lbl 116010 `"Kratie [Province: Cambodia]"', add
label define geolev1_lbl 116011 `"Mondul Kiri [Province: Cambodia]"', add
label define geolev1_lbl 116012 `"Phnom Penh [Province: Cambodia]"', add
label define geolev1_lbl 116013 `"Preah Vihear [Province: Cambodia]"', add
label define geolev1_lbl 116014 `"Prey Veng [Province: Cambodia]"', add
label define geolev1_lbl 116015 `"Pursat [Province: Cambodia]"', add
label define geolev1_lbl 116016 `"Rotanak Kiri [Province: Cambodia]"', add
label define geolev1_lbl 116017 `"Siem Reap and Otdar Meanchey [Province: Cambodia]"', add
label define geolev1_lbl 116018 `"Preah Sihanouk [Province: Cambodia]"', add
label define geolev1_lbl 116019 `"Stung Treng [Province: Cambodia]"', add
label define geolev1_lbl 116020 `"Svay Rieng [Province: Cambodia]"', add
label define geolev1_lbl 116021 `"Takeo [Province: Cambodia]"', add
label define geolev1_lbl 116023 `"Kep [Province: Cambodia]"', add
label define geolev1_lbl 116024 `"Pailin [Province: Cambodia]"', add
label define geolev1_lbl 120002 `"Centre, Sud [Province: Cameroon]"', add
label define geolev1_lbl 120003 `"Est [Province: Cameroon]"', add
label define geolev1_lbl 120004 `"Nord, Adamoua , Extrème Nord [Province: Cameroon]"', add
label define geolev1_lbl 120005 `"Littoral [Province: Cameroon]"', add
label define geolev1_lbl 120007 `"Nord Ouest [Province: Cameroon]"', add
label define geolev1_lbl 120008 `"Ouest [Province: Cameroon]"', add
label define geolev1_lbl 120010 `"Sud Ouest [Province: Cameroon]"', add
label define geolev1_lbl 124010 `"Newfoundland and Labrador [Province: Canada]"', add
label define geolev1_lbl 124011 `"Prince Edward Island, Yukon, Northwest Territories, and Nunavut [Province: Canada]"', add
label define geolev1_lbl 124012 `"Nova Scotia [Province: Canada]"', add
label define geolev1_lbl 124013 `"New Brunswick [Province: Canada]"', add
label define geolev1_lbl 124024 `"Quebec [Province: Canada]"', add
label define geolev1_lbl 124035 `"Ontario [Province: Canada]"', add
label define geolev1_lbl 124046 `"Manitoba [Province: Canada]"', add
label define geolev1_lbl 124047 `"Saskatchewan [Province: Canada]"', add
label define geolev1_lbl 124048 `"Alberta [Province: Canada]"', add
label define geolev1_lbl 124059 `"British Columbia [Province: Canada]"', add
label define geolev1_lbl 152002 `"Antofagasta and Tarapacá [Region: Chile]"', add
label define geolev1_lbl 152004 `"Atacama and Coquimbo [Region: Chile]"', add
label define geolev1_lbl 152007 `"Del Maule [Region: Chile]"', add
label define geolev1_lbl 152008 `"Del Biobio [Region: Chile]"', add
label define geolev1_lbl 152009 `"La Araucanía [Region: Chile]"', add
label define geolev1_lbl 152010 `"Aysen del Gral Carlos Ibáñez del Campo and Los Lagos [Region: Chile]"', add
label define geolev1_lbl 152012 `"Magallanes and La Antártica Chilena [Region: Chile]"', add
label define geolev1_lbl 152013 `"Libertador General Bernardo O"Higgins, Metropolitana de Santiago, and Valparaiso [Region: Chile]"', add
label define geolev1_lbl 152099 `"Unknown [Region: Chile]"', add
label define geolev1_lbl 156011 `"Beijing (municipality) [Province: China]"', add
label define geolev1_lbl 156012 `"Tianjin (municipality) [Province: China]"', add
label define geolev1_lbl 156013 `"Hebei [Province: China]"', add
label define geolev1_lbl 156014 `"Shanxi [Province: China]"', add
label define geolev1_lbl 156015 `"Inner Mongolia [Province: China]"', add
label define geolev1_lbl 156021 `"Liaoning [Province: China]"', add
label define geolev1_lbl 156022 `"Jilin [Province: China]"', add
label define geolev1_lbl 156023 `"Heilongjiang [Province: China]"', add
label define geolev1_lbl 156031 `"Shanghai (municipality) [Province: China]"', add
label define geolev1_lbl 156032 `"Jiangsu [Province: China]"', add
label define geolev1_lbl 156033 `"Zhejiang [Province: China]"', add
label define geolev1_lbl 156034 `"Anhui [Province: China]"', add
label define geolev1_lbl 156035 `"Fujian [Province: China]"', add
label define geolev1_lbl 156036 `"Jiangxi [Province: China]"', add
label define geolev1_lbl 156037 `"Shangdong [Province: China]"', add
label define geolev1_lbl 156041 `"Henan [Province: China]"', add
label define geolev1_lbl 156042 `"Hubei [Province: China]"', add
label define geolev1_lbl 156043 `"Hunan [Province: China]"', add
label define geolev1_lbl 156044 `"Guangdong and Hainan [Province: China]"', add
label define geolev1_lbl 156045 `"Guangxi [Province: China]"', add
label define geolev1_lbl 156051 `"Sichuan [Province: China]"', add
label define geolev1_lbl 156052 `"Guizhou [Province: China]"', add
label define geolev1_lbl 156053 `"Yunnan [Province: China]"', add
label define geolev1_lbl 156054 `"Tibet [Province: China]"', add
label define geolev1_lbl 156061 `"Shaanxi [Province: China]"', add
label define geolev1_lbl 156062 `"Gansu [Province: China]"', add
label define geolev1_lbl 156063 `"Qinghai [Province: China]"', add
label define geolev1_lbl 156064 `"Ningxia [Province: China]"', add
label define geolev1_lbl 156065 `"Xinjiang [Province: China]"', add
label define geolev1_lbl 170005 `"Antioquia [Department: Colombia]"', add
label define geolev1_lbl 170008 `"Atlántico [Department: Colombia]"', add
label define geolev1_lbl 170011 `"Bogotá [Department: Colombia]"', add
label define geolev1_lbl 170013 `"Bolívar and Sucre [Department: Colombia]"', add
label define geolev1_lbl 170015 `"Boyacá and Casanare [Department: Colombia]"', add
label define geolev1_lbl 170018 `"Caquetá [Department: Colombia]"', add
label define geolev1_lbl 170019 `"Cauca [Department: Colombia]"', add
label define geolev1_lbl 170023 `"Córdoba [Department: Colombia]"', add
label define geolev1_lbl 170025 `"Cundinamarca [Department: Colombia]"', add
label define geolev1_lbl 170027 `"Chocó [Department: Colombia]"', add
label define geolev1_lbl 170041 `"Huila [Department: Colombia]"', add
label define geolev1_lbl 170044 `"La Guajira [Department: Colombia]"', add
label define geolev1_lbl 170047 `"Cesar and Magdalena [Department: Colombia]"', add
label define geolev1_lbl 170050 `"Meta and Vichada [Department: Colombia]"', add
label define geolev1_lbl 170052 `"Nariño [Department: Colombia]"', add
label define geolev1_lbl 170054 `"Norte de Santander [Department: Colombia]"', add
label define geolev1_lbl 170066 `"Caldas, Quindío, and Risaralda [Department: Colombia]"', add
label define geolev1_lbl 170068 `"Santander [Department: Colombia]"', add
label define geolev1_lbl 170073 `"Tolima [Department: Colombia]"', add
label define geolev1_lbl 170076 `"Valle [Department: Colombia]"', add
label define geolev1_lbl 170081 `"Arauca [Department: Colombia]"', add
label define geolev1_lbl 170086 `"Putumayo [Department: Colombia]"', add
label define geolev1_lbl 170088 `"San Andrés [Department: Colombia]"', add
label define geolev1_lbl 170091 `"Amazonas [Department: Colombia]"', add
label define geolev1_lbl 170095 `"Guaviare, Vaupés, and Guainía [Department: Colombia]"', add
label define geolev1_lbl 188001 `"San José [Province: Costa Rica]"', add
label define geolev1_lbl 188002 `"Alajuela [Province: Costa Rica]"', add
label define geolev1_lbl 188003 `"Cartago [Province: Costa Rica]"', add
label define geolev1_lbl 188004 `"Heredia [Province: Costa Rica]"', add
label define geolev1_lbl 188005 `"Guanacaste [Province: Costa Rica]"', add
label define geolev1_lbl 188006 `"Puntarenas [Province: Costa Rica]"', add
label define geolev1_lbl 188007 `"Limón [Province: Costa Rica]"', add
label define geolev1_lbl 192001 `"Pinar del Río [Province: Cuba]"', add
label define geolev1_lbl 192002 `"La Habana [Province: Cuba]"', add
label define geolev1_lbl 192003 `"Ciudad de la Habana [Province: Cuba]"', add
label define geolev1_lbl 192004 `"Matanzas [Province: Cuba]"', add
label define geolev1_lbl 192005 `"Villa Clara [Province: Cuba]"', add
label define geolev1_lbl 192006 `"Cienfuegos [Province: Cuba]"', add
label define geolev1_lbl 192007 `"Sancti Spiritus [Province: Cuba]"', add
label define geolev1_lbl 192008 `"Ciego de Avila [Province: Cuba]"', add
label define geolev1_lbl 192009 `"Camagüey [Province: Cuba]"', add
label define geolev1_lbl 192010 `"Las Tunas [Province: Cuba]"', add
label define geolev1_lbl 192011 `"Holguín [Province: Cuba]"', add
label define geolev1_lbl 192012 `"Granma [Province: Cuba]"', add
label define geolev1_lbl 192013 `"Santiago de Cuba [Province: Cuba]"', add
label define geolev1_lbl 192014 `"Guantánamo [Province: Cuba]"', add
label define geolev1_lbl 192099 `"Isla de la Juventud [Province: Cuba]"', add
label define geolev1_lbl 214001 `"Federal district and Santo Domingo [Province: Dominican Republic]"', add
label define geolev1_lbl 214002 `"Azua [Province: Dominican Republic]"', add
label define geolev1_lbl 214003 `"Baoruco [Province: Dominican Republic]"', add
label define geolev1_lbl 214004 `"Barahona [Province: Dominican Republic]"', add
label define geolev1_lbl 214005 `"Dajabón [Province: Dominican Republic]"', add
label define geolev1_lbl 214006 `"Duarte [Province: Dominican Republic]"', add
label define geolev1_lbl 214007 `"Elías Piña [Province: Dominican Republic]"', add
label define geolev1_lbl 214008 `"El Seibo and Hato Mayor [Province: Dominican Republic]"', add
label define geolev1_lbl 214009 `"Espaillat [Province: Dominican Republic]"', add
label define geolev1_lbl 214010 `"Independencia [Province: Dominican Republic]"', add
label define geolev1_lbl 214011 `"La Altagracia and La Romana [Province: Dominican Republic]"', add
label define geolev1_lbl 214013 `"La Vega and Monseñor Nouel [Province: Dominican Republic]"', add
label define geolev1_lbl 214014 `"María Trinidad Sánchez and Samaná [Province: Dominican Republic]"', add
label define geolev1_lbl 214015 `"Monte Cristi [Province: Dominican Republic]"', add
label define geolev1_lbl 214016 `"Pedernales [Province: Dominican Republic]"', add
label define geolev1_lbl 214017 `"Peravia and San José de Ocoa [Province: Dominican Republic]"', add
label define geolev1_lbl 214018 `"Puerto Plata [Province: Dominican Republic]"', add
label define geolev1_lbl 214019 `"Hermanas Mirabal [Province: Dominican Republic]"', add
label define geolev1_lbl 214021 `"San Cristóbal and Monte Plata [Province: Dominican Republic]"', add
label define geolev1_lbl 214022 `"San Juan [Province: Dominican Republic]"', add
label define geolev1_lbl 214023 `"San Pedro de Macorís [Province: Dominican Republic]"', add
label define geolev1_lbl 214024 `"Sánchez Ramírez [Province: Dominican Republic]"', add
label define geolev1_lbl 214025 `"Santiago [Province: Dominican Republic]"', add
label define geolev1_lbl 214026 `"Santiago Rodríguez [Province: Dominican Republic]"', add
label define geolev1_lbl 214027 `"Valverde [Province: Dominican Republic]"', add
label define geolev1_lbl 218001 `"Azuay [Province: Ecuador]"', add
label define geolev1_lbl 218002 `"Bolívar [Province: Ecuador]"', add
label define geolev1_lbl 218004 `"Carchi [Province: Ecuador]"', add
label define geolev1_lbl 218005 `"Cotopaxi [Province: Ecuador]"', add
label define geolev1_lbl 218006 `"Chimborazo [Province: Ecuador]"', add
label define geolev1_lbl 218007 `"El Oro [Province: Ecuador]"', add
label define geolev1_lbl 218009 `"Cañar, Esmeraldas, Guayas, Manabí, Manga del Cura [Disputed canton], Pichincha, El Piedrero [Disputed canton], Los Ríos, Santa Elena, Santo Domingo de las Tsáchilas, Galápagos [Disputed canton], Pichincha, El Piedrero"', add
label define geolev1_lbl 218010 `"Imbabura, Las Golondrinas [Disputed canton] [Disputed canton]"', add
label define geolev1_lbl 218011 `"Loja [Province: Ecuador]"', add
label define geolev1_lbl 218014 `"Morona Santiago [Province: Ecuador]"', add
label define geolev1_lbl 218016 `"Pastaza [Province: Ecuador]"', add
label define geolev1_lbl 218018 `"Tungurahua [Province: Ecuador]"', add
label define geolev1_lbl 218019 `"Zamora Chinchipe [Province: Ecuador]"', add
label define geolev1_lbl 218021 `"Napo, Orellana, Sucumbíos [Province: Ecuador]"', add
label define geolev1_lbl 218099 `"Unknown [Province: Ecuador]"', add
label define geolev1_lbl 222001 `"Ahuachapán [Department: El Salvador]"', add
label define geolev1_lbl 222002 `"Santa Ana [Department: El Salvador]"', add
label define geolev1_lbl 222003 `"Sonsonate [Department: El Salvador]"', add
label define geolev1_lbl 222004 `"Chalatenango [Department: El Salvador]"', add
label define geolev1_lbl 222005 `"La Libertad [Department: El Salvador]"', add
label define geolev1_lbl 222006 `"San Salvador [Department: El Salvador]"', add
label define geolev1_lbl 222007 `"Cuscatlán [Department: El Salvador]"', add
label define geolev1_lbl 222008 `"La Paz [Department: El Salvador]"', add
label define geolev1_lbl 222009 `"Cabañas [Department: El Salvador]"', add
label define geolev1_lbl 222010 `"San Vicente [Department: El Salvador]"', add
label define geolev1_lbl 222011 `"Usulután [Department: El Salvador]"', add
label define geolev1_lbl 222012 `"San Miguel [Department: El Salvador]"', add
label define geolev1_lbl 222013 `"Morazán [Department: El Salvador]"', add
label define geolev1_lbl 222014 `"La Unión [Department: El Salvador]"', add
label define geolev1_lbl 231001 `"Tigray [Region: Ethiopia]"', add
label define geolev1_lbl 231002 `"Affar [Region: Ethiopia]"', add
label define geolev1_lbl 231003 `"Amhara [Region: Ethiopia]"', add
label define geolev1_lbl 231004 `"Oromiya [Region: Ethiopia]"', add
label define geolev1_lbl 231005 `"Somali [Region: Ethiopia]"', add
label define geolev1_lbl 231006 `"Benishangul-Gumz [Region: Ethiopia]"', add
label define geolev1_lbl 231007 `"Southern Nations, Nationalities, and People (SNPP) [Region: Ethiopia]"', add
label define geolev1_lbl 231012 `"Gambela [Region: Ethiopia]"', add
label define geolev1_lbl 231013 `"Harari [Region: Ethiopia]"', add
label define geolev1_lbl 231014 `"Addis Ababa [Region: Ethiopia]"', add
label define geolev1_lbl 231015 `"Dire Dawa [Region: Ethiopia]"', add
label define geolev1_lbl 231017 `"Special region [Region: Ethiopia]"', add
label define geolev1_lbl 238094 `"Falkland Islands [Province: Argentina]"', add
label define geolev1_lbl 239094 `"South Georgia and South Sandwich Islands [Province: Argentina]"', add
label define geolev1_lbl 242001 `"Ba [Province: Fiji]"', add
label define geolev1_lbl 242003 `"Bua, Cakaudrove [Province: Fiji]"', add
label define geolev1_lbl 242006 `"Kadavu, Lau, Lomaiviti, Rotuma [Province: Fiji]"', add
label define geolev1_lbl 242007 `"Macuata [Province: Fiji]"', add
label define geolev1_lbl 242008 `"Nadroha [Province: Fiji]"', add
label define geolev1_lbl 242009 `"Naitasiri, Rewa [Province: Fiji]"', add
label define geolev1_lbl 242011 `"Ra [Province: Fiji]"', add
label define geolev1_lbl 242014 `"Serua, Namosi [Province: Fiji]"', add
label define geolev1_lbl 242015 `"Tailevu [Province: Fiji]"', add
label define geolev1_lbl 242099 `"Ships, unknown [Province: Fiji]"', add
label define geolev1_lbl 250001 `"Guadeloupe [Oversea Department, France]"', add
label define geolev1_lbl 250002 `"Martinique [Oversea Department, France]"', add
label define geolev1_lbl 250003 `"French Guyana [Oversea Department, France]"', add
label define geolev1_lbl 250004 `"Réunion Island [Oversea Department, France]"', add
label define geolev1_lbl 250011 `"Île-de-France [Region: France]"', add
label define geolev1_lbl 250021 `"Champagne-Ardenne [Region: France]"', add
label define geolev1_lbl 250022 `"Picardy [Region: France]"', add
label define geolev1_lbl 250023 `"Upper Normandy [Region: France]"', add
label define geolev1_lbl 250024 `"Centre [Region: France]"', add
label define geolev1_lbl 250025 `"Lower Normandy [Region: France]"', add
label define geolev1_lbl 250026 `"Burgundy [Region: France]"', add
label define geolev1_lbl 250031 `"North Pas-de-Calais [Region: France]"', add
label define geolev1_lbl 250041 `"Lorraine [Region: France]"', add
label define geolev1_lbl 250042 `"Alsace [Region: France]"', add
label define geolev1_lbl 250043 `"Franche-Comté [Region: France]"', add
label define geolev1_lbl 250052 `"Loire Valley [Region: France]"', add
label define geolev1_lbl 250053 `"Brittany [Region: France]"', add
label define geolev1_lbl 250054 `"Poitou-Charentes [Region: France]"', add
label define geolev1_lbl 250072 `"Aquitaine [Region: France]"', add
label define geolev1_lbl 250073 `"Midi-Pyrénées [Region: France]"', add
label define geolev1_lbl 250074 `"Limousin [Region: France]"', add
label define geolev1_lbl 250082 `"Rhône-Alpes [Region: France]"', add
label define geolev1_lbl 250083 `"Auvergne [Region: France]"', add
label define geolev1_lbl 250091 `"Languedoc-Roussillon [Region: France]"', add
label define geolev1_lbl 250093 `"Provence-Alpes-Riviera [Region: France]"', add
label define geolev1_lbl 250094 `"Corsica [Region: France]"', add
label define geolev1_lbl 250999 `"Unknown [Region: France]"', add
label define geolev1_lbl 275001 `"Jenin [Governorate: Palestine]"', add
label define geolev1_lbl 275005 `"Tubas [Governorate: Palestine]"', add
label define geolev1_lbl 275010 `"Tulkarm [Governorate: Palestine]"', add
label define geolev1_lbl 275015 `"Nablus [Governorate: Palestine]"', add
label define geolev1_lbl 275020 `"Qalqiliya [Governorate: Palestine]"', add
label define geolev1_lbl 275025 `"Salfit [Governorate: Palestine]"', add
label define geolev1_lbl 275030 `"Ramallah and Al-Bireh [Governorate: Palestine]"', add
label define geolev1_lbl 275035 `"Jericho [Governorate: Palestine]"', add
label define geolev1_lbl 275040 `"Jerusalem [Governorate: Palestine]"', add
label define geolev1_lbl 275045 `"Bethlehem [Governorate: Palestine]"', add
label define geolev1_lbl 275050 `"Hebron [Governorate: Palestine]"', add
label define geolev1_lbl 275055 `"North Gaza [Governorate: Palestine]"', add
label define geolev1_lbl 275060 `"Gaza [Governorate: Palestine]"', add
label define geolev1_lbl 275065 `"Deir Al-Balah [Governorate: Palestine]"', add
label define geolev1_lbl 275070 `"Khan Yunis [Governorate: Palestine]"', add
label define geolev1_lbl 275075 `"Rafah [Governorate: Palestine]"', add
label define geolev1_lbl 276001 `"Schleswig-Holstein [State: Germany]"', add
label define geolev1_lbl 276002 `"Hamburg [State: Germany]"', add
label define geolev1_lbl 276003 `"Niedersachsen [State: Germany]"', add
label define geolev1_lbl 276004 `"Bremen [State: Germany]"', add
label define geolev1_lbl 276005 `"Nordrhein-Westfalen [State: Germany]"', add
label define geolev1_lbl 276006 `"Hessen [State: Germany]"', add
label define geolev1_lbl 276007 `"Rheinland-Pfalz [State: Germany]"', add
label define geolev1_lbl 276008 `"Baden-Württemberg [State: Germany]"', add
label define geolev1_lbl 276009 `"Bayern [State: Germany]"', add
label define geolev1_lbl 276010 `"Saarland [State: Germany]"', add
label define geolev1_lbl 276012 `"Brandenburg [State: Germany]"', add
label define geolev1_lbl 276013 `"Mecklenburg-West Pomerania [State: Germany]"', add
label define geolev1_lbl 276014 `"Saxony [State: Germany]"', add
label define geolev1_lbl 276015 `"Saxony-Anhalt [State: Germany]"', add
label define geolev1_lbl 276016 `"Thuringia [State: Germany]"', add
label define geolev1_lbl 276017 `"East Berlin [State: Germany]"', add
label define geolev1_lbl 276018 `"West Berlin [State: Germany]"', add
label define geolev1_lbl 276099 `"NIU (Not in universe) [State: Germany]"', add
label define geolev1_lbl 288001 `"Western [Region: Ghana]"', add
label define geolev1_lbl 288002 `"Central [Region: Ghana]"', add
label define geolev1_lbl 288003 `"Greater Accra [Region: Ghana]"', add
label define geolev1_lbl 288004 `"Volta [Region: Ghana]"', add
label define geolev1_lbl 288005 `"Eastern [Region: Ghana]"', add
label define geolev1_lbl 288006 `"Ashanti [Region: Ghana]"', add
label define geolev1_lbl 288007 `"Brong Ahafo [Region: Ghana]"', add
label define geolev1_lbl 288008 `"Northern [Region: Ghana]"', add
label define geolev1_lbl 288009 `"Upper East [Region: Ghana]"', add
label define geolev1_lbl 288010 `"Upper West [Region: Ghana]"', add
label define geolev1_lbl 300001 `"Etolia and Akarnania [Department: Greece]"', add
label define geolev1_lbl 300003 `"Viotia [Department: Greece]"', add
label define geolev1_lbl 300004 `"Evia [Department: Greece]"', add
label define geolev1_lbl 300005 `"Evrytania [Department: Greece]"', add
label define geolev1_lbl 300006 `"Fthiotida [Department: Greece]"', add
label define geolev1_lbl 300007 `"Fokida [Department: Greece]"', add
label define geolev1_lbl 300011 `"Argolida [Department: Greece]"', add
label define geolev1_lbl 300012 `"Arkadia [Department: Greece]"', add
label define geolev1_lbl 300013 `"Achaia [Department: Greece]"', add
label define geolev1_lbl 300014 `"Ilia [Department: Greece]"', add
label define geolev1_lbl 300015 `"Korinthia [Department: Greece]"', add
label define geolev1_lbl 300016 `"Lakonia [Department: Greece]"', add
label define geolev1_lbl 300017 `"Messinia [Department: Greece]"', add
label define geolev1_lbl 300021 `"Zakynthos [Department: Greece]"', add
label define geolev1_lbl 300022 `"Kerkyra [Department: Greece]"', add
label define geolev1_lbl 300023 `"Kefallinia [Department: Greece]"', add
label define geolev1_lbl 300024 `"Lefkada [Department: Greece]"', add
label define geolev1_lbl 300031 `"Arta [Department: Greece]"', add
label define geolev1_lbl 300032 `"Thesprotia [Department: Greece]"', add
label define geolev1_lbl 300033 `"Ioannina [Department: Greece]"', add
label define geolev1_lbl 300034 `"Preveza [Department: Greece]"', add
label define geolev1_lbl 300041 `"Karditsa [Department: Greece]"', add
label define geolev1_lbl 300042 `"Larissa [Department: Greece]"', add
label define geolev1_lbl 300043 `"Magnissia [Department: Greece]"', add
label define geolev1_lbl 300044 `"Trikala [Department: Greece]"', add
label define geolev1_lbl 300051 `"Grevena [Department: Greece]"', add
label define geolev1_lbl 300052 `"Drama [Department: Greece]"', add
label define geolev1_lbl 300053 `"Imathia [Department: Greece]"', add
label define geolev1_lbl 300054 `"Thessaloniki [Department: Greece]"', add
label define geolev1_lbl 300055 `"Kavala [Department: Greece]"', add
label define geolev1_lbl 300056 `"Kastoria [Department: Greece]"', add
label define geolev1_lbl 300057 `"Kilkis [Department: Greece]"', add
label define geolev1_lbl 300058 `"Kozani [Department: Greece]"', add
label define geolev1_lbl 300059 `"Pella [Department: Greece]"', add
label define geolev1_lbl 300061 `"Pieria [Department: Greece]"', add
label define geolev1_lbl 300062 `"Serres [Department: Greece]"', add
label define geolev1_lbl 300063 `"Florina [Department: Greece]"', add
label define geolev1_lbl 300064 `"Chalkidiki and Aghion Oros [Department: Greece]"', add
label define geolev1_lbl 300071 `"Evros [Department: Greece]"', add
label define geolev1_lbl 300072 `"Xanthi [Department: Greece]"', add
label define geolev1_lbl 300073 `"Rodopi [Department: Greece]"', add
label define geolev1_lbl 300081 `"Dodekanissos [Department: Greece]"', add
label define geolev1_lbl 300082 `"Kyklades [Department: Greece]"', add
label define geolev1_lbl 300083 `"Lesvos [Department: Greece]"', add
label define geolev1_lbl 300084 `"Samos [Department: Greece]"', add
label define geolev1_lbl 300085 `"Chios [Department: Greece]"', add
label define geolev1_lbl 300091 `"Iraklio [Department: Greece]"', add
label define geolev1_lbl 300092 `"Lassithi [Department: Greece]"', add
label define geolev1_lbl 300093 `"Rethymno [Department: Greece]"', add
label define geolev1_lbl 300094 `"Chania [Department: Greece]"', add
label define geolev1_lbl 300101 `"Prefecture of Athens [Department: Greece]"', add
label define geolev1_lbl 300102 `"Prefecture of East Attiki [Department: Greece]"', add
label define geolev1_lbl 300103 `"Prefecture of West Attiki [Department: Greece]"', add
label define geolev1_lbl 300104 `"Prefecture of Pireas [Department: Greece]"', add
label define geolev1_lbl 324001 `"Boké [Region: Guinea]"', add
label define geolev1_lbl 324002 `"Faranah [Region: Guinea]"', add
label define geolev1_lbl 324003 `"Kankan [Region: Guinea]"', add
label define geolev1_lbl 324004 `"Kindia, Labe, Mamou [Region: Guinea]"', add
label define geolev1_lbl 324007 `"N'zerekore [Region: Guinea]"', add
label define geolev1_lbl 324008 `"Conakry [Region: Guinea]"', add
label define geolev1_lbl 332003 `"Nord (North) and Nord'est (North East) [Department: Haiti]"', add
label define geolev1_lbl 332006 `"Centre (Central), L'Artibonite, Ouest (West), Sud'Est (South East) [Department: Haiti]"', add
label define geolev1_lbl 332007 `"Grand'Anse, Nippes, Sud (South) [Department: Haiti]"', add
label define geolev1_lbl 332009 `"Nord'Ouest (North West) [Department: Haiti]"', add
label define geolev1_lbl 356001 `"Jammu and Kashmir [State: India]"', add
label define geolev1_lbl 356002 `"Himachal Pradesh [State: India]"', add
label define geolev1_lbl 356003 `"Punjab [State: India]"', add
label define geolev1_lbl 356004 `"Chandigarh [State: India]"', add
label define geolev1_lbl 356006 `"Haryana [State: India]"', add
label define geolev1_lbl 356007 `"Delhi [State: India]"', add
label define geolev1_lbl 356008 `"Rajasthan [State: India]"', add
label define geolev1_lbl 356009 `"Uttar Pradesh and Uttaranchal [State: India]"', add
label define geolev1_lbl 356010 `"Bihar and Jharkhand [State: India]"', add
label define geolev1_lbl 356011 `"Sikkim [State: India]"', add
label define geolev1_lbl 356012 `"Arunachal Pradesh [State: India]"', add
label define geolev1_lbl 356013 `"Nagaland [State: India]"', add
label define geolev1_lbl 356014 `"Manipur [State: India]"', add
label define geolev1_lbl 356015 `"Mizoram [State: India]"', add
label define geolev1_lbl 356016 `"Tripura [State: India]"', add
label define geolev1_lbl 356017 `"Meghalaya [State: India]"', add
label define geolev1_lbl 356018 `"Assam [State: India]"', add
label define geolev1_lbl 356019 `"West Bengal [State: India]"', add
label define geolev1_lbl 356021 `"Orissa [State: India]"', add
label define geolev1_lbl 356023 `"Chhattisgarh and Madhya Pradesh [State: India]"', add
label define geolev1_lbl 356024 `"Gujarat [State: India]"', add
label define geolev1_lbl 356026 `"Dadra and Nagar Haveli [State: India]"', add
label define geolev1_lbl 356027 `"Maharashtra [State: India]"', add
label define geolev1_lbl 356028 `"Andhra Pradesh [State: India]"', add
label define geolev1_lbl 356029 `"Karnataka [State: India]"', add
label define geolev1_lbl 356030 `"Daman and Diu and Goa [State: India]"', add
label define geolev1_lbl 356031 `"Lakshadweep [State: India]"', add
label define geolev1_lbl 356032 `"Kerala [State: India]"', add
label define geolev1_lbl 356033 `"Tamil Nadu [State: India]"', add
label define geolev1_lbl 356034 `"Pondicherry [State: India]"', add
label define geolev1_lbl 356035 `"Andaman and Nicobar Islands [State: India]"', add
label define geolev1_lbl 360011 `"Nanggroe Aceh Darussalam [Province: Indonesia]"', add
label define geolev1_lbl 360012 `"Sumatera Utara [Province: Indonesia]"', add
label define geolev1_lbl 360013 `"Sumatera Barat [Province: Indonesia]"', add
label define geolev1_lbl 360014 `"Riau and Kepulauan Riau [Province: Indonesia]"', add
label define geolev1_lbl 360015 `"Jambi [Province: Indonesia]"', add
label define geolev1_lbl 360016 `"Sumatera Selatan and Bangka Belitung [Province: Indonesia]"', add
label define geolev1_lbl 360017 `"Bengkulu [Province: Indonesia]"', add
label define geolev1_lbl 360018 `"Lampung [Province: Indonesia]"', add
label define geolev1_lbl 360031 `"DKI Jakarta [Province: Indonesia]"', add
label define geolev1_lbl 360032 `"West Java and Banten [Province: Indonesia]"', add
label define geolev1_lbl 360033 `"Jawa Tengah [Province: Indonesia]"', add
label define geolev1_lbl 360034 `"DI Yogyakarta [Province: Indonesia]"', add
label define geolev1_lbl 360035 `"Jawa Timur [Province: Indonesia]"', add
label define geolev1_lbl 360051 `"Bali [Province: Indonesia]"', add
label define geolev1_lbl 360052 `"Nusa Tenggara Barat [Province: Indonesia]"', add
label define geolev1_lbl 360053 `"East Nusa Tenggara [Province: Indonesia]"', add
label define geolev1_lbl 360061 `"Kalimantan Barat [Province: Indonesia]"', add
label define geolev1_lbl 360062 `"Kalimantan Tengah [Province: Indonesia]"', add
label define geolev1_lbl 360063 `"Kalimantan Selatan [Province: Indonesia]"', add
label define geolev1_lbl 360064 `"Kalimantan Timur [Province: Indonesia]"', add
label define geolev1_lbl 360071 `"Sulawesi Utara and Gorontalo [Province: Indonesia]"', add
label define geolev1_lbl 360072 `"Sulawesi Tengah [Province: Indonesia]"', add
label define geolev1_lbl 360073 `"Sulawesi Selatan, Sulawesi Tenggara and Sulawesi Barat [Province: Indonesia]"', add
label define geolev1_lbl 360081 `"Maluku and Maluku Utara [Province: Indonesia]"', add
label define geolev1_lbl 360094 `"Papua and Papua Barat [Province: Indonesia]"', add
label define geolev1_lbl 364000 `"Markazi [Province: Iran]"', add
label define geolev1_lbl 364001 `"Gilan [Province: Iran]"', add
label define geolev1_lbl 364002 `"Mazandaran [Province: Iran]"', add
label define geolev1_lbl 364003 `"East Azarbayejan [Province: Iran]"', add
label define geolev1_lbl 364004 `"West Azarbayejan [Province: Iran]"', add
label define geolev1_lbl 364005 `"Kermanshah [Province: Iran]"', add
label define geolev1_lbl 364006 `"Khuzestan [Province: Iran]"', add
label define geolev1_lbl 364007 `"Fars [Province: Iran]"', add
label define geolev1_lbl 364008 `"Kerman [Province: Iran]"', add
label define geolev1_lbl 364009 `"Khorasan-e- Razavi [Province: Iran]"', add
label define geolev1_lbl 364010 `"Esfahan [Province: Iran]"', add
label define geolev1_lbl 364011 `"Sistan and Baluchestan [Province: Iran]"', add
label define geolev1_lbl 364012 `"Kordestan [Province: Iran]"', add
label define geolev1_lbl 364013 `"Hamedan [Province: Iran]"', add
label define geolev1_lbl 364014 `"Chaharmahal and Bakhtiyari [Province: Iran]"', add
label define geolev1_lbl 364015 `"Lorestan [Province: Iran]"', add
label define geolev1_lbl 364016 `"Ilam [Province: Iran]"', add
label define geolev1_lbl 364017 `"Kohgiluyeh and Boyerahmad [Province: Iran]"', add
label define geolev1_lbl 364018 `"Bushehr [Province: Iran]"', add
label define geolev1_lbl 364019 `"Zanjan [Province: Iran]"', add
label define geolev1_lbl 364020 `"Semnan [Province: Iran]"', add
label define geolev1_lbl 364021 `"Yazd [Province: Iran]"', add
label define geolev1_lbl 364022 `"Hormozgan [Province: Iran]"', add
label define geolev1_lbl 364023 `"Tehran [Province: Iran]"', add
label define geolev1_lbl 364024 `"Ardebil [Province: Iran]"', add
label define geolev1_lbl 364025 `"Qom [Province: Iran]"', add
label define geolev1_lbl 364026 `"Qazvin [Province: Iran]"', add
label define geolev1_lbl 364027 `"Golestan [Province: Iran]"', add
label define geolev1_lbl 364028 `"North Khorasan [Province: Iran]"', add
label define geolev1_lbl 364029 `"South Khorasan [Province: Iran]"', add
label define geolev1_lbl 368011 `"Dhok [Governorate: Iraq]"', add
label define geolev1_lbl 368012 `"Nineveh [Governorate: Iraq]"', add
label define geolev1_lbl 368013 `"Al-Sulaimaniya [Governorate: Iraq]"', add
label define geolev1_lbl 368014 `"Al-Tameem [Governorate: Iraq]"', add
label define geolev1_lbl 368015 `"Arbil [Governorate: Iraq]"', add
label define geolev1_lbl 368021 `"Diala [Governorate: Iraq]"', add
label define geolev1_lbl 368022 `"Al-Anbar [Governorate: Iraq]"', add
label define geolev1_lbl 368023 `"Baghdad [Governorate: Iraq]"', add
label define geolev1_lbl 368024 `"Babylon [Governorate: Iraq]"', add
label define geolev1_lbl 368025 `"Kerbela [Governorate: Iraq]"', add
label define geolev1_lbl 368026 `"Wasit [Governorate: Iraq]"', add
label define geolev1_lbl 368027 `"Salah Al-Deen [Governorate: Iraq]"', add
label define geolev1_lbl 368028 `"Al-Najaf [Governorate: Iraq]"', add
label define geolev1_lbl 368031 `"Al-Qadisiya [Governorate: Iraq]"', add
label define geolev1_lbl 368032 `"Al-Muthanna [Governorate: Iraq]"', add
label define geolev1_lbl 368033 `"Thi-Qar [Governorate: Iraq]"', add
label define geolev1_lbl 368034 `"Maysan [Governorate: Iraq]"', add
label define geolev1_lbl 368035 `"Al-Basrah [Governorate: Iraq]"', add
label define geolev1_lbl 372001 `"Border [Region: Ireland]"', add
label define geolev1_lbl 372002 `"Dublin [Region: Ireland]"', add
label define geolev1_lbl 372003 `"Mid-East [Region: Ireland]"', add
label define geolev1_lbl 372004 `"Midlands [Region: Ireland]"', add
label define geolev1_lbl 372005 `"Mid-West [Region: Ireland]"', add
label define geolev1_lbl 372006 `"South-East [Region: Ireland]"', add
label define geolev1_lbl 372007 `"South-West [Region: Ireland]"', add
label define geolev1_lbl 372008 `"West [Region: Ireland]"', add
label define geolev1_lbl 376001 `"Jerusalem [District: Israel]"', add
label define geolev1_lbl 376002 `"Northern [District: Israel]"', add
label define geolev1_lbl 376003 `"Haifa [District: Israel]"', add
label define geolev1_lbl 376004 `"Central [District: Israel]"', add
label define geolev1_lbl 376005 `"Tel-Aviv [District: Israel]"', add
label define geolev1_lbl 376006 `"Southern [District: Israel]"', add
label define geolev1_lbl 376009 `"Judea, Samaria, and Gaza areas [District: Israel]"', add
label define geolev1_lbl 380001 `"Piemonte-Valle d'Aosta [Region: Italy]"', add
label define geolev1_lbl 380003 `"Lombardia [Region: Italy]"', add
label define geolev1_lbl 380004 `"Trentino-Alto Adige [Region: Italy]"', add
label define geolev1_lbl 380005 `"Veneto [Region: Italy]"', add
label define geolev1_lbl 380006 `"Friuli-Venezia Giulia [Region: Italy]"', add
label define geolev1_lbl 380007 `"Liguria [Region: Italy]"', add
label define geolev1_lbl 380008 `"Emilia-Romagna [Region: Italy]"', add
label define geolev1_lbl 380009 `"Toscana [Region: Italy]"', add
label define geolev1_lbl 380010 `"Umbria [Region: Italy]"', add
label define geolev1_lbl 380011 `"Marche [Region: Italy]"', add
label define geolev1_lbl 380012 `"Lazio [Region: Italy]"', add
label define geolev1_lbl 380013 `"Abruzzo [Region: Italy]"', add
label define geolev1_lbl 380014 `"Molise [Region: Italy]"', add
label define geolev1_lbl 380015 `"Campania [Region: Italy]"', add
label define geolev1_lbl 380016 `"Puglia [Region: Italy]"', add
label define geolev1_lbl 380017 `"Basilicata [Region: Italy]"', add
label define geolev1_lbl 380018 `"Calabria [Region: Italy]"', add
label define geolev1_lbl 380019 `"Sicilia [Region: Italy]"', add
label define geolev1_lbl 380020 `"Sardegna [Region: Italy]"', add
label define geolev1_lbl 388001 `"Kingston [Parish: Jamaica]"', add
label define geolev1_lbl 388002 `"Saint Andrew [Parish: Jamaica]"', add
label define geolev1_lbl 388003 `"Saint Thomas [Parish: Jamaica]"', add
label define geolev1_lbl 388004 `"Portland [Parish: Jamaica]"', add
label define geolev1_lbl 388005 `"Saint Mary [Parish: Jamaica]"', add
label define geolev1_lbl 388006 `"Saint Ann [Parish: Jamaica]"', add
label define geolev1_lbl 388007 `"Trelawny [Parish: Jamaica]"', add
label define geolev1_lbl 388008 `"Saint James [Parish: Jamaica]"', add
label define geolev1_lbl 388009 `"Hanover [Parish: Jamaica]"', add
label define geolev1_lbl 388010 `"Westmoreland [Parish: Jamaica]"', add
label define geolev1_lbl 388011 `"Saint Elizabeth [Parish: Jamaica]"', add
label define geolev1_lbl 388012 `"Manchester [Parish: Jamaica]"', add
label define geolev1_lbl 388013 `"Clarendon [Parish: Jamaica]"', add
label define geolev1_lbl 388014 `"Saint Catherine [Parish: Jamaica]"', add
label define geolev1_lbl 400011 `"Amman [Governorate: Jordan]"', add
label define geolev1_lbl 400012 `"Balqa [Governorate: Jordan]"', add
label define geolev1_lbl 400013 `"Zarqa [Governorate: Jordan]"', add
label define geolev1_lbl 400014 `"Madaba [Governorate: Jordan]"', add
label define geolev1_lbl 400021 `"Irbid [Governorate: Jordan]"', add
label define geolev1_lbl 400022 `"Mafraq [Governorate: Jordan]"', add
label define geolev1_lbl 400023 `"Jarash [Governorate: Jordan]"', add
label define geolev1_lbl 400024 `"Ajlun [Governorate: Jordan]"', add
label define geolev1_lbl 400031 `"Karak [Governorate: Jordan]"', add
label define geolev1_lbl 400032 `"Tafilah [Governorate: Jordan]"', add
label define geolev1_lbl 400033 `"Ma'an [Governorate: Jordan]"', add
label define geolev1_lbl 400034 `"Aqaba [Governorate: Jordan]"', add
label define geolev1_lbl 404001 `"Nairobi [Province: Kenya]"', add
label define geolev1_lbl 404002 `"Central Province [Province: Kenya]"', add
label define geolev1_lbl 404003 `"Coast Province [Province: Kenya]"', add
label define geolev1_lbl 404004 `"Eastern Province [Province: Kenya]"', add
label define geolev1_lbl 404005 `"North-Eastern Province [Province: Kenya]"', add
label define geolev1_lbl 404006 `"Nyanza Province [Province: Kenya]"', add
label define geolev1_lbl 404007 `"Rift Valley Province [Province: Kenya]"', add
label define geolev1_lbl 404008 `"Western Province [Province: Kenya]"', add
label define geolev1_lbl 417001 `"Gorkenesh Bishkek [Region: Kyrgyz Republic]"', add
label define geolev1_lbl 417002 `"Issyk-Kul [Region: Kyrgyz Republic]"', add
label define geolev1_lbl 417003 `"Dzhalal-Abad [Region: Kyrgyz Republic]"', add
label define geolev1_lbl 417004 `"Naryn [Region: Kyrgyz Republic]"', add
label define geolev1_lbl 417005 `"Batken [Region: Kyrgyz Republic]"', add
label define geolev1_lbl 417006 `"Oshskaya [Region: Kyrgyz Republic]"', add
label define geolev1_lbl 417007 `"Talasskaya [Region: Kyrgyz Republic]"', add
label define geolev1_lbl 417008 `"Chuya [Region: Kyrgyz Republic]"', add
label define geolev1_lbl 430006 `"Bong [County: Liberia]"', add
label define geolev1_lbl 430009 `"Grand Bassa and Rivercess [County: Liberia]"', add
label define geolev1_lbl 430012 `"Grand Cape Mount [County: Liberia]"', add
label define geolev1_lbl 430015 `"Grand Gedeh and River Gee [County: Liberia]"', add
label define geolev1_lbl 430021 `"Lofa and Gbarpolu [County: Liberia]"', add
label define geolev1_lbl 430027 `"Maryland and Grand Kru [County: Liberia]"', add
label define geolev1_lbl 430030 `"Montserrado, Bomi, and Margibi [County: Liberia]"', add
label define geolev1_lbl 430033 `"Nimba [County: Liberia]"', add
label define geolev1_lbl 430039 `"Sinoe [County: Liberia]"', add
label define geolev1_lbl 454101 `"Chitipa [District: Malawi]"', add
label define geolev1_lbl 454102 `"Karonga [District: Malawi]"', add
label define geolev1_lbl 454103 `"Nkhata Bay, Likoma [District: Malawi]"', add
label define geolev1_lbl 454104 `"Rumphi [District: Malawi]"', add
label define geolev1_lbl 454105 `"Mzimba, Mzuzu city [District: Malawi]"', add
label define geolev1_lbl 454201 `"Kasungu [District: Malawi]"', add
label define geolev1_lbl 454202 `"Nkhota Kota [District: Malawi]"', add
label define geolev1_lbl 454203 `"Ntchisi [District: Malawi]"', add
label define geolev1_lbl 454204 `"Dowa [District: Malawi]"', add
label define geolev1_lbl 454205 `"Salima [District: Malawi]"', add
label define geolev1_lbl 454206 `"Lilongwe [District: Malawi]"', add
label define geolev1_lbl 454207 `"Mchinji [District: Malawi]"', add
label define geolev1_lbl 454208 `"Dedza [District: Malawi]"', add
label define geolev1_lbl 454209 `"Ntcheu [District: Malawi]"', add
label define geolev1_lbl 454301 `"Mangochi [District: Malawi]"', add
label define geolev1_lbl 454302 `"Machinga [District: Malawi]"', add
label define geolev1_lbl 454303 `"Zomba [District: Malawi]"', add
label define geolev1_lbl 454304 `"Chiradzulu [District: Malawi]"', add
label define geolev1_lbl 454305 `"Blantyre [District: Malawi]"', add
label define geolev1_lbl 454307 `"Thyolo [District: Malawi]"', add
label define geolev1_lbl 454308 `"Mulanje [District: Malawi]"', add
label define geolev1_lbl 454310 `"Chikwawa [District: Malawi]"', add
label define geolev1_lbl 454311 `"Nsanje [District: Malawi]"', add
label define geolev1_lbl 454313 `"Mwanza, Neno [District: Malawi]"', add
label define geolev1_lbl 458001 `"Johor [State: Malaysia]"', add
label define geolev1_lbl 458002 `"Kedah [State: Malaysia]"', add
label define geolev1_lbl 458003 `"Kelantan [State: Malaysia]"', add
label define geolev1_lbl 458004 `"Melaka [State: Malaysia]"', add
label define geolev1_lbl 458005 `"Negeri Sembilan [State: Malaysia]"', add
label define geolev1_lbl 458006 `"Pahang [State: Malaysia]"', add
label define geolev1_lbl 458007 `"Pulau Pinang [State: Malaysia]"', add
label define geolev1_lbl 458008 `"Perak [State: Malaysia]"', add
label define geolev1_lbl 458009 `"Perlis [State: Malaysia]"', add
label define geolev1_lbl 458010 `"Selangor and Kuala Lumpur Federal Territory [State: Malaysia]"', add
label define geolev1_lbl 458011 `"Terengganu [State: Malaysia]"', add
label define geolev1_lbl 458012 `"Sabah and Labuan Federal Territory [State: Malaysia]"', add
label define geolev1_lbl 458013 `"Sarawak [State: Malaysia]"', add
label define geolev1_lbl 466001 `"Kayes [Region: Mali]"', add
label define geolev1_lbl 466002 `"Koulikoro [Region: Mali]"', add
label define geolev1_lbl 466003 `"Sikasso [Region: Mali]"', add
label define geolev1_lbl 466004 `"Ségou [Region: Mali]"', add
label define geolev1_lbl 466005 `"Mopti [Region: Mali]"', add
label define geolev1_lbl 466006 `"Tombouctou [Region: Mali]"', add
label define geolev1_lbl 466007 `"Gao and Kidal [Region: Mali]"', add
label define geolev1_lbl 466009 `"Bamako [Region: Mali]"', add
label define geolev1_lbl 466099 `"Unknown [Region: Mali]"', add
label define geolev1_lbl 484001 `"Aguascalientes [State: Meico]"', add
label define geolev1_lbl 484002 `"Baja California [State: Meico]"', add
label define geolev1_lbl 484003 `"Baja California Sur [State: Meico]"', add
label define geolev1_lbl 484004 `"Campeche [State: Meico]"', add
label define geolev1_lbl 484005 `"Coahuila [State: Meico]"', add
label define geolev1_lbl 484006 `"Colima [State: Meico]"', add
label define geolev1_lbl 484007 `"Chiapas [State: Meico]"', add
label define geolev1_lbl 484008 `"Chihuahua [State: Meico]"', add
label define geolev1_lbl 484009 `"Distrito Federal [State: Meico]"', add
label define geolev1_lbl 484010 `"Durango [State: Meico]"', add
label define geolev1_lbl 484011 `"Guanajuato [State: Meico]"', add
label define geolev1_lbl 484012 `"Guerrero [State: Meico]"', add
label define geolev1_lbl 484013 `"Hidalgo [State: Meico]"', add
label define geolev1_lbl 484014 `"Jalisco [State: Meico]"', add
label define geolev1_lbl 484015 `"México [State: Meico]"', add
label define geolev1_lbl 484016 `"Michoacán [State: Meico]"', add
label define geolev1_lbl 484017 `"Morelos [State: Meico]"', add
label define geolev1_lbl 484018 `"Nayarit [State: Meico]"', add
label define geolev1_lbl 484019 `"Nuevo León [State: Meico]"', add
label define geolev1_lbl 484020 `"Oaxaca [State: Meico]"', add
label define geolev1_lbl 484021 `"Puebla [State: Meico]"', add
label define geolev1_lbl 484022 `"Querétaro [State: Meico]"', add
label define geolev1_lbl 484023 `"Quintana Roo [State: Meico]"', add
label define geolev1_lbl 484024 `"San Luis Potosí [State: Meico]"', add
label define geolev1_lbl 484025 `"Sinaloa [State: Meico]"', add
label define geolev1_lbl 484026 `"Sonora [State: Meico]"', add
label define geolev1_lbl 484027 `"Tabasco [State: Meico]"', add
label define geolev1_lbl 484028 `"Tamaulipas [State: Meico]"', add
label define geolev1_lbl 484029 `"Tlaxcala [State: Meico]"', add
label define geolev1_lbl 484030 `"Veracruz [State: Meico]"', add
label define geolev1_lbl 484031 `"Yucatán [State: Meico]"', add
label define geolev1_lbl 484032 `"Zacatecas [State: Meico]"', add
label define geolev1_lbl 496001 `"Arkhangai [Province: Mongolia]"', add
label define geolev1_lbl 496002 `"Bayan-Ölgii [Province: Mongolia]"', add
label define geolev1_lbl 496003 `"Bayankhongor [Province: Mongolia]"', add
label define geolev1_lbl 496004 `"Bulgan [Province: Mongolia]"', add
label define geolev1_lbl 496005 `"Govi-Altai [Province: Mongolia]"', add
label define geolev1_lbl 496006 `"Dornogovi [Province: Mongolia]"', add
label define geolev1_lbl 496007 `"Dornod [Province: Mongolia]"', add
label define geolev1_lbl 496008 `"Dundgovi and Govisumber [Province: Mongolia]"', add
label define geolev1_lbl 496009 `"Zavkhan [Province: Mongolia]"', add
label define geolev1_lbl 496010 `"Övörkhangai [Province: Mongolia]"', add
label define geolev1_lbl 496011 `"Ömnögovi [Province: Mongolia]"', add
label define geolev1_lbl 496012 `"Sükhbaatar [Province: Mongolia]"', add
label define geolev1_lbl 496013 `"Selenge [Province: Mongolia]"', add
label define geolev1_lbl 496014 `"Töv [Province: Mongolia]"', add
label define geolev1_lbl 496015 `"Uvs [Province: Mongolia]"', add
label define geolev1_lbl 496016 `"Khovd [Province: Mongolia]"', add
label define geolev1_lbl 496017 `"Khövsgöl [Province: Mongolia]"', add
label define geolev1_lbl 496018 `"Khentii [Province: Mongolia]"', add
label define geolev1_lbl 496019 `"Darkhan-Uul [Province: Mongolia]"', add
label define geolev1_lbl 496020 `"Ulaanbaatar [Province: Mongolia]"', add
label define geolev1_lbl 496021 `"Orkhon [Province: Mongolia]"', add
label define geolev1_lbl 504001 `"Oued-Ed-Dahab-Lagouira [Region: Morocco]"', add
label define geolev1_lbl 504002 `"Laâyoune-Boujdour-Sakia El Hamra [Region: Morocco]"', add
label define geolev1_lbl 504003 `"Guelmin-Es-Samara [Region: Morocco]"', add
label define geolev1_lbl 504004 `"Souss-Massa-Draâ [Region: Morocco]"', add
label define geolev1_lbl 504005 `"Charb-Chrarda-Béni Hssen [Region: Morocco]"', add
label define geolev1_lbl 504006 `"Chaouia-Ouardigha [Region: Morocco]"', add
label define geolev1_lbl 504007 `"Marrakech-Tensift-Al Haouz [Region: Morocco]"', add
label define geolev1_lbl 504008 `"Oriental [Region: Morocco]"', add
label define geolev1_lbl 504009 `"Grand-Casablanca [Region: Morocco]"', add
label define geolev1_lbl 504010 `"Rabat-Salé-Zemmour-Zaer [Region: Morocco]"', add
label define geolev1_lbl 504011 `"Doukala Abda [Region: Morocco]"', add
label define geolev1_lbl 504012 `"Tadla Azilal [Region: Morocco]"', add
label define geolev1_lbl 504013 `"Meknès-Tafilalet [Region: Morocco]"', add
label define geolev1_lbl 504014 `"Fès-Boulemane [Region: Morocco]"', add
label define geolev1_lbl 504015 `"Taza-Al Heiceima-Taounate [Region: Morocco]"', add
label define geolev1_lbl 504016 `"Tanger-Tétouan [Region: Morocco]"', add
label define geolev1_lbl 508001 `"Niassa [Province: Mozambique]"', add
label define geolev1_lbl 508002 `"Cabo Delgado [Province: Mozambique]"', add
label define geolev1_lbl 508003 `"Nampula [Province: Mozambique]"', add
label define geolev1_lbl 508004 `"Zambézia [Province: Mozambique]"', add
label define geolev1_lbl 508005 `"Tete [Province: Mozambique]"', add
label define geolev1_lbl 508006 `"Manica [Province: Mozambique]"', add
label define geolev1_lbl 508007 `"Sofala [Province: Mozambique]"', add
label define geolev1_lbl 508008 `"Inhambane [Province: Mozambique]"', add
label define geolev1_lbl 508009 `"Gaza [Province: Mozambique]"', add
label define geolev1_lbl 508010 `"Maputo province [Province: Mozambique]"', add
label define geolev1_lbl 508011 `"Maputo city [Province: Mozambique]"', add
label define geolev1_lbl 524001 `"Mechi [Administrative zone: Nepal]"', add
label define geolev1_lbl 524002 `"Koshi [Administrative zone: Nepal]"', add
label define geolev1_lbl 524003 `"Sagarmatha [Administrative zone: Nepal]"', add
label define geolev1_lbl 524004 `"Janakpur [Administrative zone: Nepal]"', add
label define geolev1_lbl 524005 `"Bagmati [Administrative zone: Nepal]"', add
label define geolev1_lbl 524006 `"Narayani [Administrative zone: Nepal]"', add
label define geolev1_lbl 524007 `"Gandaki [Administrative zone: Nepal]"', add
label define geolev1_lbl 524008 `"Dhawalagiri [Administrative zone: Nepal]"', add
label define geolev1_lbl 524009 `"Lumbini [Administrative zone: Nepal]"', add
label define geolev1_lbl 524010 `"Rapti [Administrative zone: Nepal]"', add
label define geolev1_lbl 524011 `"Bheri [Administrative zone: Nepal]"', add
label define geolev1_lbl 524012 `"Karnali [Administrative zone: Nepal]"', add
label define geolev1_lbl 524013 `"Seti [Administrative zone: Nepal]"', add
label define geolev1_lbl 524014 `"Mahakali [Administrative zone: Nepal]"', add
label define geolev1_lbl 558005 `"Nueva Segovia [Department: Nicaragua]"', add
label define geolev1_lbl 558010 `"Jinotega [Department: Nicaragua]"', add
label define geolev1_lbl 558020 `"Madríz [Department: Nicaragua]"', add
label define geolev1_lbl 558030 `"Chinandega [Department: Nicaragua]"', add
label define geolev1_lbl 558035 `"Leon and Esteli [Department: Nicaragua]"', add
label define geolev1_lbl 558040 `"Matagalpa [Department: Nicaragua]"', add
label define geolev1_lbl 558050 `"Boaco [Department: Nicaragua]"', add
label define geolev1_lbl 558055 `"Managua [Department: Nicaragua]"', add
label define geolev1_lbl 558060 `"Masaya [Department: Nicaragua]"', add
label define geolev1_lbl 558065 `"Chontales [Department: Nicaragua]"', add
label define geolev1_lbl 558070 `"Granada [Department: Nicaragua]"', add
label define geolev1_lbl 558075 `"Carazo [Department: Nicaragua]"', add
label define geolev1_lbl 558080 `"Rivas [Department: Nicaragua]"', add
label define geolev1_lbl 558085 `"Río San Juan [Department: Nicaragua]"', add
label define geolev1_lbl 558093 `"Atlántico Norte and Atlántico Sur [Department: Nicaragua]"', add
label define geolev1_lbl 558099 `"Unknown [Department: Nicaragua]"', add
label define geolev1_lbl 566001 `"Abia [State: Nigeria]"', add
label define geolev1_lbl 566002 `"Adamawa [State: Nigeria]"', add
label define geolev1_lbl 566003 `"Akwa Ibom [State: Nigeria]"', add
label define geolev1_lbl 566004 `"Anambra [State: Nigeria]"', add
label define geolev1_lbl 566005 `"Bauchi [State: Nigeria]"', add
label define geolev1_lbl 566006 `"Bayelsa [State: Nigeria]"', add
label define geolev1_lbl 566007 `"Benue [State: Nigeria]"', add
label define geolev1_lbl 566008 `"Borno [State: Nigeria]"', add
label define geolev1_lbl 566009 `"Cross River [State: Nigeria]"', add
label define geolev1_lbl 566010 `"Delta [State: Nigeria]"', add
label define geolev1_lbl 566011 `"Ebonyi [State: Nigeria]"', add
label define geolev1_lbl 566012 `"Edo [State: Nigeria]"', add
label define geolev1_lbl 566013 `"Ekiti [State: Nigeria]"', add
label define geolev1_lbl 566014 `"Enugu [State: Nigeria]"', add
label define geolev1_lbl 566015 `"Gombe [State: Nigeria]"', add
label define geolev1_lbl 566016 `"Imo [State: Nigeria]"', add
label define geolev1_lbl 566017 `"Jigawa [State: Nigeria]"', add
label define geolev1_lbl 566018 `"Kaduna [State: Nigeria]"', add
label define geolev1_lbl 566019 `"Kano [State: Nigeria]"', add
label define geolev1_lbl 566020 `"Katsina [State: Nigeria]"', add
label define geolev1_lbl 566021 `"Kebbi [State: Nigeria]"', add
label define geolev1_lbl 566022 `"Kogi [State: Nigeria]"', add
label define geolev1_lbl 566023 `"Kwara [State: Nigeria]"', add
label define geolev1_lbl 566024 `"Lagos [State: Nigeria]"', add
label define geolev1_lbl 566025 `"Nasarawa [State: Nigeria]"', add
label define geolev1_lbl 566026 `"Niger [State: Nigeria]"', add
label define geolev1_lbl 566027 `"Ogun [State: Nigeria]"', add
label define geolev1_lbl 566028 `"Ondo [State: Nigeria]"', add
label define geolev1_lbl 566029 `"Osun [State: Nigeria]"', add
label define geolev1_lbl 566030 `"Oyo [State: Nigeria]"', add
label define geolev1_lbl 566031 `"Plateau [State: Nigeria]"', add
label define geolev1_lbl 566032 `"Rivers [State: Nigeria]"', add
label define geolev1_lbl 566033 `"Sokoto [State: Nigeria]"', add
label define geolev1_lbl 566034 `"Taraba [State: Nigeria]"', add
label define geolev1_lbl 566035 `"Yobe [State: Nigeria]"', add
label define geolev1_lbl 566036 `"Zamfara [State: Nigeria]"', add
label define geolev1_lbl 566037 `"Federal Capital Territory Abuja [State: Nigeria]"', add
label define geolev1_lbl 566099 `"Unknown [State: Nigeria]"', add
label define geolev1_lbl 586001 `"North-West Frontier Province [Province: Pakistan]"', add
label define geolev1_lbl 586002 `"Fata [Province: Pakistan]"', add
label define geolev1_lbl 586003 `"Punjab, Islamabad [Province: Pakistan]"', add
label define geolev1_lbl 586004 `"Sind [Province: Pakistan]"', add
label define geolev1_lbl 586005 `"Baluchistan [Province: Pakistan]"', add
label define geolev1_lbl 586007 `"Northern areas [Province: Pakistan]"', add
label define geolev1_lbl 586008 `"Kashmir [Province: Pakistan]"', add
label define geolev1_lbl 591002 `"Coclé [Province: Panama]"', add
label define geolev1_lbl 591003 `"Colón, Comarca Kuna Yala (San Blas) [Province: Panama]"', add
label define geolev1_lbl 591004 `"Bocas de Toro, Chiriquí, Comarca Ngäbe Buglé, Veraguas [Province: Panama]"', add
label define geolev1_lbl 591005 `"Comarca Emberá, Darién [Province: Panama]"', add
label define geolev1_lbl 591006 `"Herrera [Province: Panama]"', add
label define geolev1_lbl 591007 `"Los Santos [Province: Panama]"', add
label define geolev1_lbl 591008 `"Panamá [Province: Panama]"', add
label define geolev1_lbl 600000 `"Asunción [Department: Paraguay]"', add
label define geolev1_lbl 600001 `"Concepción [Department: Paraguay]"', add
label define geolev1_lbl 600002 `"San Pedro [Department: Paraguay]"', add
label define geolev1_lbl 600007 `"Itapúa [Department: Paraguay]"', add
label define geolev1_lbl 600008 `"Misiones and Ñeembucú [Department: Paraguay]"', add
label define geolev1_lbl 600009 `"Guairá, Caazapá, and Paraguarí [Department: Paraguay]"', add
label define geolev1_lbl 600010 `"Cordillera, Caaguazú, Alto Paraná, and Canindeyú [Department: Paraguay]"', add
label define geolev1_lbl 600011 `"Central [Department: Paraguay]"', add
label define geolev1_lbl 600013 `"Amambay [Department: Paraguay]"', add
label define geolev1_lbl 600015 `"Presidente Hayes, Boqueron, and Alto Paraguay [Department: Paraguay]"', add
label define geolev1_lbl 600099 `"Unknown [Department: Paraguay]"', add
label define geolev1_lbl 604001 `"Amazonas [Region: Peru]"', add
label define geolev1_lbl 604002 `"Ancash [Region: Peru]"', add
label define geolev1_lbl 604003 `"Apurímac [Region: Peru]"', add
label define geolev1_lbl 604004 `"Arequipa [Region: Peru]"', add
label define geolev1_lbl 604005 `"Ayacucho [Region: Peru]"', add
label define geolev1_lbl 604006 `"Cajamarca [Region: Peru]"', add
label define geolev1_lbl 604007 `"Callao [Region: Peru]"', add
label define geolev1_lbl 604008 `"Cusco [Region: Peru]"', add
label define geolev1_lbl 604009 `"Huancavelica [Region: Peru]"', add
label define geolev1_lbl 604010 `"Huánuco [Region: Peru]"', add
label define geolev1_lbl 604011 `"Ica [Region: Peru]"', add
label define geolev1_lbl 604012 `"Junín [Region: Peru]"', add
label define geolev1_lbl 604013 `"La Libertad [Region: Peru]"', add
label define geolev1_lbl 604014 `"Lambayeque [Region: Peru]"', add
label define geolev1_lbl 604015 `"Lima [Region: Peru]"', add
label define geolev1_lbl 604016 `"Loreto [Region: Peru]"', add
label define geolev1_lbl 604017 `"Madre de Dios [Region: Peru]"', add
label define geolev1_lbl 604018 `"Moquegua [Region: Peru]"', add
label define geolev1_lbl 604019 `"Pasco [Region: Peru]"', add
label define geolev1_lbl 604020 `"Piura [Region: Peru]"', add
label define geolev1_lbl 604021 `"Puno [Region: Peru]"', add
label define geolev1_lbl 604022 `"San Martín [Region: Peru]"', add
label define geolev1_lbl 604023 `"Tacna [Region: Peru]"', add
label define geolev1_lbl 604024 `"Tumbes [Region: Peru]"', add
label define geolev1_lbl 604025 `"Ucayali [Region: Peru]"', add
label define geolev1_lbl 608001 `"Ilocos [Region: Philippines]"', add
label define geolev1_lbl 608002 `"Cagayan Valley [Region: Philippines]"', add
label define geolev1_lbl 608003 `"Central Luzon [Region: Philippines]"', add
label define geolev1_lbl 608004 `"Southern Tagalog [Region: Philippines]"', add
label define geolev1_lbl 608005 `"Bicol [Region: Philippines]"', add
label define geolev1_lbl 608006 `"Western Visayas [Region: Philippines]"', add
label define geolev1_lbl 608007 `"Central Visayas [Region: Philippines]"', add
label define geolev1_lbl 608008 `"Eastern Visayas [Region: Philippines]"', add
label define geolev1_lbl 608009 `"Western Mindanao [Region: Philippines]"', add
label define geolev1_lbl 608011 `"Northern Mindanao, Southern Mindanao, and Caraga [Region: Philippines]"', add
label define geolev1_lbl 608012 `"Central Mindanao and Autonomous Region of Muslim Mindanao [Region: Philippines]"', add
label define geolev1_lbl 608013 `"National Capital Region [Region: Philippines]"', add
label define geolev1_lbl 608014 `"Cordillera Administrative Region [Region: Philippines]"', add
label define geolev1_lbl 620111 `"Minho-Lima [Subregion: Portugal]"', add
label define geolev1_lbl 620112 `"Cávado [Subregion: Portugal]"', add
label define geolev1_lbl 620113 `"Ave [Subregion: Portugal]"', add
label define geolev1_lbl 620114 `"Grande Porto [Subregion: Portugal]"', add
label define geolev1_lbl 620115 `"Tâmega [Subregion: Portugal]"', add
label define geolev1_lbl 620116 `"Entre Douro e Vouga [Subregion: Portugal]"', add
label define geolev1_lbl 620117 `"Douro [Subregion: Portugal]"', add
label define geolev1_lbl 620118 `"Alto Trás-os-Montes [Subregion: Portugal]"', add
label define geolev1_lbl 620150 `"Algarve [Subregion: Portugal]"', add
label define geolev1_lbl 620161 `"Baixo Vouga [Subregion: Portugal]"', add
label define geolev1_lbl 620162 `"Baixo Mondego [Subregion: Portugal]"', add
label define geolev1_lbl 620163 `"Pinhal Litoral [Subregion: Portugal]"', add
label define geolev1_lbl 620165 `"Dão-Lafões [Subregion: Portugal]"', add
label define geolev1_lbl 620166 `"Oeste [Subregion: Portugal]"', add
label define geolev1_lbl 620167 `"Médio Tejo [Subregion: Portugal]"', add
label define geolev1_lbl 620169 `"Other Center [Subregion: Portugal]"', add
label define geolev1_lbl 620171 `"Grande Lisboa [Subregion: Portugal]"', add
label define geolev1_lbl 620172 `"Península de Setúbal [Subregion: Portugal]"', add
label define geolev1_lbl 620185 `"Lezíria do Tejo [Subregion: Portugal]"', add
label define geolev1_lbl 620189 `"Other Alentejo [Subregion: Portugal]"', add
label define geolev1_lbl 620200 `"Região Autónoma dos Açores [Subregion: Portugal]"', add
label define geolev1_lbl 620300 `"Região Autónoma da Madeira [Subregion: Portugal]"', add
label define geolev1_lbl 630101 `"G7201001 [PUMA: Puerto Rico]"', add
label define geolev1_lbl 630104 `"G7201002, G7201003, G7201004 [PUMA: Puerto Rico]"', add
label define geolev1_lbl 630110 `"G7201100 [PUMA: Puerto Rico]"', add
label define geolev1_lbl 630180 `"G7201800 [PUMA: Puerto Rico]"', add
label define geolev1_lbl 630200 `"G7200100, G7200200, G7200300, G7200400, G7200500, G72000700, G7201200, G7201300, G7201400, G7201500, G7201600, G7201700, G7201900, G7202000, G7202100, G7202200, G7202300, G7202400, G7202600, G7200600, G7200801, G7200802, G7200900 [PUMA: Puerto "', add
label define geolev1_lbl 630250 `"G7202500 [PUMA: Puerto Rico]"', add
label define geolev1_lbl 642001 `"Alba [County: Romania]"', add
label define geolev1_lbl 642002 `"Arad [County: Romania]"', add
label define geolev1_lbl 642003 `"Arges [County: Romania]"', add
label define geolev1_lbl 642004 `"Bacau [County: Romania]"', add
label define geolev1_lbl 642005 `"Bihor [County: Romania]"', add
label define geolev1_lbl 642006 `"Bistrita Nasaud [County: Romania]"', add
label define geolev1_lbl 642007 `"Botosani [County: Romania]"', add
label define geolev1_lbl 642008 `"Brasov [County: Romania]"', add
label define geolev1_lbl 642009 `"Braila [County: Romania]"', add
label define geolev1_lbl 642010 `"Buzau [County: Romania]"', add
label define geolev1_lbl 642011 `"Caras Severin [County: Romania]"', add
label define geolev1_lbl 642012 `"Cluj [County: Romania]"', add
label define geolev1_lbl 642013 `"Constanta [County: Romania]"', add
label define geolev1_lbl 642014 `"Covasna [County: Romania]"', add
label define geolev1_lbl 642015 `"Dimbovita [County: Romania]"', add
label define geolev1_lbl 642016 `"Dolj [County: Romania]"', add
label define geolev1_lbl 642017 `"Galati [County: Romania]"', add
label define geolev1_lbl 642018 `"Gorj [County: Romania]"', add
label define geolev1_lbl 642019 `"Harghita [County: Romania]"', add
label define geolev1_lbl 642020 `"Hunedoara [County: Romania]"', add
label define geolev1_lbl 642022 `"Iasi [County: Romania]"', add
label define geolev1_lbl 642024 `"Maramures [County: Romania]"', add
label define geolev1_lbl 642025 `"Mehedinti [County: Romania]"', add
label define geolev1_lbl 642026 `"Mures [County: Romania]"', add
label define geolev1_lbl 642027 `"Neamt [County: Romania]"', add
label define geolev1_lbl 642028 `"Olt [County: Romania]"', add
label define geolev1_lbl 642029 `"Prahova [County: Romania]"', add
label define geolev1_lbl 642030 `"Satu Mare [County: Romania]"', add
label define geolev1_lbl 642031 `"Salaj [County: Romania]"', add
label define geolev1_lbl 642032 `"Sibiu [County: Romania]"', add
label define geolev1_lbl 642033 `"Suceava [County: Romania]"', add
label define geolev1_lbl 642034 `"Teleorman [County: Romania]"', add
label define geolev1_lbl 642035 `"Timis [County: Romania]"', add
label define geolev1_lbl 642036 `"Tulcea [County: Romania]"', add
label define geolev1_lbl 642037 `"Vaslui [County: Romania]"', add
label define geolev1_lbl 642038 `"Valcea [County: Romania]"', add
label define geolev1_lbl 642039 `"Vrancea [County: Romania]"', add
label define geolev1_lbl 642043 `"Bucharest Sector 1 to 6 [County: Romania]"', add
label define geolev1_lbl 642051 `"Calarasi, Giurgiu, Ialomita, Ilfov [County: Romania]"', add
label define geolev1_lbl 646001 `"Kigali City [Province: Rwanda]"', add
label define geolev1_lbl 646002 `"Kigali Ngali [Province: Rwanda]"', add
label define geolev1_lbl 646004 `"Gitarama [Province: Rwanda]"', add
label define geolev1_lbl 646005 `"Butare [Province: Rwanda]"', add
label define geolev1_lbl 646006 `"Gikongoro [Province: Rwanda]"', add
label define geolev1_lbl 646007 `"Cyangugu [Province: Rwanda]"', add
label define geolev1_lbl 646008 `"Kibuye [Province: Rwanda]"', add
label define geolev1_lbl 646009 `"Gisenyi [Province: Rwanda]"', add
label define geolev1_lbl 646010 `"Ruhengeri [Province: Rwanda]"', add
label define geolev1_lbl 646012 `"Byumba, Kibungo and Umutara [Province: Rwanda]"', add
label define geolev1_lbl 686001 `"Dakar [Region: Senegal]"', add
label define geolev1_lbl 686002 `"Diourbel [Region: Senegal]"', add
label define geolev1_lbl 686003 `"Fatick [Region: Senegal]"', add
label define geolev1_lbl 686004 `"Kaolack [Region: Senegal]"', add
label define geolev1_lbl 686005 `"Kolda [Region: Senegal]"', add
label define geolev1_lbl 686008 `"Louga, Saint Louis, Matam [Region: Senegal]"', add
label define geolev1_lbl 686009 `"Tambacounda [Region: Senegal]"', add
label define geolev1_lbl 686010 `"Thiès [Region: Senegal]"', add
label define geolev1_lbl 686011 `"Ziguinchor [Region: Senegal]"', add
label define geolev1_lbl 694011 `"Kailahun [District: Sierra Leone]"', add
label define geolev1_lbl 694012 `"Kenema [District: Sierra Leone]"', add
label define geolev1_lbl 694013 `"Kono [District: Sierra Leone]"', add
label define geolev1_lbl 694021 `"Bombali [District: Sierra Leone]"', add
label define geolev1_lbl 694022 `"Kambia [District: Sierra Leone]"', add
label define geolev1_lbl 694023 `"Koinadugu [District: Sierra Leone]"', add
label define geolev1_lbl 694024 `"Port Loko [District: Sierra Leone]"', add
label define geolev1_lbl 694025 `"Tonkolili [District: Sierra Leone]"', add
label define geolev1_lbl 694031 `"Bo [District: Sierra Leone]"', add
label define geolev1_lbl 694032 `"Bonthe [District: Sierra Leone]"', add
label define geolev1_lbl 694033 `"Moyamba [District: Sierra Leone]"', add
label define geolev1_lbl 694034 `"Pujehun [District: Sierra Leone]"', add
label define geolev1_lbl 694041 `"Western - rural [District: Sierra Leone]"', add
label define geolev1_lbl 694042 `"Western - urban [District: Sierra Leone]"', add
label define geolev1_lbl 704001 `"Ninh Binh, Hoa Binh, Ha Noi, Phu Tho, Vinh Phuc, Ha Nam, and Nam Dinh [Province: Vietnam]"', add
label define geolev1_lbl 704002 `"Ha Giang and Tuyen Quang [Province: Vietnam]"', add
label define geolev1_lbl 704004 `"Cao Bang [Province: Vietnam]"', add
label define geolev1_lbl 704014 `"Son La [Province: Vietnam]"', add
label define geolev1_lbl 704015 `"Lai Chau, Dien Bien, Lao Cai, and Yen Bai [Province: Vietnam]"', add
label define geolev1_lbl 704019 `"Bac Kan and Thai Nguyen [Province: Vietnam]"', add
label define geolev1_lbl 704020 `"Lang Son [Province: Vietnam]"', add
label define geolev1_lbl 704022 `"Quang Ninh [Province: Vietnam]"', add
label define geolev1_lbl 704024 `"Bac Giang, and Bac Ninh [Province: Vietnam]"', add
label define geolev1_lbl 704030 `"Hai Duong and Hung Yen [Province: Vietnam]"', add
label define geolev1_lbl 704031 `"Hai Phong [Province: Vietnam]"', add
label define geolev1_lbl 704034 `"Thai Binh [Province: Vietnam]"', add
label define geolev1_lbl 704038 `"Thanh Hoa [Province: Vietnam]"', add
label define geolev1_lbl 704040 `"Nghe An and Ha Tinh [Province: Vietnam]"', add
label define geolev1_lbl 704046 `"Quang Binh, Quang Tri, and Thua Thien - Hue [Province: Vietnam]"', add
label define geolev1_lbl 704049 `"Da Nang and Quang Nam [Province: Vietnam]"', add
label define geolev1_lbl 704051 `"Binh Dinh and Quang Ngai [Province: Vietnam]"', add
label define geolev1_lbl 704054 `"Phu Yen and Khanh Hoa [Province: Vietnam]"', add
label define geolev1_lbl 704060 `"Thuan Hai, Ninh Thuan, and Binh Thuan [Province: Vietnam]"', add
label define geolev1_lbl 704062 `"Gia Lai and Kon Tum [Province: Vietnam]"', add
label define geolev1_lbl 704066 `"Dak Lak and Dak Nong [Province: Vietnam]"', add
label define geolev1_lbl 704068 `"Lam Dong [Province: Vietnam]"', add
label define geolev1_lbl 704072 `"Tay Ninh [Province: Vietnam]"', add
label define geolev1_lbl 704074 `"Binh Duong and Binh Phuoc [Province: Vietnam]"', add
label define geolev1_lbl 704075 `"Dong Nai and Ba Ria - Vung Tau [Province: Vietnam]"', add
label define geolev1_lbl 704079 `"Ho Chi Minh City [Province: Vietnam]"', add
label define geolev1_lbl 704080 `"Long An [Province: Vietnam]"', add
label define geolev1_lbl 704082 `"Tien Giang [Province: Vietnam]"', add
label define geolev1_lbl 704083 `"Ben Tre [Province: Vietnam]"', add
label define geolev1_lbl 704086 `"Vinh Long and Tra Vinh [Province: Vietnam]"', add
label define geolev1_lbl 704087 `"Dong Thap [Province: Vietnam]"', add
label define geolev1_lbl 704089 `"An Giang [Province: Vietnam]"', add
label define geolev1_lbl 704091 `"Kien Giang [Province: Vietnam]"', add
label define geolev1_lbl 704094 `"Hau Giang, Can Tho City, and Soc Trang [Province: Vietnam]"', add
label define geolev1_lbl 704096 `"Bac Lieu and Ca Mau [Province: Vietnam]"', add
label define geolev1_lbl 705001 `"Pomurska [Region: Slovenia]"', add
label define geolev1_lbl 705002 `"Podravska [Region: Slovenia]"', add
label define geolev1_lbl 705003 `"Koroška [Region: Slovenia]"', add
label define geolev1_lbl 705004 `"Savinjska [Region: Slovenia]"', add
label define geolev1_lbl 705005 `"Zasavska [Region: Slovenia]"', add
label define geolev1_lbl 705006 `"Spodnjeposavska [Region: Slovenia]"', add
label define geolev1_lbl 705007 `"Jugovzhodna Slovenija [Region: Slovenia]"', add
label define geolev1_lbl 705008 `"Osrednjeslovenska [Region: Slovenia]"', add
label define geolev1_lbl 705009 `"Gorenjska [Region: Slovenia]"', add
label define geolev1_lbl 705010 `"Notranjsko-kraška [Region: Slovenia]"', add
label define geolev1_lbl 705011 `"Goriška [Region: Slovenia]"', add
label define geolev1_lbl 705012 `"Obalno-kraška [Region: Slovenia]"', add
label define geolev1_lbl 705099 `"Unknown [Region: Slovenia]"', add
label define geolev1_lbl 710001 `"Western Cape [Province: South Africa]"', add
label define geolev1_lbl 710004 `"Free State [Province: South Africa]"', add
label define geolev1_lbl 710005 `"Eastern Cape, KwaZulu-Natal [Province: South Africa]"', add
label define geolev1_lbl 710007 `"Gauteng, Limpopo, Mpumalanga, North West, Northern Cape [Province: South Africa]"', add
label define geolev1_lbl 710999 `"Unknown [Province: South Africa]"', add
label define geolev1_lbl 724011 `"Galicia [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724012 `"Principado de Asturias [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724013 `"Cantabria [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724021 `"País Vasco [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724022 `"Comunidad Foral de Navarra [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724023 `"La Rioja [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724024 `"Aragón [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724030 `"Comunidad de Madrid [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724041 `"Castilla y León [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724042 `"Castilla-La Mancha [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724043 `"Extremadura [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724051 `"Cataluña [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724052 `"Comunidad Valenciana [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724053 `"Illes Balears [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724061 `"Andalucía [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724062 `"Región de Murcia [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724063 `"Ciudad Autónoma de Ceuta [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724064 `"Ciudad Autónoma de Melilla [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724070 `"Canarias [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 724099 `"Unknown [Communities and Autonomous Cities: Spain]"', add
label define geolev1_lbl 728071 `"Upper Nile [State: South Sudan]"', add
label define geolev1_lbl 728072 `"Jonglei [State: South Sudan]"', add
label define geolev1_lbl 728073 `"Unity [State: South Sudan]"', add
label define geolev1_lbl 728081 `"Warrap [State: South Sudan]"', add
label define geolev1_lbl 728082 `"Northern Bahr El Ghazal [State: South Sudan]"', add
label define geolev1_lbl 728083 `"Western Bahr El Ghazal [State: South Sudan]"', add
label define geolev1_lbl 728084 `"Lakes [State: South Sudan]"', add
label define geolev1_lbl 728091 `"Western Equatoria [State: South Sudan]"', add
label define geolev1_lbl 728092 `"Central Equatoria [State: South Sudan]"', add
label define geolev1_lbl 728093 `"Eastern Equatoria [State: South Sudan]"', add
label define geolev1_lbl 729011 `"Northern [State: Sudan]"', add
label define geolev1_lbl 729012 `"Nahr El Nil [State: Sudan]"', add
label define geolev1_lbl 729021 `"Red Sea [State: Sudan]"', add
label define geolev1_lbl 729022 `"Kassala [State: Sudan]"', add
label define geolev1_lbl 729023 `"Al Gedarif [State: Sudan]"', add
label define geolev1_lbl 729031 `"Khartoum [State: Sudan]"', add
label define geolev1_lbl 729041 `"Al Gezira [State: Sudan]"', add
label define geolev1_lbl 729042 `"White Nile [State: Sudan]"', add
label define geolev1_lbl 729043 `"Sinnar [State: Sudan]"', add
label define geolev1_lbl 729044 `"Blue Nile [State: Sudan]"', add
label define geolev1_lbl 729051 `"North Kordofan [State: Sudan]"', add
label define geolev1_lbl 729052 `"South Kordofan [State: Sudan]"', add
label define geolev1_lbl 729061 `"North Darfur [State: Sudan]"', add
label define geolev1_lbl 729062 `"West Darfur [State: Sudan]"', add
label define geolev1_lbl 729063 `"South Darfur [State: Sudan]"', add
label define geolev1_lbl 756001 `"Zurich [Canton: Switzerland]"', add
label define geolev1_lbl 756002 `"Bern [Canton: Switzerland]"', add
label define geolev1_lbl 756003 `"Luzern (Lucerne) [Canton: Switzerland]"', add
label define geolev1_lbl 756004 `"Uri [Canton: Switzerland]"', add
label define geolev1_lbl 756005 `"Schwyz [Canton: Switzerland]"', add
label define geolev1_lbl 756006 `"Obwalden (Obwald) [Canton: Switzerland]"', add
label define geolev1_lbl 756007 `"Nidwalden (Nidwald) [Canton: Switzerland]"', add
label define geolev1_lbl 756008 `"Glarus [Canton: Switzerland]"', add
label define geolev1_lbl 756009 `"Zug [Canton: Switzerland]"', add
label define geolev1_lbl 756010 `"Fribourg [Canton: Switzerland]"', add
label define geolev1_lbl 756011 `"Solothurn [Canton: Switzerland]"', add
label define geolev1_lbl 756012 `"Basel-Stadt (Basel-City) [Canton: Switzerland]"', add
label define geolev1_lbl 756013 `"Basel-Landschaft (Basel-Country) [Canton: Switzerland]"', add
label define geolev1_lbl 756014 `"Schaffhausen [Canton: Switzerland]"', add
label define geolev1_lbl 756015 `"Outer and Inner Rhodes [Canton: Switzerland]"', add
label define geolev1_lbl 756017 `"St. Gallen (St. Gall) [Canton: Switzerland]"', add
label define geolev1_lbl 756018 `"Graubundun (Grisons) [Canton: Switzerland]"', add
label define geolev1_lbl 756019 `"Aargau (Argovia) [Canton: Switzerland]"', add
label define geolev1_lbl 756020 `"Thurgau (Thurgovia) [Canton: Switzerland]"', add
label define geolev1_lbl 756021 `"Ticino [Canton: Switzerland]"', add
label define geolev1_lbl 756022 `"Vaud [Canton: Switzerland]"', add
label define geolev1_lbl 756023 `"Valais [Canton: Switzerland]"', add
label define geolev1_lbl 756024 `"Neuchatel [Canton: Switzerland]"', add
label define geolev1_lbl 756025 `"Geneva [Canton: Switzerland]"', add
label define geolev1_lbl 756026 `"Jura [Canton: Switzerland]"', add
label define geolev1_lbl 764010 `"Bangkok [Province: Thailand]"', add
label define geolev1_lbl 764011 `"Samut Prakan [Province: Thailand]"', add
label define geolev1_lbl 764012 `"Nonthaburi [Province: Thailand]"', add
label define geolev1_lbl 764013 `"Pathum Thani [Province: Thailand]"', add
label define geolev1_lbl 764014 `"Phra Nakhon si Ayutthaya [Province: Thailand]"', add
label define geolev1_lbl 764015 `"Ang Thong [Province: Thailand]"', add
label define geolev1_lbl 764016 `"Lop Buri [Province: Thailand]"', add
label define geolev1_lbl 764017 `"Sing Buri [Province: Thailand]"', add
label define geolev1_lbl 764018 `"Chai Nat [Province: Thailand]"', add
label define geolev1_lbl 764019 `"Prachin Buri and Sa Kaeo [Province: Thailand]"', add
label define geolev1_lbl 764020 `"Chon Buri [Province: Thailand]"', add
label define geolev1_lbl 764021 `"Rayong [Province: Thailand]"', add
label define geolev1_lbl 764022 `"Chanthaburi [Province: Thailand]"', add
label define geolev1_lbl 764023 `"Trat [Province: Thailand]"', add
label define geolev1_lbl 764024 `"Chachoengsao [Province: Thailand]"', add
label define geolev1_lbl 764026 `"Nakhon Nayok [Province: Thailand]"', add
label define geolev1_lbl 764027 `"Saraburi [Province: Thailand]"', add
label define geolev1_lbl 764030 `"Nakhon Ratchasima [Province: Thailand]"', add
label define geolev1_lbl 764031 `"Buri Ram [Province: Thailand]"', add
label define geolev1_lbl 764032 `"Surin [Province: Thailand]"', add
label define geolev1_lbl 764033 `"Si Sa Ket [Province: Thailand]"', add
label define geolev1_lbl 764034 `"Ubon Ratchathani, Yasothon and Amnat Charoen [Province: Thailand]"', add
label define geolev1_lbl 764036 `"Chaiyaphum [Province: Thailand]"', add
label define geolev1_lbl 764040 `"Khon Kaen [Province: Thailand]"', add
label define geolev1_lbl 764041 `"Udon Thani and Nong Bua Lam Phu [Province: Thailand]"', add
label define geolev1_lbl 764042 `"Loei [Province: Thailand]"', add
label define geolev1_lbl 764043 `"Nong Khai [Province: Thailand]"', add
label define geolev1_lbl 764044 `"Maha Sarakham [Province: Thailand]"', add
label define geolev1_lbl 764045 `"Roi Et [Province: Thailand]"', add
label define geolev1_lbl 764046 `"Kalasin [Province: Thailand]"', add
label define geolev1_lbl 764047 `"Sakon Nakhon [Province: Thailand]"', add
label define geolev1_lbl 764048 `"Nakhon Phanom and Mukdahan [Province: Thailand]"', add
label define geolev1_lbl 764050 `"Chiang Mai [Province: Thailand]"', add
label define geolev1_lbl 764051 `"Lamphun [Province: Thailand]"', add
label define geolev1_lbl 764052 `"Lampang [Province: Thailand]"', add
label define geolev1_lbl 764053 `"Uttaradit [Province: Thailand]"', add
label define geolev1_lbl 764054 `"Phrae [Province: Thailand]"', add
label define geolev1_lbl 764055 `"Nan [Province: Thailand]"', add
label define geolev1_lbl 764057 `"Chiang Rai and Phayao [Province: Thailand]"', add
label define geolev1_lbl 764058 `"Mae Hong Son [Province: Thailand]"', add
label define geolev1_lbl 764060 `"Nakhon Sawan [Province: Thailand]"', add
label define geolev1_lbl 764061 `"Uthai Thani [Province: Thailand]"', add
label define geolev1_lbl 764062 `"Kamphaeng Phet [Province: Thailand]"', add
label define geolev1_lbl 764063 `"Tak [Province: Thailand]"', add
label define geolev1_lbl 764064 `"Sukhothai [Province: Thailand]"', add
label define geolev1_lbl 764065 `"Phitsanulok [Province: Thailand]"', add
label define geolev1_lbl 764066 `"Phichit [Province: Thailand]"', add
label define geolev1_lbl 764067 `"Phetchabun [Province: Thailand]"', add
label define geolev1_lbl 764070 `"Ratchaburi [Province: Thailand]"', add
label define geolev1_lbl 764071 `"Kanchanaburi [Province: Thailand]"', add
label define geolev1_lbl 764072 `"Suphanburi [Province: Thailand]"', add
label define geolev1_lbl 764073 `"Nakhon Pathom [Province: Thailand]"', add
label define geolev1_lbl 764074 `"Samut Sakhon [Province: Thailand]"', add
label define geolev1_lbl 764075 `"Samut Songkhram [Province: Thailand]"', add
label define geolev1_lbl 764076 `"Phetchaburi [Province: Thailand]"', add
label define geolev1_lbl 764077 `"Prachuap Khiri Khan [Province: Thailand]"', add
label define geolev1_lbl 764080 `"Nakhon Si Thammarat [Province: Thailand]"', add
label define geolev1_lbl 764081 `"Krabi [Province: Thailand]"', add
label define geolev1_lbl 764082 `"Phangnga [Province: Thailand]"', add
label define geolev1_lbl 764083 `"Phuket [Province: Thailand]"', add
label define geolev1_lbl 764084 `"Surat Thani [Province: Thailand]"', add
label define geolev1_lbl 764085 `"Ranong [Province: Thailand]"', add
label define geolev1_lbl 764086 `"Chumphon [Province: Thailand]"', add
label define geolev1_lbl 764090 `"Songkhla [Province: Thailand]"', add
label define geolev1_lbl 764091 `"Satun [Province: Thailand]"', add
label define geolev1_lbl 764092 `"Trang [Province: Thailand]"', add
label define geolev1_lbl 764093 `"Phatthalung [Province: Thailand]"', add
label define geolev1_lbl 764094 `"Pattani [Province: Thailand]"', add
label define geolev1_lbl 764095 `"Yala [Province: Thailand]"', add
label define geolev1_lbl 764096 `"Narathiwat [Province: Thailand]"', add
label define geolev1_lbl 792001 `"Adana, Gaziantep, Osmaniye and Kilis [Province: Turkey]"', add
label define geolev1_lbl 792002 `"Adiyaman [Province: Turkey]"', add
label define geolev1_lbl 792003 `"Afyon [Province: Turkey]"', add
label define geolev1_lbl 792004 `"Agri [Province: Turkey]"', add
label define geolev1_lbl 792005 `"Amasya [Province: Turkey]"', add
label define geolev1_lbl 792006 `"Ankara and Kirikkale [Province: Turkey]"', add
label define geolev1_lbl 792007 `"Antalya [Province: Turkey]"', add
label define geolev1_lbl 792008 `"Artvin [Province: Turkey]"', add
label define geolev1_lbl 792009 `"Aydin [Province: Turkey]"', add
label define geolev1_lbl 792010 `"Balikesir [Province: Turkey]"', add
label define geolev1_lbl 792011 `"Bilecik [Province: Turkey]"', add
label define geolev1_lbl 792012 `"Bingöl [Province: Turkey]"', add
label define geolev1_lbl 792013 `"Bitlis [Province: Turkey]"', add
label define geolev1_lbl 792014 `"Bolu and Düzce [Province: Turkey]"', add
label define geolev1_lbl 792015 `"Burdur [Province: Turkey]"', add
label define geolev1_lbl 792017 `"Çanakkale [Province: Turkey]"', add
label define geolev1_lbl 792019 `"Çorum [Province: Turkey]"', add
label define geolev1_lbl 792020 `"Denizli [Province: Turkey]"', add
label define geolev1_lbl 792021 `"Diyarbakir [Province: Turkey]"', add
label define geolev1_lbl 792022 `"Edirne [Province: Turkey]"', add
label define geolev1_lbl 792023 `"Elazig [Province: Turkey]"', add
label define geolev1_lbl 792024 `"Erzincan [Province: Turkey]"', add
label define geolev1_lbl 792025 `"Erzurum [Province: Turkey]"', add
label define geolev1_lbl 792026 `"Eskisehir [Province: Turkey]"', add
label define geolev1_lbl 792028 `"Giresun [Province: Turkey]"', add
label define geolev1_lbl 792029 `"Gümüshane and Bayburt [Province: Turkey]"', add
label define geolev1_lbl 792031 `"Hatay [Province: Turkey]"', add
label define geolev1_lbl 792032 `"Isparta [Province: Turkey]"', add
label define geolev1_lbl 792033 `"Mersin (içel) [Province: Turkey]"', add
label define geolev1_lbl 792034 `"Istanbul, Bursa, Kocaeli and Yalova [Province: Turkey]"', add
label define geolev1_lbl 792035 `"Izmir [Province: Turkey]"', add
label define geolev1_lbl 792036 `"Kars, Ardahan and Igdir [Province: Turkey]"', add
label define geolev1_lbl 792037 `"Kastamonu [Province: Turkey]"', add
label define geolev1_lbl 792038 `"Kayseri [Province: Turkey]"', add
label define geolev1_lbl 792039 `"Kirklareli [Province: Turkey]"', add
label define geolev1_lbl 792040 `"Kirsehir [Province: Turkey]"', add
label define geolev1_lbl 792042 `"Konya and Karaman [Province: Turkey]"', add
label define geolev1_lbl 792043 `"Kütahya [Province: Turkey]"', add
label define geolev1_lbl 792044 `"Malatya [Province: Turkey]"', add
label define geolev1_lbl 792045 `"Manisa [Province: Turkey]"', add
label define geolev1_lbl 792046 `"Kahramanmaras [Province: Turkey]"', add
label define geolev1_lbl 792047 `"Mardin, Hakkari, Siirt, Batman and Sirnak [Province: Turkey]"', add
label define geolev1_lbl 792048 `"Mugla [Province: Turkey]"', add
label define geolev1_lbl 792049 `"Mus [Province: Turkey]"', add
label define geolev1_lbl 792050 `"Nevsehir [Province: Turkey]"', add
label define geolev1_lbl 792051 `"Nigde and Aksaray [Province: Turkey]"', add
label define geolev1_lbl 792052 `"Ordu [Province: Turkey]"', add
label define geolev1_lbl 792053 `"Rize [Province: Turkey]"', add
label define geolev1_lbl 792054 `"Sakarya [Province: Turkey]"', add
label define geolev1_lbl 792055 `"Samsun [Province: Turkey]"', add
label define geolev1_lbl 792057 `"Sinop [Province: Turkey]"', add
label define geolev1_lbl 792058 `"Sivas [Province: Turkey]"', add
label define geolev1_lbl 792059 `"Tekirdag [Province: Turkey]"', add
label define geolev1_lbl 792060 `"Tokat [Province: Turkey]"', add
label define geolev1_lbl 792061 `"Trabzon [Province: Turkey]"', add
label define geolev1_lbl 792062 `"Tunceli [Province: Turkey]"', add
label define geolev1_lbl 792063 `"Sanliurfa [Province: Turkey]"', add
label define geolev1_lbl 792064 `"Usak [Province: Turkey]"', add
label define geolev1_lbl 792065 `"Van [Province: Turkey]"', add
label define geolev1_lbl 792066 `"Yozgat [Province: Turkey]"', add
label define geolev1_lbl 792067 `"Zonguldak, Çankiri, Karabuk and Bartin [Province: Turkey]"', add
label define geolev1_lbl 800101 `"Kalangala [District: Uganda]"', add
label define geolev1_lbl 800102 `"Kampala [District: Uganda]"', add
label define geolev1_lbl 800103 `"Kiboga [District: Uganda]"', add
label define geolev1_lbl 800104 `"Luwero and Nakasongola [District: Uganda]"', add
label define geolev1_lbl 800105 `"Masaka and Sembabule [District: Uganda]"', add
label define geolev1_lbl 800107 `"Mubende [District: Uganda]"', add
label define geolev1_lbl 800108 `"Mukono and Kayunga [District: Uganda]"', add
label define geolev1_lbl 800110 `"Rakai [District: Uganda]"', add
label define geolev1_lbl 800113 `"Mpigi and Wakiso [District: Uganda]"', add
label define geolev1_lbl 800203 `"Iganga, Buguri, and Mayuge [District: Uganda]"', add
label define geolev1_lbl 800204 `"Jinja [District: Uganda]"', add
label define geolev1_lbl 800205 `"Kamuli [District: Uganda]"', add
label define geolev1_lbl 800206 `"Kapchorwa [District: Uganda]"', add
label define geolev1_lbl 800208 `"Kumi [District: Uganda]"', add
label define geolev1_lbl 800209 `"Mbale and Sironko [District: Uganda]"', add
label define geolev1_lbl 800210 `"Pallisa [District: Uganda]"', add
label define geolev1_lbl 800211 `"Soroti, Katakwi, and Kaberamaido [District: Uganda]"', add
label define geolev1_lbl 800212 `"Busia and Tororo [District: Uganda]"', add
label define geolev1_lbl 800301 `"Moyo and Adjumani [District: Uganda]"', add
label define geolev1_lbl 800302 `"Apac [District: Uganda]"', add
label define geolev1_lbl 800303 `"Arua and Yumbe [District: Uganda]"', add
label define geolev1_lbl 800304 `"Gulu [District: Uganda]"', add
label define geolev1_lbl 800306 `"Kotido [District: Uganda]"', add
label define geolev1_lbl 800307 `"Lira [District: Uganda]"', add
label define geolev1_lbl 800308 `"Moroto and Nakapiripirit [District: Uganda]"', add
label define geolev1_lbl 800310 `"Nebbi [District: Uganda]"', add
label define geolev1_lbl 800312 `"Kitgum and Pader [District: Uganda]"', add
label define geolev1_lbl 800401 `"Bundibugyo [District: Uganda]"', add
label define geolev1_lbl 800403 `"Hoima [District: Uganda]"', add
label define geolev1_lbl 800404 `"Kabale [District: Uganda]"', add
label define geolev1_lbl 800405 `"Kabarole, Kamwenge, and Kyenjojo [District: Uganda]"', add
label define geolev1_lbl 800406 `"Kasese [District: Uganda]"', add
label define geolev1_lbl 800407 `"Kibaale [District: Uganda]"', add
label define geolev1_lbl 800408 `"Kisoro [District: Uganda]"', add
label define geolev1_lbl 800409 `"Masindi [District: Uganda]"', add
label define geolev1_lbl 800410 `"Bushenyi, Mbarara, and Ntungamo [District: Uganda]"', add
label define geolev1_lbl 800412 `"Rukungiri and Kanungu [District: Uganda]"', add
label define geolev1_lbl 800999 `"Unknown [District: Uganda]"', add
label define geolev1_lbl 804001 `"The Autonomous Republic of Crimea [Region: Ukraine]"', add
label define geolev1_lbl 804005 `"Vinnytska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804007 `"Volynska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804012 `"Dnipropetrovska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804014 `"Donetska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804018 `"Zhytomyrska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804021 `"Zakarpatska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804023 `"Zaporizka oblast [Region: Ukraine]"', add
label define geolev1_lbl 804026 `"Ivano-Frankivska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804032 `"Kyivska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804035 `"Kirovohradska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804044 `"Luhanska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804046 `"Lvivska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804048 `"Mykolaivska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804051 `"Odeska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804053 `"Poltavska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804056 `"Rivnenska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804059 `"Sumska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804061 `"Ternopilska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804063 `"Kharkivska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804065 `"Khersonska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804068 `"Khmelnytska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804071 `"Cherkaska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804073 `"Chernivetska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804074 `"Chernihivska oblast [Region: Ukraine]"', add
label define geolev1_lbl 804080 `"Kyiv [Region: Ukraine]"', add
label define geolev1_lbl 804085 `"Sevastopol [Region: Ukraine]"', add
label define geolev1_lbl 818001 `"Cairo [Governorate: Egypt]"', add
label define geolev1_lbl 818002 `"Alexandria [Governorate: Egypt]"', add
label define geolev1_lbl 818003 `"Port Said [Governorate: Egypt]"', add
label define geolev1_lbl 818004 `"Suez [Governorate: Egypt]"', add
label define geolev1_lbl 818011 `"Damietta [Governorate: Egypt]"', add
label define geolev1_lbl 818012 `"Dakahlia [Governorate: Egypt]"', add
label define geolev1_lbl 818013 `"Sharkia [Governorate: Egypt]"', add
label define geolev1_lbl 818014 `"Kaliobia [Governorate: Egypt]"', add
label define geolev1_lbl 818015 `"Kafr Sheikh [Governorate: Egypt]"', add
label define geolev1_lbl 818016 `"Gharbia [Governorate: Egypt]"', add
label define geolev1_lbl 818017 `"Menoufia [Governorate: Egypt]"', add
label define geolev1_lbl 818018 `"Behera [Governorate: Egypt]"', add
label define geolev1_lbl 818019 `"Ismailia [Governorate: Egypt]"', add
label define geolev1_lbl 818021 `"Giza [Governorate: Egypt]"', add
label define geolev1_lbl 818022 `"Bani Swif [Governorate: Egypt]"', add
label define geolev1_lbl 818023 `"Fayoum [Governorate: Egypt]"', add
label define geolev1_lbl 818024 `"Menia [Governorate: Egypt]"', add
label define geolev1_lbl 818025 `"Asiut [Governorate: Egypt]"', add
label define geolev1_lbl 818026 `"Sohag [Governorate: Egypt]"', add
label define geolev1_lbl 818027 `"Qena [Governorate: Egypt]"', add
label define geolev1_lbl 818028 `"Aswan [Governorate: Egypt]"', add
label define geolev1_lbl 818029 `"Luxor [Governorate: Egypt]"', add
label define geolev1_lbl 818031 `"Red Sea [Governorate: Egypt]"', add
label define geolev1_lbl 818032 `"New Valley [Governorate: Egypt]"', add
label define geolev1_lbl 818033 `"Marsa Matroh [Governorate: Egypt]"', add
label define geolev1_lbl 818034 `"North Sinai [Governorate: Egypt]"', add
label define geolev1_lbl 818035 `"South Sinai [Governorate: Egypt]"', add
label define geolev1_lbl 826011 `"North East [Region: United Kingdom]"', add
label define geolev1_lbl 826013 `"North West [Region: United Kingdom]"', add
label define geolev1_lbl 826014 `"Yorkshire and the Humber [Region: United Kingdom]"', add
label define geolev1_lbl 826021 `"East Midlands [Region: United Kingdom]"', add
label define geolev1_lbl 826022 `"West Midlands [Region: United Kingdom]"', add
label define geolev1_lbl 826031 `"East of England [Region: United Kingdom]"', add
label define geolev1_lbl 826032 `"South East and London [Region: United Kingdom]"', add
label define geolev1_lbl 826040 `"South West [Region: United Kingdom]"', add
label define geolev1_lbl 826060 `"Scotland [Region: United Kingdom]"', add
label define geolev1_lbl 826070 `"Wales [Region: United Kingdom]"', add
label define geolev1_lbl 826080 `"Northern Ireland [Region: United Kingdom]"', add
label define geolev1_lbl 834001 `"Dodoma [Region: Tanzania]"', add
label define geolev1_lbl 834003 `"Kilimanjaro [Region: Tanzania]"', add
label define geolev1_lbl 834004 `"Tanga [Region: Tanzania]"', add
label define geolev1_lbl 834005 `"Morogoro [Region: Tanzania]"', add
label define geolev1_lbl 834006 `"Pwani [Region: Tanzania]"', add
label define geolev1_lbl 834007 `"Dar es Salaam [Region: Tanzania]"', add
label define geolev1_lbl 834008 `"Lindi [Region: Tanzania]"', add
label define geolev1_lbl 834009 `"Mtwara [Region: Tanzania]"', add
label define geolev1_lbl 834010 `"Ruvumba [Region: Tanzania]"', add
label define geolev1_lbl 834011 `"Iringa [Region: Tanzania]"', add
label define geolev1_lbl 834012 `"Mbeya [Region: Tanzania]"', add
label define geolev1_lbl 834013 `"Singida [Region: Tanzania]"', add
label define geolev1_lbl 834014 `"Tabora [Region: Tanzania]"', add
label define geolev1_lbl 834015 `"Rukwa [Region: Tanzania]"', add
label define geolev1_lbl 834016 `"Kigoma [Region: Tanzania]"', add
label define geolev1_lbl 834017 `"Shinyanga [Region: Tanzania]"', add
label define geolev1_lbl 834018 `"Kagera [Region: Tanzania]"', add
label define geolev1_lbl 834019 `"Mwanza [Region: Tanzania]"', add
label define geolev1_lbl 834020 `"Mara [Region: Tanzania]"', add
label define geolev1_lbl 834021 `"Arusha and Manyara [Region: Tanzania]"', add
label define geolev1_lbl 834051 `"Zanzibar North [Region: Tanzania]"', add
label define geolev1_lbl 834052 `"Zanzibar South [Region: Tanzania]"', add
label define geolev1_lbl 834053 `"Zanzibar Town/West [Region: Tanzania]"', add
label define geolev1_lbl 834054 `"Pemba North [Region: Tanzania]"', add
label define geolev1_lbl 834055 `"Pemba South [Region: Tanzania]"', add
label define geolev1_lbl 840001 `"Alabama [State: U.S.]"', add
label define geolev1_lbl 840002 `"Alaska [State: U.S.]"', add
label define geolev1_lbl 840004 `"Arizona [State: U.S.]"', add
label define geolev1_lbl 840005 `"Arkansas [State: U.S.]"', add
label define geolev1_lbl 840006 `"California [State: U.S.]"', add
label define geolev1_lbl 840008 `"Colorado [State: U.S.]"', add
label define geolev1_lbl 840009 `"Connecticut [State: U.S.]"', add
label define geolev1_lbl 840010 `"Delaware [State: U.S.]"', add
label define geolev1_lbl 840011 `"District of Columbia [State: U.S.]"', add
label define geolev1_lbl 840012 `"Florida [State: U.S.]"', add
label define geolev1_lbl 840013 `"Georgia [State: U.S.]"', add
label define geolev1_lbl 840015 `"Hawaii [State: U.S.]"', add
label define geolev1_lbl 840016 `"Idaho [State: U.S.]"', add
label define geolev1_lbl 840017 `"Illinois [State: U.S.]"', add
label define geolev1_lbl 840018 `"Indiana [State: U.S.]"', add
label define geolev1_lbl 840019 `"Iowa [State: U.S.]"', add
label define geolev1_lbl 840020 `"Kansas [State: U.S.]"', add
label define geolev1_lbl 840021 `"Kentucky [State: U.S.]"', add
label define geolev1_lbl 840022 `"Louisiana [State: U.S.]"', add
label define geolev1_lbl 840023 `"Maine [State: U.S.]"', add
label define geolev1_lbl 840024 `"Maryland [State: U.S.]"', add
label define geolev1_lbl 840025 `"Massachusetts [State: U.S.]"', add
label define geolev1_lbl 840026 `"Michigan [State: U.S.]"', add
label define geolev1_lbl 840027 `"Minnesota [State: U.S.]"', add
label define geolev1_lbl 840028 `"Mississippi [State: U.S.]"', add
label define geolev1_lbl 840029 `"Missouri [State: U.S.]"', add
label define geolev1_lbl 840030 `"Montana [State: U.S.]"', add
label define geolev1_lbl 840031 `"Nebraska [State: U.S.]"', add
label define geolev1_lbl 840032 `"Nevada [State: U.S.]"', add
label define geolev1_lbl 840033 `"New Hampshire [State: U.S.]"', add
label define geolev1_lbl 840034 `"New Jersey [State: U.S.]"', add
label define geolev1_lbl 840035 `"New Mexico [State: U.S.]"', add
label define geolev1_lbl 840036 `"New York [State: U.S.]"', add
label define geolev1_lbl 840037 `"North Carolina [State: U.S.]"', add
label define geolev1_lbl 840038 `"North Dakota [State: U.S.]"', add
label define geolev1_lbl 840039 `"Ohio [State: U.S.]"', add
label define geolev1_lbl 840040 `"Oklahoma [State: U.S.]"', add
label define geolev1_lbl 840041 `"Oregon [State: U.S.]"', add
label define geolev1_lbl 840042 `"Pennsylvania [State: U.S.]"', add
label define geolev1_lbl 840044 `"Rhode Island [State: U.S.]"', add
label define geolev1_lbl 840045 `"South Carolina [State: U.S.]"', add
label define geolev1_lbl 840046 `"South Dakota [State: U.S.]"', add
label define geolev1_lbl 840047 `"Tennessee [State: U.S.]"', add
label define geolev1_lbl 840048 `"Texas [State: U.S.]"', add
label define geolev1_lbl 840049 `"Utah [State: U.S.]"', add
label define geolev1_lbl 840050 `"Vermont [State: U.S.]"', add
label define geolev1_lbl 840051 `"Virginia [State: U.S.]"', add
label define geolev1_lbl 840053 `"Washington [State: U.S.]"', add
label define geolev1_lbl 840054 `"West Virginia [State: U.S.]"', add
label define geolev1_lbl 840055 `"Wisconsin [State: U.S.]"', add
label define geolev1_lbl 840056 `"Wyoming [State: U.S.]"', add
label define geolev1_lbl 840099 `"State not identified [State: U.S.]"', add
label define geolev1_lbl 854001 `"Boucle du Mouhoun [Region: Burkina Faso]"', add
label define geolev1_lbl 854002 `"Cascades [Region: Burkina Faso]"', add
label define geolev1_lbl 854003 `"Centre [Region: Burkina Faso]"', add
label define geolev1_lbl 854004 `"Centre-Est [Region: Burkina Faso]"', add
label define geolev1_lbl 854005 `"Centre-Nord [Region: Burkina Faso]"', add
label define geolev1_lbl 854006 `"Centre-Ouest [Region: Burkina Faso]"', add
label define geolev1_lbl 854007 `"Centre-Sud [Region: Burkina Faso]"', add
label define geolev1_lbl 854008 `"Est [Region: Burkina Faso]"', add
label define geolev1_lbl 854009 `"Hauts-Bassins [Region: Burkina Faso]"', add
label define geolev1_lbl 854010 `"Nord [Region: Burkina Faso]"', add
label define geolev1_lbl 854011 `"Plateau Central [Region: Burkina Faso]"', add
label define geolev1_lbl 854012 `"Sahel [Region: Burkina Faso]"', add
label define geolev1_lbl 854013 `"Sud-Ouest [Region: Burkina Faso]"', add
label define geolev1_lbl 858001 `"Montevideo [Department: Uruguay]"', add
label define geolev1_lbl 858002 `"Artigas [Department: Uruguay]"', add
label define geolev1_lbl 858003 `"Canelones [Department: Uruguay]"', add
label define geolev1_lbl 858004 `"Cerro Largo [Department: Uruguay]"', add
label define geolev1_lbl 858005 `"Colonia [Department: Uruguay]"', add
label define geolev1_lbl 858006 `"Durazno [Department: Uruguay]"', add
label define geolev1_lbl 858007 `"Flores [Department: Uruguay]"', add
label define geolev1_lbl 858008 `"Florida [Department: Uruguay]"', add
label define geolev1_lbl 858009 `"Lavalleja [Department: Uruguay]"', add
label define geolev1_lbl 858010 `"Maldonado [Department: Uruguay]"', add
label define geolev1_lbl 858011 `"Paysandú [Department: Uruguay]"', add
label define geolev1_lbl 858012 `"Río Negro [Department: Uruguay]"', add
label define geolev1_lbl 858013 `"Rivera [Department: Uruguay]"', add
label define geolev1_lbl 858014 `"Rocha [Department: Uruguay]"', add
label define geolev1_lbl 858015 `"Salto [Department: Uruguay]"', add
label define geolev1_lbl 858016 `"San Jose [Department: Uruguay]"', add
label define geolev1_lbl 858017 `"Soriano [Department: Uruguay]"', add
label define geolev1_lbl 858018 `"Tacuarembó [Department: Uruguay]"', add
label define geolev1_lbl 858019 `"Treinta Y Tres [Department: Uruguay]"', add
label define geolev1_lbl 862001 `"Federal District, Vargas [State: Venezuela]"', add
label define geolev1_lbl 862002 `"Amazonas Federal Territory [State: Venezuela]"', add
label define geolev1_lbl 862003 `"Anzoátegui [State: Venezuela]"', add
label define geolev1_lbl 862004 `"Apure [State: Venezuela]"', add
label define geolev1_lbl 862005 `"Aragua [State: Venezuela]"', add
label define geolev1_lbl 862007 `"Bolívar [State: Venezuela]"', add
label define geolev1_lbl 862008 `"Carabobo [State: Venezuela]"', add
label define geolev1_lbl 862009 `"Cojedes [State: Venezuela]"', add
label define geolev1_lbl 862010 `"Amacuros Delta Federal Territory [State: Venezuela]"', add
label define geolev1_lbl 862011 `"Falcón [State: Venezuela]"', add
label define geolev1_lbl 862012 `"Guárico [State: Venezuela]"', add
label define geolev1_lbl 862013 `"Lara [State: Venezuela]"', add
label define geolev1_lbl 862014 `"Barinas, Mérida [State: Venezuela]"', add
label define geolev1_lbl 862015 `"Miranda [State: Venezuela]"', add
label define geolev1_lbl 862016 `"Monagas [State: Venezuela]"', add
label define geolev1_lbl 862017 `"Nueva Esparta, Federal Dependencies [State: Venezuela]"', add
label define geolev1_lbl 862018 `"Portuguesa [State: Venezuela]"', add
label define geolev1_lbl 862019 `"Sucre [State: Venezuela]"', add
label define geolev1_lbl 862020 `"Táchira [State: Venezuela]"', add
label define geolev1_lbl 862021 `"Trujillo [State: Venezuela]"', add
label define geolev1_lbl 862022 `"Yaracuy [State: Venezuela]"', add
label define geolev1_lbl 862023 `"Zulia [State: Venezuela]"', add
label define geolev1_lbl 894001 `"Central [Province: Zambia]"', add
label define geolev1_lbl 894002 `"Copperbelt [Province: Zambia]"', add
label define geolev1_lbl 894003 `"Eastern, Muchinga, Northern [Province: Zambia]"', add
label define geolev1_lbl 894004 `"Luapula [Province: Zambia]"', add
label define geolev1_lbl 894005 `"Lusaka [Province: Zambia]"', add
label define geolev1_lbl 894008 `"North Western [Province: Zambia]"', add
label define geolev1_lbl 894009 `"Southern [Province: Zambia]"', add
label define geolev1_lbl 894010 `"Western [Province: Zambia]"', add
label values geolev1 geolev1_lbl

label define geo1_do_lbl 214001 `"Federal district and Santo Domingo"'
label define geo1_do_lbl 214002 `"Azua"', add
label define geo1_do_lbl 214003 `"Baoruco"', add
label define geo1_do_lbl 214004 `"Barahona"', add
label define geo1_do_lbl 214005 `"Dajabón"', add
label define geo1_do_lbl 214006 `"Duarte"', add
label define geo1_do_lbl 214007 `"Elías Piña"', add
label define geo1_do_lbl 214008 `"El Seibo and Hato Mayor"', add
label define geo1_do_lbl 214009 `"Espaillat"', add
label define geo1_do_lbl 214010 `"Independencia"', add
label define geo1_do_lbl 214011 `"La Altagracia and La Romana"', add
label define geo1_do_lbl 214013 `"La Vega and Monseñor Nouel"', add
label define geo1_do_lbl 214014 `"María Trinidad Sánchez and Samaná"', add
label define geo1_do_lbl 214015 `"Monte Cristi"', add
label define geo1_do_lbl 214016 `"Pedernales"', add
label define geo1_do_lbl 214017 `"Peravia and San José de Ocoa"', add
label define geo1_do_lbl 214018 `"Puerto Plata"', add
label define geo1_do_lbl 214019 `"Hermanas Mirabal"', add
label define geo1_do_lbl 214021 `"San Cristóbal and Monte Plata"', add
label define geo1_do_lbl 214022 `"San Juan"', add
label define geo1_do_lbl 214023 `"San Pedro de Macorís"', add
label define geo1_do_lbl 214024 `"Sánchez Ramírez"', add
label define geo1_do_lbl 214025 `"Santiago"', add
label define geo1_do_lbl 214026 `"Santiago Rodríguez"', add
label define geo1_do_lbl 214027 `"Valverde"', add
label values geo1_do geo1_do_lbl

label define geo1_dox_lbl 01 `"Federal district"'
label define geo1_dox_lbl 02 `"Azua"', add
label define geo1_dox_lbl 03 `"Baoruco"', add
label define geo1_dox_lbl 04 `"Barahona"', add
label define geo1_dox_lbl 05 `"Dajabón"', add
label define geo1_dox_lbl 06 `"Duarte"', add
label define geo1_dox_lbl 07 `"Elías Piña"', add
label define geo1_dox_lbl 08 `"El Seibo"', add
label define geo1_dox_lbl 09 `"Espaillat"', add
label define geo1_dox_lbl 10 `"Independencia"', add
label define geo1_dox_lbl 11 `"La Altagracia"', add
label define geo1_dox_lbl 12 `"La Romana"', add
label define geo1_dox_lbl 13 `"La Vega"', add
label define geo1_dox_lbl 14 `"María Trinidad Sánchez"', add
label define geo1_dox_lbl 15 `"Monte Cristi"', add
label define geo1_dox_lbl 16 `"Pedernales"', add
label define geo1_dox_lbl 17 `"Peravia"', add
label define geo1_dox_lbl 18 `"Puerto Plata"', add
label define geo1_dox_lbl 19 `"Hermanas Mirabal"', add
label define geo1_dox_lbl 20 `"Samaná"', add
label define geo1_dox_lbl 21 `"San Cristóbal"', add
label define geo1_dox_lbl 22 `"San Juan"', add
label define geo1_dox_lbl 23 `"San Pedro de Macorís"', add
label define geo1_dox_lbl 24 `"Sánchez Ramírez"', add
label define geo1_dox_lbl 25 `"Santiago"', add
label define geo1_dox_lbl 26 `"Santiago Rodríguez"', add
label define geo1_dox_lbl 27 `"Valverde"', add
label define geo1_dox_lbl 28 `"Monseñor Nouel"', add
label define geo1_dox_lbl 29 `"Monte Plata"', add
label define geo1_dox_lbl 30 `"Hato Mayor"', add
label define geo1_dox_lbl 31 `"San José de Ocoa"', add
label define geo1_dox_lbl 32 `"Santo Domingo"', add
label define geo1_dox_lbl 40 `"Julia Molina"', add
label values geo1_dox geo1_dox_lbl

label define geo2_dox_lbl 0101 `"Santo Domingo de Guzman"'
label define geo2_dox_lbl 0201 `"Azua and Pueblo Viejo"', add
label define geo2_dox_lbl 0204 `"Padre las Casas and Sabana Yegua"', add
label define geo2_dox_lbl 0205 `"Peralta, Las Charcas, Palmar de Ocoa, Villarpando, and  Estebanía"', add
label define geo2_dox_lbl 0208 `"Tábara Arriba, Las Yayas de Viajama, and Guayabal"', add
label define geo2_dox_lbl 0213 `"Puerto Viejo"', add
label define geo2_dox_lbl 0214 `"Jose Trujillo Valdez"', add
label define geo2_dox_lbl 0301 `"Neiba, Galvan, Villa Jaragua, and Los Ríos"', add
label define geo2_dox_lbl 0306 `"Uvilla, Tamayo, and El Palmar"', add
label define geo2_dox_lbl 0401 `"Barahona, La Cienaga, El Peñon, Pescadería and Fundación"', add
label define geo2_dox_lbl 0402 `"Cabral, Las Salinas, El Cachón, and Polo"', add
label define geo2_dox_lbl 0404 `"Paraiso and Enriquillo"', add
label define geo2_dox_lbl 0405 `"Vicente Noble, Canoa and Jaquimeyes"', add
label define geo2_dox_lbl 0501 `"Dajabón"', add
label define geo2_dox_lbl 0502 `"Loma de Cabrera, Partido, Restauración, and El Pino"', add
label define geo2_dox_lbl 0601 `"San Francisco de Macorís"', add
label define geo2_dox_lbl 0603 `"Castillo and Eugenio María de Hostos"', add
label define geo2_dox_lbl 0604 `"Pimentel and Las Guáranas"', add
label define geo2_dox_lbl 0605 `"Villa Riva and Arenoso"', add
label define geo2_dox_lbl 0609 `"Other municipalities in Duarte"', add
label define geo2_dox_lbl 0701 `"Comendador, Banica, and Pedro Santana"', add
label define geo2_dox_lbl 0704 `"Hondo Valle, Juan Santiago, and El Llano"', add
label define geo2_dox_lbl 0801 `"El Seibo"', add
label define geo2_dox_lbl 0802 `"Miches and Pedro Sánchez"', add
label define geo2_dox_lbl 0901 `"Moca and Cayetano Germosén"', add
label define geo2_dox_lbl 0903 `"Gaspar Hernández and Jamao al Norte"', add
label define geo2_dox_lbl 0909 `"Other municipalities in Espaillat"', add
label define geo2_dox_lbl 1000 `"Municipalities in Independencia province"', add
label define geo2_dox_lbl 1101 `"Higüey"', add
label define geo2_dox_lbl 1102 `"San Rafael del Yuma"', add
label define geo2_dox_lbl 1109 `"Other municipalities in La Altagracia"', add
label define geo2_dox_lbl 1201 `"La Romana and Guaymate"', add
label define geo2_dox_lbl 1203 `"Villa Hermosa"', add
label define geo2_dox_lbl 1301 `"La Vega"', add
label define geo2_dox_lbl 1302 `"Constanza"', add
label define geo2_dox_lbl 1303 `"Jarabacoa"', add
label define geo2_dox_lbl 1304 `"Jima Abajo"', add
label define geo2_dox_lbl 1309 `"Other municipalities in La Vega"', add
label define geo2_dox_lbl 1401 `"Nagua"', add
label define geo2_dox_lbl 1402 `"Cabrera and Río San Juan"', add
label define geo2_dox_lbl 1403 `"El Factor"', add
label define geo2_dox_lbl 1409 `"Other municipalities in Maria Trinidad"', add
label define geo2_dox_lbl 1501 `"Monte Cristi and Pepillo Salcedo"', add
label define geo2_dox_lbl 1502 `"Castañuelas and Villa Vásquez"', add
label define geo2_dox_lbl 1503 `"Guayubín and Las Matas de Santa Cruz"', add
label define geo2_dox_lbl 1509 `"Other municipalities in Monte Cristi"', add
label define geo2_dox_lbl 1600 `"Municipalities in Pedernales Province"', add
label define geo2_dox_lbl 1701 `"Baní"', add
label define geo2_dox_lbl 1702 `"Nizao"', add
label define geo2_dox_lbl 1709 `"Other municipalities in Peravia"', add
label define geo2_dox_lbl 1801 `"Puerto Plata"', add
label define geo2_dox_lbl 1802 `"Altamira and Guananico"', add
label define geo2_dox_lbl 1804 `"Imbert"', add
label define geo2_dox_lbl 1806 `"Villa Isabela, Los Hidalgos, and Luperón"', add
label define geo2_dox_lbl 1807 `"Sosúa and Villa Montellano"', add
label define geo2_dox_lbl 1810 `"Other municipalities in Puerto Plata"', add
label define geo2_dox_lbl 1901 `"Salcedo"', add
label define geo2_dox_lbl 1902 `"Tenares"', add
label define geo2_dox_lbl 1903 `"Villa Tapia"', add
label define geo2_dox_lbl 1909 `"Other municipalities in Hermanas Mirabal"', add
label define geo2_dox_lbl 2001 `"Samaná"', add
label define geo2_dox_lbl 2002 `"Sánchez and  Las Terrenas"', add
label define geo2_dox_lbl 2101 `"San Cristóbal"', add
label define geo2_dox_lbl 2102 `"Sabana Grande de Palenque and Los Cacaos"', add
label define geo2_dox_lbl 2103 `"Bajos de Haina"', add
label define geo2_dox_lbl 2104 `"Cambita Garabitos"', add
label define geo2_dox_lbl 2105 `"Villa Altagracia"', add
label define geo2_dox_lbl 2106 `"Yaguate"', add
label define geo2_dox_lbl 2107 `"San Gregorio de Nigua"', add
label define geo2_dox_lbl 2109 `"El Carril"', add
label define geo2_dox_lbl 2201 `"San Juan, Juan de Herrera, and Bohechío"', add
label define geo2_dox_lbl 2203 `"El Cercado and Vallejuelo"', add
label define geo2_dox_lbl 2205 `"Las Matas de Farfán"', add
label define geo2_dox_lbl 2209 `"Other municipalities in San Juan"', add
label define geo2_dox_lbl 2301 `"San Pedro de Macorís and Ramón Santana"', add
label define geo2_dox_lbl 2302 `"Los Llanos, Quisqueya, and Guayacanes"', add
label define geo2_dox_lbl 2309 `"Other municipalities in San Pedro de Macorís"', add
label define geo2_dox_lbl 2401 `"Cotuí and Cevicos"', add
label define geo2_dox_lbl 2403 `"Fantino"', add
label define geo2_dox_lbl 2404 `"La Mata and La Cueva"', add
label define geo2_dox_lbl 2501 `"Santiago"', add
label define geo2_dox_lbl 2502 `"Bisonó"', add
label define geo2_dox_lbl 2503 `"Jánico and Sabana Iglesia"', add
label define geo2_dox_lbl 2504 `"Licey Al Medio"', add
label define geo2_dox_lbl 2505 `"San José de las Matas"', add
label define geo2_dox_lbl 2506 `"Tamboril"', add
label define geo2_dox_lbl 2507 `"Villa González"', add
label define geo2_dox_lbl 2508 `"Puñal"', add
label define geo2_dox_lbl 2509 `"Other municipalities in Santiago"', add
label define geo2_dox_lbl 2600 `"Municipalities in Santiago Rodríguez province"', add
label define geo2_dox_lbl 2701 `"Mao"', add
label define geo2_dox_lbl 2702 `"Esperanza"', add
label define geo2_dox_lbl 2703 `"Laguna Salada and La Caya"', add
label define geo2_dox_lbl 2709 `"Other municipalities in Valverde"', add
label define geo2_dox_lbl 2801 `"Bonao"', add
label define geo2_dox_lbl 2803 `"Piedra Blanca and Maimón"', add
label define geo2_dox_lbl 2809 `"Other municipalities in Monseñor Nouel"', add
label define geo2_dox_lbl 2901 `"Monte Plata"', add
label define geo2_dox_lbl 2902 `"Bayaguana"', add
label define geo2_dox_lbl 2903 `"Sabana Grande de Boya"', add
label define geo2_dox_lbl 2904 `"Yamasá"', add
label define geo2_dox_lbl 2905 `"Peralvillo"', add
label define geo2_dox_lbl 2909 `"Other municipalities in Monte Plata"', add
label define geo2_dox_lbl 3001 `"Hato Mayor and Yerba Buena"', add
label define geo2_dox_lbl 3009 `"Other municipalities in Hato Mayor"', add
label define geo2_dox_lbl 3101 `"San José de Ocoa and La Cienaga (San José de Ocoa)"', add
label define geo2_dox_lbl 3109 `"Other municipalities in San José de Ocoa"', add
label define geo2_dox_lbl 3201 `"Santo Domingo Este"', add
label define geo2_dox_lbl 3202 `"Santo Domingo oeste"', add
label define geo2_dox_lbl 3203 `"Santo Domingo Norte"', add
label define geo2_dox_lbl 3204 `"Boca Chica"', add
label define geo2_dox_lbl 3205 `"San Antonio de Guerra"', add
label define geo2_dox_lbl 3206 `"Los Alcarrizos"', add
label define geo2_dox_lbl 3207 `"Pedro Brand"', add
label define geo2_dox_lbl 3208 `"Santo Domingo Norte", add
label values geo2_dox geo2_dox_lbl

label define subrdo_lbl 01 `"Cibao Norte"'
label define subrdo_lbl 02 `"Cibao Sur"', add
label define subrdo_lbl 03 `"Cibao Nordeste"', add
label define subrdo_lbl 04 `"Cibao Noroeste"', add
label define subrdo_lbl 05 `"Valdesia"', add
label define subrdo_lbl 06 `"Enriquillo"', add
label define subrdo_lbl 07 `"El Valle"', add
label define subrdo_lbl 08 `"Yuma and Higuamo"', add
label define subrdo_lbl 10 `"Ozama"', add
label values subrdo subrdo_lbl

label define ownership_lbl 0 `"NIU (not in universe)"'
label define ownership_lbl 1 `"Owned"', add
label define ownership_lbl 2 `"Not owned"', add
label define ownership_lbl 9 `"Unknown"', add
label values ownership ownership_lbl

label define ownershipd_lbl 000 `"NIU (not in universe)"'
label define ownershipd_lbl 100 `"Owned"', add
label define ownershipd_lbl 110 `"Owned, already paid"', add
label define ownershipd_lbl 120 `"Owned, still paying"', add
label define ownershipd_lbl 130 `"Owned, constructed"', add
label define ownershipd_lbl 140 `"Owned, inherited"', add
label define ownershipd_lbl 190 `"Owned, other"', add
label define ownershipd_lbl 191 `"Owned, house"', add
label define ownershipd_lbl 192 `"Owned, condominium"', add
label define ownershipd_lbl 193 `"Apartment proprietor"', add
label define ownershipd_lbl 194 `"Shared ownership"', add
label define ownershipd_lbl 200 `"Not owned"', add
label define ownershipd_lbl 210 `"Renting, not specified"', add
label define ownershipd_lbl 211 `"Renting, government"', add
label define ownershipd_lbl 212 `"Renting, local authority"', add
label define ownershipd_lbl 213 `"Renting, parastatal"', add
label define ownershipd_lbl 214 `"Renting, private"', add
label define ownershipd_lbl 215 `"Renting, private company"', add
label define ownershipd_lbl 216 `"Renting, individual"', add
label define ownershipd_lbl 217 `"Renting, collective"', add
label define ownershipd_lbl 218 `"Renting, joint state and individual"', add
label define ownershipd_lbl 219 `"Renting, public subsidized"', add
label define ownershipd_lbl 220 `"Renting, private subsidized"', add
label define ownershipd_lbl 221 `"Renting, co-tenant"', add
label define ownershipd_lbl 222 `"Renting, relative of tenant"', add
label define ownershipd_lbl 223 `"Renting, cooperative"', add
label define ownershipd_lbl 224 `"Renting, with a job or business"', add
label define ownershipd_lbl 225 `"Renting, loan-backed habitation"', add
label define ownershipd_lbl 226 `"Renting, mixed contract"', add
label define ownershipd_lbl 227 `"Furnished dwelling"', add
label define ownershipd_lbl 228 `"Sharecropping"', add
label define ownershipd_lbl 230 `"Subletting"', add
label define ownershipd_lbl 231 `"Rent to own"', add
label define ownershipd_lbl 239 `"Renting, other"', add
label define ownershipd_lbl 240 `"Occupied de facto/squatting"', add
label define ownershipd_lbl 250 `"Free/usufruct (no cash rent)"', add
label define ownershipd_lbl 251 `"Free, provided by employer"', add
label define ownershipd_lbl 252 `"Free, without work or services"', add
label define ownershipd_lbl 253 `"Free, provided by family or friend"', add
label define ownershipd_lbl 254 `"Free, private"', add
label define ownershipd_lbl 255 `"Free, public"', add
label define ownershipd_lbl 256 `"Free, condemned"', add
label define ownershipd_lbl 257 `"Free, other"', add
label define ownershipd_lbl 290 `"Not owned, other"', add
label define ownershipd_lbl 999 `"Unknown"', add
label values ownershipd ownershipd_lbl

label define intmig1_lbl 00 `"No migrants"'
label define intmig1_lbl 01 `"1"', add
label define intmig1_lbl 02 `"2"', add
label define intmig1_lbl 03 `"3"', add
label define intmig1_lbl 04 `"4"', add
label define intmig1_lbl 05 `"5"', add
label define intmig1_lbl 06 `"6"', add
label define intmig1_lbl 07 `"7"', add
label define intmig1_lbl 08 `"8"', add
label define intmig1_lbl 09 `"9"', add
label define intmig1_lbl 10 `"10 or more"', add
label define intmig1_lbl 98 `"Unknown"', add
label define intmig1_lbl 99 `"NIU (not in universe)"', add
label values intmig1 intmig1_lbl

label define remitt_lbl 0 `"No"'
label define remitt_lbl 1 `"Yes"', add
label define remitt_lbl 8 `"Unknown"', add
label define remitt_lbl 9 `"NIU (not in universe)"', add
label values remitt remitt_lbl

label define electric_lbl 0 `"NIU (not in universe)"'
label define electric_lbl 1 `"Yes"', add
label define electric_lbl 2 `"No"', add
label define electric_lbl 9 `"Unknown"', add
label values electric electric_lbl

label define watsup_lbl 00 `"NIU (not in universe)"'
label define watsup_lbl 10 `"Yes, piped water"', add
label define watsup_lbl 11 `"Piped inside dwelling"', add
label define watsup_lbl 12 `"Piped, exclusively to this household"', add
label define watsup_lbl 13 `"Piped, shared with other households"', add
label define watsup_lbl 14 `"Piped outside the dwelling"', add
label define watsup_lbl 15 `"Piped outside dwelling, in building"', add
label define watsup_lbl 16 `"Piped within the building or plot of land"', add
label define watsup_lbl 17 `"Piped outside the building or lot"', add
label define watsup_lbl 18 `"Have access to public piped water"', add
label define watsup_lbl 20 `"No piped water"', add
label define watsup_lbl 99 `"Unknown"', add
label values watsup watsup_lbl

label define sewage_lbl 00 `"NIU (not in universe)"'
label define sewage_lbl 10 `"Connected to sewage system or septic tank"', add
label define sewage_lbl 11 `"Sewage system (public sewage disposal)"', add
label define sewage_lbl 12 `"Septic tank (private sewage disposal)"', add
label define sewage_lbl 20 `"Not connected to sewage disposal system"', add
label define sewage_lbl 99 `"Unknown"', add
label values sewage sewage_lbl

label define fuelcook_lbl 00 `"NIU (not in universe)"'
label define fuelcook_lbl 10 `"None"', add
label define fuelcook_lbl 20 `"Electricity"', add
label define fuelcook_lbl 30 `"Petroleum gas, unspecified"', add
label define fuelcook_lbl 31 `"Gas -- piped/utility"', add
label define fuelcook_lbl 32 `"Gas -- tanked or bottled"', add
label define fuelcook_lbl 33 `"Propane"', add
label define fuelcook_lbl 35 `"Liquefied petroleum gas"', add
label define fuelcook_lbl 40 `"Petroleum liquid"', add
label define fuelcook_lbl 41 `"Oil, kerosene, and other liquid fuels"', add
label define fuelcook_lbl 42 `"Kerosene/paraffin"', add
label define fuelcook_lbl 43 `"Kerosene or oil"', add
label define fuelcook_lbl 44 `"Kerosene or gasoline"', add
label define fuelcook_lbl 45 `"Gasoline"', add
label define fuelcook_lbl 46 `"Cocinol"', add
label define fuelcook_lbl 50 `"Wood, coal, and other solid fuels"', add
label define fuelcook_lbl 51 `"Wood and other plant fuels"', add
label define fuelcook_lbl 52 `"Non-wood plant materials"', add
label define fuelcook_lbl 53 `"Coal or charcoal"', add
label define fuelcook_lbl 54 `"Charcoal"', add
label define fuelcook_lbl 55 `"Coal"', add
label define fuelcook_lbl 56 `"Wood or charcoal"', add
label define fuelcook_lbl 60 `"Multiple fuels"', add
label define fuelcook_lbl 61 `"Bottled gas and wood"', add
label define fuelcook_lbl 62 `"Propane and electricity"', add
label define fuelcook_lbl 63 `"Propane, kerosene, and electricity"', add
label define fuelcook_lbl 64 `"Propane and kerosene"', add
label define fuelcook_lbl 65 `"Kerosene and electrictiy"', add
label define fuelcook_lbl 66 `"Other combinations"', add
label define fuelcook_lbl 70 `"Other"', add
label define fuelcook_lbl 71 `"Alcohol"', add
label define fuelcook_lbl 72 `"Biogas"', add
label define fuelcook_lbl 73 `"Discarded or waste material"', add
label define fuelcook_lbl 74 `"Dung/manure"', add
label define fuelcook_lbl 75 `"Dung or grass"', add
label define fuelcook_lbl 76 `"Solar energy"', add
label define fuelcook_lbl 77 `"Candle"', add
label define fuelcook_lbl 99 `"Unknown/missing"', add
label values fuelcook fuelcook_lbl

label define phone_lbl 0 `"NIU (not in universe)"'
label define phone_lbl 1 `"No"', add
label define phone_lbl 2 `"Yes"', add
label define phone_lbl 9 `"Unknown/missing"', add
label values phone phone_lbl

label define cell_lbl 0 `"NIU (not in universe)"'
label define cell_lbl 1 `"Yes"', add
label define cell_lbl 2 `"No"', add
label define cell_lbl 9 `"Unknown"', add
label values cell cell_lbl

label define internet_lbl 0 `"NIU (not in universe)"'
label define internet_lbl 1 `"No"', add
label define internet_lbl 2 `"Yes"', add
label define internet_lbl 9 `"Unknown"', add
label values internet internet_lbl

label define trash_lbl 00 `"NIU (not in universe)"'
label define trash_lbl 10 `"Collected by a sanitation service"', add
label define trash_lbl 11 `"Collected directly from the household or dwelling"', add
label define trash_lbl 12 `"Collected indirectly from a garbage container or deposit"', add
label define trash_lbl 13 `"Collected by a sanitation service only"', add
label define trash_lbl 14 `"Collected by a sanitation service and disposed of in some other manner"', add
label define trash_lbl 20 `"Disposed of in some other manner"', add
label define trash_lbl 21 `"Burned or buried"', add
label define trash_lbl 22 `"Burned"', add
label define trash_lbl 23 `"Buried"', add
label define trash_lbl 24 `"Thrown into street, vacant land, or common area"', add
label define trash_lbl 25 `"Thrown into river, lake, ocean, lagoon, etc."', add
label define trash_lbl 26 `"Thrown into canyon or gulley"', add
label define trash_lbl 27 `"Dumped in pit"', add
label define trash_lbl 28 `"Communal refuse dump"', add
label define trash_lbl 29 `"Own refuse dump"', add
label define trash_lbl 30 `"Authorized refuse dump"', add
label define trash_lbl 31 `"Illegal refuse dump"', add
label define trash_lbl 32 `"Other dumping"', add
label define trash_lbl 33 `"Outside"', add
label define trash_lbl 34 `"In the fields"', add
label define trash_lbl 35 `"Fed to animals"', add
label define trash_lbl 36 `"Composted"', add
label define trash_lbl 37 `"Heap"', add
label define trash_lbl 38 `"Garden"', add
label define trash_lbl 39 `"Other, none"', add
label define trash_lbl 99 `"Unknown/missing"', add
label values trash trash_lbl

label define autos_lbl 0 `"No autos"'
label define autos_lbl 1 `"1 auto"', add
label define autos_lbl 2 `"2 autos"', add
label define autos_lbl 3 `"3 autos"', add
label define autos_lbl 4 `"4 autos"', add
label define autos_lbl 5 `"5 autos"', add
label define autos_lbl 6 `"6+ autos"', add
label define autos_lbl 7 `"Have auto, number unspecified"', add
label define autos_lbl 8 `"Unknown"', add
label define autos_lbl 9 `"NIU (not in universe)"', add
label values autos autos_lbl

label define aircon_lbl 00 `"NIU (not in universe)"'
label define aircon_lbl 10 `"No air conditioning"', add
label define aircon_lbl 20 `"Yes, air conditioning"', add
label define aircon_lbl 21 `"1 unit or room"', add
label define aircon_lbl 22 `"2 units or rooms"', add
label define aircon_lbl 23 `"3 units or rooms"', add
label define aircon_lbl 24 `"4 units or rooms"', add
label define aircon_lbl 25 `"5 units or rooms"', add
label define aircon_lbl 26 `"6 units or rooms"', add
label define aircon_lbl 27 `"7 units or rooms"', add
label define aircon_lbl 28 `"8 or more units or rooms"', add
label define aircon_lbl 29 `"Central system"', add
label define aircon_lbl 99 `"Unknown"', add
label values aircon aircon_lbl

label define computer_lbl 0 `"NIU (not in universe)"'
label define computer_lbl 1 `"No"', add
label define computer_lbl 2 `"Yes"', add
label define computer_lbl 9 `"Unknown/missing"', add
label values computer computer_lbl

label define washer_lbl 0 `"NIU (not in universe)"'
label define washer_lbl 1 `"No"', add
label define washer_lbl 2 `"Yes"', add
label define washer_lbl 3 `"Automatic or semi-automatic"', add
label define washer_lbl 4 `"Wringer or other non-automatic"', add
label define washer_lbl 9 `"Unknown/missing"', add
label values washer washer_lbl

label define refrig_lbl 0 `"NIU (not in universe)"'
label define refrig_lbl 1 `"No"', add
label define refrig_lbl 2 `"Yes"', add
label define refrig_lbl 9 `"Unknown/missing"', add
label values refrig refrig_lbl

label define tv_lbl 00 `"NIU (not in universe)"'
label define tv_lbl 10 `"No"', add
label define tv_lbl 20 `"Yes, color or black-and-white not specified"', add
label define tv_lbl 21 `"1 television"', add
label define tv_lbl 22 `"2 televisions"', add
label define tv_lbl 23 `"3 televisions"', add
label define tv_lbl 24 `"4 televisions"', add
label define tv_lbl 25 `"5 televisions"', add
label define tv_lbl 26 `"6 televisions"', add
label define tv_lbl 27 `"7 televisions"', add
label define tv_lbl 28 `"8 televisions"', add
label define tv_lbl 29 `"9+ televisions"', add
label define tv_lbl 30 `"Yes, color only"', add
label define tv_lbl 31 `"1 color tv"', add
label define tv_lbl 32 `"2 color tvs"', add
label define tv_lbl 33 `"3+ color tvs"', add
label define tv_lbl 40 `"Yes, black-and-white only"', add
label define tv_lbl 41 `"1 black-white tv"', add
label define tv_lbl 42 `"2 black-white tvs"', add
label define tv_lbl 43 `"3+ black-white tvs"', add
label define tv_lbl 50 `"Yes, both color and black-and-white"', add
label define tv_lbl 52 `"2+ color and black-white tvs"', add
label define tv_lbl 53 `"3+ color and black-white tvs"', add
label define tv_lbl 54 `"4+ color and black-white tvs"', add
label define tv_lbl 99 `"Unknown/missing"', add
label values tv tv_lbl

label define radio_lbl 0 `"NIU (not in universe)"'
label define radio_lbl 1 `"No"', add
label define radio_lbl 2 `"Yes"', add
label define radio_lbl 9 `"Unknown/missing"', add
label values radio radio_lbl

label define rooms_lbl 00 `"Part of a room; no rooms"'
label define rooms_lbl 01 `"1"', add
label define rooms_lbl 02 `"2"', add
label define rooms_lbl 03 `"3"', add
label define rooms_lbl 04 `"4"', add
label define rooms_lbl 05 `"5"', add
label define rooms_lbl 06 `"6"', add
label define rooms_lbl 07 `"7"', add
label define rooms_lbl 08 `"8"', add
label define rooms_lbl 09 `"9"', add
label define rooms_lbl 10 `"10"', add
label define rooms_lbl 11 `"11"', add
label define rooms_lbl 12 `"12"', add
label define rooms_lbl 13 `"13"', add
label define rooms_lbl 14 `"14"', add
label define rooms_lbl 15 `"15"', add
label define rooms_lbl 16 `"16"', add
label define rooms_lbl 17 `"17"', add
label define rooms_lbl 18 `"18"', add
label define rooms_lbl 19 `"19"', add
label define rooms_lbl 20 `"20"', add
label define rooms_lbl 21 `"21"', add
label define rooms_lbl 22 `"22"', add
label define rooms_lbl 23 `"23"', add
label define rooms_lbl 24 `"24"', add
label define rooms_lbl 25 `"25"', add
label define rooms_lbl 26 `"26"', add
label define rooms_lbl 27 `"27"', add
label define rooms_lbl 28 `"28"', add
label define rooms_lbl 29 `"29"', add
label define rooms_lbl 30 `"30+"', add
label define rooms_lbl 98 `"Unknown"', add
label define rooms_lbl 99 `"NIU (not in universe)"', add
label values rooms rooms_lbl

label define bedrooms_lbl 00 `"No bedrooms"'
label define bedrooms_lbl 01 `"1"', add
label define bedrooms_lbl 02 `"2"', add
label define bedrooms_lbl 03 `"3"', add
label define bedrooms_lbl 04 `"4"', add
label define bedrooms_lbl 05 `"5"', add
label define bedrooms_lbl 06 `"6"', add
label define bedrooms_lbl 07 `"7"', add
label define bedrooms_lbl 08 `"8"', add
label define bedrooms_lbl 09 `"9"', add
label define bedrooms_lbl 10 `"10"', add
label define bedrooms_lbl 11 `"11"', add
label define bedrooms_lbl 12 `"12"', add
label define bedrooms_lbl 13 `"13"', add
label define bedrooms_lbl 14 `"14"', add
label define bedrooms_lbl 15 `"15"', add
label define bedrooms_lbl 16 `"16"', add
label define bedrooms_lbl 17 `"17"', add
label define bedrooms_lbl 18 `"18"', add
label define bedrooms_lbl 19 `"19"', add
label define bedrooms_lbl 20 `"20+"', add
label define bedrooms_lbl 98 `"Unknown"', add
label define bedrooms_lbl 99 `"NIU (not in universe)"', add
label values bedrooms bedrooms_lbl

label define kitchen_lbl 00 `"NIU (not in universe)"'
label define kitchen_lbl 10 `"No kitchen"', add
label define kitchen_lbl 11 `"Food is prepared in a non-kitchen room"', add
label define kitchen_lbl 13 `"Does not prepare food in the dwelling"', add
label define kitchen_lbl 20 `"Yes, have a kitchen"', add
label define kitchen_lbl 21 `"Kitchen located inside the dwelling"', add
label define kitchen_lbl 22 `"Indoor kitchen, exclusive use"', add
label define kitchen_lbl 23 `"Indoor kitchen, shared use"', add
label define kitchen_lbl 24 `"Exclusive use of kitchen (indoor/outdoor status not specified)"', add
label define kitchen_lbl 25 `"Kitchen shared with another household (indoor/outdoor status not specified)"', add
label define kitchen_lbl 26 `"Kitchen located outside the dwelling"', add
label define kitchen_lbl 27 `"Outdoor kitchen, exclusive use"', add
label define kitchen_lbl 28 `"Outdoor kitchen, shared use"', add
label define kitchen_lbl 99 `"Unknown/missing"', add
label values kitchen kitchen_lbl

label define toilet_lbl 00 `"NIU (not in universe)"'
label define toilet_lbl 10 `"No toilet"', add
label define toilet_lbl 11 `"No flush toilet"', add
label define toilet_lbl 20 `"Have toilet, type not specified"', add
label define toilet_lbl 21 `"Flush toilet"', add
label define toilet_lbl 22 `"Non-flush, latrine"', add
label define toilet_lbl 23 `"Non-flush, other and unspecified"', add
label define toilet_lbl 99 `"Unknown"', add
label values toilet toilet_lbl

label define floor_lbl 000 `"NIU (not in universe)"'
label define floor_lbl 100 `"None/unfinished (earth)"', add
label define floor_lbl 110 `"Sand"', add
label define floor_lbl 120 `"Dung"', add
label define floor_lbl 200 `"Finished"', add
label define floor_lbl 201 `"Cement, tile, or brick"', add
label define floor_lbl 202 `"Cement"', add
label define floor_lbl 203 `"Concrete"', add
label define floor_lbl 204 `"Cement screed"', add
label define floor_lbl 205 `"Ceramic tile"', add
label define floor_lbl 206 `"Paving stone, cement tile"', add
label define floor_lbl 207 `"Stone"', add
label define floor_lbl 208 `"Brick"', add
label define floor_lbl 209 `"Brick or stone"', add
label define floor_lbl 210 `"Brick or cement"', add
label define floor_lbl 211 `"Block"', add
label define floor_lbl 212 `"Terrazzo"', add
label define floor_lbl 213 `"Wood"', add
label define floor_lbl 214 `"Palm, bamboo"', add
label define floor_lbl 215 `"Parquet"', add
label define floor_lbl 216 `"Parquet, tile, vinyl"', add
label define floor_lbl 217 `"Parquet, tile, marble"', add
label define floor_lbl 218 `"Ceramic, marble, granite"', add
label define floor_lbl 219 `"Ceramic, marble, tile, or vinyl"', add
label define floor_lbl 220 `"Marble"', add
label define floor_lbl 221 `"Mosaic"', add
label define floor_lbl 222 `"Tile"', add
label define floor_lbl 223 `"Tile, linoleum, ceramic, etc"', add
label define floor_lbl 224 `"Tile, cement"', add
label define floor_lbl 225 `"Tile, stone"', add
label define floor_lbl 226 `"Tile, stone, brick"', add
label define floor_lbl 227 `"Tile, stone, vinyl, brick"', add
label define floor_lbl 228 `"Tile, vinyl, brick"', add
label define floor_lbl 229 `"Tile, vinyl"', add
label define floor_lbl 230 `"Vinyl, linoleum, etc"', add
label define floor_lbl 231 `"Asphalt sheet, vinyl, etc"', add
label define floor_lbl 232 `"Synthetic, plastic"', add
label define floor_lbl 233 `"Cane"', add
label define floor_lbl 234 `"Carpet"', add
label define floor_lbl 235 `"Scrap material"', add
label define floor_lbl 236 `"Other finished, n.e.c."', add
label define floor_lbl 999 `"Unknown/missing"', add
label values floor floor_lbl

label define wall_lbl 000 `"NIU (not in universe)"'
label define wall_lbl 100 `"No walls"', add
label define wall_lbl 200 `"Cardboard, scrap, and miscellaneous materials"', add
label define wall_lbl 201 `"Waste, scrap, or discarded material"', add
label define wall_lbl 202 `"Fabric or discarded material"', add
label define wall_lbl 203 `"Zinc, fabric, cardboard, tins, and waste material"', add
label define wall_lbl 204 `"Cardboard sheet"', add
label define wall_lbl 205 `"Plastic sheeting, cardboard"', add
label define wall_lbl 206 `"Makeshift, salvaged, or improvised materials"', add
label define wall_lbl 207 `"Reused materials"', add
label define wall_lbl 300 `"Wood"', add
label define wall_lbl 310 `"Rough wood"', add
label define wall_lbl 320 `"Wood, fibercement or plywood"', add
label define wall_lbl 330 `"Wood, formica, and other"', add
label define wall_lbl 340 `"Wood or bamboo"', add
label define wall_lbl 350 `"Wood or straw"', add
label define wall_lbl 400 `"Other plant-based materials"', add
label define wall_lbl 401 `"Plantain leaves and similar material"', add
label define wall_lbl 402 `"Bamboo or cane"', add
label define wall_lbl 403 `"Bamboo, sawali, cogon, nipa"', add
label define wall_lbl 404 `"Straw or bamboo"', add
label define wall_lbl 405 `"Grass, straw or reed"', add
label define wall_lbl 406 `"Reed, bamboo, or palm"', add
label define wall_lbl 407 `"Cane, palm leaves, logs"', add
label define wall_lbl 408 `"Palm leaves or palm planks"', add
label define wall_lbl 500 `"Masonry, stone, cement, adobe, metal, glass, and other fabricated materials (sometimes mixed with wood)"', add
label define wall_lbl 501 `"Brick, block, stone, or cement"', add
label define wall_lbl 502 `"Brick, stone, concrete"', add
label define wall_lbl 503 `"Brick, stone, or substitutes (dividing panels made of reinforced concrete)"', add
label define wall_lbl 504 `"Brick, stone, or substitutes (dividing panels made of wood)"', add
label define wall_lbl 505 `"Brick or tile"', add
label define wall_lbl 506 `"Brick or stone"', add
label define wall_lbl 507 `"Brick or cement block"', add
label define wall_lbl 508 `"Brick with plaster exterior"', add
label define wall_lbl 509 `"Brick without plaster exterior"', add
label define wall_lbl 510 `"Burnt or stabilized brick"', add
label define wall_lbl 511 `"Brick"', add
label define wall_lbl 512 `"Unburnt brick"', add
label define wall_lbl 513 `"Unburnt brick with cement"', add
label define wall_lbl 514 `"Unburnt brick with mud"', add
label define wall_lbl 515 `"Concrete"', add
label define wall_lbl 516 `"Landcrete"', add
label define wall_lbl 517 `"Cement blocks"', add
label define wall_lbl 518 `"Cement blocks or brick"', add
label define wall_lbl 519 `"Cement blocks or brick, unfinished"', add
label define wall_lbl 520 `"Cement and adobe bricks"', add
label define wall_lbl 521 `"Cement and stone block"', add
label define wall_lbl 522 `"Reinforced concrete, pre-cast concrete panels, or steel skeleton framed concrete"', add
label define wall_lbl 523 `"Concrete, reinforced concrete, blocks, panels"', add
label define wall_lbl 524 `"Adobe"', add
label define wall_lbl 525 `"Adobe walls with plaster exterior"', add
label define wall_lbl 526 `"Adobe walls without plaster exterior"', add
label define wall_lbl 527 `"Adobe with cement exterior"', add
label define wall_lbl 528 `"Adobe (tabique, quinche)"', add
label define wall_lbl 529 `"Wood and earth adobe"', add
label define wall_lbl 530 `"Wood and cement adobe"', add
label define wall_lbl 531 `"Mud or adobe"', add
label define wall_lbl 532 `"Pressed dirt"', add
label define wall_lbl 533 `"Clay"', add
label define wall_lbl 534 `"Coated clay/mud with sticks/cane"', add
label define wall_lbl 535 `"Clay or clay-covered sticks"', add
label define wall_lbl 536 `"Netted bamboo or cane with mud"', add
label define wall_lbl 537 `"Bundle of mud, straw, other materials"', add
label define wall_lbl 538 `"Mud with wood/wattle"', add
label define wall_lbl 539 `"Pole and mud"', add
label define wall_lbl 540 `"Mud with cement"', add
label define wall_lbl 541 `"Unfinished lathe and plaster, stucco, etc."', add
label define wall_lbl 542 `"Stone"', add
label define wall_lbl 543 `"Hand-laid stone"', add
label define wall_lbl 544 `"Quarried stone"', add
label define wall_lbl 545 `"Cut stone and concrete"', add
label define wall_lbl 546 `"Cemented stone"', add
label define wall_lbl 547 `"Stone with clay"', add
label define wall_lbl 548 `"Blocks of light material"', add
label define wall_lbl 549 `"Prefabricated material"', add
label define wall_lbl 550 `"Asbestos"', add
label define wall_lbl 551 `"Metal or asbestos sheet"', add
label define wall_lbl 552 `"Metal or iron sheet"', add
label define wall_lbl 553 `"Metal or fibercement sheeting"', add
label define wall_lbl 554 `"Galvanized iron or aluminum"', add
label define wall_lbl 555 `"Tin"', add
label define wall_lbl 556 `"Glass"', add
label define wall_lbl 557 `"Cloth"', add
label define wall_lbl 558 `"Covintec panels"', add
label define wall_lbl 559 `"Mixed material"', add
label define wall_lbl 560 `"Mixed material: part wood; part concrete, brick, or stone"', add
label define wall_lbl 561 `"Wood plastered with clay, adobe, other materials; wood pressed panels; rolled mud bricks; etc."', add
label define wall_lbl 570 `"Mainly permanent materials"', add
label define wall_lbl 600 `"Other material"', add
label define wall_lbl 999 `"Unknown/missing"', add
label values wall wall_lbl

label define roof_lbl 00 `"NIU (not in universe)"'
label define roof_lbl 10 `"Masonry, concrete, clay tile, or tiles of unspecified type"', add
label define roof_lbl 11 `"Concrete or cement"', add
label define roof_lbl 12 `"Reinforced concrete (slab)"', add
label define roof_lbl 13 `"Cement or sheet metal"', add
label define roof_lbl 14 `"Tile, unspecified"', add
label define roof_lbl 15 `"Clay tile"', add
label define roof_lbl 16 `"Tile or cement"', add
label define roof_lbl 17 `"Modern tiles, industrial"', add
label define roof_lbl 18 `"Traditional tiles, locally made"', add
label define roof_lbl 19 `"Tile or flat stone"', add
label define roof_lbl 20 `"Fibercement or plastic"', add
label define roof_lbl 21 `"Asphalt or laminate cover"', add
label define roof_lbl 22 `"Tile, cement, asphalt"', add
label define roof_lbl 23 `"Asphalt tile"', add
label define roof_lbl 24 `"Slate or tile"', add
label define roof_lbl 25 `"Slate or asbestos"', add
label define roof_lbl 26 `"Asbestos"', add
label define roof_lbl 27 `"Adobe"', add
label define roof_lbl 28 `"Tiles or wood planks"', add
label define roof_lbl 29 `"Roofing shingles"', add
label define roof_lbl 30 `"Metal"', add
label define roof_lbl 31 `"Sheet metal"', add
label define roof_lbl 32 `"Zinc or tin"', add
label define roof_lbl 33 `"Tin"', add
label define roof_lbl 34 `"Sheet metal or other sheet material"', add
label define roof_lbl 35 `"Sheet metal, tile, slate"', add
label define roof_lbl 40 `"Wood and other plant materials"', add
label define roof_lbl 41 `"Wood"', add
label define roof_lbl 42 `"Wood, including bamboo"', add
label define roof_lbl 43 `"Bamboo"', add
label define roof_lbl 44 `"Cogon, nipa, anahaw"', add
label define roof_lbl 45 `"Thatch (straw, grass, leaves, palm, etc.)"', add
label define roof_lbl 46 `"Cane, wood, straw"', add
label define roof_lbl 47 `"Grass"', add
label define roof_lbl 48 `"Papyrus"', add
label define roof_lbl 49 `"Banana leaves or fiber"', add
label define roof_lbl 50 `"Palm or makuti"', add
label define roof_lbl 51 `"Plant material or wood with clay"', add
label define roof_lbl 52 `"Grass and mud"', add
label define roof_lbl 53 `"Straw, bamboo, polythene"', add
label define roof_lbl 54 `"Rustic mat"', add
label define roof_lbl 60 `"Mud or earth"', add
label define roof_lbl 61 `"Clay"', add
label define roof_lbl 70 `"Cardboard, scrap, and miscellaneous materials"', add
label define roof_lbl 71 `"Discarded or scrap material"', add
label define roof_lbl 72 `"Cardboard"', add
label define roof_lbl 73 `"Plastic"', add
label define roof_lbl 80 `"Other, unspecified"', add
label define roof_lbl 99 `"Unknown/missing"', add
label values roof roof_lbl

label define hhtype_lbl 00 `"Vacant household"'
label define hhtype_lbl 01 `"One-person household"', add
label define hhtype_lbl 02 `"Married/cohab couple, no children"', add
label define hhtype_lbl 03 `"Married/cohab couple with children"', add
label define hhtype_lbl 04 `"Single-parent family"', add
label define hhtype_lbl 05 `"Polygamous family"', add
label define hhtype_lbl 06 `"Extended family, relatives only"', add
label define hhtype_lbl 07 `"Composite household, family and non-relatives"', add
label define hhtype_lbl 08 `"Non-family household"', add
label define hhtype_lbl 09 `"Unclassified subfamily"', add
label define hhtype_lbl 10 `"Other relative or non-relative household"', add
label define hhtype_lbl 11 `"Group quarters"', add
label define hhtype_lbl 99 `"Unclassifiable"', add
label values hhtype hhtype_lbl

label define nfams_lbl 0 `"Vacant household"'
label define nfams_lbl 1 `"1 family"', add
label define nfams_lbl 2 `"2 families"', add
label define nfams_lbl 3 `"3 families"', add
label define nfams_lbl 4 `"4 families"', add
label define nfams_lbl 5 `"5 families"', add
label define nfams_lbl 6 `"6 families"', add
label define nfams_lbl 7 `"7 families"', add
label define nfams_lbl 8 `"8 families"', add
label define nfams_lbl 9 `"9 or more families"', add
label values nfams nfams_lbl

label define ncouples_lbl 0 `"No married couples in household"'
label define ncouples_lbl 1 `"1 couple"', add
label define ncouples_lbl 2 `"2 couples"', add
label define ncouples_lbl 3 `"3 couples"', add
label define ncouples_lbl 4 `"4 couples"', add
label define ncouples_lbl 5 `"5 couples"', add
label define ncouples_lbl 6 `"6 couples"', add
label define ncouples_lbl 7 `"7 couples"', add
label define ncouples_lbl 8 `"8 couples"', add
label define ncouples_lbl 9 `"9 or more couples"', add
label values ncouples ncouples_lbl

label define nmothers_lbl 0 `"No mothers in household"'
label define nmothers_lbl 1 `"1 mother"', add
label define nmothers_lbl 2 `"2 mothers"', add
label define nmothers_lbl 3 `"3 mothers"', add
label define nmothers_lbl 4 `"4 mothers"', add
label define nmothers_lbl 5 `"5 mothers"', add
label define nmothers_lbl 6 `"6 mothers"', add
label define nmothers_lbl 7 `"7 mothers"', add
label define nmothers_lbl 8 `"8 mothers"', add
label define nmothers_lbl 9 `"9 or more mothers in household"', add
label values nmothers nmothers_lbl

label define nfathers_lbl 0 `"No fathers in household"'
label define nfathers_lbl 1 `"1 father"', add
label define nfathers_lbl 2 `"2 fathers"', add
label define nfathers_lbl 3 `"3 fathers"', add
label define nfathers_lbl 4 `"4 fathers"', add
label define nfathers_lbl 5 `"5 fathers"', add
label define nfathers_lbl 6 `"6 fathers"', add
label define nfathers_lbl 7 `"7 fathers"', add
label define nfathers_lbl 8 `"8 fathers"', add
label define nfathers_lbl 9 `"9 or more fathers in household"', add
label values nfathers nfathers_lbl

label define relate_lbl 1 `"Head"'
label define relate_lbl 2 `"Spouse/partner"', add
label define relate_lbl 3 `"Child"', add
label define relate_lbl 4 `"Other relative"', add
label define relate_lbl 5 `"Non-relative"', add
label define relate_lbl 6 `"Other relative or non-relative"', add
label define relate_lbl 9 `"Unknown"', add
label values relate relate_lbl

label define related_lbl 1000 `"Head"'
label define related_lbl 2000 `"Spouse/partner"', add
label define related_lbl 2100 `"Spouse"', add
label define related_lbl 2200 `"Unmarried partner"', add
label define related_lbl 2300 `"Same-sex spouse/partner"', add
label define related_lbl 3000 `"Child"', add
label define related_lbl 3100 `"Biological child"', add
label define related_lbl 3200 `"Adopted child"', add
label define related_lbl 3300 `"Stepchild"', add
label define related_lbl 3400 `"Child/child-in-law"', add
label define related_lbl 3500 `"Child/child-in-law/grandchild"', add
label define related_lbl 3600 `"Child of unmarried partner"', add
label define related_lbl 4000 `"Other relative"', add
label define related_lbl 4100 `"Grandchild"', add
label define related_lbl 4110 `"Grandchild or great grandchild"', add
label define related_lbl 4120 `"Great grandchild"', add
label define related_lbl 4130 `"Great-great grandchild"', add
label define related_lbl 4200 `"Parent/parent-in-law"', add
label define related_lbl 4210 `"Parent"', add
label define related_lbl 4211 `"Stepparent"', add
label define related_lbl 4220 `"Parent-in-law"', add
label define related_lbl 4300 `"Child-in-law"', add
label define related_lbl 4301 `"Daughter-in-law"', add
label define related_lbl 4302 `"Spouse/partner of child"', add
label define related_lbl 4310 `"Unmarried partner of child"', add
label define related_lbl 4400 `"Sibling/sibling-in-law"', add
label define related_lbl 4410 `"Sibling"', add
label define related_lbl 4420 `"Stepsibling"', add
label define related_lbl 4430 `"Sibling-in-law"', add
label define related_lbl 4431 `"Sibling of spouse/partner"', add
label define related_lbl 4432 `"Spouse/partner of sibling"', add
label define related_lbl 4500 `"Grandparent"', add
label define related_lbl 4510 `"Great grandparent"', add
label define related_lbl 4600 `"Parent/grandparent/ascendant"', add
label define related_lbl 4700 `"Aunt/uncle"', add
label define related_lbl 4800 `"Other specified relative"', add
label define related_lbl 4810 `"Nephew/niece"', add
label define related_lbl 4820 `"Cousin"', add
label define related_lbl 4830 `"Sibling of sibling-in-law"', add
label define related_lbl 4900 `"Other relative, not elsewhere classified"', add
label define related_lbl 4910 `"Other relative with same family name"', add
label define related_lbl 4920 `"Other relative with different family name"', add
label define related_lbl 4930 `"Other relative, not specified (secondary family)"', add
label define related_lbl 5000 `"Non-relative"', add
label define related_lbl 5100 `"Friend/guest/visitor/partner"', add
label define related_lbl 5110 `"Partner/friend"', add
label define related_lbl 5111 `"Friend"', add
label define related_lbl 5112 `"Partner/roommate"', add
label define related_lbl 5113 `"Housemate/roommate"', add
label define related_lbl 5120 `"Visitor"', add
label define related_lbl 5130 `"Ex-spouse"', add
label define related_lbl 5140 `"Godparent"', add
label define related_lbl 5150 `"Godchild"', add
label define related_lbl 5200 `"Employee"', add
label define related_lbl 5210 `"Domestic employee"', add
label define related_lbl 5220 `"Relative of employee, n.s."', add
label define related_lbl 5221 `"Spouse of servant"', add
label define related_lbl 5222 `"Child of servant"', add
label define related_lbl 5223 `"Other relative of servant"', add
label define related_lbl 5300 `"Roomer/boarder/lodger/foster child"', add
label define related_lbl 5310 `"Boarder"', add
label define related_lbl 5311 `"Boarder or guest"', add
label define related_lbl 5320 `"Lodger"', add
label define related_lbl 5330 `"Foster child"', add
label define related_lbl 5340 `"Tutored/foster child"', add
label define related_lbl 5350 `"Tutored child"', add
label define related_lbl 5400 `"Employee, boarder or guest"', add
label define related_lbl 5500 `"Other specified non-relative"', add
label define related_lbl 5510 `"Agregado"', add
label define related_lbl 5520 `"Temporary resident, guest"', add
label define related_lbl 5600 `"Group quarters"', add
label define related_lbl 5610 `"Group quarters, non-inmates"', add
label define related_lbl 5620 `"Institutional inmates"', add
label define related_lbl 5900 `"Non-relative, n.e.c."', add
label define related_lbl 6000 `"Other relative or non-relative"', add
label define related_lbl 9999 `"Unknown"', add
label values related related_lbl

label define age_lbl 000 `"Less than 1 year"'
label define age_lbl 001 `"1 year"', add
label define age_lbl 002 `"2 years"', add
label define age_lbl 003 `"3"', add
label define age_lbl 004 `"4"', add
label define age_lbl 005 `"5"', add
label define age_lbl 006 `"6"', add
label define age_lbl 007 `"7"', add
label define age_lbl 008 `"8"', add
label define age_lbl 009 `"9"', add
label define age_lbl 010 `"10"', add
label define age_lbl 011 `"11"', add
label define age_lbl 012 `"12"', add
label define age_lbl 013 `"13"', add
label define age_lbl 014 `"14"', add
label define age_lbl 015 `"15"', add
label define age_lbl 016 `"16"', add
label define age_lbl 017 `"17"', add
label define age_lbl 018 `"18"', add
label define age_lbl 019 `"19"', add
label define age_lbl 020 `"20"', add
label define age_lbl 021 `"21"', add
label define age_lbl 022 `"22"', add
label define age_lbl 023 `"23"', add
label define age_lbl 024 `"24"', add
label define age_lbl 025 `"25"', add
label define age_lbl 026 `"26"', add
label define age_lbl 027 `"27"', add
label define age_lbl 028 `"28"', add
label define age_lbl 029 `"29"', add
label define age_lbl 030 `"30"', add
label define age_lbl 031 `"31"', add
label define age_lbl 032 `"32"', add
label define age_lbl 033 `"33"', add
label define age_lbl 034 `"34"', add
label define age_lbl 035 `"35"', add
label define age_lbl 036 `"36"', add
label define age_lbl 037 `"37"', add
label define age_lbl 038 `"38"', add
label define age_lbl 039 `"39"', add
label define age_lbl 040 `"40"', add
label define age_lbl 041 `"41"', add
label define age_lbl 042 `"42"', add
label define age_lbl 043 `"43"', add
label define age_lbl 044 `"44"', add
label define age_lbl 045 `"45"', add
label define age_lbl 046 `"46"', add
label define age_lbl 047 `"47"', add
label define age_lbl 048 `"48"', add
label define age_lbl 049 `"49"', add
label define age_lbl 050 `"50"', add
label define age_lbl 051 `"51"', add
label define age_lbl 052 `"52"', add
label define age_lbl 053 `"53"', add
label define age_lbl 054 `"54"', add
label define age_lbl 055 `"55"', add
label define age_lbl 056 `"56"', add
label define age_lbl 057 `"57"', add
label define age_lbl 058 `"58"', add
label define age_lbl 059 `"59"', add
label define age_lbl 060 `"60"', add
label define age_lbl 061 `"61"', add
label define age_lbl 062 `"62"', add
label define age_lbl 063 `"63"', add
label define age_lbl 064 `"64"', add
label define age_lbl 065 `"65"', add
label define age_lbl 066 `"66"', add
label define age_lbl 067 `"67"', add
label define age_lbl 068 `"68"', add
label define age_lbl 069 `"69"', add
label define age_lbl 070 `"70"', add
label define age_lbl 071 `"71"', add
label define age_lbl 072 `"72"', add
label define age_lbl 073 `"73"', add
label define age_lbl 074 `"74"', add
label define age_lbl 075 `"75"', add
label define age_lbl 076 `"76"', add
label define age_lbl 077 `"77"', add
label define age_lbl 078 `"78"', add
label define age_lbl 079 `"79"', add
label define age_lbl 080 `"80"', add
label define age_lbl 081 `"81"', add
label define age_lbl 082 `"82"', add
label define age_lbl 083 `"83"', add
label define age_lbl 084 `"84"', add
label define age_lbl 085 `"85"', add
label define age_lbl 086 `"86"', add
label define age_lbl 087 `"87"', add
label define age_lbl 088 `"88"', add
label define age_lbl 089 `"89"', add
label define age_lbl 090 `"90"', add
label define age_lbl 091 `"91"', add
label define age_lbl 092 `"92"', add
label define age_lbl 093 `"93"', add
label define age_lbl 094 `"94"', add
label define age_lbl 095 `"95"', add
label define age_lbl 096 `"96"', add
label define age_lbl 097 `"97"', add
label define age_lbl 098 `"98"', add
label define age_lbl 099 `"99"', add
label define age_lbl 100 `"100+"', add
label define age_lbl 999 `"Not reported/missing"', add
label values age age_lbl

label define age2_lbl 01 `"0 to 4"'
label define age2_lbl 02 `"5 to 9"', add
label define age2_lbl 03 `"10 to 14"', add
label define age2_lbl 04 `"15 to 19"', add
label define age2_lbl 05 `"15 to 17"', add
label define age2_lbl 06 `"18 to 19"', add
label define age2_lbl 07 `"18 to 24"', add
label define age2_lbl 08 `"20 to 24"', add
label define age2_lbl 09 `"25 to 29"', add
label define age2_lbl 10 `"30 to 34"', add
label define age2_lbl 11 `"35 to 39"', add
label define age2_lbl 12 `"40 to 44"', add
label define age2_lbl 13 `"45 to 49"', add
label define age2_lbl 14 `"50 to 54"', add
label define age2_lbl 15 `"55 to 59"', add
label define age2_lbl 16 `"60 to 64"', add
label define age2_lbl 17 `"65 to 69"', add
label define age2_lbl 18 `"70 to 74"', add
label define age2_lbl 19 `"75 to 79"', add
label define age2_lbl 20 `"80+"', add
label define age2_lbl 98 `"Unknown"', add
label values age2 age2_lbl

label define sex_lbl 1 `"Male"'
label define sex_lbl 2 `"Female"', add
label define sex_lbl 9 `"Unknown"', add
label values sex sex_lbl

label define marst_lbl 0 `"NIU (not in universe)"'
label define marst_lbl 1 `"Single/never married"', add
label define marst_lbl 2 `"Married/in union"', add
label define marst_lbl 3 `"Separated/divorced/spouse absent"', add
label define marst_lbl 4 `"Widowed"', add
label define marst_lbl 9 `"Unknown/missing"', add
label values marst marst_lbl

label define marstd_lbl 000 `"NIU (not in universe)"'
label define marstd_lbl 100 `"Single/never married"', add
label define marstd_lbl 110 `"Engaged"', add
label define marstd_lbl 111 `"Never married and never cohabited"', add
label define marstd_lbl 200 `"Married or consensual union"', add
label define marstd_lbl 210 `"Married, formally"', add
label define marstd_lbl 211 `"Married, civil"', add
label define marstd_lbl 212 `"Married, religious"', add
label define marstd_lbl 213 `"Married, civil and religious"', add
label define marstd_lbl 214 `"Married, civil or religious"', add
label define marstd_lbl 215 `"Married, traditional/customary"', add
label define marstd_lbl 216 `"Married, monogamous"', add
label define marstd_lbl 217 `"Married, polygamous"', add
label define marstd_lbl 220 `"Consensual union"', add
label define marstd_lbl 300 `"Separated/divorced/spouse absent"', add
label define marstd_lbl 310 `"Separated or divorced"', add
label define marstd_lbl 320 `"Separated or annulled"', add
label define marstd_lbl 330 `"Separated"', add
label define marstd_lbl 331 `"Separated legally"', add
label define marstd_lbl 332 `"Separated de facto"', add
label define marstd_lbl 333 `"Separated from marriage"', add
label define marstd_lbl 334 `"Separated from consensual union"', add
label define marstd_lbl 335 `"Separated from consensual union or marriage"', add
label define marstd_lbl 340 `"Annulled"', add
label define marstd_lbl 350 `"Divorced"', add
label define marstd_lbl 360 `"Married, spouse absent"', add
label define marstd_lbl 400 `"Widowed"', add
label define marstd_lbl 410 `"Widowed or divorced"', add
label define marstd_lbl 411 `"Widowed from consensual union or marriage"', add
label define marstd_lbl 412 `"Widowed from marriage"', add
label define marstd_lbl 413 `"Widowed from consensual union"', add
label define marstd_lbl 420 `"Widowed, divorced, or separated"', add
label define marstd_lbl 999 `"Unknown/missing"', add
label values marstd marstd_lbl

label define consens_lbl 1 `"Yes, in consensual union"'
label define consens_lbl 2 `"No, married"', add
label define consens_lbl 8 `"Unknown"', add
label define consens_lbl 9 `"NIU (not in universe)"', add
label values consens consens_lbl

label define birthyr_lbl 0000 `"NIU (not in universe)"'
label define birthyr_lbl 1843 `"1843"', add
label define birthyr_lbl 1845 `"1845"', add
label define birthyr_lbl 1850 `"1850"', add
label define birthyr_lbl 1853 `"1853"', add
label define birthyr_lbl 1854 `"1854"', add
label define birthyr_lbl 1856 `"1856"', add
label define birthyr_lbl 1858 `"1858"', add
label define birthyr_lbl 1859 `"1859"', add
label define birthyr_lbl 1860 `"1860"', add
label define birthyr_lbl 1861 `"1861"', add
label define birthyr_lbl 1862 `"1862"', add
label define birthyr_lbl 1863 `"1863"', add
label define birthyr_lbl 1864 `"1864"', add
label define birthyr_lbl 1865 `"1865"', add
label define birthyr_lbl 1866 `"1866"', add
label define birthyr_lbl 1867 `"1867"', add
label define birthyr_lbl 1868 `"1868"', add
label define birthyr_lbl 1869 `"1869"', add
label define birthyr_lbl 1870 `"1870"', add
label define birthyr_lbl 1871 `"1871"', add
label define birthyr_lbl 1872 `"1872"', add
label define birthyr_lbl 1873 `"1873"', add
label define birthyr_lbl 1874 `"1874"', add
label define birthyr_lbl 1875 `"1875"', add
label define birthyr_lbl 1876 `"1876"', add
label define birthyr_lbl 1877 `"1877"', add
label define birthyr_lbl 1878 `"1878"', add
label define birthyr_lbl 1879 `"1879"', add
label define birthyr_lbl 1880 `"1880"', add
label define birthyr_lbl 1881 `"1881"', add
label define birthyr_lbl 1882 `"1882"', add
label define birthyr_lbl 1883 `"1883"', add
label define birthyr_lbl 1884 `"1884"', add
label define birthyr_lbl 1885 `"1885"', add
label define birthyr_lbl 1886 `"1886"', add
label define birthyr_lbl 1887 `"1887"', add
label define birthyr_lbl 1888 `"1888"', add
label define birthyr_lbl 1889 `"1889"', add
label define birthyr_lbl 1890 `"1890"', add
label define birthyr_lbl 1891 `"1891"', add
label define birthyr_lbl 1892 `"1892"', add
label define birthyr_lbl 1893 `"1893"', add
label define birthyr_lbl 1894 `"1894"', add
label define birthyr_lbl 1895 `"1895"', add
label define birthyr_lbl 1896 `"1896"', add
label define birthyr_lbl 1897 `"1897"', add
label define birthyr_lbl 1898 `"1898"', add
label define birthyr_lbl 1899 `"1899"', add
label define birthyr_lbl 1900 `"1900"', add
label define birthyr_lbl 1901 `"1901"', add
label define birthyr_lbl 1902 `"1902"', add
label define birthyr_lbl 1903 `"1903"', add
label define birthyr_lbl 1904 `"1904"', add
label define birthyr_lbl 1905 `"1905"', add
label define birthyr_lbl 1906 `"1906"', add
label define birthyr_lbl 1907 `"1907"', add
label define birthyr_lbl 1908 `"1908"', add
label define birthyr_lbl 1909 `"1909"', add
label define birthyr_lbl 1910 `"1910"', add
label define birthyr_lbl 1911 `"1911"', add
label define birthyr_lbl 1912 `"1912"', add
label define birthyr_lbl 1913 `"1913"', add
label define birthyr_lbl 1914 `"1914"', add
label define birthyr_lbl 1915 `"1915"', add
label define birthyr_lbl 1916 `"1916"', add
label define birthyr_lbl 1917 `"1917"', add
label define birthyr_lbl 1918 `"1918"', add
label define birthyr_lbl 1919 `"1919"', add
label define birthyr_lbl 1920 `"1920"', add
label define birthyr_lbl 1921 `"1921"', add
label define birthyr_lbl 1922 `"1922"', add
label define birthyr_lbl 1923 `"1923"', add
label define birthyr_lbl 1924 `"1924"', add
label define birthyr_lbl 1925 `"1925"', add
label define birthyr_lbl 1926 `"1926"', add
label define birthyr_lbl 1927 `"1927"', add
label define birthyr_lbl 1928 `"1928"', add
label define birthyr_lbl 1929 `"1929"', add
label define birthyr_lbl 1930 `"1930"', add
label define birthyr_lbl 1931 `"1931"', add
label define birthyr_lbl 1932 `"1932"', add
label define birthyr_lbl 1933 `"1933"', add
label define birthyr_lbl 1934 `"1934"', add
label define birthyr_lbl 1935 `"1935"', add
label define birthyr_lbl 1936 `"1936"', add
label define birthyr_lbl 1937 `"1937"', add
label define birthyr_lbl 1938 `"1938"', add
label define birthyr_lbl 1939 `"1939"', add
label define birthyr_lbl 1940 `"1940"', add
label define birthyr_lbl 1941 `"1941"', add
label define birthyr_lbl 1942 `"1942"', add
label define birthyr_lbl 1943 `"1943"', add
label define birthyr_lbl 1944 `"1944"', add
label define birthyr_lbl 1945 `"1945"', add
label define birthyr_lbl 1946 `"1946"', add
label define birthyr_lbl 1947 `"1947"', add
label define birthyr_lbl 1948 `"1948"', add
label define birthyr_lbl 1949 `"1949"', add
label define birthyr_lbl 1950 `"1950"', add
label define birthyr_lbl 1951 `"1951"', add
label define birthyr_lbl 1952 `"1952"', add
label define birthyr_lbl 1953 `"1953"', add
label define birthyr_lbl 1954 `"1954"', add
label define birthyr_lbl 1955 `"1955"', add
label define birthyr_lbl 1956 `"1956"', add
label define birthyr_lbl 1957 `"1957"', add
label define birthyr_lbl 1958 `"1958"', add
label define birthyr_lbl 1959 `"1959"', add
label define birthyr_lbl 1960 `"1960"', add
label define birthyr_lbl 1961 `"1961"', add
label define birthyr_lbl 1962 `"1962"', add
label define birthyr_lbl 1963 `"1963"', add
label define birthyr_lbl 1964 `"1964"', add
label define birthyr_lbl 1965 `"1965"', add
label define birthyr_lbl 1966 `"1966"', add
label define birthyr_lbl 1967 `"1967"', add
label define birthyr_lbl 1968 `"1968"', add
label define birthyr_lbl 1969 `"1969"', add
label define birthyr_lbl 1970 `"1970"', add
label define birthyr_lbl 1971 `"1971"', add
label define birthyr_lbl 1972 `"1972"', add
label define birthyr_lbl 1973 `"1973"', add
label define birthyr_lbl 1974 `"1974"', add
label define birthyr_lbl 1975 `"1975"', add
label define birthyr_lbl 1976 `"1976"', add
label define birthyr_lbl 1977 `"1977"', add
label define birthyr_lbl 1978 `"1978"', add
label define birthyr_lbl 1979 `"1979"', add
label define birthyr_lbl 1980 `"1980"', add
label define birthyr_lbl 1981 `"1981"', add
label define birthyr_lbl 1982 `"1982"', add
label define birthyr_lbl 1983 `"1983"', add
label define birthyr_lbl 1984 `"1984"', add
label define birthyr_lbl 1985 `"1985"', add
label define birthyr_lbl 1986 `"1986"', add
label define birthyr_lbl 1987 `"1987"', add
label define birthyr_lbl 1988 `"1988"', add
label define birthyr_lbl 1989 `"1989"', add
label define birthyr_lbl 1990 `"1990"', add
label define birthyr_lbl 1991 `"1991"', add
label define birthyr_lbl 1992 `"1992"', add
label define birthyr_lbl 1993 `"1993"', add
label define birthyr_lbl 1994 `"1994"', add
label define birthyr_lbl 1995 `"1995"', add
label define birthyr_lbl 1996 `"1996"', add
label define birthyr_lbl 1997 `"1997"', add
label define birthyr_lbl 1998 `"1998"', add
label define birthyr_lbl 1999 `"1999"', add
label define birthyr_lbl 2000 `"2000"', add
label define birthyr_lbl 2001 `"2001"', add
label define birthyr_lbl 2002 `"2002"', add
label define birthyr_lbl 2003 `"2003"', add
label define birthyr_lbl 2004 `"2004"', add
label define birthyr_lbl 2005 `"2005"', add
label define birthyr_lbl 2006 `"2006"', add
label define birthyr_lbl 2007 `"2007"', add
label define birthyr_lbl 2008 `"2008"', add
label define birthyr_lbl 2009 `"2009"', add
label define birthyr_lbl 2010 `"2010"', add
label define birthyr_lbl 2011 `"2011"', add
label define birthyr_lbl 2012 `"2012"', add
label define birthyr_lbl 2013 `"2013"', add
label define birthyr_lbl 9999 `"Unknown"', add
label values birthyr birthyr_lbl

label define birthmo_lbl 01 `"January"'
label define birthmo_lbl 02 `"February"', add
label define birthmo_lbl 03 `"March"', add
label define birthmo_lbl 04 `"April"', add
label define birthmo_lbl 05 `"May"', add
label define birthmo_lbl 06 `"June"', add
label define birthmo_lbl 07 `"July"', add
label define birthmo_lbl 08 `"August"', add
label define birthmo_lbl 09 `"September"', add
label define birthmo_lbl 10 `"October"', add
label define birthmo_lbl 11 `"November"', add
label define birthmo_lbl 12 `"December"', add
label define birthmo_lbl 98 `"Unknown"', add
label define birthmo_lbl 99 `"NIU (not in universe)"', add
label values birthmo birthmo_lbl

label define nativity_lbl 0 `"NIU (not universe)"'
label define nativity_lbl 1 `"Native-born"', add
label define nativity_lbl 2 `"Foreign-born"', add
label define nativity_lbl 9 `"Unknown/missing"', add
label values nativity nativity_lbl

label define bplcountry_lbl 00000 `"NIU (not in universe)"'
label define bplcountry_lbl 10000 `"Africa"', add
label define bplcountry_lbl 11000 `"Eastern Africa"', add
label define bplcountry_lbl 11010 `"Burundi"', add
label define bplcountry_lbl 11020 `"Comoros"', add
label define bplcountry_lbl 11030 `"Djibouti"', add
label define bplcountry_lbl 11040 `"Eritrea"', add
label define bplcountry_lbl 11050 `"Ethiopia"', add
label define bplcountry_lbl 11051 `"Ethiopia (including Eritrea)"', add
label define bplcountry_lbl 11060 `"Kenya"', add
label define bplcountry_lbl 11070 `"Madagascar"', add
label define bplcountry_lbl 11080 `"Malawi"', add
label define bplcountry_lbl 11090 `"Mauritius"', add
label define bplcountry_lbl 11100 `"Mozambique"', add
label define bplcountry_lbl 11110 `"Reunion"', add
label define bplcountry_lbl 11120 `"Rwanda"', add
label define bplcountry_lbl 11130 `"Seychelles"', add
label define bplcountry_lbl 11140 `"Somalia"', add
label define bplcountry_lbl 11150 `"South Sudan"', add
label define bplcountry_lbl 11160 `"Uganda"', add
label define bplcountry_lbl 11170 `"Tanzania"', add
label define bplcountry_lbl 11180 `"Zambia"', add
label define bplcountry_lbl 11190 `"Zimbabwe"', add
label define bplcountry_lbl 11990 `"Eastern Africa, n.s."', add
label define bplcountry_lbl 12000 `"Middle Africa"', add
label define bplcountry_lbl 12010 `"Angola"', add
label define bplcountry_lbl 12020 `"Cameroon"', add
label define bplcountry_lbl 12030 `"Central African Republic"', add
label define bplcountry_lbl 12040 `"Chad"', add
label define bplcountry_lbl 12050 `"Congo"', add
label define bplcountry_lbl 12060 `"Democratic Republic of Congo"', add
label define bplcountry_lbl 12070 `"Equatorial Guinea"', add
label define bplcountry_lbl 12080 `"Gabon"', add
label define bplcountry_lbl 12090 `"Sao Tome and Principe"', add
label define bplcountry_lbl 12990 `"Middle Africa, n.s."', add
label define bplcountry_lbl 13000 `"Northern Africa"', add
label define bplcountry_lbl 13010 `"Algeria"', add
label define bplcountry_lbl 13011 `"Algeria/Tunisia"', add
label define bplcountry_lbl 13020 `"Egypt"', add
label define bplcountry_lbl 13021 `"Egypt/Sudan"', add
label define bplcountry_lbl 13030 `"Libya"', add
label define bplcountry_lbl 13040 `"Morocco"', add
label define bplcountry_lbl 13050 `"Sudan"', add
label define bplcountry_lbl 13060 `"Tunisia"', add
label define bplcountry_lbl 13070 `"Western Sahara"', add
label define bplcountry_lbl 13990 `"Northern Africa, n.s."', add
label define bplcountry_lbl 14000 `"Southern Africa"', add
label define bplcountry_lbl 14010 `"Botswana"', add
label define bplcountry_lbl 14020 `"Lesotho"', add
label define bplcountry_lbl 14030 `"Namibia"', add
label define bplcountry_lbl 14040 `"South Africa"', add
label define bplcountry_lbl 14050 `"Swaziland"', add
label define bplcountry_lbl 14990 `"Southern Africa, n.s."', add
label define bplcountry_lbl 15000 `"Western Africa"', add
label define bplcountry_lbl 15010 `"Benin"', add
label define bplcountry_lbl 15020 `"Burkina Faso"', add
label define bplcountry_lbl 15021 `"Upper Volta"', add
label define bplcountry_lbl 15030 `"Cape Verde"', add
label define bplcountry_lbl 15040 `"Ivory Coast"', add
label define bplcountry_lbl 15050 `"Gambia"', add
label define bplcountry_lbl 15060 `"Ghana"', add
label define bplcountry_lbl 15070 `"Guinea"', add
label define bplcountry_lbl 15080 `"Guinea-Bissau"', add
label define bplcountry_lbl 15081 `"Guinea-Bissau and Cape Verde"', add
label define bplcountry_lbl 15090 `"Liberia"', add
label define bplcountry_lbl 15100 `"Mali"', add
label define bplcountry_lbl 15110 `"Mauritania"', add
label define bplcountry_lbl 15120 `"Niger"', add
label define bplcountry_lbl 15130 `"Nigeria"', add
label define bplcountry_lbl 15140 `"St. Helena and Ascension"', add
label define bplcountry_lbl 15150 `"Senegal"', add
label define bplcountry_lbl 15160 `"Sierra Leone"', add
label define bplcountry_lbl 15170 `"Togo"', add
label define bplcountry_lbl 15990 `"West Africa, n.s."', add
label define bplcountry_lbl 19990 `"Africa, other and n.s."', add
label define bplcountry_lbl 19991 `"Central and South Africa"', add
label define bplcountry_lbl 19992 `"East and Central Africa"', add
label define bplcountry_lbl 19993 `"Southeastern Africa"', add
label define bplcountry_lbl 19994 `"Saharan Africa"', add
label define bplcountry_lbl 20000 `"Americas"', add
label define bplcountry_lbl 21000 `"Caribbean"', add
label define bplcountry_lbl 21010 `"Anguilla"', add
label define bplcountry_lbl 21020 `"Antigua-Barbuda"', add
label define bplcountry_lbl 21030 `"Aruba"', add
label define bplcountry_lbl 21040 `"Bahamas"', add
label define bplcountry_lbl 21050 `"Barbados"', add
label define bplcountry_lbl 21060 `"British Virgin Islands"', add
label define bplcountry_lbl 21070 `"Cayman Isles"', add
label define bplcountry_lbl 21080 `"Cuba"', add
label define bplcountry_lbl 21090 `"Dominica"', add
label define bplcountry_lbl 21100 `"Dominican Republic"', add
label define bplcountry_lbl 21110 `"Grenada"', add
label define bplcountry_lbl 21120 `"Guadeloupe"', add
label define bplcountry_lbl 21130 `"Haiti"', add
label define bplcountry_lbl 21140 `"Jamaica"', add
label define bplcountry_lbl 21150 `"Martinique"', add
label define bplcountry_lbl 21160 `"Montserrat"', add
label define bplcountry_lbl 21170 `"Netherlands Antilles"', add
label define bplcountry_lbl 21180 `"Puerto Rico"', add
label define bplcountry_lbl 21190 `"St. Kitts-Nevis"', add
label define bplcountry_lbl 21200 `"St. Croix"', add
label define bplcountry_lbl 21210 `"St. John"', add
label define bplcountry_lbl 21220 `"St. Lucia"', add
label define bplcountry_lbl 21230 `"St Thomas"', add
label define bplcountry_lbl 21240 `"St. Vincent"', add
label define bplcountry_lbl 21250 `"Trinidad and Tobago"', add
label define bplcountry_lbl 21260 `"Turks and Caicos"', add
label define bplcountry_lbl 21270 `"U.S. Virgin Islands"', add
label define bplcountry_lbl 21990 `"Other Caribbean and n.s."', add
label define bplcountry_lbl 21991 `"Caribbean commonwealth, n.s."', add
label define bplcountry_lbl 22000 `"Central America"', add
label define bplcountry_lbl 22010 `"Belize/British Honduras"', add
label define bplcountry_lbl 22020 `"Costa Rica"', add
label define bplcountry_lbl 22030 `"El Salvador"', add
label define bplcountry_lbl 22040 `"Guatemala"', add
label define bplcountry_lbl 22050 `"Honduras"', add
label define bplcountry_lbl 22060 `"Mexico"', add
label define bplcountry_lbl 22070 `"Nicaragua"', add
label define bplcountry_lbl 22080 `"Panama"', add
label define bplcountry_lbl 22081 `"Panama Canal Zone"', add
label define bplcountry_lbl 22990 `"Central America, n.s."', add
label define bplcountry_lbl 22991 `"Central America and Caribbean"', add
label define bplcountry_lbl 23000 `"South America"', add
label define bplcountry_lbl 23010 `"Argentina"', add
label define bplcountry_lbl 23020 `"Bolivia"', add
label define bplcountry_lbl 23030 `"Brazil"', add
label define bplcountry_lbl 23040 `"Chile"', add
label define bplcountry_lbl 23050 `"Colombia"', add
label define bplcountry_lbl 23060 `"Ecuador"', add
label define bplcountry_lbl 23070 `"Falkland Islands"', add
label define bplcountry_lbl 23080 `"French Guiana"', add
label define bplcountry_lbl 23090 `"Guyana/British Guiana"', add
label define bplcountry_lbl 23100 `"Paraguay"', add
label define bplcountry_lbl 23110 `"Peru"', add
label define bplcountry_lbl 23120 `"Suriname"', add
label define bplcountry_lbl 23130 `"Uruguay"', add
label define bplcountry_lbl 23140 `"Venezuela"', add
label define bplcountry_lbl 23990 `"South America, other and n.s."', add
label define bplcountry_lbl 23991 `"South America or Central America, n.s."', add
label define bplcountry_lbl 23992 `"Central/South America and Caribbean"', add
label define bplcountry_lbl 24000 `"North America"', add
label define bplcountry_lbl 24010 `"Bermuda"', add
label define bplcountry_lbl 24020 `"Canada"', add
label define bplcountry_lbl 24030 `"Greenland"', add
label define bplcountry_lbl 24040 `"United States"', add
label define bplcountry_lbl 24990 `"North America, other and n.s."', add
label define bplcountry_lbl 24991 `"North America/Oceania"', add
label define bplcountry_lbl 29990 `"Americas, other and n.s."', add
label define bplcountry_lbl 30000 `"Asia"', add
label define bplcountry_lbl 31000 `"Eastern Asia"', add
label define bplcountry_lbl 31010 `"China"', add
label define bplcountry_lbl 31011 `"Hong Kong"', add
label define bplcountry_lbl 31012 `"Macau"', add
label define bplcountry_lbl 31013 `"Taiwan"', add
label define bplcountry_lbl 31020 `"Japan"', add
label define bplcountry_lbl 31030 `"Korea"', add
label define bplcountry_lbl 31031 `"Korea, DPR (North)"', add
label define bplcountry_lbl 31032 `"Korea, RO (South)"', add
label define bplcountry_lbl 31040 `"Mongolia"', add
label define bplcountry_lbl 31990 `"Eastern Asia, n.s."', add
label define bplcountry_lbl 32000 `"South-Central Asia"', add
label define bplcountry_lbl 32010 `"Afghanistan"', add
label define bplcountry_lbl 32020 `"Bangladesh"', add
label define bplcountry_lbl 32030 `"Bhutan"', add
label define bplcountry_lbl 32040 `"India"', add
label define bplcountry_lbl 32041 `"India/Pakistan"', add
label define bplcountry_lbl 32042 `"India/Pakistan/Bangladesh/Sri Lanka"', add
label define bplcountry_lbl 32050 `"Iran"', add
label define bplcountry_lbl 32060 `"Kazakhstan"', add
label define bplcountry_lbl 32070 `"Kyrgyzstan"', add
label define bplcountry_lbl 32080 `"Maldives"', add
label define bplcountry_lbl 32090 `"Nepal"', add
label define bplcountry_lbl 32100 `"Pakistan"', add
label define bplcountry_lbl 32101 `"Pakistan/Bangladesh"', add
label define bplcountry_lbl 32110 `"Sri Lanka (Ceylon)"', add
label define bplcountry_lbl 32120 `"Tajikistan"', add
label define bplcountry_lbl 32130 `"Turkmenistan"', add
label define bplcountry_lbl 32140 `"Uzbekistan"', add
label define bplcountry_lbl 32999 `"South-Central Asia, n.s."', add
label define bplcountry_lbl 33000 `"South-Eastern Asia"', add
label define bplcountry_lbl 33010 `"Brunei"', add
label define bplcountry_lbl 33020 `"Cambodia (Kampuchea)"', add
label define bplcountry_lbl 33030 `"East Timor"', add
label define bplcountry_lbl 33040 `"Indonesia"', add
label define bplcountry_lbl 33050 `"Laos"', add
label define bplcountry_lbl 33060 `"Malaysia"', add
label define bplcountry_lbl 33070 `"Myanmar (Burma)"', add
label define bplcountry_lbl 33080 `"Philippines"', add
label define bplcountry_lbl 33090 `"Singapore"', add
label define bplcountry_lbl 33100 `"Thailand"', add
label define bplcountry_lbl 33110 `"Vietnam"', add
label define bplcountry_lbl 33990 `"South-Eastern Asia, n.s."', add
label define bplcountry_lbl 34000 `"Western Asia"', add
label define bplcountry_lbl 34010 `"Armenia"', add
label define bplcountry_lbl 34020 `"Azerbaijan"', add
label define bplcountry_lbl 34030 `"Bahrain"', add
label define bplcountry_lbl 34040 `"Cyprus"', add
label define bplcountry_lbl 34050 `"Georgia"', add
label define bplcountry_lbl 34060 `"Iraq"', add
label define bplcountry_lbl 34070 `"Israel"', add
label define bplcountry_lbl 34071 `"Israel/Palestine"', add
label define bplcountry_lbl 34080 `"Jordan"', add
label define bplcountry_lbl 34090 `"Kuwait"', add
label define bplcountry_lbl 34100 `"Lebanon"', add
label define bplcountry_lbl 34110 `"Palestinian Territories"', add
label define bplcountry_lbl 34111 `"West Bank"', add
label define bplcountry_lbl 34112 `"Gaza Strip"', add
label define bplcountry_lbl 34120 `"Oman"', add
label define bplcountry_lbl 34130 `"Qatar"', add
label define bplcountry_lbl 34140 `"Saudi Arabia"', add
label define bplcountry_lbl 34150 `"Syria"', add
label define bplcountry_lbl 34151 `"Syria/Lebanon"', add
label define bplcountry_lbl 34160 `"Turkey"', add
label define bplcountry_lbl 34170 `"United Arab Emirates"', add
label define bplcountry_lbl 34180 `"Yemen"', add
label define bplcountry_lbl 34990 `"Western Asia, n.s."', add
label define bplcountry_lbl 34991 `"Middle East"', add
label define bplcountry_lbl 39990 `"Asia, other and n.s."', add
label define bplcountry_lbl 39991 `"Central Asia and Middle East, n.s."', add
label define bplcountry_lbl 39992 `"Far East, n.s."', add
label define bplcountry_lbl 39993 `"Eastern/Southeast Asia, n.s."', add
label define bplcountry_lbl 39994 `"Asia/Middle East, other and n.s."', add
label define bplcountry_lbl 40000 `"Europe"', add
label define bplcountry_lbl 41000 `"Eastern Europe"', add
label define bplcountry_lbl 41010 `"Belarus"', add
label define bplcountry_lbl 41020 `"Bulgaria"', add
label define bplcountry_lbl 41021 `"Bulgaria/Greece"', add
label define bplcountry_lbl 41030 `"Czech Republic/Czechoslovakia"', add
label define bplcountry_lbl 41040 `"Hungary"', add
label define bplcountry_lbl 41050 `"Poland"', add
label define bplcountry_lbl 41060 `"Moldova"', add
label define bplcountry_lbl 41070 `"Romania"', add
label define bplcountry_lbl 41080 `"Russia/USSR"', add
label define bplcountry_lbl 41090 `"Slovakia"', add
label define bplcountry_lbl 41100 `"Ukraine"', add
label define bplcountry_lbl 41990 `"Eastern Europe, other and n.s."', add
label define bplcountry_lbl 41991 `"Albania, Bulgaria, Czech, Hungary, Romania, Yugoslavia"', add
label define bplcountry_lbl 41992 `"Central-Eastern Europe"', add
label define bplcountry_lbl 42000 `"Northern Europe"', add
label define bplcountry_lbl 42010 `"Denmark"', add
label define bplcountry_lbl 42020 `"Estonia"', add
label define bplcountry_lbl 42030 `"Faroe Islands"', add
label define bplcountry_lbl 42040 `"Finland"', add
label define bplcountry_lbl 42050 `"Iceland"', add
label define bplcountry_lbl 42060 `"Ireland"', add
label define bplcountry_lbl 42070 `"Latvia"', add
label define bplcountry_lbl 42080 `"Lithuania"', add
label define bplcountry_lbl 42090 `"Norway"', add
label define bplcountry_lbl 42100 `"Svalbard and Jan Mayen Islands"', add
label define bplcountry_lbl 42110 `"Sweden"', add
label define bplcountry_lbl 42120 `"United Kingdom"', add
label define bplcountry_lbl 42990 `"Northern Europe, n.s."', add
label define bplcountry_lbl 43000 `"Southern Europe"', add
label define bplcountry_lbl 43010 `"Albania"', add
label define bplcountry_lbl 43020 `"Andorra"', add
label define bplcountry_lbl 43030 `"Bosnia and Herzegovina"', add
label define bplcountry_lbl 43040 `"Croatia"', add
label define bplcountry_lbl 43050 `"Gibraltar"', add
label define bplcountry_lbl 43060 `"Greece"', add
label define bplcountry_lbl 43070 `"Italy"', add
label define bplcountry_lbl 43071 `"Vatican City"', add
label define bplcountry_lbl 43080 `"Malta"', add
label define bplcountry_lbl 43090 `"Portugal"', add
label define bplcountry_lbl 43100 `"San Marino"', add
label define bplcountry_lbl 43110 `"Slovenia"', add
label define bplcountry_lbl 43120 `"Spain"', add
label define bplcountry_lbl 43121 `"Spain/Portugal"', add
label define bplcountry_lbl 43130 `"Macedonia"', add
label define bplcountry_lbl 43140 `"Yugoslavia"', add
label define bplcountry_lbl 43141 `"Montenegro"', add
label define bplcountry_lbl 43142 `"Serbia"', add
label define bplcountry_lbl 43143 `"Serbia and Montenegro"', add
label define bplcountry_lbl 43144 `"Kosovo"', add
label define bplcountry_lbl 43990 `"Southern Europe, n.s."', add
label define bplcountry_lbl 43991 `"Gibraltar/Malta"', add
label define bplcountry_lbl 43992 `"Portugal/Greece"', add
label define bplcountry_lbl 43993 `"Italy, Holy See, San Marino"', add
label define bplcountry_lbl 44000 `"Western Europe"', add
label define bplcountry_lbl 44010 `"Austria"', add
label define bplcountry_lbl 44020 `"Belgium"', add
label define bplcountry_lbl 44021 `"Belgium/Luxemburg"', add
label define bplcountry_lbl 44022 `"Belgium/Netherlands/Luxemburg"', add
label define bplcountry_lbl 44030 `"France"', add
label define bplcountry_lbl 44040 `"Germany"', add
label define bplcountry_lbl 44041 `"Germany/Austria"', add
label define bplcountry_lbl 44042 `"West Germany"', add
label define bplcountry_lbl 44050 `"Liechtenstein"', add
label define bplcountry_lbl 44060 `"Luxembourg"', add
label define bplcountry_lbl 44070 `"Monaco"', add
label define bplcountry_lbl 44080 `"Netherlands"', add
label define bplcountry_lbl 44090 `"Switzerland"', add
label define bplcountry_lbl 44990 `"Western Europe, n.s."', add
label define bplcountry_lbl 44991 `"Belgium, Denmark, Luxembourg, Netherlands"', add
label define bplcountry_lbl 49991 `"Turkey and U.S.S.R."', add
label define bplcountry_lbl 49992 `"European Union"', add
label define bplcountry_lbl 49993 `"European Union (Original 15)"', add
label define bplcountry_lbl 49994 `"Other European Union"', add
label define bplcountry_lbl 49995 `"EEA, Switzerland, associated microstates"', add
label define bplcountry_lbl 49999 `"Europe, other and n.s."', add
label define bplcountry_lbl 50000 `"Oceania"', add
label define bplcountry_lbl 51000 `"Australia and New Zealand"', add
label define bplcountry_lbl 51010 `"Australia"', add
label define bplcountry_lbl 51020 `"New Zealand"', add
label define bplcountry_lbl 51030 `"Norfolk Islands"', add
label define bplcountry_lbl 51999 `"Australia and New Zealand, n.s."', add
label define bplcountry_lbl 52000 `"Melanesia"', add
label define bplcountry_lbl 52010 `"Fiji"', add
label define bplcountry_lbl 52020 `"New Caledonia"', add
label define bplcountry_lbl 52030 `"Papua New Guinea"', add
label define bplcountry_lbl 52040 `"Solomon Islands"', add
label define bplcountry_lbl 52050 `"Vanuatu (New Hebrides)"', add
label define bplcountry_lbl 52999 `"Melanesia, n.s."', add
label define bplcountry_lbl 53000 `"Micronesia"', add
label define bplcountry_lbl 53010 `"Kiribati"', add
label define bplcountry_lbl 53020 `"Marshall Islands"', add
label define bplcountry_lbl 53030 `"Nauru"', add
label define bplcountry_lbl 53040 `"Northern Mariana Isls."', add
label define bplcountry_lbl 53050 `"Palau"', add
label define bplcountry_lbl 53990 `"Micronesia, n.e.c."', add
label define bplcountry_lbl 54000 `"Polynesia"', add
label define bplcountry_lbl 54010 `"Cook Islands"', add
label define bplcountry_lbl 54020 `"French Polynesia"', add
label define bplcountry_lbl 54030 `"Niue"', add
label define bplcountry_lbl 54040 `"Pitcairn Island"', add
label define bplcountry_lbl 54050 `"Samoa"', add
label define bplcountry_lbl 54060 `"Eastern Samoa"', add
label define bplcountry_lbl 54070 `"Tokelau"', add
label define bplcountry_lbl 54080 `"Tonga"', add
label define bplcountry_lbl 54090 `"Tuvalu"', add
label define bplcountry_lbl 54100 `"Wallis and Futuna Isls."', add
label define bplcountry_lbl 54990 `"Polynesia, n.s."', add
label define bplcountry_lbl 55000 `"U.S. Pacific Possessions"', add
label define bplcountry_lbl 55010 `"American Samoa"', add
label define bplcountry_lbl 55020 `"Baker Island"', add
label define bplcountry_lbl 55030 `"Guam"', add
label define bplcountry_lbl 55040 `"Howland Island"', add
label define bplcountry_lbl 55050 `"Johnston Atoll"', add
label define bplcountry_lbl 55060 `"Kingman Reef"', add
label define bplcountry_lbl 55070 `"Midway Islands"', add
label define bplcountry_lbl 55080 `"Wake Island"', add
label define bplcountry_lbl 55990 `"Other US Pacific"', add
label define bplcountry_lbl 59990 `"Oceania, n.s."', add
label define bplcountry_lbl 60000 `"OTHER ABROAD"', add
label define bplcountry_lbl 60100 `"U.S. Outlying Areas and Territories"', add
label define bplcountry_lbl 60200 `"Africa/Other"', add
label define bplcountry_lbl 60300 `"Central/South America or Africa"', add
label define bplcountry_lbl 60400 `"Asia/Africa"', add
label define bplcountry_lbl 60500 `"Europe, Australia, New Zealand"', add
label define bplcountry_lbl 60600 `"Other commonwealth"', add
label define bplcountry_lbl 60700 `"Asia, Australia, Oceania, n.s."', add
label define bplcountry_lbl 69900 `"Other countries, not specified"', add
label define bplcountry_lbl 99999 `"Unknown"', add
label values bplcountry bplcountry_lbl

label define bpldo_lbl 0101 `"Santo Domingo de Guzman"'
label define bpldo_lbl 0201 `"Azua"', add
label define bpldo_lbl 0202 `"Las Charcas"', add
label define bpldo_lbl 0203 `"Las Yayas de Viajama"', add
label define bpldo_lbl 0204 `"Padre las Casas"', add
label define bpldo_lbl 0205 `"Peralta"', add
label define bpldo_lbl 0206 `"Sabana Yegua"', add
label define bpldo_lbl 0207 `"Pueblo Viejo"', add
label define bpldo_lbl 0208 `"Tabara Arriba"', add
label define bpldo_lbl 0209 `"Guayabal"', add
label define bpldo_lbl 0210 `"Estebanía"', add
label define bpldo_lbl 0211 `"Palmar de Ocoa"', add
label define bpldo_lbl 0212 `"Villarpando"', add
label define bpldo_lbl 0301 `"Neiba"', add
label define bpldo_lbl 0302 `"Galvan"', add
label define bpldo_lbl 0303 `"Tamayo"', add
label define bpldo_lbl 0304 `"Villa Jaragua"', add
label define bpldo_lbl 0305 `"Los Ríos"', add
label define bpldo_lbl 0306 `"Uvilla"', add
label define bpldo_lbl 0307 `"El Palmar"', add
label define bpldo_lbl 0401 `"Barahona"', add
label define bpldo_lbl 0402 `"Cabral"', add
label define bpldo_lbl 0403 `"Enriquillo"', add
label define bpldo_lbl 0404 `"Paraiso"', add
label define bpldo_lbl 0405 `"Vicente Noble"', add
label define bpldo_lbl 0406 `"El Peñon"', add
label define bpldo_lbl 0407 `"La Cienaga"', add
label define bpldo_lbl 0408 `"Fundación"', add
label define bpldo_lbl 0409 `"Las Salinas"', add
label define bpldo_lbl 0410 `"Polo"', add
label define bpldo_lbl 0411 `"Jaquimeyes"', add
label define bpldo_lbl 0412 `"Canoa"', add
label define bpldo_lbl 0413 `"El Cachón"', add
label define bpldo_lbl 0414 `"Pescadería"', add
label define bpldo_lbl 0501 `"Dajabón"', add
label define bpldo_lbl 0502 `"Loma de Cabrera"', add
label define bpldo_lbl 0503 `"Partido"', add
label define bpldo_lbl 0504 `"Restauración"', add
label define bpldo_lbl 0505 `"El Pino"', add
label define bpldo_lbl 0601 `"San Francisco de Macorís"', add
label define bpldo_lbl 0602 `"Arenoso"', add
label define bpldo_lbl 0603 `"Castillo"', add
label define bpldo_lbl 0604 `"Pimentel"', add
label define bpldo_lbl 0605 `"Villa Riva"', add
label define bpldo_lbl 0606 `"Las Guáranas"', add
label define bpldo_lbl 0607 `"Eugenio Maria de Hostos"', add
label define bpldo_lbl 0608 `"Agua Santa del Yuna"', add
label define bpldo_lbl 0609 `"Cristo Rey de Guaraguao"', add
label define bpldo_lbl 0610 `"La Peña"', add
label define bpldo_lbl 0611 `"Cenoví"', add
label define bpldo_lbl 0699 `"Other Duarte Province"', add
label define bpldo_lbl 0701 `"Comendador"', add
label define bpldo_lbl 0702 `"Banica"', add
label define bpldo_lbl 0703 `"El Llano"', add
label define bpldo_lbl 0704 `"Hondo Valle"', add
label define bpldo_lbl 0705 `"Pedro Santana"', add
label define bpldo_lbl 0706 `"Juan Santiago"', add
label define bpldo_lbl 0707 `"Río Limpio"', add
label define bpldo_lbl 0801 `"El Seibo"', add
label define bpldo_lbl 0802 `"Miches"', add
label define bpldo_lbl 0803 `"Pedro Sánchez"', add
label define bpldo_lbl 0901 `"Moca"', add
label define bpldo_lbl 0902 `"Cayetano Germosén"', add
label define bpldo_lbl 0903 `"Gaspar Hernández"', add
label define bpldo_lbl 0904 `"Jamao al Norte"', add
label define bpldo_lbl 0905 `"José Contreras"', add
label define bpldo_lbl 0906 `"San Víctor"', add
label define bpldo_lbl 0907 `"Joba Arriba"', add
label define bpldo_lbl 0908 `"Veragua"', add
label define bpldo_lbl 0909 `"Juan López"', add
label define bpldo_lbl 1001 `"Jimaní"', add
label define bpldo_lbl 1002 `"Duvergé"', add
label define bpldo_lbl 1003 `"La Descubierta"', add
label define bpldo_lbl 1004 `"Postrer Río"', add
label define bpldo_lbl 1005 `"Cristóbal"', add
label define bpldo_lbl 1006 `"Mella"', add
label define bpldo_lbl 1007 `"Guayabal (Independencia)"', add
label define bpldo_lbl 1101 `"Higüey"', add
label define bpldo_lbl 1102 `"San Rafael del Yuma"', add
label define bpldo_lbl 1103 `"Las Lagunas de Nisibón"', add
label define bpldo_lbl 1104 `"La Otra Banda"', add
label define bpldo_lbl 1105 `"Boca de Yuma"', add
label define bpldo_lbl 1201 `"La Romana"', add
label define bpldo_lbl 1202 `"Guaymate"', add
label define bpldo_lbl 1203 `"Villa Hermosa"', add
label define bpldo_lbl 1301 `"La Vega"', add
label define bpldo_lbl 1302 `"Constanza"', add
label define bpldo_lbl 1303 `"Jarabacoa"', add
label define bpldo_lbl 1304 `"Jima Abajo"', add
label define bpldo_lbl 1305 `"Tireo"', add
label define bpldo_lbl 1306 `"Río Verde Arriba"', add
label define bpldo_lbl 1307 `"Rincón"', add
label define bpldo_lbl 1401 `"Nagua"', add
label define bpldo_lbl 1402 `"Cabrera"', add
label define bpldo_lbl 1403 `"El Factor"', add
label define bpldo_lbl 1404 `"Río San Juan"', add
label define bpldo_lbl 1405 `"San José de Mantanzas"', add
label define bpldo_lbl 1406 `"Arroyo Salado"', add
label define bpldo_lbl 1407 `"La Entrada"', add
label define bpldo_lbl 1408 `"El Pozo"', add
label define bpldo_lbl 1501 `"Monte Cristi"', add
label define bpldo_lbl 1502 `"Castañuelas"', add
label define bpldo_lbl 1503 `"Guayubín"', add
label define bpldo_lbl 1504 `"Las Matas de Santa Cruz"', add
label define bpldo_lbl 1505 `"Pepillo Salcedo"', add
label define bpldo_lbl 1506 `"Villa Vásquez"', add
label define bpldo_lbl 1507 `"Villa Elisa"', add
label define bpldo_lbl 1508 `"Hatillo Palma"', add
label define bpldo_lbl 1509 `"Cana Chapetón"', add
label define bpldo_lbl 1601 `"Pedernales"', add
label define bpldo_lbl 1602 `"Oviedo"', add
label define bpldo_lbl 1603 `"Juancho"', add
label define bpldo_lbl 1701 `"Baní"', add
label define bpldo_lbl 1702 `"Nizao"', add
label define bpldo_lbl 1703 `"Mantanzas"', add
label define bpldo_lbl 1704 `"Villa Fundación"', add
label define bpldo_lbl 1705 `"Sabana Buey"', add
label define bpldo_lbl 1706 `"Pizarrete"', add
label define bpldo_lbl 1707 `"Santana"', add
label define bpldo_lbl 1708 `"Paya"', add
label define bpldo_lbl 1801 `"Puerto Plata"', add
label define bpldo_lbl 1802 `"Altamira"', add
label define bpldo_lbl 1803 `"Guananico"', add
label define bpldo_lbl 1804 `"Imbert"', add
label define bpldo_lbl 1805 `"Los Hidalgos"', add
label define bpldo_lbl 1806 `"Luperón"', add
label define bpldo_lbl 1807 `"Sosúa"', add
label define bpldo_lbl 1808 `"Villa Isabela"', add
label define bpldo_lbl 1809 `"Villa Montellano"', add
label define bpldo_lbl 1810 `"Estero Hondo"', add
label define bpldo_lbl 1811 `"La Isabella"', add
label define bpldo_lbl 1901 `"Salcedo"', add
label define bpldo_lbl 1902 `"Tenares"', add
label define bpldo_lbl 1903 `"Villa Tapa"', add
label define bpldo_lbl 1904 `"Blanco"', add
label define bpldo_lbl 2001 `"Samaná"', add
label define bpldo_lbl 2002 `"Sánchez"', add
label define bpldo_lbl 2003 `"Las Terrenas"', add
label define bpldo_lbl 2101 `"San Cristóbal"', add
label define bpldo_lbl 2102 `"Sabana Grande de Palenque"', add
label define bpldo_lbl 2103 `"Bajos de Haina"', add
label define bpldo_lbl 2104 `"Cambita Garabitos"', add
label define bpldo_lbl 2105 `"Villa Altagracia"', add
label define bpldo_lbl 2106 `"Yaguate"', add
label define bpldo_lbl 2107 `"San Gregorio de Nigua"', add
label define bpldo_lbl 2108 `"Los Cacaos"', add
label define bpldo_lbl 2109 `"El Carril"', add
label define bpldo_lbl 2201 `"San Juan"', add
label define bpldo_lbl 2202 `"Bohechio"', add
label define bpldo_lbl 2203 `"El Cercado"', add
label define bpldo_lbl 2204 `"Juan de Herrera"', add
label define bpldo_lbl 2205 `"Las Matas de Farfán"', add
label define bpldo_lbl 2206 `"Vallejuelo"', add
label define bpldo_lbl 2207 `"Matayaya"', add
label define bpldo_lbl 2208 `"Pedro Corto"', add
label define bpldo_lbl 2301 `"San Pedro de Macorís"', add
label define bpldo_lbl 2302 `"Los Llanos"', add
label define bpldo_lbl 2303 `"Ramón Santana"', add
label define bpldo_lbl 2304 `"Consuelo"', add
label define bpldo_lbl 2305 `"Quisqueya"', add
label define bpldo_lbl 2306 `"Guayacanes"', add
label define bpldo_lbl 2307 `"El Puerto"', add
label define bpldo_lbl 2401 `"Cotuí"', add
label define bpldo_lbl 2402 `"Cevicos"', add
label define bpldo_lbl 2403 `"Fantino"', add
label define bpldo_lbl 2404 `"La Mata"', add
label define bpldo_lbl 2405 `"La Cueva"', add
label define bpldo_lbl 2501 `"Santiago"', add
label define bpldo_lbl 2502 `"Bisonó"', add
label define bpldo_lbl 2503 `"Jánico"', add
label define bpldo_lbl 2504 `"Licey Al Medio"', add
label define bpldo_lbl 2505 `"San José de las Matas"', add
label define bpldo_lbl 2506 `"Tamboril"', add
label define bpldo_lbl 2507 `"Villa González"', add
label define bpldo_lbl 2508 `"Punal"', add
label define bpldo_lbl 2509 `"Sabana Iglesia"', add
label define bpldo_lbl 2510 `"Baitoa"', add
label define bpldo_lbl 2511 `"La Canela"', add
label define bpldo_lbl 2512 `"El Rubio"', add
label define bpldo_lbl 2513 `"Juncalito"', add
label define bpldo_lbl 2514 `"Palmar Arriba"', add
label define bpldo_lbl 2515 `"Pedro Garcia"', add
label define bpldo_lbl 2601 `"San Ignacio de Sabaneta"', add
label define bpldo_lbl 2602 `"Villa los Almácigos"', add
label define bpldo_lbl 2603 `"Monción"', add
label define bpldo_lbl 2701 `"Mao"', add
label define bpldo_lbl 2702 `"Esperanza"', add
label define bpldo_lbl 2703 `"Laguna Salada"', add
label define bpldo_lbl 2704 `"Amina"', add
label define bpldo_lbl 2705 `"Maizal"', add
label define bpldo_lbl 2706 `"Jaibon (Pueblo Nuevo)"', add
label define bpldo_lbl 2707 `"Guatapanal"', add
label define bpldo_lbl 2708 `"Jicomé"', add
label define bpldo_lbl 2709 `"Jaibon (Laguna Salada)"', add
label define bpldo_lbl 2710 `"La Caya"', add
label define bpldo_lbl 2801 `"Bonao"', add
label define bpldo_lbl 2802 `"Maimón"', add
label define bpldo_lbl 2803 `"Piedra Blanca"', add
label define bpldo_lbl 2804 `"Villa de Sonador"', add
label define bpldo_lbl 2805 `"Sabana del Puerto"', add
label define bpldo_lbl 2806 `"Juan Adrián"', add
label define bpldo_lbl 2901 `"Monte Plata"', add
label define bpldo_lbl 2902 `"Bayaguana"', add
label define bpldo_lbl 2903 `"Sabana Grande de Boya"', add
label define bpldo_lbl 2904 `"Yamasá"', add
label define bpldo_lbl 2905 `"Peralvillo"', add
label define bpldo_lbl 2906 `"Gonzalo"', add
label define bpldo_lbl 2907 `"Los Botados"', add
label define bpldo_lbl 2908 `"Majagual"', add
label define bpldo_lbl 2909 `"Don Juan"', add
label define bpldo_lbl 3001 `"Hato Mayor"', add
label define bpldo_lbl 3002 `"Sabana de la Mar"', add
label define bpldo_lbl 3003 `"El Valle"', add
label define bpldo_lbl 3004 `"Elupina Cordero de las Cañitas"', add
label define bpldo_lbl 3005 `"Yerba Buena"', add
label define bpldo_lbl 3006 `"Mata Palacio"', add
label define bpldo_lbl 3007 `"Guayabo Dulce"', add
label define bpldo_lbl 3101 `"San José de Ocoa"', add
label define bpldo_lbl 3102 `"Sabana Larga"', add
label define bpldo_lbl 3103 `"Rancho Arriba"', add
label define bpldo_lbl 3104 `"La Cienaga (San José de Ocoa)"', add
label define bpldo_lbl 3201 `"Santo Domingo Este"', add
label define bpldo_lbl 3202 `"Santo Domingo Oeste"', add
label define bpldo_lbl 3203 `"Santo Domingo Norte"', add
label define bpldo_lbl 3204 `"Boca Chica"', add
label define bpldo_lbl 3205 `"San Antonio de Guerra"', add
label define bpldo_lbl 3206 `"Los Alcarrizos"', add
label define bpldo_lbl 3207 `"Pedro Brand"', add
label define bpldo_lbl 3208 `"La Victoria"', add
label define bpldo_lbl 5000 `"Foreign country"', add
label define bpldo_lbl 9998 `"Unknown"', add
label values bpldo bpldo_lbl

label define yrimm_lbl 0000 `"NIU (not in universe)"'
label define yrimm_lbl 1872 `"1872"', add
label define yrimm_lbl 1879 `"1879"', add
label define yrimm_lbl 1880 `"1880"', add
label define yrimm_lbl 1881 `"1881"', add
label define yrimm_lbl 1882 `"1882"', add
label define yrimm_lbl 1883 `"1883"', add
label define yrimm_lbl 1884 `"1884"', add
label define yrimm_lbl 1885 `"1885"', add
label define yrimm_lbl 1886 `"1886"', add
label define yrimm_lbl 1887 `"1887"', add
label define yrimm_lbl 1888 `"1888"', add
label define yrimm_lbl 1889 `"1889"', add
label define yrimm_lbl 1890 `"1890"', add
label define yrimm_lbl 1891 `"1891"', add
label define yrimm_lbl 1892 `"1892"', add
label define yrimm_lbl 1893 `"1893"', add
label define yrimm_lbl 1894 `"1894"', add
label define yrimm_lbl 1895 `"1895"', add
label define yrimm_lbl 1896 `"1896"', add
label define yrimm_lbl 1897 `"1897"', add
label define yrimm_lbl 1898 `"1898"', add
label define yrimm_lbl 1899 `"1899"', add
label define yrimm_lbl 1900 `"1900"', add
label define yrimm_lbl 1901 `"1901"', add
label define yrimm_lbl 1902 `"1902"', add
label define yrimm_lbl 1903 `"1903"', add
label define yrimm_lbl 1904 `"1904"', add
label define yrimm_lbl 1905 `"1905"', add
label define yrimm_lbl 1906 `"1906"', add
label define yrimm_lbl 1907 `"1907"', add
label define yrimm_lbl 1908 `"1908"', add
label define yrimm_lbl 1909 `"1909"', add
label define yrimm_lbl 1910 `"1910"', add
label define yrimm_lbl 1911 `"1911"', add
label define yrimm_lbl 1912 `"1912"', add
label define yrimm_lbl 1913 `"1913"', add
label define yrimm_lbl 1914 `"1914"', add
label define yrimm_lbl 1915 `"1915"', add
label define yrimm_lbl 1916 `"1916"', add
label define yrimm_lbl 1917 `"1917"', add
label define yrimm_lbl 1918 `"1918"', add
label define yrimm_lbl 1919 `"1919"', add
label define yrimm_lbl 1920 `"1920"', add
label define yrimm_lbl 1921 `"1921"', add
label define yrimm_lbl 1922 `"1922"', add
label define yrimm_lbl 1923 `"1923"', add
label define yrimm_lbl 1924 `"1924"', add
label define yrimm_lbl 1925 `"1925"', add
label define yrimm_lbl 1926 `"1926"', add
label define yrimm_lbl 1927 `"1927"', add
label define yrimm_lbl 1928 `"1928"', add
label define yrimm_lbl 1929 `"1929"', add
label define yrimm_lbl 1930 `"1930"', add
label define yrimm_lbl 1931 `"1931"', add
label define yrimm_lbl 1932 `"1932"', add
label define yrimm_lbl 1933 `"1933"', add
label define yrimm_lbl 1934 `"1934"', add
label define yrimm_lbl 1935 `"1935"', add
label define yrimm_lbl 1936 `"1936"', add
label define yrimm_lbl 1937 `"1937"', add
label define yrimm_lbl 1938 `"1938"', add
label define yrimm_lbl 1939 `"1939"', add
label define yrimm_lbl 1940 `"1940"', add
label define yrimm_lbl 1941 `"1941"', add
label define yrimm_lbl 1942 `"1942"', add
label define yrimm_lbl 1943 `"1943"', add
label define yrimm_lbl 1944 `"1944"', add
label define yrimm_lbl 1945 `"1945"', add
label define yrimm_lbl 1946 `"1946"', add
label define yrimm_lbl 1947 `"1947"', add
label define yrimm_lbl 1948 `"1948"', add
label define yrimm_lbl 1949 `"1949"', add
label define yrimm_lbl 1950 `"1950"', add
label define yrimm_lbl 1951 `"1951"', add
label define yrimm_lbl 1952 `"1952"', add
label define yrimm_lbl 1953 `"1953"', add
label define yrimm_lbl 1954 `"1954"', add
label define yrimm_lbl 1955 `"1955"', add
label define yrimm_lbl 1956 `"1956"', add
label define yrimm_lbl 1957 `"1957"', add
label define yrimm_lbl 1958 `"1958"', add
label define yrimm_lbl 1959 `"1959"', add
label define yrimm_lbl 1960 `"1960"', add
label define yrimm_lbl 1961 `"1961"', add
label define yrimm_lbl 1962 `"1962"', add
label define yrimm_lbl 1963 `"1963"', add
label define yrimm_lbl 1964 `"1964"', add
label define yrimm_lbl 1965 `"1965"', add
label define yrimm_lbl 1966 `"1966"', add
label define yrimm_lbl 1967 `"1967"', add
label define yrimm_lbl 1968 `"1968"', add
label define yrimm_lbl 1969 `"1969"', add
label define yrimm_lbl 1970 `"1970"', add
label define yrimm_lbl 1971 `"1971"', add
label define yrimm_lbl 1972 `"1972"', add
label define yrimm_lbl 1973 `"1973"', add
label define yrimm_lbl 1974 `"1974"', add
label define yrimm_lbl 1975 `"1975"', add
label define yrimm_lbl 1976 `"1976"', add
label define yrimm_lbl 1977 `"1977"', add
label define yrimm_lbl 1978 `"1978"', add
label define yrimm_lbl 1979 `"1979"', add
label define yrimm_lbl 1980 `"1980"', add
label define yrimm_lbl 1981 `"1981"', add
label define yrimm_lbl 1982 `"1982"', add
label define yrimm_lbl 1983 `"1983"', add
label define yrimm_lbl 1984 `"1984"', add
label define yrimm_lbl 1985 `"1985"', add
label define yrimm_lbl 1986 `"1986"', add
label define yrimm_lbl 1987 `"1987"', add
label define yrimm_lbl 1988 `"1988"', add
label define yrimm_lbl 1989 `"1989"', add
label define yrimm_lbl 1990 `"1990"', add
label define yrimm_lbl 1991 `"1991"', add
label define yrimm_lbl 1992 `"1992"', add
label define yrimm_lbl 1993 `"1993"', add
label define yrimm_lbl 1994 `"1994"', add
label define yrimm_lbl 1995 `"1995"', add
label define yrimm_lbl 1996 `"1996"', add
label define yrimm_lbl 1997 `"1997"', add
label define yrimm_lbl 1998 `"1998"', add
label define yrimm_lbl 1999 `"1999"', add
label define yrimm_lbl 2000 `"2000"', add
label define yrimm_lbl 2001 `"2001"', add
label define yrimm_lbl 2002 `"2002"', add
label define yrimm_lbl 2003 `"2003"', add
label define yrimm_lbl 2004 `"2004"', add
label define yrimm_lbl 2005 `"2005"', add
label define yrimm_lbl 2006 `"2006"', add
label define yrimm_lbl 2007 `"2007"', add
label define yrimm_lbl 2008 `"2008"', add
label define yrimm_lbl 2009 `"2009"', add
label define yrimm_lbl 2010 `"2010"', add
label define yrimm_lbl 2011 `"2011"', add
label define yrimm_lbl 9998 `"In transit"', add
label define yrimm_lbl 9999 `"Unknown"', add
label values yrimm yrimm_lbl

label define yrsimm_lbl 00 `"0 (within previous year)"'
label define yrsimm_lbl 01 `"1"', add
label define yrsimm_lbl 02 `"2"', add
label define yrsimm_lbl 03 `"3"', add
label define yrsimm_lbl 04 `"4"', add
label define yrsimm_lbl 05 `"5"', add
label define yrsimm_lbl 06 `"6"', add
label define yrsimm_lbl 07 `"7"', add
label define yrsimm_lbl 08 `"8"', add
label define yrsimm_lbl 09 `"9"', add
label define yrsimm_lbl 10 `"10"', add
label define yrsimm_lbl 11 `"11"', add
label define yrsimm_lbl 12 `"12"', add
label define yrsimm_lbl 13 `"13"', add
label define yrsimm_lbl 14 `"14"', add
label define yrsimm_lbl 15 `"15"', add
label define yrsimm_lbl 16 `"16"', add
label define yrsimm_lbl 17 `"17"', add
label define yrsimm_lbl 18 `"18"', add
label define yrsimm_lbl 19 `"19"', add
label define yrsimm_lbl 20 `"20"', add
label define yrsimm_lbl 21 `"21"', add
label define yrsimm_lbl 22 `"22"', add
label define yrsimm_lbl 23 `"23"', add
label define yrsimm_lbl 24 `"24"', add
label define yrsimm_lbl 25 `"25"', add
label define yrsimm_lbl 26 `"26"', add
label define yrsimm_lbl 27 `"27"', add
label define yrsimm_lbl 28 `"28"', add
label define yrsimm_lbl 29 `"29"', add
label define yrsimm_lbl 30 `"30"', add
label define yrsimm_lbl 31 `"31"', add
label define yrsimm_lbl 32 `"32"', add
label define yrsimm_lbl 33 `"33"', add
label define yrsimm_lbl 34 `"34"', add
label define yrsimm_lbl 35 `"35"', add
label define yrsimm_lbl 36 `"36"', add
label define yrsimm_lbl 37 `"37"', add
label define yrsimm_lbl 38 `"38"', add
label define yrsimm_lbl 39 `"39"', add
label define yrsimm_lbl 40 `"40"', add
label define yrsimm_lbl 41 `"41"', add
label define yrsimm_lbl 42 `"42"', add
label define yrsimm_lbl 43 `"43"', add
label define yrsimm_lbl 44 `"44"', add
label define yrsimm_lbl 45 `"45"', add
label define yrsimm_lbl 46 `"46"', add
label define yrsimm_lbl 47 `"47"', add
label define yrsimm_lbl 48 `"48"', add
label define yrsimm_lbl 49 `"49"', add
label define yrsimm_lbl 50 `"50"', add
label define yrsimm_lbl 51 `"51"', add
label define yrsimm_lbl 52 `"52"', add
label define yrsimm_lbl 53 `"53"', add
label define yrsimm_lbl 54 `"54"', add
label define yrsimm_lbl 55 `"55"', add
label define yrsimm_lbl 56 `"56"', add
label define yrsimm_lbl 57 `"57"', add
label define yrsimm_lbl 58 `"58"', add
label define yrsimm_lbl 59 `"59"', add
label define yrsimm_lbl 60 `"60"', add
label define yrsimm_lbl 61 `"61"', add
label define yrsimm_lbl 62 `"62"', add
label define yrsimm_lbl 63 `"63"', add
label define yrsimm_lbl 64 `"64"', add
label define yrsimm_lbl 65 `"65"', add
label define yrsimm_lbl 66 `"66"', add
label define yrsimm_lbl 67 `"67"', add
label define yrsimm_lbl 68 `"68"', add
label define yrsimm_lbl 69 `"69"', add
label define yrsimm_lbl 70 `"70"', add
label define yrsimm_lbl 71 `"71"', add
label define yrsimm_lbl 72 `"72"', add
label define yrsimm_lbl 73 `"73"', add
label define yrsimm_lbl 74 `"74"', add
label define yrsimm_lbl 75 `"75"', add
label define yrsimm_lbl 76 `"76"', add
label define yrsimm_lbl 77 `"77"', add
label define yrsimm_lbl 78 `"78"', add
label define yrsimm_lbl 79 `"79"', add
label define yrsimm_lbl 80 `"80"', add
label define yrsimm_lbl 81 `"81"', add
label define yrsimm_lbl 82 `"82"', add
label define yrsimm_lbl 83 `"83"', add
label define yrsimm_lbl 84 `"84"', add
label define yrsimm_lbl 85 `"85"', add
label define yrsimm_lbl 86 `"86"', add
label define yrsimm_lbl 87 `"87"', add
label define yrsimm_lbl 88 `"88"', add
label define yrsimm_lbl 89 `"89"', add
label define yrsimm_lbl 90 `"90"', add
label define yrsimm_lbl 91 `"91"', add
label define yrsimm_lbl 92 `"92"', add
label define yrsimm_lbl 93 `"93"', add
label define yrsimm_lbl 94 `"94"', add
label define yrsimm_lbl 95 `"95"', add
label define yrsimm_lbl 96 `"96"', add
label define yrsimm_lbl 97 `"97+"', add
label define yrsimm_lbl 98 `"Unknown"', add
label define yrsimm_lbl 99 `"NIU (not in universe)"', add
label values yrsimm yrsimm_lbl

label define yrsimm2_lbl 1 `"Less than 1 year"'
label define yrsimm2_lbl 2 `"1 to 4 years"', add
label define yrsimm2_lbl 3 `"5 to 9 years"', add
label define yrsimm2_lbl 4 `"10 or more years"', add
label define yrsimm2_lbl 8 `"Unknown"', add
label define yrsimm2_lbl 9 `"NIU (not in universe)"', add
label values yrsimm2 yrsimm2_lbl

label define school_lbl 0 `"NIU (not in universe)"'
label define school_lbl 1 `"Yes"', add
label define school_lbl 2 `"No, not specified"', add
label define school_lbl 3 `"No, attended in the past"', add
label define school_lbl 4 `"No, never attended"', add
label define school_lbl 9 `"Unknown/missing"', add
label values school school_lbl

label define lit_lbl 0 `"NIU (not in universe)"'
label define lit_lbl 1 `"No, illiterate"', add
label define lit_lbl 2 `"Yes, literate"', add
label define lit_lbl 9 `"Unknown/missing"', add
label values lit lit_lbl

label define edattain_lbl 0 `"NIU (not in universe)"'
label define edattain_lbl 1 `"Less than primary completed"', add
label define edattain_lbl 2 `"Primary completed"', add
label define edattain_lbl 3 `"Secondary completed"', add
label define edattain_lbl 4 `"University completed"', add
label define edattain_lbl 9 `"Unknown"', add
label values edattain edattain_lbl

label define edattaind_lbl 000 `"NIU (not in universe)"'
label define edattaind_lbl 100 `"Less than primary completed (n.s.)"', add
label define edattaind_lbl 110 `"No schooling"', add
label define edattaind_lbl 120 `"Some primary completed"', add
label define edattaind_lbl 130 `"Primary (4 yrs) completed"', add
label define edattaind_lbl 211 `"Primary (5 yrs) completed"', add
label define edattaind_lbl 212 `"Primary (6 yrs) completed"', add
label define edattaind_lbl 221 `"Lower secondary general completed"', add
label define edattaind_lbl 222 `"Lower secondary technical completed"', add
label define edattaind_lbl 311 `"Secondary, general track completed"', add
label define edattaind_lbl 312 `"Some college completed"', add
label define edattaind_lbl 320 `"Secondary or post-secondary technical completed"', add
label define edattaind_lbl 321 `"Secondary, technical track completed"', add
label define edattaind_lbl 322 `"Post-secondary technical education"', add
label define edattaind_lbl 400 `"University completed"', add
label define edattaind_lbl 999 `"Unknown/missing"', add
label values edattaind edattaind_lbl

label define yrschool_lbl 00 `"None or pre-school"'
label define yrschool_lbl 01 `"1 year"', add
label define yrschool_lbl 02 `"2 years"', add
label define yrschool_lbl 03 `"3 years"', add
label define yrschool_lbl 04 `"4 years"', add
label define yrschool_lbl 05 `"5 years"', add
label define yrschool_lbl 06 `"6 years"', add
label define yrschool_lbl 07 `"7 years"', add
label define yrschool_lbl 08 `"8 years"', add
label define yrschool_lbl 09 `"9 years"', add
label define yrschool_lbl 10 `"10 years"', add
label define yrschool_lbl 11 `"11 years"', add
label define yrschool_lbl 12 `"12 years"', add
label define yrschool_lbl 13 `"13 years"', add
label define yrschool_lbl 14 `"14 years"', add
label define yrschool_lbl 15 `"15 years"', add
label define yrschool_lbl 16 `"16 years"', add
label define yrschool_lbl 17 `"17 years"', add
label define yrschool_lbl 18 `"18 years or more"', add
label define yrschool_lbl 90 `"Not specified"', add
label define yrschool_lbl 91 `"Some primary"', add
label define yrschool_lbl 92 `"Some technical after primary"', add
label define yrschool_lbl 93 `"Some secondary"', add
label define yrschool_lbl 94 `"Some tertiary"', add
label define yrschool_lbl 95 `"Adult literacy"', add
label define yrschool_lbl 96 `"Special education"', add
label define yrschool_lbl 97 `"Response suppressed"', add
label define yrschool_lbl 98 `"Unknown/missing"', add
label define yrschool_lbl 99 `"NIU (not in universe)"', add
label values yrschool yrschool_lbl

label define educdo_lbl 000 `"NIU (not in universe)"'
label define educdo_lbl 100 `"None"', add
label define educdo_lbl 200 `"Preschool"', add
label define educdo_lbl 201 `"Preschool, year 1"', add
label define educdo_lbl 202 `"Preschool, year 2"', add
label define educdo_lbl 203 `"Preschool, year 3"', add
label define educdo_lbl 204 `"Preschool, not complete"', add
label define educdo_lbl 205 `"Preschool, complete"', add
label define educdo_lbl 300 `"Primary, less than 1 year"', add
label define educdo_lbl 301 `"Primary, year 1"', add
label define educdo_lbl 302 `"Primary, year 2"', add
label define educdo_lbl 303 `"Primary, year 3"', add
label define educdo_lbl 304 `"Primary, year 4"', add
label define educdo_lbl 305 `"Primary, year 5"', add
label define educdo_lbl 306 `"Primary, year 6"', add
label define educdo_lbl 307 `"Primary, year 7"', add
label define educdo_lbl 308 `"Primary, year 8"', add
label define educdo_lbl 309 `"Primary, year unknown"', add
label define educdo_lbl 401 `"Intermediate, year 1"', add
label define educdo_lbl 402 `"Intermediate, year 2"', add
label define educdo_lbl 403 `"Intermediate, year unknown"', add
label define educdo_lbl 410 `"Secondary, less than 1 year"', add
label define educdo_lbl 411 `"Secondary, year 1"', add
label define educdo_lbl 412 `"Secondary, year 2"', add
label define educdo_lbl 413 `"Secondary, year 3"', add
label define educdo_lbl 414 `"Secondary, year 4"', add
label define educdo_lbl 415 `"Secondary, year unknown"', add
label define educdo_lbl 421 `"Reformed secondary, year 1"', add
label define educdo_lbl 422 `"Reformed secondary, year 2"', add
label define educdo_lbl 423 `"Reformed secondary, year 3"', add
label define educdo_lbl 424 `"Reformed secondary, year 4"', add
label define educdo_lbl 425 `"Reformed secondary, year 5"', add
label define educdo_lbl 426 `"Reformed secondary, year 6"', add
label define educdo_lbl 500 `"University, less than 1 year"', add
label define educdo_lbl 501 `"University, year 1"', add
label define educdo_lbl 502 `"University, year 2"', add
label define educdo_lbl 503 `"University, year 3"', add
label define educdo_lbl 504 `"University, year 4"', add
label define educdo_lbl 505 `"University, year 5"', add
label define educdo_lbl 506 `"University, year 6"', add
label define educdo_lbl 507 `"University, year 7"', add
label define educdo_lbl 508 `"University, year 8"', add
label define educdo_lbl 509 `"University, year unknown"', add
label define educdo_lbl 510 `"Speciality"', add
label define educdo_lbl 511 `"Speciality, year 1"', add
label define educdo_lbl 512 `"Speciality, year 2"', add
label define educdo_lbl 520 `"Masters"', add
label define educdo_lbl 521 `"Masters, year 1"', add
label define educdo_lbl 522 `"Masters, year 2"', add
label define educdo_lbl 523 `"Masters, year 3"', add
label define educdo_lbl 530 `"Doctorate"', add
label define educdo_lbl 531 `"Doctorate, year 1"', add
label define educdo_lbl 532 `"Doctorate, year 2"', add
label define educdo_lbl 533 `"Doctorate, year 3"', add
label define educdo_lbl 534 `"Doctorate, year 4"', add
label define educdo_lbl 998 `"Unknown"', add
label values educdo educdo_lbl

label define leftsch_lbl 00 `"NIU (not in universe)"'
label define leftsch_lbl 10 `"Finished studies"', add
label define leftsch_lbl 20 `"Financial considerations"', add
label define leftsch_lbl 21 `"Insufficient economic means"', add
label define leftsch_lbl 22 `"Working"', add
label define leftsch_lbl 30 `"Access to a school"', add
label define leftsch_lbl 31 `"School too far away"', add
label define leftsch_lbl 32 `"No school available"', add
label define leftsch_lbl 33 `"No higher grades offered"', add
label define leftsch_lbl 34 `"No places available in school"', add
label define leftsch_lbl 40 `"Family reasons"', add
label define leftsch_lbl 41 `"Parents think it is not important"', add
label define leftsch_lbl 42 `"Family required for household tasks"', add
label define leftsch_lbl 43 `"Got married or entered a consensual union"', add
label define leftsch_lbl 44 `"Pregnancy"', add
label define leftsch_lbl 45 `"Separation or death of parents"', add
label define leftsch_lbl 50 `"Other reasons"', add
label define leftsch_lbl 51 `"Never attended school"', add
label define leftsch_lbl 52 `"Did not want to attend or to study"', add
label define leftsch_lbl 53 `"Too young to attend"', add
label define leftsch_lbl 54 `"Too old to attend"', add
label define leftsch_lbl 55 `"Illness/disability"', add
label define leftsch_lbl 56 `"No required documentation available to enroll"', add
label define leftsch_lbl 57 `"Other, not elsewhere classified"', add
label define leftsch_lbl 99 `"Unknown/missing"', add
label values leftsch leftsch_lbl

label define empstat_lbl 0 `"NIU (not in universe)"'
label define empstat_lbl 1 `"Employed"', add
label define empstat_lbl 2 `"Unemployed"', add
label define empstat_lbl 3 `"Inactive"', add
label define empstat_lbl 9 `"Unknown/missing"', add
label values empstat empstat_lbl

label define empstatd_lbl 000 `"NIU (not in universe)"'
label define empstatd_lbl 100 `"Employed, not specified"', add
label define empstatd_lbl 110 `"At work"', add
label define empstatd_lbl 111 `"At work, and 'student'"', add
label define empstatd_lbl 112 `"At work, and 'housework'"', add
label define empstatd_lbl 113 `"At work, and 'seeking work'"', add
label define empstatd_lbl 114 `"At work, and 'retired'"', add
label define empstatd_lbl 115 `"At work, and 'no work'"', add
label define empstatd_lbl 116 `"At work, and other situation"', add
label define empstatd_lbl 117 `"At work, family holding, not specified"', add
label define empstatd_lbl 118 `"At work, family holding, not agricultural"', add
label define empstatd_lbl 119 `"At work, family holding, agricultural"', add
label define empstatd_lbl 120 `"Have job, not at work in reference period"', add
label define empstatd_lbl 130 `"Armed forces"', add
label define empstatd_lbl 131 `"Armed forces, at work"', add
label define empstatd_lbl 132 `"Armed forces, not at work in reference period"', add
label define empstatd_lbl 133 `"Military trainee"', add
label define empstatd_lbl 140 `"Marginally employed"', add
label define empstatd_lbl 200 `"Unemployed, not specified"', add
label define empstatd_lbl 201 `"Unemployed 6 or more months"', add
label define empstatd_lbl 202 `"Worked fewer than 6 months, permanent job"', add
label define empstatd_lbl 203 `"Worked fewer than 6 months, temporary job"', add
label define empstatd_lbl 210 `"Unemployed, experienced worker"', add
label define empstatd_lbl 220 `"Unemployed, new worker"', add
label define empstatd_lbl 230 `"No work available"', add
label define empstatd_lbl 240 `"Inactive unemployed"', add
label define empstatd_lbl 300 `"Inactive (not in labor force)"', add
label define empstatd_lbl 310 `"Housework"', add
label define empstatd_lbl 320 `"Unable to work/disabled"', add
label define empstatd_lbl 321 `"Permanent disability"', add
label define empstatd_lbl 322 `"Temporary illness"', add
label define empstatd_lbl 323 `"Disabled or imprisoned"', add
label define empstatd_lbl 330 `"In school"', add
label define empstatd_lbl 340 `"Retirees and living on rent"', add
label define empstatd_lbl 341 `"Living on rents"', add
label define empstatd_lbl 342 `"Living on rents or pension"', add
label define empstatd_lbl 343 `"Retirees/pensioners"', add
label define empstatd_lbl 344 `"Retired"', add
label define empstatd_lbl 345 `"Pensioner"', add
label define empstatd_lbl 346 `"Non-retirement pension"', add
label define empstatd_lbl 347 `"Disability pension"', add
label define empstatd_lbl 348 `"Retired without benefits"', add
label define empstatd_lbl 350 `"Elderly"', add
label define empstatd_lbl 351 `"Elderly or disabled"', add
label define empstatd_lbl 360 `"Institutionalized"', add
label define empstatd_lbl 361 `"Prisoner"', add
label define empstatd_lbl 370 `"Intermittent worker"', add
label define empstatd_lbl 371 `"Not working, seasonal worker"', add
label define empstatd_lbl 372 `"Not working, occasional worker"', add
label define empstatd_lbl 380 `"Other income recipient"', add
label define empstatd_lbl 390 `"Inactive, other reasons"', add
label define empstatd_lbl 391 `"Too young to work"', add
label define empstatd_lbl 392 `"Dependent"', add
label define empstatd_lbl 999 `"Unknown/missing"', add
label values empstatd empstatd_lbl

label define occisco_lbl 01 `"Legislators, senior officials and managers"'
label define occisco_lbl 02 `"Professionals"', add
label define occisco_lbl 03 `"Technicians and associate professionals"', add
label define occisco_lbl 04 `"Clerks"', add
label define occisco_lbl 05 `"Service workers and shop and market sales"', add
label define occisco_lbl 06 `"Skilled agricultural and fishery workers"', add
label define occisco_lbl 07 `"Crafts and related trades workers"', add
label define occisco_lbl 08 `"Plant and machine operators and assemblers"', add
label define occisco_lbl 09 `"Elementary occupations"', add
label define occisco_lbl 10 `"Armed forces"', add
label define occisco_lbl 11 `"Other occupations, unspecified or n.e.c."', add
label define occisco_lbl 97 `"Response suppressed"', add
label define occisco_lbl 98 `"Unknown"', add
label define occisco_lbl 99 `"NIU (not in universe)"', add
label values occisco occisco_lbl

label define indgen_lbl 000 `"NIU (not in universe)"'
label define indgen_lbl 010 `"Agriculture, fishing, and forestry"', add
label define indgen_lbl 020 `"Mining"', add
label define indgen_lbl 030 `"Manufacturing"', add
label define indgen_lbl 040 `"Electricity, gas and water"', add
label define indgen_lbl 050 `"Construction"', add
label define indgen_lbl 060 `"Wholesale and retail trade"', add
label define indgen_lbl 070 `"Hotels and restaurants"', add
label define indgen_lbl 080 `"Transportation and communications"', add
label define indgen_lbl 090 `"Financial services and insurance"', add
label define indgen_lbl 100 `"Public administration and defense"', add
label define indgen_lbl 110 `"Services, not specified"', add
label define indgen_lbl 111 `"Real estate and business services"', add
label define indgen_lbl 112 `"Education"', add
label define indgen_lbl 113 `"Health and social work"', add
label define indgen_lbl 114 `"Other services"', add
label define indgen_lbl 120 `"Private household services"', add
label define indgen_lbl 130 `"Other industry, n.e.c."', add
label define indgen_lbl 998 `"Response suppressed"', add
label define indgen_lbl 999 `"Unknown"', add
label values indgen indgen_lbl

label define classwk_lbl 0 `"NIU (not in universe)"'
label define classwk_lbl 1 `"Self-employed"', add
label define classwk_lbl 2 `"Wage/salary worker"', add
label define classwk_lbl 3 `"Unpaid worker"', add
label define classwk_lbl 4 `"Other"', add
label define classwk_lbl 9 `"Unknown/missing"', add
label values classwk classwk_lbl

label define classwkd_lbl 000 `"NIU (not in universe)"'
label define classwkd_lbl 100 `"Self-employed"', add
label define classwkd_lbl 101 `"Self-employed, unincorporated"', add
label define classwkd_lbl 102 `"Self-employed, incorporated"', add
label define classwkd_lbl 110 `"Employer"', add
label define classwkd_lbl 111 `"Sharecropper, employer"', add
label define classwkd_lbl 120 `"Working on own account"', add
label define classwkd_lbl 121 `"Own account, agriculture"', add
label define classwkd_lbl 122 `"Domestic worker, self-employed"', add
label define classwkd_lbl 123 `"Subsistence worker, own consumption"', add
label define classwkd_lbl 124 `"Own account, other"', add
label define classwkd_lbl 125 `"Own account, without temporary/unpaid help"', add
label define classwkd_lbl 126 `"Own account, with temporary/unpaid help"', add
label define classwkd_lbl 130 `"Member of cooperative"', add
label define classwkd_lbl 140 `"Sharecropper"', add
label define classwkd_lbl 141 `"Sharecropper, self-employed"', add
label define classwkd_lbl 142 `"Sharecropper, employee"', add
label define classwkd_lbl 150 `"Kibbutz member"', add
label define classwkd_lbl 200 `"Wage/salary worker"', add
label define classwkd_lbl 201 `"Management"', add
label define classwkd_lbl 202 `"Non-management"', add
label define classwkd_lbl 203 `"White collar (non-manual)"', add
label define classwkd_lbl 204 `"Blue collar (manual)"', add
label define classwkd_lbl 205 `"White and blue collar"', add
label define classwkd_lbl 206 `"Day laborer"', add
label define classwkd_lbl 207 `"Employee, with a permanent job"', add
label define classwkd_lbl 208 `"Employee, occasional, temporary, contract"', add
label define classwkd_lbl 209 `"Employee without legal contract"', add
label define classwkd_lbl 210 `"Wage/salary worker, private employer"', add
label define classwkd_lbl 211 `"Apprentice"', add
label define classwkd_lbl 212 `"Religious worker"', add
label define classwkd_lbl 213 `"Wage/salary worker, non-profit, NGO"', add
label define classwkd_lbl 214 `"White collar, private"', add
label define classwkd_lbl 215 `"Blue collar, private"', add
label define classwkd_lbl 216 `"Paid family worker"', add
label define classwkd_lbl 217 `"Cooperative employee"', add
label define classwkd_lbl 220 `"Wage/salary worker, government"', add
label define classwkd_lbl 221 `"Federal, government employee"', add
label define classwkd_lbl 222 `"State government employee"', add
label define classwkd_lbl 223 `"Local government employee"', add
label define classwkd_lbl 224 `"White collar, public"', add
label define classwkd_lbl 225 `"Blue collar, public"', add
label define classwkd_lbl 226 `"Public companies"', add
label define classwkd_lbl 227 `"Civil servants, local collectives"', add
label define classwkd_lbl 230 `"Domestic worker (work for private household)"', add
label define classwkd_lbl 240 `"Seasonal migrant"', add
label define classwkd_lbl 241 `"Seasonal migrant, no broker"', add
label define classwkd_lbl 242 `"Seasonal migrant, uses broker"', add
label define classwkd_lbl 250 `"Other wage and salary"', add
label define classwkd_lbl 251 `"Canal zone/commission employee"', add
label define classwkd_lbl 252 `"Government employment/training program"', add
label define classwkd_lbl 253 `"Mixed state/private enterprise/parastatal"', add
label define classwkd_lbl 254 `"Government public work program"', add
label define classwkd_lbl 300 `"Unpaid worker"', add
label define classwkd_lbl 310 `"Unpaid family worker"', add
label define classwkd_lbl 320 `"Apprentice, unpaid or unspecified"', add
label define classwkd_lbl 330 `"Trainee"', add
label define classwkd_lbl 340 `"Apprentice or trainee"', add
label define classwkd_lbl 350 `"Works for others without wage"', add
label define classwkd_lbl 400 `"Other"', add
label define classwkd_lbl 999 `"Unknown/missing"', add
label values classwkd classwkd_lbl

label define empsect_lbl 00 `"NIU (not in universe)"'
label define empsect_lbl 10 `"Public"', add
label define empsect_lbl 20 `"Private"', add
label define empsect_lbl 21 `"Private, not elsewhere classified"', add
label define empsect_lbl 22 `"Individual/family enterprise, and self-employed"', add
label define empsect_lbl 23 `"Foreign"', add
label define empsect_lbl 30 `"Mixed: public-private or parastatal"', add
label define empsect_lbl 40 `"Collective or cooperative"', add
label define empsect_lbl 50 `"Foreign government or non-governmental organization"', add
label define empsect_lbl 60 `"Other, unspecified"', add
label define empsect_lbl 61 `"Canal zone"', add
label define empsect_lbl 62 `"Faith-based organization"', add
label define empsect_lbl 99 `"Unknown"', add
label values empsect empsect_lbl

label define migrate5_lbl 00 `"NIU (not in universe)"'
label define migrate5_lbl 10 `"Same major administrative unit"', add
label define migrate5_lbl 11 `"Same major, same minor administrative unit"', add
label define migrate5_lbl 12 `"Same major, different minor administrative unit"', add
label define migrate5_lbl 20 `"Different major administrative unit"', add
label define migrate5_lbl 30 `"Abroad"', add
label define migrate5_lbl 99 `"Unknown/missing"', add
label values migrate5 migrate5_lbl

label define migctry5_lbl 00000 `"NIU (not in universe)"'
label define migctry5_lbl 10000 `"Africa"', add
label define migctry5_lbl 11000 `"Eastern Africa"', add
label define migctry5_lbl 11010 `"Burundi"', add
label define migctry5_lbl 11020 `"Comoros"', add
label define migctry5_lbl 11030 `"Djibouti"', add
label define migctry5_lbl 11040 `"Eritrea"', add
label define migctry5_lbl 11050 `"Ethiopia"', add
label define migctry5_lbl 11060 `"Kenya"', add
label define migctry5_lbl 11070 `"Madagascar"', add
label define migctry5_lbl 11080 `"Malawi"', add
label define migctry5_lbl 11090 `"Mauritius"', add
label define migctry5_lbl 11100 `"Mozambique"', add
label define migctry5_lbl 11110 `"Reunion"', add
label define migctry5_lbl 11120 `"Rwanda"', add
label define migctry5_lbl 11130 `"Seychelles"', add
label define migctry5_lbl 11140 `"Somalia"', add
label define migctry5_lbl 11150 `"South Sudan"', add
label define migctry5_lbl 11160 `"Uganda"', add
label define migctry5_lbl 11170 `"Tanzania"', add
label define migctry5_lbl 11180 `"Zambia"', add
label define migctry5_lbl 11190 `"Zimbabwe"', add
label define migctry5_lbl 11999 `"Eastern Africa, n.s."', add
label define migctry5_lbl 12000 `"Middle Africa"', add
label define migctry5_lbl 12010 `"Angola"', add
label define migctry5_lbl 12020 `"Cameroon"', add
label define migctry5_lbl 12030 `"Central African Republic"', add
label define migctry5_lbl 12040 `"Chad"', add
label define migctry5_lbl 12050 `"Congo"', add
label define migctry5_lbl 12060 `"Democratic Republic of Congo"', add
label define migctry5_lbl 12070 `"Equatorial Guinea"', add
label define migctry5_lbl 12080 `"Gabon"', add
label define migctry5_lbl 12090 `"Sao Tome and Principe"', add
label define migctry5_lbl 12999 `"Middle Africa, n.s."', add
label define migctry5_lbl 13000 `"Northern Africa"', add
label define migctry5_lbl 13010 `"Algeria"', add
label define migctry5_lbl 13020 `"Egypt/United Arab Rep."', add
label define migctry5_lbl 13030 `"Libya"', add
label define migctry5_lbl 13040 `"Morocco"', add
label define migctry5_lbl 13050 `"Sudan"', add
label define migctry5_lbl 13060 `"Tunisia"', add
label define migctry5_lbl 13070 `"Western Sahara"', add
label define migctry5_lbl 13999 `"Northern Africa, n.s."', add
label define migctry5_lbl 14000 `"Southern Africa"', add
label define migctry5_lbl 14010 `"Botswana"', add
label define migctry5_lbl 14020 `"Lesotho"', add
label define migctry5_lbl 14030 `"Namibia"', add
label define migctry5_lbl 14040 `"South Africa"', add
label define migctry5_lbl 14050 `"Swaziland"', add
label define migctry5_lbl 14999 `"Southern Africa, n.s."', add
label define migctry5_lbl 15000 `"Western Africa"', add
label define migctry5_lbl 15010 `"Benin"', add
label define migctry5_lbl 15020 `"Burkina Faso"', add
label define migctry5_lbl 15030 `"Cape Verde"', add
label define migctry5_lbl 15040 `"Ivory Coast"', add
label define migctry5_lbl 15050 `"Gambia"', add
label define migctry5_lbl 15060 `"Ghana"', add
label define migctry5_lbl 15070 `"Guinea"', add
label define migctry5_lbl 15080 `"Guinea-Bissau"', add
label define migctry5_lbl 15090 `"Liberia"', add
label define migctry5_lbl 15100 `"Mali"', add
label define migctry5_lbl 15110 `"Mauritania"', add
label define migctry5_lbl 15120 `"Niger"', add
label define migctry5_lbl 15130 `"Nigeria"', add
label define migctry5_lbl 15140 `"St. Helena and Ascension"', add
label define migctry5_lbl 15150 `"Senegal"', add
label define migctry5_lbl 15160 `"Sierra Leone"', add
label define migctry5_lbl 15170 `"Togo"', add
label define migctry5_lbl 15999 `"Western Africa, n.s."', add
label define migctry5_lbl 19999 `"Africa, n.s."', add
label define migctry5_lbl 20000 `"Americas"', add
label define migctry5_lbl 21000 `"Caribbean"', add
label define migctry5_lbl 21010 `"Anguilla"', add
label define migctry5_lbl 21020 `"Antigua-Barbuda"', add
label define migctry5_lbl 21030 `"Aruba"', add
label define migctry5_lbl 21040 `"Bahamas"', add
label define migctry5_lbl 21050 `"Barbados"', add
label define migctry5_lbl 21060 `"British Virgin Islands"', add
label define migctry5_lbl 21070 `"Cayman Isles"', add
label define migctry5_lbl 21080 `"Cuba"', add
label define migctry5_lbl 21090 `"Dominica"', add
label define migctry5_lbl 21100 `"Dominican Republic"', add
label define migctry5_lbl 21110 `"Grenada"', add
label define migctry5_lbl 21120 `"Guadeloupe"', add
label define migctry5_lbl 21130 `"Haiti"', add
label define migctry5_lbl 21140 `"Jamaica"', add
label define migctry5_lbl 21150 `"Martinique"', add
label define migctry5_lbl 21160 `"Montserrat"', add
label define migctry5_lbl 21170 `"Netherlands Antilles"', add
label define migctry5_lbl 21180 `"Puerto Rico"', add
label define migctry5_lbl 21190 `"St. Kitts-Nevis"', add
label define migctry5_lbl 21200 `"St. Croix"', add
label define migctry5_lbl 21210 `"St. John"', add
label define migctry5_lbl 21220 `"St. Lucia"', add
label define migctry5_lbl 21230 `"St. Thomas"', add
label define migctry5_lbl 21240 `"St. Vincent"', add
label define migctry5_lbl 21250 `"Trinidad and Tobago"', add
label define migctry5_lbl 21260 `"Turks and Caicos"', add
label define migctry5_lbl 21270 `"U.S. Virgin Islands"', add
label define migctry5_lbl 21280 `"Curacao"', add
label define migctry5_lbl 21290 `"Sint Maarten"', add
label define migctry5_lbl 21999 `"Caribbean, n.s."', add
label define migctry5_lbl 22000 `"Central America"', add
label define migctry5_lbl 22010 `"Belize/British Honduras"', add
label define migctry5_lbl 22020 `"Costa Rica"', add
label define migctry5_lbl 22030 `"El Salvador"', add
label define migctry5_lbl 22040 `"Guatemala"', add
label define migctry5_lbl 22050 `"Honduras"', add
label define migctry5_lbl 22060 `"Mexico"', add
label define migctry5_lbl 22070 `"Nicaragua"', add
label define migctry5_lbl 22080 `"Panama"', add
label define migctry5_lbl 22081 `"Panama Canal Zone"', add
label define migctry5_lbl 22990 `"Central America, n.s."', add
label define migctry5_lbl 22991 `"Central America and Caribbean"', add
label define migctry5_lbl 23000 `"South America"', add
label define migctry5_lbl 23010 `"Argentina"', add
label define migctry5_lbl 23020 `"Bolivia"', add
label define migctry5_lbl 23030 `"Brazil"', add
label define migctry5_lbl 23040 `"Chile"', add
label define migctry5_lbl 23050 `"Colombia"', add
label define migctry5_lbl 23060 `"Ecuador"', add
label define migctry5_lbl 23070 `"Falkland Islands"', add
label define migctry5_lbl 23080 `"French Guiana"', add
label define migctry5_lbl 23090 `"Guyana/British Guiana"', add
label define migctry5_lbl 23100 `"Paraguay"', add
label define migctry5_lbl 23110 `"Peru"', add
label define migctry5_lbl 23120 `"Suriname"', add
label define migctry5_lbl 23130 `"Uruguay"', add
label define migctry5_lbl 23140 `"Venezuela"', add
label define migctry5_lbl 23999 `"South America, n.s."', add
label define migctry5_lbl 24000 `"North America"', add
label define migctry5_lbl 24010 `"Bermuda"', add
label define migctry5_lbl 24020 `"Canada"', add
label define migctry5_lbl 24030 `"Greenland"', add
label define migctry5_lbl 24040 `"United States"', add
label define migctry5_lbl 24041 `"U.S. Outlying Areas and Territories"', add
label define migctry5_lbl 24999 `"North or Central America, n.s."', add
label define migctry5_lbl 29999 `"Americas, n.s."', add
label define migctry5_lbl 30000 `"Asia"', add
label define migctry5_lbl 31000 `"Eastern Asia"', add
label define migctry5_lbl 31010 `"China"', add
label define migctry5_lbl 31011 `"Hong Kong"', add
label define migctry5_lbl 31012 `"Macau"', add
label define migctry5_lbl 31013 `"Taiwan"', add
label define migctry5_lbl 31020 `"Japan"', add
label define migctry5_lbl 31030 `"Korea"', add
label define migctry5_lbl 31031 `"Korea, DPR (North)"', add
label define migctry5_lbl 31032 `"Korea, RO (South)"', add
label define migctry5_lbl 31040 `"Mongolia"', add
label define migctry5_lbl 32000 `"South-Central Asia"', add
label define migctry5_lbl 32010 `"Afghanistan"', add
label define migctry5_lbl 32020 `"Bangladesh"', add
label define migctry5_lbl 32030 `"Bhutan"', add
label define migctry5_lbl 32040 `"India"', add
label define migctry5_lbl 32050 `"Iran"', add
label define migctry5_lbl 32060 `"Kazakhstan"', add
label define migctry5_lbl 32070 `"Kyrgyzstan"', add
label define migctry5_lbl 32080 `"Maldives"', add
label define migctry5_lbl 32090 `"Nepal"', add
label define migctry5_lbl 32100 `"Pakistan"', add
label define migctry5_lbl 32110 `"Sri Lanka (Ceylon)"', add
label define migctry5_lbl 32120 `"Tajikistan"', add
label define migctry5_lbl 32130 `"Turkmenistan"', add
label define migctry5_lbl 32140 `"Uzbekistan"', add
label define migctry5_lbl 32900 `"South Asia, not specified"', add
label define migctry5_lbl 33000 `"South-Eastern Asia"', add
label define migctry5_lbl 33010 `"Brunei"', add
label define migctry5_lbl 33020 `"Cambodia (Kampuchea)"', add
label define migctry5_lbl 33030 `"East Timor"', add
label define migctry5_lbl 33040 `"Indonesia"', add
label define migctry5_lbl 33050 `"Laos"', add
label define migctry5_lbl 33060 `"Malaysia"', add
label define migctry5_lbl 33070 `"Myanmar (Burma)"', add
label define migctry5_lbl 33080 `"Philippines"', add
label define migctry5_lbl 33090 `"Singapore"', add
label define migctry5_lbl 33100 `"Thailand"', add
label define migctry5_lbl 33110 `"Vietnam"', add
label define migctry5_lbl 34000 `"Western Asia"', add
label define migctry5_lbl 34010 `"Armenia"', add
label define migctry5_lbl 34020 `"Azerbaijan"', add
label define migctry5_lbl 34030 `"Bahrain"', add
label define migctry5_lbl 34040 `"Cyprus"', add
label define migctry5_lbl 34050 `"Georgia"', add
label define migctry5_lbl 34060 `"Iraq"', add
label define migctry5_lbl 34070 `"Israel"', add
label define migctry5_lbl 34080 `"Jordan"', add
label define migctry5_lbl 34090 `"Kuwait"', add
label define migctry5_lbl 34100 `"Lebanon"', add
label define migctry5_lbl 34110 `"Palestine"', add
label define migctry5_lbl 34120 `"Oman"', add
label define migctry5_lbl 34130 `"Qatar"', add
label define migctry5_lbl 34140 `"Saudi Arabia"', add
label define migctry5_lbl 34150 `"Syria"', add
label define migctry5_lbl 34151 `"Syria/Lebanon"', add
label define migctry5_lbl 34160 `"Turkey"', add
label define migctry5_lbl 34170 `"United Arab Emirates"', add
label define migctry5_lbl 34180 `"Yemen"', add
label define migctry5_lbl 34999 `"Middle East, n.e.c."', add
label define migctry5_lbl 39999 `"Asia, n.s."', add
label define migctry5_lbl 40000 `"Europe"', add
label define migctry5_lbl 41000 `"Eastern Europe"', add
label define migctry5_lbl 41010 `"Belarus"', add
label define migctry5_lbl 41020 `"Bulgaria"', add
label define migctry5_lbl 41030 `"Czech Republic"', add
label define migctry5_lbl 41040 `"Hungary"', add
label define migctry5_lbl 41050 `"Poland"', add
label define migctry5_lbl 41060 `"Moldova"', add
label define migctry5_lbl 41070 `"Romania"', add
label define migctry5_lbl 41080 `"Russia/USSR"', add
label define migctry5_lbl 41090 `"Slovakia"', add
label define migctry5_lbl 41100 `"Ukraine"', add
label define migctry5_lbl 41999 `"Eastern Europe, n.e.c."', add
label define migctry5_lbl 42000 `"Northern Europe"', add
label define migctry5_lbl 42010 `"Denmark"', add
label define migctry5_lbl 42020 `"Estonia"', add
label define migctry5_lbl 42030 `"Faroe Islands"', add
label define migctry5_lbl 42040 `"Finland"', add
label define migctry5_lbl 42050 `"Iceland"', add
label define migctry5_lbl 42060 `"Ireland"', add
label define migctry5_lbl 42070 `"Latvia"', add
label define migctry5_lbl 42080 `"Lithuania"', add
label define migctry5_lbl 42090 `"Norway"', add
label define migctry5_lbl 42110 `"Sweden"', add
label define migctry5_lbl 42120 `"United Kingdom"', add
label define migctry5_lbl 42199 `"Scandinavia"', add
label define migctry5_lbl 42999 `"Northern Europe, n.e.c."', add
label define migctry5_lbl 43000 `"Southern Europe"', add
label define migctry5_lbl 43010 `"Albania"', add
label define migctry5_lbl 43020 `"Andorra"', add
label define migctry5_lbl 43030 `"Bosnia"', add
label define migctry5_lbl 43040 `"Croatia"', add
label define migctry5_lbl 43050 `"Gibraltar"', add
label define migctry5_lbl 43060 `"Greece"', add
label define migctry5_lbl 43070 `"Italy"', add
label define migctry5_lbl 43080 `"Malta"', add
label define migctry5_lbl 43090 `"Portugal"', add
label define migctry5_lbl 43100 `"San Marino"', add
label define migctry5_lbl 43110 `"Slovenia"', add
label define migctry5_lbl 43120 `"Spain"', add
label define migctry5_lbl 43130 `"Macedonia"', add
label define migctry5_lbl 43140 `"Yugoslavia"', add
label define migctry5_lbl 43141 `"Montenegro"', add
label define migctry5_lbl 43142 `"Serbia"', add
label define migctry5_lbl 43999 `"Southern Europe, n.s."', add
label define migctry5_lbl 44000 `"Western Europe"', add
label define migctry5_lbl 44010 `"Austria"', add
label define migctry5_lbl 44020 `"Belgium"', add
label define migctry5_lbl 44021 `"Belgium/Luxembourg"', add
label define migctry5_lbl 44022 `"Benelux (Belgium/Netherlands/Luxembourg)"', add
label define migctry5_lbl 44030 `"France"', add
label define migctry5_lbl 44040 `"Germany"', add
label define migctry5_lbl 44050 `"Liechtenstein"', add
label define migctry5_lbl 44060 `"Luxembourg"', add
label define migctry5_lbl 44070 `"Monaco"', add
label define migctry5_lbl 44080 `"Netherlands"', add
label define migctry5_lbl 44090 `"Switzerland"', add
label define migctry5_lbl 44999 `"Western Europe, n.e.c."', add
label define migctry5_lbl 49999 `"Europe, n.s."', add
label define migctry5_lbl 50000 `"Oceania"', add
label define migctry5_lbl 51000 `"Australia and New Zealand"', add
label define migctry5_lbl 51010 `"Australia"', add
label define migctry5_lbl 51020 `"New Zealand"', add
label define migctry5_lbl 51030 `"Norfolk Islands"', add
label define migctry5_lbl 51999 `"Australia and New Zealand, n.s."', add
label define migctry5_lbl 52000 `"Melanesia"', add
label define migctry5_lbl 52010 `"Fiji"', add
label define migctry5_lbl 52020 `"New Caledonia"', add
label define migctry5_lbl 52030 `"Papua New Guinea"', add
label define migctry5_lbl 52040 `"Solomon Islands"', add
label define migctry5_lbl 52050 `"Vanuatu (New Hebrides)"', add
label define migctry5_lbl 52999 `"Melanesia, n.e.c."', add
label define migctry5_lbl 53000 `"Micronesia"', add
label define migctry5_lbl 53010 `"Kiribati"', add
label define migctry5_lbl 53020 `"Marshall Islands"', add
label define migctry5_lbl 53030 `"Nauru"', add
label define migctry5_lbl 53040 `"Northern Mariana Isls."', add
label define migctry5_lbl 53050 `"Palau"', add
label define migctry5_lbl 53999 `"Micronesia, n.e.c."', add
label define migctry5_lbl 54000 `"Polynesia"', add
label define migctry5_lbl 54010 `"Cook Islands"', add
label define migctry5_lbl 54020 `"French Polynesia"', add
label define migctry5_lbl 54030 `"Niue"', add
label define migctry5_lbl 54040 `"Pitcairn Island"', add
label define migctry5_lbl 54050 `"Samoa"', add
label define migctry5_lbl 54060 `"Tokelau"', add
label define migctry5_lbl 54070 `"Tonga"', add
label define migctry5_lbl 54080 `"Tuvalu"', add
label define migctry5_lbl 54090 `"Wallis and Futuna Isls."', add
label define migctry5_lbl 54999 `"Polynesia, n.e.c."', add
label define migctry5_lbl 59999 `"Oceania, n.s."', add
label define migctry5_lbl 60000 `"Other"', add
label define migctry5_lbl 60010 `"Other Arab country"', add
label define migctry5_lbl 90000 `"Non-migrants (international)"', add
label define migctry5_lbl 99998 `"Response suppressed"', add
label define migctry5_lbl 99999 `"Unknown"', add
label values migctry5 migctry5_lbl

label define migdo_lbl 0101 `"Santo Domingo de Guzman"'
label define migdo_lbl 0201 `"Azua"', add
label define migdo_lbl 0202 `"Las Charcas"', add
label define migdo_lbl 0203 `"Las Yayas de Viajama"', add
label define migdo_lbl 0204 `"Padre las Casas"', add
label define migdo_lbl 0205 `"Peralta"', add
label define migdo_lbl 0206 `"Sabana Yegua"', add
label define migdo_lbl 0207 `"Pueblo Viejo"', add
label define migdo_lbl 0208 `"Tabara Arriba"', add
label define migdo_lbl 0209 `"Guayabal"', add
label define migdo_lbl 0210 `"Estebanía"', add
label define migdo_lbl 0211 `"Palmar de Ocoa"', add
label define migdo_lbl 0212 `"Villarpando"', add
label define migdo_lbl 0301 `"Neiba"', add
label define migdo_lbl 0302 `"Galvan"', add
label define migdo_lbl 0303 `"Tamayo"', add
label define migdo_lbl 0304 `"Villa Jaragua"', add
label define migdo_lbl 0305 `"Los Ríos"', add
label define migdo_lbl 0306 `"Uvilla"', add
label define migdo_lbl 0307 `"El Palmar"', add
label define migdo_lbl 0401 `"Barahona"', add
label define migdo_lbl 0402 `"Cabral"', add
label define migdo_lbl 0403 `"Enriquillo"', add
label define migdo_lbl 0404 `"Paraiso"', add
label define migdo_lbl 0405 `"Vicente Noble"', add
label define migdo_lbl 0406 `"El Peñon"', add
label define migdo_lbl 0407 `"La Cienaga"', add
label define migdo_lbl 0408 `"Fundación"', add
label define migdo_lbl 0409 `"Las Salinas"', add
label define migdo_lbl 0410 `"Polo"', add
label define migdo_lbl 0411 `"Jaquimeyes"', add
label define migdo_lbl 0412 `"Canoa"', add
label define migdo_lbl 0413 `"El Cachón"', add
label define migdo_lbl 0414 `"Pescadería"', add
label define migdo_lbl 0501 `"Dajabón"', add
label define migdo_lbl 0502 `"Loma de Cabrera"', add
label define migdo_lbl 0503 `"Partido"', add
label define migdo_lbl 0504 `"Restauración"', add
label define migdo_lbl 0505 `"El Pino"', add
label define migdo_lbl 0601 `"San Francisco de Macorís"', add
label define migdo_lbl 0602 `"Arenoso"', add
label define migdo_lbl 0603 `"Castillo"', add
label define migdo_lbl 0604 `"Pimentel"', add
label define migdo_lbl 0605 `"Villa Riva"', add
label define migdo_lbl 0606 `"Las Guáranas"', add
label define migdo_lbl 0607 `"Eugenio Maria de Hostos"', add
label define migdo_lbl 0608 `"Agua Santa del Yuna"', add
label define migdo_lbl 0609 `"Cristo Rey de Guaraguao"', add
label define migdo_lbl 0610 `"La Peña"', add
label define migdo_lbl 0611 `"Cenoví"', add
label define migdo_lbl 0701 `"Comendador"', add
label define migdo_lbl 0702 `"Banica"', add
label define migdo_lbl 0703 `"El Llano"', add
label define migdo_lbl 0704 `"Hondo Valle"', add
label define migdo_lbl 0705 `"Pedro Santana"', add
label define migdo_lbl 0706 `"Juan Santiago"', add
label define migdo_lbl 0707 `"Río Limpio"', add
label define migdo_lbl 0801 `"El Seibo"', add
label define migdo_lbl 0802 `"Miches"', add
label define migdo_lbl 0803 `"Pedro Sánchez"', add
label define migdo_lbl 0901 `"Moca"', add
label define migdo_lbl 0902 `"Cayetano Germosén"', add
label define migdo_lbl 0903 `"Gaspar Hernández"', add
label define migdo_lbl 0904 `"Jamao al Norte"', add
label define migdo_lbl 0905 `"José Contreras"', add
label define migdo_lbl 0906 `"San Víctor"', add
label define migdo_lbl 0907 `"Joba Arriba"', add
label define migdo_lbl 0908 `"Veragua"', add
label define migdo_lbl 0909 `"Juan López"', add
label define migdo_lbl 1001 `"Jimaní"', add
label define migdo_lbl 1002 `"Duvergé"', add
label define migdo_lbl 1003 `"La Descubierta"', add
label define migdo_lbl 1004 `"Postrer Río"', add
label define migdo_lbl 1005 `"Cristóbal"', add
label define migdo_lbl 1006 `"Mella"', add
label define migdo_lbl 1007 `"Guayabal (Independencia)"', add
label define migdo_lbl 1101 `"Higüey"', add
label define migdo_lbl 1102 `"San Rafael del Yuma"', add
label define migdo_lbl 1103 `"Las Lagunas de Nisibón"', add
label define migdo_lbl 1104 `"La Otra Banda"', add
label define migdo_lbl 1105 `"Boca de Yuma"', add
label define migdo_lbl 1201 `"La Romana"', add
label define migdo_lbl 1202 `"Guaymate"', add
label define migdo_lbl 1203 `"Villa Hermosa"', add
label define migdo_lbl 1301 `"La Vega"', add
label define migdo_lbl 1302 `"Constanza"', add
label define migdo_lbl 1303 `"Jarabacoa"', add
label define migdo_lbl 1304 `"Jima Abajo"', add
label define migdo_lbl 1305 `"Tireo"', add
label define migdo_lbl 1306 `"Río Verde Arriba"', add
label define migdo_lbl 1307 `"Rincón"', add
label define migdo_lbl 1399 `"Other La Vega Province"', add
label define migdo_lbl 1401 `"Nagua"', add
label define migdo_lbl 1402 `"Cabrera"', add
label define migdo_lbl 1403 `"El Factor"', add
label define migdo_lbl 1404 `"Río San Juan"', add
label define migdo_lbl 1405 `"San José de Mantanzas"', add
label define migdo_lbl 1406 `"Arroyo Salado"', add
label define migdo_lbl 1407 `"La Entrada"', add
label define migdo_lbl 1408 `"El Pozo"', add
label define migdo_lbl 1501 `"Monte Cristi"', add
label define migdo_lbl 1502 `"Castañuelas"', add
label define migdo_lbl 1503 `"Guayubín"', add
label define migdo_lbl 1504 `"Las Matas de Santa Cruz"', add
label define migdo_lbl 1505 `"Pepillo Salcedo"', add
label define migdo_lbl 1506 `"Villa Vásquez"', add
label define migdo_lbl 1507 `"Villa Elisa"', add
label define migdo_lbl 1508 `"Hatillo Palma"', add
label define migdo_lbl 1509 `"Cana Chapetón"', add
label define migdo_lbl 1601 `"Pedernales"', add
label define migdo_lbl 1602 `"Oviedo"', add
label define migdo_lbl 1603 `"Juancho"', add
label define migdo_lbl 1701 `"Baní"', add
label define migdo_lbl 1702 `"Nizao"', add
label define migdo_lbl 1703 `"Mantanzas"', add
label define migdo_lbl 1704 `"Villa Fundación"', add
label define migdo_lbl 1705 `"Sabana Buey"', add
label define migdo_lbl 1706 `"Pizarrete"', add
label define migdo_lbl 1707 `"Santana"', add
label define migdo_lbl 1708 `"Paya"', add
label define migdo_lbl 1801 `"Puerto Plata"', add
label define migdo_lbl 1802 `"Altamira"', add
label define migdo_lbl 1803 `"Guananico"', add
label define migdo_lbl 1804 `"Imbert"', add
label define migdo_lbl 1805 `"Los Hidalgos"', add
label define migdo_lbl 1806 `"Luperón"', add
label define migdo_lbl 1807 `"Sosúa"', add
label define migdo_lbl 1808 `"Villa Isabela"', add
label define migdo_lbl 1809 `"Villa Montellano"', add
label define migdo_lbl 1810 `"Estero Hondo"', add
label define migdo_lbl 1811 `"La Isabella"', add
label define migdo_lbl 1901 `"Salcedo"', add
label define migdo_lbl 1902 `"Tenares"', add
label define migdo_lbl 1903 `"Villa Tapa"', add
label define migdo_lbl 1904 `"Blanco"', add
label define migdo_lbl 2001 `"Samaná"', add
label define migdo_lbl 2002 `"Sánchez"', add
label define migdo_lbl 2003 `"Las Terrenas"', add
label define migdo_lbl 2101 `"San Cristóbal"', add
label define migdo_lbl 2102 `"Sabana Grande de Palenque"', add
label define migdo_lbl 2103 `"Bajos de Haina"', add
label define migdo_lbl 2104 `"Cambita Garabitos"', add
label define migdo_lbl 2105 `"Villa Altagracia"', add
label define migdo_lbl 2106 `"Yaguate"', add
label define migdo_lbl 2107 `"San Gregorio de Nigua"', add
label define migdo_lbl 2108 `"Los Cacaos"', add
label define migdo_lbl 2109 `"El Carril"', add
label define migdo_lbl 2201 `"San Juan"', add
label define migdo_lbl 2202 `"Bohechio"', add
label define migdo_lbl 2203 `"El Cercado"', add
label define migdo_lbl 2204 `"Juan de Herrera"', add
label define migdo_lbl 2205 `"Las Matas de Farfán"', add
label define migdo_lbl 2206 `"Vallejuelo"', add
label define migdo_lbl 2207 `"Matayaya"', add
label define migdo_lbl 2208 `"Pedro Corto"', add
label define migdo_lbl 2301 `"San Pedro de Macorís"', add
label define migdo_lbl 2302 `"Los Llanos"', add
label define migdo_lbl 2303 `"Ramón Santana"', add
label define migdo_lbl 2304 `"Consuelo"', add
label define migdo_lbl 2305 `"Quisqueya"', add
label define migdo_lbl 2306 `"Guayacanes"', add
label define migdo_lbl 2307 `"El Puerto"', add
label define migdo_lbl 2401 `"Cotuí"', add
label define migdo_lbl 2402 `"Cevicos"', add
label define migdo_lbl 2403 `"Fantino"', add
label define migdo_lbl 2404 `"La Mata"', add
label define migdo_lbl 2405 `"La Cueva"', add
label define migdo_lbl 2501 `"Santiago"', add
label define migdo_lbl 2502 `"Bisonó"', add
label define migdo_lbl 2503 `"Jánico"', add
label define migdo_lbl 2504 `"Licey Al Medio"', add
label define migdo_lbl 2505 `"San José de las Matas"', add
label define migdo_lbl 2506 `"Tamboril"', add
label define migdo_lbl 2507 `"Villa González"', add
label define migdo_lbl 2508 `"Punal"', add
label define migdo_lbl 2509 `"Sabana Iglesia"', add
label define migdo_lbl 2510 `"Baitoa"', add
label define migdo_lbl 2511 `"La Canela"', add
label define migdo_lbl 2512 `"El Rubio"', add
label define migdo_lbl 2513 `"Juncalito"', add
label define migdo_lbl 2514 `"Palmar Arriba"', add
label define migdo_lbl 2515 `"Pedro Garcia"', add
label define migdo_lbl 2601 `"San Ignacio de Sabaneta"', add
label define migdo_lbl 2602 `"Villa los Almácigos"', add
label define migdo_lbl 2603 `"Monción"', add
label define migdo_lbl 2701 `"Mao"', add
label define migdo_lbl 2702 `"Esperanza"', add
label define migdo_lbl 2703 `"Laguna Salada"', add
label define migdo_lbl 2704 `"Amina"', add
label define migdo_lbl 2705 `"Maizal"', add
label define migdo_lbl 2706 `"Jaibon (Pueblo Nuevo)"', add
label define migdo_lbl 2707 `"Guatapanal"', add
label define migdo_lbl 2708 `"Jicomé"', add
label define migdo_lbl 2709 `"Jaibon (Laguna Salada)"', add
label define migdo_lbl 2710 `"La Caya"', add
label define migdo_lbl 2801 `"Bonao"', add
label define migdo_lbl 2802 `"Maimón"', add
label define migdo_lbl 2803 `"Piedra Blanca"', add
label define migdo_lbl 2804 `"Villa de Sonador"', add
label define migdo_lbl 2805 `"Sabana del Puerto"', add
label define migdo_lbl 2806 `"Juan Adrián"', add
label define migdo_lbl 2901 `"Monte Plata"', add
label define migdo_lbl 2902 `"Bayaguana"', add
label define migdo_lbl 2903 `"Sabana Grande de Boya"', add
label define migdo_lbl 2904 `"Yamasá"', add
label define migdo_lbl 2905 `"Peralvillo"', add
label define migdo_lbl 2906 `"Gonzalo"', add
label define migdo_lbl 2907 `"Los Botados"', add
label define migdo_lbl 2908 `"Majagual"', add
label define migdo_lbl 2909 `"Don Juan"', add
label define migdo_lbl 3001 `"Hato Mayor"', add
label define migdo_lbl 3002 `"Sabana de la Mar"', add
label define migdo_lbl 3003 `"El Valle"', add
label define migdo_lbl 3004 `"Elupina Cordero de las Cañitas"', add
label define migdo_lbl 3005 `"Yerba Buena"', add
label define migdo_lbl 3006 `"Mata Palacio"', add
label define migdo_lbl 3007 `"Guayabo Dulce"', add
label define migdo_lbl 3101 `"San José de Ocoa"', add
label define migdo_lbl 3102 `"Sabana Larga"', add
label define migdo_lbl 3103 `"Rancho Arriba"', add
label define migdo_lbl 3104 `"La Cienaga (San José de Ocoa)"', add
label define migdo_lbl 3201 `"Santo Domingo Este"', add
label define migdo_lbl 3202 `"Santo Domingo Oeste"', add
label define migdo_lbl 3203 `"Santo Domingo Norte"', add
label define migdo_lbl 3204 `"Boca Chica"', add
label define migdo_lbl 3205 `"San Antonio de Guerra"', add
label define migdo_lbl 3206 `"Los Alcarrizos"', add
label define migdo_lbl 3207 `"Pedro Brand"', add
label define migdo_lbl 3208 `"La Victoria"', add
label define migdo_lbl 5000 `"Foreign country"', add
label define migdo_lbl 9998 `"Unknown"', add
label define migdo_lbl 9999 `"NIU (not in universe)"', add
label values migdo migdo_lbl

label define disabled_lbl 0 `"NIU (not in universe)"'
label define disabled_lbl 1 `"Yes, disabled"', add
label define disabled_lbl 2 `"No, not disabled"', add
label define disabled_lbl 9 `"Unknown"', add
label values disabled disabled_lbl

label define disemp_lbl 1 `"Disabled"'
label define disemp_lbl 2 `"Not disabled"', add
label define disemp_lbl 8 `"Unknown"', add
label define disemp_lbl 9 `"NIU (not in universe)"', add
label values disemp disemp_lbl

label define disblnd_lbl 0 `"NIU (not in universe)"'
label define disblnd_lbl 1 `"Yes"', add
label define disblnd_lbl 2 `"No"', add
label define disblnd_lbl 9 `"Unknown"', add
label values disblnd disblnd_lbl

label define disdeaf_lbl 0 `"NIU (not in universe)"'
label define disdeaf_lbl 1 `"Yes"', add
label define disdeaf_lbl 2 `"No"', add
label define disdeaf_lbl 9 `"Unknown"', add
label values disdeaf disdeaf_lbl

label define dismute_lbl 0 `"NIU (not in universe)"'
label define dismute_lbl 1 `"Yes"', add
label define dismute_lbl 2 `"No"', add
label define dismute_lbl 9 `"Unknown"', add
label values dismute dismute_lbl

label define dislowr_lbl 0 `"NIU (not in universe)"'
label define dislowr_lbl 1 `"Yes"', add
label define dislowr_lbl 2 `"No"', add
label define dislowr_lbl 9 `"Unknown"', add
label values dislowr dislowr_lbl

label define disuppr_lbl 0 `"NIU (not in universe)"'
label define disuppr_lbl 1 `"Yes"', add
label define disuppr_lbl 2 `"No"', add
label define disuppr_lbl 9 `"Unknown"', add
label values disuppr disuppr_lbl

label define dismntl_lbl 0 `"NIU (not in universe)"'
label define dismntl_lbl 1 `"Yes"', add
label define dismntl_lbl 2 `"No"', add
label define dismntl_lbl 9 `"Unknown"', add
label values dismntl dismntl_lbl

label define dispsyc_lbl 0 `"NIU (not in universe)"'
label define dispsyc_lbl 1 `"Yes"', add
label define dispsyc_lbl 2 `"No"', add
label define dispsyc_lbl 9 `"Unknown"', add
label values dispsyc dispsyc_lbl

label define disorig_lbl 00 `"NIU (not in universe)"'
label define disorig_lbl 10 `"Congenital, since birth"', add
label define disorig_lbl 20 `"Disease"', add
label define disorig_lbl 21 `"Polio, infant paralysis"', add
label define disorig_lbl 22 `"Parkinsons"', add
label define disorig_lbl 23 `"Sclerosis"', add
label define disorig_lbl 24 `"Stroke"', add
label define disorig_lbl 25 `"Epilepsy"', add
label define disorig_lbl 26 `"Hanson disease"', add
label define disorig_lbl 29 `"Other disease"', add
label define disorig_lbl 30 `"Accident"', add
label define disorig_lbl 31 `"Work accident"', add
label define disorig_lbl 32 `"Transport accident"', add
label define disorig_lbl 33 `"Other accident"', add
label define disorig_lbl 40 `"Other"', add
label define disorig_lbl 41 `"Aging"', add
label define disorig_lbl 42 `"Mental infirmity"', add
label define disorig_lbl 43 `"War injury"', add
label define disorig_lbl 44 `"Genocide"', add
label define disorig_lbl 45 `"Anti-personnel mine"', add
label define disorig_lbl 46 `"Domestic violence"', add
label define disorig_lbl 47 `"Violence of delinquency"', add
label define disorig_lbl 48 `"Other form of violence"', add
label define disorig_lbl 49 `"Other cause, n.e.c."', add
label define disorig_lbl 50 `"Unknown"', add
label define disorig_lbl 60 `"Multiple causes"', add
label define disorig_lbl 99 `"No disability"', add
label values disorig disorig_lbl


