#install.packages('WDI')
#install.packages('ggplot2')
#install.packages('caTools')
#install.packages('shiny')
#install.packages('data.table')
#install.packages('corrplot')
#install.packages('corrgram')
#install.packages('plyr')
library(ggplot2)
library(plyr)
library(WDI)
library(caTools)
library(shiny)
library(data.table)
library(corrplot)
library(corrgram)

options(scipen=999) # turn-off scientific notation like 1e+48

# ----------------------Accessing WDI data through WDI Library-------------------------------------------

#---------------------------------HEALTH (US) DATASETS--------------------------------------------------------

# US population total
USpopulation = WDI(indicator='SP.POP.TOTL', country="US",start=1960, end=2014)
names(USpopulation)[3]="population"

# Fertility rate (births per woman)
USfertility = WDI(indicator='SP.DYN.TFRT.IN', country="US",start=1960, end=2014)
names(USfertility)[3]="Fertility (Births per woman)"

#Birth rate
USbirthrate= WDI(indicator='SP.DYN.CBRT.IN', country="US",start=1960, end=2014)
names(USbirthrate)[3]="Birth Rate"

#Infant death rate
USInfantdeaths= WDI(indicator='SH.DTH.IMRT', country="US",start=1960, end=2014)
names(USInfantdeaths)[3]="Infant Deaths"

# GDP in current US $
USgdp= WDI(indicator='NY.GDP.MKTP.CD', country="US",start=1960, end=2014)
names(USgdp)[3]="GDP (US$)"

#GDP Per Capita  in US$
USPercapita= WDI(indicator='NY.GDP.PCAP.CD', country="US",start=1960, end=2014)
names(USPercapita)[3]="GDP Percapita (US$)"

# CO2 Emissions(Kt)
USco2emission= WDI(indicator='EN.ATM.CO2E.KT', country="US",start=1960, end=2014)
names(USco2emission)[3]="CO2 Emission (Kt)"

# Life expectancy at birth (Years)
USlifeExpectancy= WDI(indicator='SP.DYN.LE00.IN', country="US",start=1960, end=2014)
names(USlifeExpectancy)[3]="Life Expectancy (Years)"

# NO.of Under five age deaths
USUfivedeaths= WDI(indicator='SH.DTH.MORT', country="US",start=1960, end=2014)
names(USUfivedeaths)[3]="Under five age deaths"

# Population 0-14 female 
USpop0to14f= WDI(indicator='SP.POP.0014.FE.IN', country="US",start=1960, end=2014)
names(USpop0to14f)[3]="Population 0-14 years female"

# Population 0-14 male
USpop0to14m= WDI(indicator='SP.POP.0014.MA.IN', country="US",start=1960, end=2014)
names(USpop0to14m)[3]="Population 0-14 years male"

# Population 0-14 total
USpop0to14t= WDI(indicator='SP.POP.0014.TO', country="US",start=1960, end=2014)
names(USpop0to14t)[3]="Population 0-14 years total"

# Population 15-64 female 
USpop15to64f= WDI(indicator='SP.POP.1564.FE.IN', country="US",start=1960, end=2014)
names(USpop15to64f)[3]="Population 15-64 years female"

# Population 15-64 male
USpop15to64m= WDI(indicator='SP.POP.1564.MA.IN', country="US",start=1960, end=2014)
names(USpop15to64m)[3]="Population 15-64 years male"

# Population 15-64 total
USpop15to64t= WDI(indicator='SP.POP.1564.TO', country="US",start=1960, end=2014)
names(USpop15to64t)[3]="Population 15-64 years total"

# Population above 65 female 
USpop65upf= WDI(indicator='SP.POP.65UP.FE.IN', country="US",start=1960, end=2014)
names(USpop65upf)[3]="Population above 65 years female"

# Population above 65 male 
USpop65upm= WDI(indicator='SP.POP.65UP.MA.IN', country="US",start=1960, end=2014)
names(USpop65upm)[3]="Population above 65 years male"

# Population above 65 total
USpop65upt= WDI(indicator='SP.POP.65UP.TO', country="US",start=1960, end=2014)
names(USpop65upt)[3]="Population above 65 years total"

# US population total- female
USpopulationf = WDI(indicator='SP.POP.TOTL.FE.IN', country="US",start=1960, end=2014)
names(USpopulationf)[3]="US population - female"

# US population total- male
USpopulationm = WDI(indicator='SP.POP.TOTL.MA.IN', country="US",start=1960, end=2014)
names(USpopulationm)[3]="US population - male"

# US rural population 
USruralpop = WDI(indicator='SP.RUR.TOTL', country="US",start=1960, end=2014)
names(USruralpop)[3]="US rural population "

# US urban population 
USurbanpop = WDI(indicator='SP.URB.TOTL', country="US",start=1960, end=2014)
names(USurbanpop)[3]="US urban population "

# Survival to age 65,female (% of cohort)
USsur65f = WDI(indicator='SP.DYN.TO65.FE.ZS', country="US",start=1960, end=2014)
names(USsur65f)[3]="US survival to age 65 female(%of cohort) "

# Survival to age 65,male (% of cohort)
USsur65m = WDI(indicator='SP.DYN.TO65.MA.ZS', country="US",start=1960, end=2014)
names(USsur65m)[3]="US survival to age 65 male(%of cohort) "

# mortality rate infant (per 1000 live births)
USmorinf = WDI(indicator='SP.DYN.IMRT.IN', country="US",start=1960, end=2014)
names(USmorinf)[3]="Mortality rate infant"

# mortality rate adult female (per 1000 female adults)
USmoradf = WDI(indicator='SP.DYN.AMRT.FE', country="US",start=1960, end=2014)
names(USmoradf)[3]="Mortality rate adult female"

# mortality rate adult male (per 1000 male adults)
USmoradm = WDI(indicator='SP.DYN.AMRT.MA', country="US",start=1960, end=2014)
names(USmoradm)[3]="Mortality rate adult male"

# Life expectancy at birth female (Years)
USlifeExpectancyf= WDI(indicator='SP.DYN.LE00.FE.IN', country="US",start=1960, end=2014)
names(USlifeExpectancyf)[3]="Life Expectancy female (Years)"

# Life expectancy at birth male (Years)
USlifeExpectancym= WDI(indicator='SP.DYN.LE00.MA.IN', country="US",start=1960, end=2014)
names(USlifeExpectancym)[3]="Life Expectancy male (Years)"

#----------------------------------ECONOMY (US) DATASETS----------------------------------------------

#credit to private sector (% of GDP)
USdomcredit = WDI(indicator='FS.AST.PRVT.GD.ZS', country="US" ,start=1980, end=2014)
names(USdomcredit)[3]="Domestic credit to private sector(% of GDP)"

#Expense (% of GDP)
USexpense= WDI(indicator='GC.XPN.TOTL.GD.ZS', country="US",start=1980, end=2014)
names(USexpense)[3]="Expense (% of GDP)"

#Exports of goods and services (% of GDP)
USexportsgdp= WDI(indicator='NE.EXP.GNFS.ZS', country="US",start=1980, end=2014)
names(USexportsgdp)[3]="Exports of goods and services (% of GDP)"

#Exports of goods and services ( current US $)
USexportsusd= WDI(indicator='NE.EXP.GNFS.CD', country="US",start=1980, end=2014)
names(USexportsusd)[3]="Exports of goods and services (Current US$)"

#GDP (current US $)
USgdpusd= WDI(indicator='NY.GDP.MKTP.CD', country="US",start=1980, end=2014)
names(USgdpusd)[3]="GDP growth (current US$)"

#GDP ( annual %)
USgdpgrowth= WDI(indicator='NY.GDP.MKTP.KD.ZG', country="US",start=1980, end=2014)
names(USgdpgrowth)[3]="GDP growth (annual %)"

#GDP per capita growth (current US $)
USgdppercapitausd= WDI(indicator='NY.GDP.PCAP.CD', country="US",start=1980, end=2014)
names(USgdppercapitausd)[3]="GDP per capita growth (current US$)"

#GDP per capita growth (annual %)
USgdppercapita= WDI(indicator='NY.GDP.PCAP.KD.ZG', country="US",start=1980, end=2014)
names(USgdppercapita)[3]="GDP per capita growth (annual %)"

#Gross savings (% of GDP)
USgrosssavings= WDI(indicator='NY.GNS.ICTR.ZS', country="US",start=1980, end=2014)
names(USgrosssavings)[3]="Gross savings (% of GDP)"

