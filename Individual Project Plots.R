DataDf <- read.csv('df.csv', header=TRUE)

install.packages('rworldmap')
library(rworldmap)


par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i") 

sPDF <- joinCountryData2Map( DataDf,
                             joinCode = "NAME",
                             nameJoinColumn = "Country")
#mapCountryData( sPDF, nameColumnToPlot="Access_to_Electricity" )

#creating a user defined colour palette 
op <- palette(c('green','yellow','orange','red')) 
#find quartile breaks 
cutVector <- quantile(sPDF@data[["Access_to_Electricity"]],na.rm=TRUE) 
#classify the data to a factor 

sPDF@data[["Access_to_Electricity"]] <- cut(sPDF@data[["Access_to_Electricity"]], cutVector, include.lowest=TRUE ) 
#rename the categories 
levels(sPDF@data[["Access_to_Electricity"]]) <- c('low', 'med', 'high', 'vhigh') 
#mapping
mapCountryData(sPDF, nameColumnToPlot= "Access_to_Electricity",catMethod="categorical", mapTitle="Access to Electricity Categories", colourPalette="palette", oceanCol="lightblue", missingCountryCol="white")








# df <- data.matrix(DataDf)
# 
# elecAccess <- c("Country", "Access_to_Electricity")
# newdf <- df[elecAccess]
# 
# accessSub <- subset(DataDf, select = Access_to_Electricity)
# access <- data.matrix(accessSub)
# 
# GDPSub <- subset(DataDf, select = GDP)
# GDP <- data.matrix(GDPSub)
# 
# energySub <- subset(DataDf, select = Energy_per_GDPunit) 
# energy <- data.matrix(energySub)
# 
# USGDPSub <- subset(USGDPDf, Year >= 1976, select = US_GDP)
# USGDPSub <- data.matrix(USGDPSub)
# 
# 
# 
# # Plot US GDP over the same date range
# plot(GDP, access, type="o", col="red", ylab="US GDP (Trillion $)", xlab="Year")
# title(main='US GDP 1976-2015')
# 
# # Plot unemployment rate for a state
# plot(energy, access, type="o", col="blue", ylab="State Unemployment Rate (%)", xlab="Year")
# title(main="State Unemployment Rate 1976-2015")
# 
# # Plot US GDP vs a single state unemployment rate
# plot(GDP, energy, type="o", col="purple", ylab="State Unemployment Rate (%)", xlab="US GDP  (Trillion $)")
# title(main="State Unemployment Rate 1976-2015")
# 
# # Plot unemployment rates for all states over time
# stateDf <- read.csv('allStatesAnnually.csv', header=TRUE)
# allStateSub <- subset(stateDf, year >= 1976) 
# plot(year, allStateSub[,2],type="l", ylab="State Unemployment Rates (%)", xlab="Year")
# title(main="State Unemployment Rates 1976-2015")
# for ( i in seq(3,length( allStateSub ),1) )
#   lines(year, allStateSub[,i],type="l",col=sample(rainbow(50)))
# 
# 
