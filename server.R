function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    MyData = MyData[MyData$Report.year == "2017", ]
  })
  
  output$table <- renderDataTable(MyData)
  
}
