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
  
  
  output$plot <- renderPlotly({
    # light grey boundaries
    l <- list(color = toRGB("grey"), width = 0.5)
    
    # specify map projection/options
    g <- list(
      showframe = FALSE,
      showcoastlines = FALSE,
      #projection = list(type = 'Mercator'),
      showframe = FALSE,
      showcoastlines = FALSE,
      showland = FALSE,
      showcountries = TRUE,
      showocean = FALSE,
      
      projection = list(type = 'equirectangular', scale =1)
    )
    
    p <- plot_geo(df) %>%
      add_trace(
        z = ~NUM, color = ~NUM, colors = 'Blues',
        text = ~COUNTRY, locations = ~CODE, marker = list(line = l)
      ) %>%
      layout(showlegend = TRUE, legend = list(font = list(size = 30)))%>%
      
      layout(
        geo = g
      )
    
  })
  
}
