function(input, output, session) {
  
  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    if(input$year != "All" && input$sector != "All"){
      temp = MyData[MyData$Report.year == input$year,]
      temp[temp$sector== input$sector, ]
    }else if(input$year == "All" && input$sector == "All")
      MyData
    else if (input$sector == "All")
      MyData[MyData$Report.year == input$year, ]
    else if (input$year == "All")
      MyData[MyData$sector == input$sector, ]
  })
  
  output$table <- renderDataTable(selectedData())
  
}