#Imports of goods and services (% of GDP)
USimportsgdp= WDI(indicator='NE.IMP.GNFS.ZS', country="US",start=1980, end=2014)
names(USimportsgdp)[3]="Imports of goods and services (% of GDP)"

#Imports of goods and services ( current US $)
USimportsusd= WDI(indicator='NE.IMP.GNFS.CD', country="US",start=1980, end=2014)
names(USimportsusd)[3]="Imports of goods and services (Current US$)"

#Net foreign assets (LCU)
USNFAlcu= WDI(indicator='FM.AST.NFRG.CN', country="US",start=1980, end=2014)
names(USNFAlcu)[3]="Net Foreign assets (LCU)"

#Net foreign assets (current USD) 
USniausd= WDI(indicator='NY.GSR.NFCY.CD', country="US",start=1980, end=2014)
names(USniausd)[3]="Net Income from abroad (Curent USD)"

#Net foreign assets (current LCU) 
USniac= WDI(indicator='NY.GSR.NFCY.CN', country="US",start=1980, end=2014)
names(USniac)[3]="Net Income from abroad (Current LCU)"

#Patent applications (residents) 
USpatentres= WDI(indicator='IP.PAT.RESD', country="US",start=1980, end=2014)
names(USpatentres)[3]="Patent applications (residents)"

#Patent applications  (non-residents)
USpatentnonres= WDI(indicator='IP.PAT.NRES', country="US",start=1980, end=2014)
names(USpatentnonres)[3]="Patent applications (non-residents)"

#Total fisheries production (metric tons)
USfisheries= WDI(indicator='ER.FSH.PROD.MT', country="US",start=1980, end=2014)
names(USfisheries)[3]="fisheries production (metric tons)"

#Total reserves (includes gold) current usd
USreservesg= WDI(indicator='FI.RES.TOTL.CD', country="US",start=1980, end=2014)
names(USreservesg)[3]="total reserves (includes gold) Current USD"

#Total reserves (excludes gold) current usd
USreserves= WDI(indicator='FI.RES.XGLD.CD', country="US",start=1980, end=2014)
names(USreserves)[3]="total reserves (excludes gold) Current USD"

#Trade (% of gdp)
UStradeingdp= WDI(indicator='NE.TRD.GNFS.ZS', country="US",start=1980, end=2014)
names(UStradeingdp)[3]=" Trade (% of gdp)"

#Merchandise exports (current US$)
USmerchexp= WDI(indicator='TX.VAL.MRCH.CD.WT', country="US",start=1980, end=2014)
names(USmerchexp)[3]=" Merchandise exports (current usd)"

#Merchandise exports by the reporting economy (current US$)
USmerchexpeco= WDI(indicator='TX.VAL.MRCH.WL.CD', country="US",start=1980, end=2014)
names(USmerchexpeco)[3]=" Merchandise exports by reporting economy (current usd)"

#Merchandise imports (current US$)
USmerchimp= WDI(indicator='TM.VAL.MRCH.CD.WT', country="US",start=1980, end=2014)
names(USmerchimp)[3]=" Merchandise imports (current usd)"

#Merchandise imports by the reporting economy (current US$)
USmerchimpeco= WDI(indicator='TM.VAL.MRCH.WL.CD', country="US",start=1980, end=2014)
names(USmerchimpeco)[3]=" Merchandise imports by reporting economy (current usd)"

#Merchandise trade (% of GDP)
USmerchtrd= WDI(indicator='TG.VAL.TOTL.GD.ZS', country="US",start=1980, end=2014)
names(USmerchtrd)[3]=" Merchandise trade (% of gdp)"

#Military expenditure (% of gdp)
USmilexpgdp= WDI(indicator='MS.MIL.XPND.GD.ZS', country="US",start=1980, end=2014)
names(USmilexpgdp)[3]=" Military expenditure (% of gdp)"

#Military expenditure (current LCU)
USmilexplcu= WDI(indicator='MS.MIL.XPND.CN', country="US",start=1980, end=2014)
names(USmilexplcu)[3]=" Military expenditure (current lcu)"

#Inflation consumer prices (annual %)
USinfconpri= WDI(indicator='FP.CPI.TOTL.ZG', country="US",start=1980, end=2014)
names(USinfconpri)[3]=" Inflation consumer prices (annual %)"

#Inflation gdp deflator (annual %)
USgdpdefpri= WDI(indicator='NY.GDP.DEFL.KD.ZG', country="US",start=1980, end=2014)
names(USgdpdefpri)[3]=" Inflation GDP deflator(annual %)"

#Gross national expenditure (current usd)
USgneusd= WDI(indicator='NE.DAB.TOTL.CD', country="US",start=1980, end=2014)
names(USgneusd)[3]=" Gross national expenditure (current usd)"

#Gross national expenditure (% of gdp)
USgnegdp= WDI(indicator='NE.DAB.TOTL.ZS', country="US",start=1980, end=2014)
names(USgnegdp)[3]=" Gross national expenditure (%of gdp))"

#Gross capital formation (current usd)
USgcfusd= WDI(indicator='NE.GDI.TOTL.CD', country="US",start=1980, end=2014)
names(USgcfusd)[3]=" Gross capital formation (current usd)"

#Gross capital formation (% of GDP)
USgcfgdp= WDI(indicator='NE.GDI.TOTL.ZS', country="US",start=1980, end=2014)
names(USgcfgdp)[3]=" Gross capital formation (% of GDP)"

#Gross domestic savings (current usd)
USgdsusd= WDI(indicator='NY.GDS.TOTL.CD', country="US",start=1980, end=2014)
names(USgdsusd)[3]=" Gross domestic savings (current usd)"

#Gross domestic savings (% of gdp)
USgdsgdp= WDI(indicator='NY.GDS.TOTL.ZS', country="US",start=1980, end=2014)
names(USgdsgdp)[3]=" Gross domestic savings (% of gdp)"

#Gross fixed capital formation (current usd)
USgfcfusd= WDI(indicator='NE.GDI.FTOT.CD', country="US",start=1980, end=2014)
names(USgfcfusd)[3]=" Gross fixed capital formation (current usd)"

#Gross fixed capital formation (% of gdp)
USgfcfgdp= WDI(indicator='NE.GDI.FTOT.ZS', country="US",start=1980, end=2014)
names(USgfcfgdp)[3]=" Gross fixed capital formation (% of gdp)"

#Final consumption expenditure,etc (current usd)
USfceusd= WDI(indicator='NE.CON.TETC.CD', country="US",start=1980, end=2014)
names(USfceusd)[3]=" Final consumption expenditure (current usd)"

#Final consumption expenditure,etc (% of gdp)
USfcegdp= WDI(indicator='NE.CON.TETC.ZS', country="US",start=1980, end=2014)
names(USfcegdp)[3]=" Final consumption expenditure (% of gdp)"

#External balance on goods and services (current USD)
USebgsusd= WDI(indicator='NE.RSB.GNFS.CD', country="US",start=1980, end=2014)
names(USebgsusd)[3]=" External balance on goods and services (current usd)"

#External balance on goods and services (% of gdp)
USebgsgdp= WDI(indicator='NE.RSB.GNFS.ZS', country="US",start=1980, end=2014)
names(USebgsgdp)[3]=" External balance on goods and services (% of gdp)"

#----------------------------HEALTH (INDIA-IN) DATASETS------------------------------------------------
# INDIA population total
INpopulation = WDI(indicator='SP.POP.TOTL', country="IN",start=1960, end=2014)
names(INpopulation)[3]="population"

# Fertility rate (births per woman)
INfertility = WDI(indicator='SP.DYN.TFRT.IN', country="IN",start=1960, end=2014)
names(INfertility)[3]="Fertility (Births per woman)"

#Birth rate
INbirthrate= WDI(indicator='SP.DYN.CBRT.IN', country="IN",start=1960, end=2014)
names(INbirthrate)[3]="Birth Rate"

#Infant death rate
INInfantdeaths= WDI(indicator='SH.DTH.IMRT', country="IN",start=1960, end=2014)
names(INInfantdeaths)[3]="Infant Deaths"

# GDP in current US $
INgdp= WDI(indicator='NY.GDP.MKTP.CD', country="IN",start=1960, end=2014)
names(INgdp)[3]="GDP (US$)"

#GDP Per Capita  in US$
INPercapita= WDI(indicator='NY.GDP.PCAP.CD', country="IN",start=1960, end=2014)
names(INPercapita)[3]="GDP Percapita (US$)"

