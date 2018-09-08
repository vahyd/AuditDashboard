pageWithSidebar(
  headerPanel('Audit Dashboard'),
  sidebarPanel(
    selectInput('year', 'Select Year',choices = c("All",(unique(MyData$Report.year))),selected = "All"),
    
    selectInput('sector', 'Select Sector', choices = c("All",levels(unique(MyData$sector))),selected = "All")
                
  ),
  mainPanel(
    dataTableOutput('table')
  )
)
