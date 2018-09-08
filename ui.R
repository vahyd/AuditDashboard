pageWithSidebar(
  headerPanel('Audit Dashboard'),
  sidebarPanel(
    selectInput('year', 'Select Year', MyData['Report.year']),
    selectInput('sector', 'Select Sector', MyData['sector'])
                
  ),
  mainPanel(
    dataTableOutput('table')
  )
)