# CO2 Emissions(Kt)
INco2emission= WDI(indicator='EN.ATM.CO2E.KT', country="IN",start=1960, end=2014)
names(INco2emission)[3]="CO2 Emission (Kt)"

# Life expectancy at birth (Years)
INlifeExpectancy= WDI(indicator='SP.DYN.LE00.IN', country="IN",start=1960, end=2014)
names(INlifeExpectancy)[3]="Life Expectancy (Years)"

# NO.of Under five age deaths
INUfivedeaths= WDI(indicator='SH.DTH.MORT', country="IN",start=1960, end=2014)
names(INUfivedeaths)[3]="Under five age deaths"

# Population 0-14 female 
INpop0to14f= WDI(indicator='SP.POP.0014.FE.IN', country="IN",start=1960, end=2014)
names(INpop0to14f)[3]="Population 0-14 years female"

# Population 0-14 male
INpop0to14m= WDI(indicator='SP.POP.0014.MA.IN', country="IN",start=1960, end=2014)
names(INpop0to14m)[3]="Population 0-14 years male"

# Population 0-14 total
INpop0to14t= WDI(indicator='SP.POP.0014.TO', country="IN",start=1960, end=2014)
names(INpop0to14t)[3]="Population 0-14 years total"

# Population 15-64 female 
INpop15to64f= WDI(indicator='SP.POP.1564.FE.IN', country="IN",start=1960, end=2014)
names(INpop15to64f)[3]="Population 15-64 years female"

# Population 15-64 male
INpop15to64m= WDI(indicator='SP.POP.1564.MA.IN', country="IN",start=1960, end=2014)
names(INpop15to64m)[3]="Population 15-64 years male"

# Population 15-64 total
INpop15to64t= WDI(indicator='SP.POP.1564.TO', country="IN",start=1960, end=2014)
names(INpop15to64t)[3]="Population 15-64 years total"

# Population above 65 female 
INpop65upf= WDI(indicator='SP.POP.65UP.FE.IN', country="IN",start=1960, end=2014)
names(INpop65upf)[3]="Population above 65 years female"

# Population above 65 male 
INpop65upm= WDI(indicator='SP.POP.65UP.MA.IN', country="IN",start=1960, end=2014)
names(INpop65upm)[3]="Population above 65 years male"

# Population above 65 total
INpop65upt= WDI(indicator='SP.POP.65UP.TO', country="IN",start=1960, end=2014)
names(INpop65upt)[3]="Population above 65 years total"

# INDIA population total- female
INpopulationf = WDI(indicator='SP.POP.TOTL.FE.IN', country="IN",start=1960, end=2014)
names(INpopulationf)[3]="US population - female"

# INDIA population total- male
INpopulationm = WDI(indicator='SP.POP.TOTL.MA.IN', country="IN",start=1960, end=2014)
names(INpopulationm)[3]="US population - male"

# INDIA rural population 
INruralpop = WDI(indicator='SP.RUR.TOTL', country="IN",start=1960, end=2014)
names(INruralpop)[3]="US rural population "

# INDIA urban population 
INurbanpop = WDI(indicator='SP.URB.TOTL', country="IN",start=1960, end=2014)
names(INurbanpop)[3]="US urban population "

# Survival to age 65,female (% of cohort)
INsur65f = WDI(indicator='SP.DYN.TO65.FE.ZS', country="IN",start=1960, end=2014)
names(INsur65f)[3]="US survival to age 65 female(%of cohort) "

# Survival to age 65,male (% of cohort)
INsur65m = WDI(indicator='SP.DYN.TO65.MA.ZS', country="IN",start=1960, end=2014)
names(INsur65m)[3]="US survival to age 65 male(%of cohort) "

# mortality rate infant (per 1000 live births)
INmorinf = WDI(indicator='SP.DYN.IMRT.IN', country="IN",start=1960, end=2014)
names(INmorinf)[3]="Mortality rate infant"

# mortality rate adult female (per 1000 female adults)
INmoradf = WDI(indicator='SP.DYN.AMRT.FE', country="IN",start=1960, end=2014)
names(INmoradf)[3]="Mortality rate adult female"

# mortality rate adult male (per 1000 male adults)
INmoradm = WDI(indicator='SP.DYN.AMRT.MA', country="IN",start=1960, end=2014)
names(INmoradm)[3]="Mortality rate adult male"

# Life expectancy at birth female (Years)
INlifeExpectancyf= WDI(indicator='SP.DYN.LE00.FE.IN', country="IN",start=1960, end=2014)
names(INlifeExpectancyf)[3]="Life Expectancy female (Years)"

# Life expectancy at birth male (Years)
INlifeExpectancym= WDI(indicator='SP.DYN.LE00.MA.IN', country="IN",start=1960, end=2014)
names(INlifeExpectancym)[3]="Life Expectancy male (Years)"

#----------------------------------ECONOMY (INDIA) DATASETS----------------------------------------------
#Credit to private sector (% of GDP)
INdomcredit = WDI(indicator='FS.AST.PRVT.GD.ZS', country="IN" ,start=1980, end=2013)
names(INdomcredit)[3]="Domestic credit to private sector(% of GDP)"

#Expense (% of GDP)
INexpense= WDI(indicator='GC.XPN.TOTL.GD.ZS', country="IN",start=1980, end=2013)
names(INexpense)[3]="Expense (% of GDP)"

#Exports of goods and services (% of GDP)
INexportsgdp= WDI(indicator='NE.EXP.GNFS.ZS', country="IN",start=1980, end=2013)
names(INexportsgdp)[3]="Exports of goods and services (% of GDP)"

#Exports of goods and services ( current US $)
INexportsusd= WDI(indicator='NE.EXP.GNFS.CD', country="IN",start=1980, end=2013)
names(INexportsusd)[3]="Exports of goods and services (Current US$)"

#GDP (current US $)
INgdpusd= WDI(indicator='NY.GDP.MKTP.CD', country="IN",start=1980, end=2013)
names(INgdpusd)[3]="GDP growth (current US$)"

#GDP ( annual %)
INgdpgrowth= WDI(indicator='NY.GDP.MKTP.KD.ZG', country="IN",start=1980, end=2013)
names(INgdpgrowth)[3]="GDP growth (annual %)"

#GDP per capita growth (current US $)
INgdppercapitausd= WDI(indicator='NY.GDP.PCAP.CD', country="IN",start=1980, end=2013)
names(INgdppercapitausd)[3]="GDP per capita growth (current US$)"

#GDP per capita growth (annual %)
INgdppercapita= WDI(indicator='NY.GDP.PCAP.KD.ZG', country="IN",start=1980, end=2013)
names(INgdppercapita)[3]="GDP per capita growth (annual %)"

#Gross savings (% of GDP)
INgrosssavings= WDI(indicator='NY.GNS.ICTR.ZS', country="IN",start=1980, end=2013)
names(INgrosssavings)[3]="Gross savings (% of GDP)"

#Imports of goods and services (% of GDP)
INimportsgdp= WDI(indicator='NE.IMP.GNFS.ZS', country="IN",start=1980, end=2013)
names(INimportsgdp)[3]="Imports of goods and services (% of GDP)"

#Imports of goods and services ( current US $)
INimportsusd= WDI(indicator='NE.IMP.GNFS.CD', country="IN",start=1980, end=2013)
names(INimportsusd)[3]="Imports of goods and services (Current US$)"

#Net foreign assets (LCU)
INNFAlcu= WDI(indicator='FM.AST.NFRG.CN', country="IN",start=1980, end=2013)
names(INNFAlcu)[3]="Net Foreign assets (LCU)"

#Net foreign assets (current USD) 
INniausd= WDI(indicator='NY.GSR.NFCY.CD', country="IN",start=1980, end=2013)
names(INniausd)[3]="Net Income from abroad (Curent USD)"

#Net foreign assets (current LCU) 
INniac= WDI(indicator='NY.GSR.NFCY.CN', country="IN",start=1980, end=2013)
names(INniac)[3]="Net Income from abroad (Current LCU)"

#Total fisheries production (metric tons)
INfisheries= WDI(indicator='ER.FSH.PROD.MT', country="IN",start=1980, end=2013)
names(INfisheries)[3]="fisheries production (metric tons)"

#Total reserves (includes gold) current usd
INreservesg= WDI(indicator='FI.RES.TOTL.CD', country="IN",start=1980, end=2013)
names(INreservesg)[3]="total reserves (includes gold) Current USD"

