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
  
  seletedMap <- reactive({
    tmpMap <- map
    tmpData <- selectedData()
    
    if(nrow(tmpData)!=0)  {
      
      tmpData["Count"] <-1
      MyDataAgg = aggregate(tmpData$Count,list(tmpData$country),FUN = sum)
      colnames(MyDataAgg) <- c("country","numbber.of.reports")
      
      l = 1
      for (i in MyDataAgg$country){
        tmpMap[tmpMap$COUNTRY == i,][3] = MyDataAgg$numbber.of.reports[l]
        l= l + 1
      }
      
    }
    tmpMap  
    
  })
  
  seletedMap2 <- reactive({
    
    tmpData <- selectedData()
    tmpMap <- merge(x = tmpData, y = map, by = "country", all.x = TRUE)
    tmpMap
    
  })
  
  output$map2 <- renderLeaflet({
    leaflet(map2) %>% addTiles() %>% fitBounds(~min(long), ~min(lat), ~max(long), ~max(lat))
  })

  observeEvent(c(input$year,input$sector), {
    leafletProxy("map2") %>% clearMarkerClusters()
    leafletProxy("map2") %>% addMarkers(
      data = seletedMap2(),
      popup = ~sprintf("Country = %s Sector = %s Year = %s", country, sector, Report.year), layerId = rownames(seletedMap2()),
      clusterOptions = markerClusterOptions(), clusterId = "cluster1"
    )
  })
  
  
  output$table <- renderDataTable(selectedData())
  
  output$plot <- renderPlotly({
    # light grey boundaries
    l <- list(color = toRGB("grey"), width = 1)
    
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
    
    p <- plot_geo(seletedMap()) %>%
      add_trace(
        z = ~NUM, color = ~NUM, colors = 'Blues',
        text = ~COUNTRY, locations = ~CODE, marker = list(line = l), showscale=FALSE
      ) %>%
      layout( title = 'Number of Reports per Country') %>%
      layout(showlegend = TRUE, legend = list(font = list(size = 30)))%>%
      
      layout(
        geo = g
      )
    
  })
  
}
