# Load libraries:
library(shiny)
library(data.table)
# Load R scripts:
#source("./scripts/prediction.R")
source("./scripts/prediction2.R")

## Load data images:
##load("./data_images/CapstoneImage_.Rdata")
bi.dt = data.table( read.csv(file="./data_images/english_bigram.csv", header=TRUE, sep = ";") )
tri.dt = data.table( read.csv(file="./data_images/english_trigram.csv", header=TRUE, sep=";") )
setkey(bi.dt, v)
setkey(tri.dt, uv)
#stmt="Talking to your mom has the same effect as a hug and helps reduce your"



# Shiny Server:
shinyServer(
  
  function(input, output) { #input=ngram; output=next word
    
    #sentence1 = "Talking to your mom has the same effect as a hug and helps reduce your"
    #choices1 = "happiness stress sleepiness hunger"
    
    #output$prediction <- as.character(predictNextWord(modKatz.l, sentence1, choices1))
    #nextWord <- predictNextWord(modKatz.l, sentence1, choices1)
    
    #output$prediction <- nextWord
    
    output$result <- renderText(
      #textOutput(nextWord)
      #input$doPrediction,
      #isolate(paste(as.numeric(23))) 
      
      #prediction.R:
      #sprintf(predictNextWord(modKatz.l, input$ngram, choices1))
      
      #prediction2.R:
      sprintf(predictNextWord(input$ngram, tri.dt, bi.dt))
      
    )
    
  }
  
)





#shinyServer(
 # function(input, output) {
    
    #output$map <- renderPlot({
      
      #percent_map( # some arguments )
    #})
    
  #}
    #)