#Total reserves (excludes gold) current usd
INreserves= WDI(indicator='FI.RES.XGLD.CD', country="IN",start=1980, end=2013)
names(INreserves)[3]="total reserves (excludes gold) Current USD"

#Trade (% of gdp)
INtradeingdp= WDI(indicator='NE.TRD.GNFS.ZS', country="IN",start=1980, end=2013)
names(INtradeingdp)[3]=" Trade (% of gdp)"

#Merchandise exports (current US$)
INmerchexp= WDI(indicator='TX.VAL.MRCH.CD.WT', country="IN",start=1980, end=2013)
names(INmerchexp)[3]=" Merchandise exports (current usd)"

#Merchandise exports by the reporting economy (current US$)
INmerchexpeco= WDI(indicator='TX.VAL.MRCH.WL.CD', country="IN",start=1980, end=2013)
names(INmerchexpeco)[3]=" Merchandise exports by reporting economy (current usd)"

#Merchandise imports (current US$)
INmerchimp= WDI(indicator='TM.VAL.MRCH.CD.WT', country="IN",start=1980, end=2013)
names(INmerchimp)[3]=" Merchandise imports (current usd)"

#Merchandise imports by the reporting economy (current US$)
INmerchimpeco= WDI(indicator='TM.VAL.MRCH.WL.CD', country="IN",start=1980, end=2013)
names(INmerchimpeco)[3]=" Merchandise imports by reporting economy (current usd)"

#Merchandise trade (% of GDP)
INmerchtrd= WDI(indicator='TG.VAL.TOTL.GD.ZS', country="IN",start=1980, end=2013)
names(INmerchtrd)[3]=" Merchandise trade (% of gdp)"

#Military expenditure (% of gdp)
INmilexpgdp= WDI(indicator='MS.MIL.XPND.GD.ZS', country="IN",start=1980, end=2013)
names(INmilexpgdp)[3]=" Military expenditure (% of gdp)"

#Military expenditure (current LCU)
INmilexplcu= WDI(indicator='MS.MIL.XPND.CN', country="IN",start=1980, end=2013)
names(INmilexplcu)[3]=" Military expenditure (current lcu)"

#Inflation consumer prices (annual %)
INinfconpri= WDI(indicator='FP.CPI.TOTL.ZG', country="IN",start=1980, end=2013)
names(INinfconpri)[3]=" Inflation consumer prices (annual %)"

#Inflation gdp deflator (annual %)
INgdpdefpri= WDI(indicator='NY.GDP.DEFL.KD.ZG', country="IN",start=1980, end=2013)
names(INgdpdefpri)[3]=" Inflation GDP deflator(annual %)"

#Gross national expenditure (current usd)
INgneusd= WDI(indicator='NE.DAB.TOTL.CD', country="IN",start=1980, end=2013)
names(INgneusd)[3]=" Gross national expenditure (current usd)"

#Gross national expenditure (% of gdp)
INgnegdp= WDI(indicator='NE.DAB.TOTL.ZS', country="IN",start=1980, end=2013)
names(INgnegdp)[3]=" Gross national expenditure (%of gdp))"

#Gross capital formation (current usd)
INgcfusd= WDI(indicator='NE.GDI.TOTL.CD', country="IN",start=1980, end=2013)
names(INgcfusd)[3]=" Gross capital formation (current usd)"

#Gross capital formation (% of GDP)
INgcfgdp= WDI(indicator='NE.GDI.TOTL.ZS', country="IN",start=1980, end=2013)
names(INgcfgdp)[3]=" Gross capital formation (% of GDP)"

#Gross domestic savings (current usd)
INgdsusd= WDI(indicator='NY.GDS.TOTL.CD', country="IN",start=1980, end=2013)
names(INgdsusd)[3]=" Gross domestic savings (current usd)"

#Gross domestic savings (% of gdp)
INgdsgdp= WDI(indicator='NY.GDS.TOTL.ZS', country="IN",start=1980, end=2013)
names(INgdsgdp)[3]=" Gross domestic savings (% of gdp)"

#Gross fixed capital formation (current usd)
INgfcfusd= WDI(indicator='NE.GDI.FTOT.CD', country="IN",start=1980, end=2013)
names(INgfcfusd)[3]=" Gross fixed capital formation (current usd)"

#Gross fixed capital formation (% of gdp)
INgfcfgdp= WDI(indicator='NE.GDI.FTOT.ZS', country="IN",start=1980, end=2013)
names(INgfcfgdp)[3]=" Gross fixed capital formation (% of gdp)"

#Final consumption expenditure,etc (current usd)
INfceusd= WDI(indicator='NE.CON.TETC.CD', country="IN",start=1980, end=2013)
names(INfceusd)[3]=" Final consumption expenditure (current usd)"

#Final consumption expenditure,etc (% of gdp)
INfcegdp= WDI(indicator='NE.CON.TETC.ZS', country="IN",start=1980, end=2013)
names(INfcegdp)[3]=" Final consumption expenditure (% of gdp)"

#External balance on goods and services (current USD)
INebgsusd= WDI(indicator='NE.RSB.GNFS.CD', country="IN",start=1980, end=2013)
names(INebgsusd)[3]=" External balance on goods and services (current usd)"

#External balance on goods and services (% of gdp)
INebgsgdp= WDI(indicator='NE.RSB.GNFS.ZS', country="IN",start=1980, end=2013)
names(INebgsgdp)[3]=" External balance on goods and services (% of gdp)"

#--------------------------JOINING DATASETS---------------------

#wbdUS- Combined data comprising Health related data of US

a1 <- join(USpopulation, USfertility)
a2 <- join(a1,USbirthrate)
a3 <- join(a2,USInfantdeaths)
a4<-join(a3,USgdp)
a5<-join(a4,USPercapita)
a6<-join(a5,USco2emission)
a7<-join(a6,USUfivedeaths)
a8<-join(a7,USpop0to14f)
a9<-join(a8,USpop0to14m)
a10<-join(a9,USpop0to14t)
a11<-join(a10,USpop15to64f)
a12<-join(a11,USpop15to64m)
a13<-join(a12,USpop15to64t)
a14<-join(a13,USpop65upf)
a15<-join(a14,USpop65upm)
a16<-join(a15,USpop65upt)
a17<-join(a16,USpopulationf)
a18<-join(a17,USpopulationm)
a19<-join(a18,USruralpop)
a20<-join(a19,USurbanpop)
a21<-join(a20,USsur65f)
a22<-join(a21,USsur65m)
a23<-join(a22,USmorinf)
a24<-join(a23,USmoradf)
a25<-join(a24,USmoradm)
a26<-join(a25,USlifeExpectancyf)
a27<-join(a26,USlifeExpectancym)
wbdUS<-join(a27,USlifeExpectancy)

#ewbdUS- Combined data comprising Economy related data of US

b1 <- join(USdomcredit, USexpense)
b2 <- join(b1,USexportsgdp)
b3 <- join(b2,USexportsusd)
b4 <- join(b3,USgdpusd)
b5<-join(b4,USgdpgrowth)
b6<-join(b5,USgdppercapitausd)
b7<-join(b6,USimportsgdp)
b8<-join(b7,USgrosssavings)
b9<-join(b8,USimportsusd)
b10<-join(b9,USNFAlcu)
b11<-join(b10,USniausd)
b12<-join(b11,USniac)
b13<-join(b12,USpatentres)
b14<-join(b13,USpatentnonres)
b15<-join(b14,USfisheries)
b16<-join(b15,USreservesg)
b17<-join(b16,USreserves)
b18<-join(b17,UStradeingdp)
b19<-join(b18,USmerchexp)
b20<-join(b19,USmerchexpeco)
b21<-join(b20,USmerchimp)
b22<-join(b21,USmerchimpeco)
b23<-join(b22,USmerchtrd)
b24<-join(b23,USmilexpgdp)
b25<-join(b24,USmilexplcu)
b26<-join(b25,USinfconpri)
b27<-join(b26,USgdpdefpri)
b28<-join(b27,USgneusd)
b29<-join(b28,USgnegdp)
b30<-join(b29,USgcfusd)
b31<-join(b30,USgcfgdp)
b32<-join(b31,USgdsusd)
b33<-join(b32,USgdsgdp)
b34<-join(b33,USgfcfusd)
b35<-join(b34,USgfcfgdp)
b36<-join(b35,USfceusd)
b37<-join(b36,USfcegdp)
b38<-join(b37,USebgsusd)
b39<-join(b38,USebgsgdp)
ewbdUS<-join(b39,USgdppercapita)

