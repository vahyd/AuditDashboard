if(!require(plotly)){   install.packages("plotly")   
  library(plotly) }
if(!require(shiny)){   install.packages("shiny")   
  library(shiny) }

# Read CSV into R

MyPath <- paste(getwd(),"sample_data.csv",sep="/")
MyData <- as.data.frame(read.csv(MyPath, header=TRUE, sep=","))

map <- read.csv(paste(getwd(),"map.csv",sep="/"), encoding = 'UTF-8')


