if (!require(quantmod)) {
  stop("This app requires the quantmod package. To install it, run 'install.packages(\"quantmod\")'.\n")
}

# Download data for a stock if needed, and return the data
require_symbol <- function(symbol, envir = parent.frame()) {
  if (is.null(envir[[symbol]])) {
    envir[[symbol]] <- getSymbols(symbol, auto.assign = FALSE)
  }

  envir[[symbol]]
}


shinyServer(function(input, output) {

  # Create an environment for storing data
  symbol_env <- new.env()


  
  # Make a chart for a symbol, with the settings from the inputs
   make_chart <- function() {
    symbol_data <- require_symbol(input$mystock, symbol_env)
    
    myta="NULL"
    if (input$rsi){myta="addRSI()"}

    chartSeries(symbol_data,
   	name      = input$mystock,
		type      = input$chart_type,
		subset    = paste(input$daterange, collapse = "::"),
    TA=myta,
		theme     = "white")

		if(input$bbands){addBBands()}

  }

  output$plot_stock = renderPlot({ make_chart()})
  
})
