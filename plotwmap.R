library(rworldmap)

plotWmap <- function(){
  cf = read.csv("cf.csv")
  cf$forest_chg = cf$forest_chg * -1
  sPDF <- joinCountryData2Map(cf
                              ,joinCode="NAME"
                              ,nameJoinColumn="country")
  colourPalette <- c('palegreen'
                     ,'yellow'
                     ,'orange'
                     ,'orangered'
                     ,'darkred'
                     )
  png("wmap.png", width = 640, height=640)
  mapParams <- mapCountryData(sPDF
                              ,nameColumnToPlot='forest_chg'
                              ,catMethod='categorical'
                              ,colourPalette=colourPalette
                              ,addLegend=FALSE
                              ,mapTitle='Deforestation')
  legend("left", c('best','good','medium','bad','worst'), fill=colourPalette, bg='white')
  dev.off()
}