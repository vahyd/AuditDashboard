if(!require(plotly)){   install.packages("plotly")   
  library(plotly) }
if(!require(shiny)){   install.packages("shiny")   
  library(shiny) }

# Read CSV into R

MyPath <- paste(getwd(),"sample_data.csv",sep="/")
MyData <- as.data.frame(read.csv(MyPath, header=TRUE, sep=","))

df <- read.csv(paste(getwd(),"map.csv",sep="/"), encoding = 'UTF-8')

MyData["Count"] <-1
MyDataAgg = aggregate(MyData$Count,list(MyData$country),FUN = sum)
colnames(MyDataAgg) <- c("country","numbber.of.reports")

l = 1
for (i in MyDataAgg$country){
  df[df$COUNTRY == i,][3] = MyDataAgg$numbber.of.reports[l]
  l= l + 1
}