#ewbdIN- Combined data comprising Health related data of India

c1 <- join(INpopulation, INfertility)
c2 <- join(c1,INbirthrate)
c3 <- join(c2,INInfantdeaths)
c4<-join(c3,INgdp)
c5<-join(c4,INPercapita)
c6<-join(c5,INco2emission)
c7<-join(c6,INUfivedeaths)
c8<-join(c7,INpop0to14f)
c9<-join(c8,INpop0to14m)
c10<-join(c9,INpop0to14t)
c11<-join(c10,INpop15to64f)
c12<-join(c11,INpop15to64m)
c13<-join(c12,INpop15to64t)
c14<-join(c13,INpop65upf)
c15<-join(c14,INpop65upm)
c16<-join(c15,INpop65upt)
c17<-join(c16,INpopulationf)
c18<-join(c17,INpopulationm)
c19<-join(c18,INruralpop)
c20<-join(c19,INurbanpop)
c21<-join(c20,INsur65f)
c22<-join(c21,INsur65m)
c23<-join(c22,INmorinf)
c24<-join(c23,INmoradf)
c25<-join(c24,INmoradm)
c26<-join(c25,INlifeExpectancyf)
c27<-join(c26,INlifeExpectancym)
wbdIN<-join(c27,INlifeExpectancy)

#ewbdIS- Combined data comprising Economy related data of India

d1 <- join(INdomcredit, INexpense)
d2 <- join(d1,INexportsgdp)
d3 <- join(d2,INexportsusd)
d4 <- join(d3,INgdpusd)
d5<-join(d4,INgdpgrowth)
d6<-join(d5,INgdppercapitausd)
d7<-join(d6,INimportsgdp)
d8<-join(d7,INgrosssavings)
d9<-join(d8,INimportsusd)
d10<-join(d9,INNFAlcu)
d11<-join(d10,INniausd)
d12<-join(d11,INniac)
d13<-join(d12,INfisheries)
d14<-join(d13,INreservesg)
d15<-join(d14,INreserves)
d16<-join(d15,INtradeingdp)
d17<-join(d16,INmerchexp)
d18<-join(d17,INmerchexpeco)
d19<-join(d18,INmerchimp)
d20<-join(d19,INmerchimpeco)
d21<-join(d20,INmerchtrd)
d22<-join(d21,INmilexpgdp)
d23<-join(d22,INmilexplcu)
d24<-join(d23,INinfconpri)
d25<-join(d24,INgdpdefpri)
d26<-join(d25,INgneusd)
d27<-join(d26,INgnegdp)
d28<-join(d27,INgcfusd)
d29<-join(d28,INgcfgdp)
d30<-join(d29,INgdsusd)
d31<-join(d30,INgdsgdp)
d32<-join(d31,INgfcfusd)
d33<-join(d32,INgfcfgdp)
d34<-join(d33,INfceusd)
d35<-join(d34,INfcegdp)
d36<-join(d35,INebgsusd)
d37<-join(d36,INebgsgdp)
ewbdIN<-join(d37,INgdppercapita)

#-------------------------linear regression - HEALTH USA DATA----------------------------------------

# Split up the sample, basically randomly assigns a booleans to a new column "sample"

Y<-wbdUS[,32] #Life Expectancy (Years)
X1<-wbdUS[,3] #Population
X2<-wbdUS[,4] #year
X3<-wbdUS[,5] #fertility (births per woman)
X4<-wbdUS[,6] #birth rate
X5<-wbdUS[,7] #infant deaths
X6<-wbdUS[,8] #gdp us$
X7<-wbdUS[,9] #gdp percapita us $
X8<-wbdUS[,10] #co2 emission kt
X9<-wbdUS[,11] #under 5 age deaths
X10<-wbdUS[,12] #pop 0-14 female
X11<-wbdUS[,13] #pop 0-14 male
X12<-wbdUS[,14] #pop 0-14 total
X13<-wbdUS[,15] #pop 15-64 female
X14<-wbdUS[,16] #pop 15-64 male
X15<-wbdUS[,17] #pop 15-64 total
X16<-wbdUS[,18] #pop above 65 female
X17<-wbdUS[,19]  #pop above 65 male
X18<-wbdUS[,20]  #pop above 65 total
X19<-wbdUS[,21] #pop female
X20<-wbdUS[,22] # pop male
X21<-wbdUS[,23] # rural pop
X22<-wbdUS[,24] # urban pop
X23<-wbdUS[,25] #survival to 65 age female
X24<-wbdUS[,26]  #survival to 65 age male
X25<-wbdUS[,27] #infant mortality rate
X26<-wbdUS[,28] #mortality rate adult female
X27<-wbdUS[,29] #mortality rate adult male
X28<-wbdUS[,30] #life exp female
X29<-wbdUS[,31] #life exp male


set.seed(101)
sampleUS <- sample.split(Y, SplitRatio = 0.80) # SplitRatio = percent of sample==TRUE

# Training Data
trainUS <- subset(wbdUS, sampleUS == TRUE)

# Testing Data
testUS <- subset(wbdUS, sampleUS == FALSE)

# training model
modelUS<-lm(Y ~ X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11+X12+X13+X14+X15+X16+X17+X18+X19+X20+X21+X22+X23+X24+X25+X26+X27+X28+X29,data = trainUS)

# Predicting on testing set
predictionsUS <- predict(modelUS,testUS)

# Comparing the predicted values and the actual values
resultsUS <- cbind(predictionsUS,testUS$`Life Expectancy (Years)`) 
colnames(resultsUS) <- c('predictedUS','actualUS')
resultsUS <- as.data.frame(resultsUS)

# MSE (mean squared error):
USmse <- mean((resultsUS$actualUS-resultsUS$predictedUS)^2)

#root mean squared error for US Health:
RMSE_H_US<- USmse^0.5

#------------------------------Linear regression- ECONOMY USA TABLE----------------------------------

# Split up the sample, basically randomly assigns a booleans to a new column "sample"

V<-ewbdUS[,44] #GDP per capita growth (annual %)
U1<-ewbdUS[,3] #Domestic credit to private sector(% of GDP)				 
U2<-ewbdUS[,4] # year
U3<-ewbdUS[,5] #Expense (% of GDP)
U4<-ewbdUS[,6] #Exports of goods and services (% of GDP)
U5<-ewbdUS[,7] #Exports of goods and services (Current US$)
U6<-ewbdUS[,8] #GDP growth (current US$)
U7<-ewbdUS[,9] #GDP growth (annual %)
U8<-ewbdUS[,10] #  GDP per capita growth (current US$)
U9<-ewbdUS[,11] #  Imports of goods and services (% of GDP)
U10<-ewbdUS[,12] #Gross savings (% of GDP)	
U11<-ewbdUS[,13] # Imports of goods and services (Current US$)
U12<-ewbdUS[,14] #Net Foreign assets (LCU)
U13<-ewbdUS[,15] # Net Income from abroad (Curent USD)
U14<-ewbdUS[,16] # Net Income from abroad (Current LCU)
U15<-ewbdUS[,17] #Patent applications (residents)
U16<-ewbdUS[,18]# Patent applications (non-residents)
U17<-ewbdUS[,19]#fisheries production (metric tons)
U18<-ewbdUS[,20]#total reserves (includes gold) Current USD
U19<-ewbdUS[,21]#total reserves (excludes gold) Current USD	
U20<-ewbdUS[,22]#Trade (% of gdp)
U21<-ewbdUS[,23]#Merchandise exports (current usd)
U22<-ewbdUS[,24]# Merchandise exports by reporting economy (current usd)
U23<-ewbdUS[,25]# Merchandise imports (current usd)
U24<-ewbdUS[,26]# 	 Merchandise imports by reporting economy (current usd)
U25<-ewbdUS[,27]#  Merchandise trade (% of gdp)
U26<-ewbdUS[,28]#  Military expenditure (% of gdp)
U27<-ewbdUS[,29]#  Military expenditure (current lcu)	
U28<-ewbdUS[,30]# Inflation consumer prices (annual %)
U29<-ewbdUS[,31]# Inflation GDP deflator(annual %)
U30<-ewbdUS[,32]# Gross national expenditure (current usd)	
U31<-ewbdUS[,33]#Gross national expenditure (%of gdp)
U32<-ewbdUS[,34]#Gross capital formation (current usd)
U33<-ewbdUS[,35]# Gross capital formation (% of GDP)
U34<-ewbdUS[,36]# Gross domestic savings (current usd)
U35<-ewbdUS[,37]#Gross domestic savings (% of gdp)
U36<-ewbdUS[,38]# Gross fixed capital formation (current usd)
U37<-ewbdUS[,39]#Gross fixed capital formation (% of gdp)
U38<-ewbdUS[,40]# Final consumption expenditure (current usd)
U39<-ewbdUS[,41]# Final consumption expenditure (% of gdp)
U40<-ewbdUS[,42]# External balance on goods and services (current usd)
U41<-ewbdUS[,43]#External balance on goods and services (% of gdp)
set.seed(101)

