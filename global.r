# Read CSV into R

MyPath <- paste(getwd(),"sample_data.csv",sep="/")
MyData <- as.data.frame(read.csv(MyPath, header=TRUE, sep=","))

