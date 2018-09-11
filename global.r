if(!require(plotly)){   install.packages("plotly")   
  library(plotly) }
if(!require(shiny)){   install.packages("shiny")   
  library(shiny) }
if(!require(leaflet)){   install.packages("leaflet")   
  library(leaflet) }

# Read CSV into R

MyPath <- paste(getwd(),"sample_data.csv",sep="/")
MyData <- as.data.frame(read.csv(MyPath, header=TRUE, sep=","))

map1 <- read.csv(paste(getwd(),"map.csv",sep="\\"), encoding = 'UTF-8')
map2 <- read.csv(paste(getwd(),"lat-long.csv",sep="\\"), encoding = 'UTF-8')

map <- merge(x = map1, y = map2, by = "CODE", all.x = TRUE)
map <- map[,-ncol(map)]
map <- map[,-6]
colnames(map)[2] <- "country"


map2 <- merge(x = MyData, y = map, by = "country", all.x = TRUE)
