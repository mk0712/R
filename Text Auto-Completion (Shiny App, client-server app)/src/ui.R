# ui.R
library(shiny)

shinyUI(fluidPage(
  
  titlePanel("JHU - Data Science Specialization"),
  
  sidebarLayout(
    
    sidebarPanel(
      #helpText("Predict Next Word"),
      textInput(inputId="ngram", label = "Input Text", value="Enter text here")
      #,actionButton("doPrediction", "Predict Next Word")
    ),
    
    mainPanel(
      p('Predicted next word:'),
      textOutput("result")            
    )
 
  )

))