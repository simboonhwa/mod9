shinyUI(pageWithSidebar(
  headerPanel("Stocks TA"),



  sidebarPanel(
    textInput(inputId="mystock", label="Stock", value = "ORCL"),

    wellPanel(
      p(strong("Technical Analysis")),       
      checkboxInput(inputId = "rsi", label = "RSI", value = FALSE),
      checkboxInput(inputId = "bbands", label = "BBands",value = FALSE)
    ),

    selectInput(inputId = "chart_type", label = "Chart type", choices = c("Candlestick" = "candlesticks", "Matchstick" = "matchsticks", "Bar" = "bars", "Line" = "line")),

  
    dateRangeInput(inputId = "daterange", label = "Date range", start = Sys.Date() - 365, end = Sys.Date()),
    
    checkboxInput(inputId = "log_y", label = "log y axis", value = FALSE)
  ),

 

  mainPanel(
      
    conditionalPanel(condition = "input.mystock",
    br(),
    plotOutput(outputId = "plot_stock"))
  )
))
