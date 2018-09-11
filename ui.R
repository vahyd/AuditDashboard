fluidPage(
  titlePanel('Audit Dashboard'),
  fluidRow(
    column(4,
           selectInput('year', 'Select Year',choices = c("All",(unique(MyData$Report.year))),selected = "All")
    
    ),
    column(4,
           selectInput('sector', 'Select Sector', choices = c("All",levels(unique(MyData$sector))),selected = "All")
    )
    ),
    fluidRow(
    
    
    #plotlyOutput("plot"),
    leafletOutput("map2"),
    dataTableOutput('table')
  )
)