esampleUS <- sample.split(V, SplitRatio = 0.80) # SplitRatio = percent of sample==TRUE

# Training Data
etrainUS <- subset(ewbdUS, esampleUS == TRUE)

# Testing Data
etestUS <- subset(ewbdUS, esampleUS == FALSE)

# training model
emodelUS <- lm(V ~ U1+U2+U3+U4+U5+U6+U7+U8+U9+U10+U11+U12+U13+U14+U15+U16+U17+U18+U19+U20+U21+U22+U23+U24+U25+U26+U27+U28+U29+U30+U31+U32+U33+U34+U35+U36+U37+U38+U39+U40+U41,data = etrainUS)

# Predicting on testing set
epredictionsUS <- predict(emodelUS,etestUS)

# Comparing the predicted values and the actual values
eresultsUS <- cbind(epredictionsUS,etestUS$`GDP growth (annual %)` )
colnames(eresultsUS) <- c('epredictedUS','eactualUS')
eresultsUS <- as.data.frame(eresultsUS)

# MSE (mean squared error):
USemse <- mean((eresultsUS$eactualUS-eresultsUS$epredictedUS)^2)

# root mean squared error for US Economy:

RMSE_E_US<- USemse^0.5

#-------------------------linear regression - HEALTH (INDIA) DATA----------------------------------------

# Split up the sample, basically randomly assigns a booleans to a new column "sample"

Z<-wbdIN[,32] #Life Expectancy (Years)
W1<-wbdIN[,3] #Population
W2<-wbdIN[,4] # year 
W3<-wbdIN[,5] # fertility births per woman
W4<-wbdIN[,6] # birth rate
W5<-wbdIN[,7] #infant death rate
W6<-wbdIN[,8]  #gdp us $
W7<-wbdIN[,9] #gdp percapita us $
W8<-wbdIN[,10] #CO2 Emission (Kt)			 	 		 	 							 		 	 
W9<-wbdIN[,11] #Under five age deaths
W10<-wbdIN[,12] # Population 0-14 years female
W11<-wbdIN[,13] #Population 0-14 years male	
W12<-wbdIN[,14] # Population 0-14 years total
W13<-wbdIN[,15] #Population 15-64 years female
W14<-wbdIN[,16] # Population 15-64 years male
W15<-wbdIN[,17] #Population 15-64 years total
W16<-wbdIN[,18] #Population above 65 years female
W17<-wbdIN[,19] # Population above 65 years male	
W18<-wbdIN[,20] # Population above 65 years total
W19<-wbdIN[,21] # US population - female
W20<-wbdIN[,22] 	# US population - male
W21<-wbdIN[,23] # US rural population
W22<-wbdIN[,24] #US urban population
W23<-wbdIN[,25]  #US survival to age 65 female(%of cohort)
W24<-wbdIN[,26] 	# US survival to age 65 male(%of cohort)
W25<-wbdIN[,27]  #Mortality rate infant
W26<-wbdIN[,28] #Mortality rate adult female
W27<-wbdIN[,29]  #Mortality rate adult male
W28<-wbdIN[,30] #Life Expectancy female (Years)	
W29<-wbdIN[,31]  #Life Expectancy male (Years)
set.seed(101)

sampleIN <- sample.split(Z, SplitRatio = 0.80) # SplitRatio = percent of sample==TRUE

# Training Data
trainIN <- subset(wbdIN, sampleIN == TRUE)

# Testing Data
testIN <- subset(wbdIN, sampleIN == FALSE)

# training model
modelIN <- lm(Z ~ W1+W2+W3+W4+W5+W6+W7+W8+W9+W10+W11+W12+W13+W14+W15+W16+W17+W18+W19+W20+W21+W22+W23+W24+W25+W26+W27+W28+W29,data = trainIN)

# Predicting on testing set
predictionsIN <- predict(modelIN,testIN)

# Comparing the predicted values and the actual values
resultsIN <- cbind(predictionsIN,testIN$`Life Expectancy (Years)`) 
colnames(resultsIN) <- c('predictedIN','actualIN')
resultsIN <- as.data.frame(resultsIN)

# MSE (mean squared error):
INmse <- mean((resultsIN$actualIN-resultsIN$predictedIN)^2)

# Root mean squared error for India Health:
RMSE_H_IN<- INmse^0.5


#------------------------------Linear regression- ECONOMY INDIA TABLE----------------------------------

# Split up the sample, basically randomly assigns a booleans to a new column "sample"

R<-ewbdIN[,42] #GDP per capita growth (annual %)
S1<-ewbdIN[,3]# Domestic credit to private sector(% of GDP)			 	
S2<-ewbdIN[,4]#year
S3<-ewbdIN[,5]#Expense (% of GDP)
S4<-ewbdIN[,6]#	 Exports of goods and services (% of GDP)
S5<-ewbdIN[,7]#  Exports of goods and services (Current US$)
S6<-ewbdIN[,8]#  GDP growth (current US$)
S7<-ewbdIN[,9]#  GDP growth (annual %)
S8<-ewbdIN[,10]# GDP per capita growth (current US$)
S9<-ewbdIN[,11]# Imports of goods and services (% of GDP)
S10<-ewbdIN[,12]# Gross savings (% of GDP)	
S11<-ewbdIN[,13]# Imports of goods and services (Current US$)
S12<-ewbdIN[,14]# Net Foreign assets (LCU)
S13<-ewbdIN[,15]#Net Income from abroad (Curent USD)
S14<-ewbdIN[,16]# Net Income from abroad (Current LCU)
S15<-ewbdIN[,17]#fisheries production (metric tons)
S16<-ewbdIN[,18]#total reserves (includes gold) Current USD	
S17<-ewbdIN[,19]#	 total reserves (excludes gold) Current USD	
S18<-ewbdIN[,20]# Trade (% of gdp)
S19<-ewbdIN[,21]#	 Merchandise exports (current usd)	
S20<-ewbdIN[,22]#  Merchandise exports by reporting economy (current usd)
S21<-ewbdIN[,23]# Merchandise imports (current usd)
S22<-ewbdIN[,24]#  Merchandise imports by reporting economy (current usd)
S23<-ewbdIN[,25]# Merchandise trade (% of gdp)
S24<-ewbdIN[,26]#Military expenditure (% of gdp)
S25<-ewbdIN[,27]#Military expenditure (current lcu)	
S26<-ewbdIN[,28]#Inflation consumer prices (annual %)	
S27<-ewbdIN[,29]# Inflation GDP deflator(annual %)
S28<-ewbdIN[,30]#Gross national expenditure (current usd)
S29<-ewbdIN[,31]# Gross national expenditure (%of gdp)
S30<-ewbdIN[,32]#Gross capital formation (current usd)
S31<-ewbdIN[,33]#	 Gross capital formation (% of GDP)
S32<-ewbdIN[,34]#Gross domestic savings (current usd)
S33<-ewbdIN[,35]#Gross domestic savings (% of gdp)
S34<-ewbdIN[,36]#Gross fixed capital formation (current usd)
S35<-ewbdIN[,37]# Gross fixed capital formation (% of gdp)
S36<-ewbdIN[,38]# Final consumption expenditure (current usd)
S37<-ewbdIN[,39]# Final consumption expenditure (% of gdp)
S38<-ewbdIN[,40]#External balance on goods and services (current usd)
S39<-ewbdIN[,41]# External balance on goods and services (% of gdp)

set.seed(101)

esampleIN <- sample.split(R, SplitRatio = 0.80) # SplitRatio = percent of sample==TRUE

# Training Data
etrainIN <- subset(ewbdIN, esampleIN == TRUE)

# Testing Data
etestIN <- subset(ewbdIN, esampleIN == FALSE)

