if(!require(ploylt)){   install.packages("plotly")   library(plotly) }
if(!require(shiny)){   install.packages("shiny")   library(shiny) }

# Read CSV into R

MyPath <- paste(getwd(),"sample_data.csv",sep="/")
MyData <- as.data.frame(read.csv(MyPath, header=TRUE, sep=","))

df <- read.csv(paste(getwd(),"map.csv",sep="/"), encoding = 'UTF-8')