# training model
emodelIN <- lm(R ~ S1+S2+S3+S4+S5+S6+S7+S8+S9+S10+S11+S12+S13+S14+S15+S16+S17+S18+S19+S20+S21+S22+S23+S24+S25+S26+S27+S28+S29+S30+S31+S32+S33+S34+S35+S36+S37+S38+S39,data = etrainIN)

# Predicting on testing set
epredictionsIN <- predict(emodelIN,etestIN)

# Comparing the predicted values and the actual values
eresultsIN <- cbind(epredictionsIN,etestIN$`GDP growth (annual %)` )
colnames(eresultsIN) <- c('epredictedIN','eactualIN')
eresultsIN <- as.data.frame(eresultsIN)

# MSE (mean squared error):
INemse <- mean((eresultsIN$eactualIN-eresultsIN$epredictedIN)^2)

# root mean squared error for India Economy:
RMSE_E_IN<-INemse^0.5

#-----------------------DATA VISUALIZATION----------------------------------------------------------
# Scatterplot for Mortality Rate Vs US Life Expectancy Rate wbdUS
g1<- ggplot(data= wbdUS, aes(x=X27, y=Y)) +
  labs(subtitle="Mortality Rate Vs US Life Expectancy Rate",y="US Life Expectancy",x="Mortality Rate",title="Scatterplot",caption = "Source: wbdUS")

g2<- g1 + geom_point(color='darkblue')


# Scatterplot for Mortality Rate Vs IN Life Expectancy Rate wbdIN
g3<- ggplot(data= wbdIN, aes(x=W27, y=Z)) +
  labs(subtitle="Mortality Rate Vs IN Life Expectancy Rate",y="IN Life Expectancy",x="Mortality Rate",title="Scatterplot",caption = "Source: wbdIN")

g4<- g3 + geom_point(color='darkblue')

# Scatterplot for year Vs US Life Expectancy Rate wbdUS
g5<- ggplot(data= wbdUS, aes(x=X2, y=Y)) +
  labs(subtitle="Year Vs US Life Expectancy Rate",y="US Life Expectancy",x="year",title="Scatterplot",caption = "Source: wbdUS")

g6<- g5 + geom_point(color='darkblue')

# Scatterplot for year Vs US Life Expectancy Rate wbdIN
g7<- ggplot(data= wbdIN, aes(x=W2, y=Z)) +
  labs(subtitle="Year Vs IN Life Expectancy Rate",y="IN Life Expectancy",x="Year",title="Scatterplot",caption = "Source: wbdIN")

g8<- g7 + geom_point(color='darkblue')

# Scatterplot for Exports of goods and services Vs GDP Growth ewbdUS
g9<- ggplot(data= ewbdUS, aes(x=U5, y=U6)) +
  labs(subtitle=" Exports of goods and services Vs GDP Growth (US)",y="GDP growth",x="Exports of goods and services",title="Scatterplot",caption = "Source: ewbdUS")

g10<- g9 + geom_point(color='darkblue')

# Scatterplot for year Vs GDP Growth ewbdUS
g11<- ggplot(data= ewbdUS, aes(x=U2, y=U6)) +
  labs(subtitle=" year Vs GDP Growth (US)",y="GDP growth",x="Year",title="Scatterplot",caption = "Source: ewbdUS")

g12<- g11 + geom_point(color='darkblue')

# Scatterplot for Exports of goods and services Vs GDP Growth ewbdIN
g13<- ggplot(data= ewbdIN, aes(x=S5, y=S6)) +
  labs(subtitle=" Exports of goods and services Vs GDP Growth (IN)",y="GDP growth",x="Exports of goods and services",title="Scatterplot",caption = "Source: ewbdIN")

g14<- g13 + geom_point(color='darkblue')
plot(g14)


# Scatterplot for year Vs GDP Growth ewbdIN
g15<- ggplot(data= ewbdIN, aes(x=S2, y=S6)) +
  labs(subtitle=" year Vs GDP Growth (IN)",y="GDP growth",x="Year",title="Scatterplot",caption = "Source: ewbdIN")

g16<- g15 + geom_point(color='darkblue')
plot(g16)

# Correlation matrix for wbdUS
# Grab only numeric columns
num.cols1 <- sapply(wbdUS, is.numeric)
# Filter to numeric columns for correlation
corrUS <- cor(wbdUS[,num.cols1])

# Correlation matrix for wbdIN
# Grab only numeric columns
num.cols3 <- sapply(wbdIN, is.numeric)
# Filter to numeric columns for correlation
corrIN <- cor(wbdIN[,num.cols3])

#-------------------------------------------------------SERVER FUNCTION -----------------------------------------------

server <- function(input,output){
  
  ## Get the value of the dataset that is selected by user from the list of datasets
  data <- reactive({
    switch(input$dataset,
           "US HEALTH" = wbdUS,
           "US ECONOMY" = ewbdUS,
           "IN HEALTH" = wbdIN,
           "IN ECONOMY" = ewbdIN
    )
  })
  
  ## to output the dataset
  output$dat <- renderTable({
    data()
  })
  
  
  # to output the structure of the dataset
  output$struct <- renderPrint({
    
    str(data())
  })
  
  # for summary
  output$summary <- renderPrint({
    
    summary(data())
  })
  
  output$Summary_model <- renderPrint({
    paste("you have selected",input$var1)
    switch(input$var1,
           "US HEALTH SUMMARY" = summary(modelUS),
           "US ECONOMY SUMMARY" = summary(emodelUS),
           "IN HEALTH SUMMARY" = summary(modelIN),
           "IN ECONOMY SUMMARY" = summary(emodelUS)
    )
    
  })  
  
  output$prediction_model <- renderTable({
    paste("you have selected",input$var2)
    switch(input$var2,
           "US HEALTH PREDICTIONS" = resultsUS,
           "US ECONOMY PREDICTIONS" = eresultsUS,
           "IN HEALTH PREDICTIONS" = resultsIN,
           "IN ECONOMY PREDICTIONS" = eresultsIN
    )
    
  })  
  
  output$error_rate <- renderPrint({
    paste("you have selected",input$var3)
    switch(input$var3,
           "US HEALTH ERRORRATE" = RMSE_H_US,
           "US ECONOMY ERRORRATE" = RMSE_E_US,
           "IN HEALTH ERRORRATE" = RMSE_H_IN,
           "IN ECONOMY ERRORRATE" = RMSE_E_IN
    )
    
  }) 
  
  output$plots <- renderPlot({
    paste("you have selected",input$var4)
    switch(input$var4,
           "Mortality Rate Vs US Life Expectancy Rate" = plot(g2),
           "Mortality Rate Vs IN Life Expectancy Rate" = plot(g4),
           "Year Vs US Life Expectancy Rate" = plot(g6),
           "Year Vs IN Life Expectancy Rate" = plot(g8),
           " Exports of goods and services Vs GDP Growth (US)" = plot(g10),
           "year Vs GDP Growth (US)" = plot(g12),
           " Exports of goods and services Vs GDP Growth (IN)" = plot(g14),
           "year Vs GDP Growth (IN)" = plot(g16),
           "US HEALTH CORRPLOT" = corrplot(corrUS,method='color',t1.cex=0.5) ,
           "IN HEALTH CORRPLOT" =  corrplot(corrIN,method='color',t1.cex=0.5)
           
           
    )
    
  }) 

}

#--------------------------------------------------------UI FUNCTION--------------------------------------------------

ui <- fluidPage(pageWithSidebar(
  headerPanel(h1("ANALYTICS APPLICATION")),
  
  sidebarPanel(
    h4("Welcome To WDI Health and Economy Analytics."),
    ## conditionalPanel() functions for selected tab
    conditionalPanel(condition="input.tabselected==1",("")),
    conditionalPanel(condition="input.tabselected==2",
                     selectInput(inputId = "dataset", "select the desired dataset", c("US HEALTH","US ECONOMY","IN HEALTH","IN ECONOMY"), 
                                 selected = "US HEALTH"),
                     
                     radioButtons(inputId = "choice","Choose an option", choices=c("Dataset" = 1, "Structure" = 2,
                                                                                   "Summary" = 3 ))
                     
    ),
    conditionalPanel(condition="input.tabselected==3",
                     selectInput(inputId = "var1", "select the desired dataset to view it's model", c("US HEALTH SUMMARY","US ECONOMY SUMMARY","IN HEALTH SUMMARY","IN ECONOMY SUMMARY"), 
                                 selected = "US HEALTH SUMMARY"),
            ('Y<-Life Expectancy (Years)
X1<-Population,X2<-year,X3<-fertility (births per woman),X4<-birth rate ,X5<-infant deaths  ,X6<-gdp us$,X7<-gdp percapita us $ ,
X8<-co2 emission kt ,X9<-under 5 age deaths,X10<-pop 0-14 female ,X11<-pop 0-14 male ,X12<-pop 0-14 total ,X13<-pop 15-64 female ,X14<-pop 15-64 male  ,
X15<-pop 15-64 total, X16<-pop above 65 female,X17<-pop above 65 male ,X18<-pop above 65 total,X19<-pop female  ,X20<- pop male X21<- rural pop,
X22<-urban pop ,X23<-survival to 65 age female ,X24<-survival to 65 age male,X25<-infant mortality rate,X26<-mortality rate adult female,X27<-mortality rate adult male,X28<-life exp female  ,
X29<-life exp male;
---------
V<-GDP per capita growth (annual %),U1<-ewbdUS[,3] #Domestic credit to private sector(% of GDP)	, U2<- year, U3<-Expense (% of GDP), U4<-Exports of goods and services (% of GDP),U5<-Exports of goods and services (Current US$),
U6<-GDP growth (current US$), U7<-GDP growth (annual %),  U8<- GDP per capita growth (current US$),  U9<-  Imports of goods and services (% of GDP), U10<-Gross savings (% of GDP)	,
U11<-Imports of goods and services (Current US$) , U12<-Net Foreign assets (LCU),  U13<- Net Income from abroad (Curent USD),  U14<-Net Income from abroad (Current LCU) , U15<-Patent applications (residents),
U16<- Patent applications (non-residents) ,U17<-fisheries production (metric tons) ,  U18<-total reserves (includes gold) Current USD,  U19<-total reserves (excludes gold) Current USD	, U20<-Trade (% of gdp),
U21<-Merchandise exports (current usd), U22<- Merchandise exports by reporting economy (current usd), U23<-Merchandise imports (current usd), U24<-	 Merchandise imports by reporting economy (current usd),  U25<-  Merchandise trade (% of gdp),
U26<-  Military expenditure (% of gdp), U27<-Military expenditure (current lcu)	, U28<- Inflation consumer prices (annual %), U29<-Inflation GDP deflator(annual %), U30<- Gross national expenditure (current usd)	,
U31<-Gross national expenditure (%of gdp),  U32<-Gross capital formation (current usd), U33<-Gross capital formation (% of GDP),  U34<- Gross domestic savings (current usd),  U35<-Gross domestic savings (% of gdp),
U36<-Gross fixed capital formation (current usd),  U37<-Gross fixed capital formation (% of gdp), U38<- Final consumption expenditure (current usd),  U39<- Final consumption expenditure (% of gdp), U40<External balance on goods and services (current usd)
U41<-External balance on goods and services (% of gdp)        
---------
Y<-Life Expectancy (Years), W1<-Population,W2<-year,W3<-fertility (births per woman),W4<-birth rate ,W5<-infant deaths  ,W6<-gdp us$,W7<-gdp percapita us $ ,
W8<-co2 emission kt ,W9<-under 5 age deaths,W10<-pop 0-14 female ,W11<-pop 0-14 male ,W12<-pop 0-14 total ,W13<-pop 15-64 female ,W14<-pop 15-64 male  ,
W15<-pop 15-64 total, W16<-pop above 65 female,W17<-pop above 65 male ,W18<-pop above 65 total,W19<-pop female  ,W20<- pop male, W21<- rural pop,
W22<-urban pop ,W23<-survival to 65 age female ,W24<-survival to 65 age male,W25<-infant mortality rate,W26<-mortality rate adult female,W27<-mortality rate adult male,W28<-life exp female  ,
W29<-life exp male;
----------
R<-GDP per capita growth (annual %), S1<- Domestic credit to private sector(% of GDP),S2<-year, S3<-Expense (% of GDP), S4<-	 Exports of goods and services (% of GDP),  S5<-  Exports of goods and services (Current US$),
S6<- GDP growth (current US$), S7<- GDP growth (annual %), S8<- GDP per capita growth (current US$),  S9<- Imports of goods and services (% of GDP), S10<-Gross savings (% of GDP)	,
S11<- Imports of goods and services (Current US$), S12<- Net Foreign assets (LCU),  S13<-Net Income from abroad (Curent USD),  S14<-Net Income from abroad (Current LCU),  S15<-fisheries production (metric tons),
S16<-total reserves (includes gold) Current USD	,S17<-	 total reserves (excludes gold) Current USD	,  S18<-Trade (% of gdp), S19<-	 Merchandise exports (current usd)	S20<-  Merchandise exports by reporting economy (current usd),
S21<- Merchandise imports (current usd), S22<-  Merchandise imports by reporting economy (current usd), S23<- Merchandise trade (% of gdp), S24<-Military expenditure (% of gdp), S25<-Military expenditure (current lcu)	,
S26<-Inflation consumer prices (annual %)	, S27<-Inflation GDP deflator(annual %), S28<-Gross national expenditure (current usd), S29<- Gross national expenditure (%of gdp),  S30<-Gross capital formation (current usd),
S31<-	 Gross capital formation (% of GDP), S32<-Gross domestic savings (current usd),  S33<-Gross domestic savings (% of gdp),S34<-Gross fixed capital formation (current usd),  S35<-Gross fixed capital formation (% of gdp),
S36<-Final consumption expenditure (current usd), S37<- Final consumption expenditure (% of gdp), S38<-External balance on goods and services (current usd),
S39<- External balance on goods and services (% of gdp)         
             
                   ')
            
    ),
    conditionalPanel(condition="input.tabselected==4",
                     selectInput(inputId = "var2", "select the desired predictions dataset", c("US HEALTH PREDICTIONS","US ECONOMY PREDICTIONS","IN HEALTH PREDICTIONS","IN ECONOMY PREDICTIONS"), 
                                 selected = "US HEALTH PREDICTIONS")
                     
    ),
    conditionalPanel(condition="input.tabselected==5",
                     selectInput(inputId = "var3", "select the desired dataset to view the error rate (root mean squared error)", c("US HEALTH ERRORRATE","US ECONOMY ERRORRATE","IN HEALTH ERRORRATE","IN ECONOMY ERRORRATE"), 
                                 selected = "US HEALTH ERRORRATE")
                     
    ),
    conditionalPanel(condition="input.tabselected==6",
                     selectInput(inputId = "var4", "select the Visualization you wish to view", c("Mortality Rate Vs US Life Expectancy Rate",  "Mortality Rate Vs IN Life Expectancy Rate",   "Year Vs US Life Expectancy Rate", "Year Vs IN Life Expectancy Rate",
                                                                                                  " Exports of goods and services Vs GDP Growth (US)",  "year Vs GDP Growth (US)", " Exports of goods and services Vs GDP Growth (IN)",  "year Vs GDP Growth (IN)",
                                                                                                  "US HEALTH CORRPLOT", "IN HEALTH CORRPLOT"),
                                  selected="Mortality Rate Vs US Life Expectancy Rate")
  )
  ),
  mainPanel(
    # recommend review the syntax for tabsetPanel() & tabPanel() for better understanding
    # id argument is important in the tabsetPanel()
    # value argument is important in the tabPanle()
    tabsetPanel(
      tabPanel("About", value=1,   helpText("Welcome to our Application which focuses on analytics and predictions on World Development Indicators produced by World Bank. 
                                            ")),
      tabPanel("Data", value=2, conditionalPanel(condition="input.choice==1", tableOutput(outputId = "dat")),
               conditionalPanel(condition="input.choice==2", verbatimTextOutput(outputId = "struct")),
               conditionalPanel(condition="input.choice==3", verbatimTextOutput(outputId = "summary"))),
      tabPanel("Model Summary of desired dataset ", value=3, verbatimTextOutput(outputId = "Summary_model")),
      tabPanel("Predictions", value=4, tableOutput(outputId = "prediction_model")),
      tabPanel("Error-rate of predicted data", value=5, verbatimTextOutput(outputId = "error_rate")),
      tabPanel("Visualizations", value=6, plotOutput(outputId = "plots")       
      ), 
      
      
      
      
      id = "tabselected"
      )
)
)
)
#------------------------------------------------------------SHINY APP CALL------------------------------------------------
shinyApp(ui=ui,server=server)
