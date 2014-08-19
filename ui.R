library(shiny)

#Definition for UI

shinyUI(fluidPage(
  titlePanel("Sample Size Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("pop", label=h5("Population Size"),
                   value=100000),
      
      numericInput("stdev", label=h5("Expected Sample proportion (in %)"),
                   value=50),
      
      numericInput("moe", label=h5("Margin of Error (in %)"),
                   value=5),
      
      selectInput("clevel", label = h3("Confidence Level"), 
                  choices = list("90%" = 1, "95%" = 2,
                                 "99%" = 3), selected=2),
      
      submitButton("Submit")
      ),
    
  mainPanel(
    h3("Calculation Information"),
    h5("Assumption: You are making an assumption that the population you are measuring is normally distributed"),
    h6("Population size: Enter population size you are measuring; sample size doesn't change much after 100,000"),
    h6("Sample proportion: What is the expected proportion you expect your sample to represent; if unsure, leave it at 50%"),
    h6("Margin of Error: Level of precision you want your results to be, in (+/-)% form"),
    h6("Confidence LEvel: How confident to do you want to be in your results"),
    br(),
    br(),
    h5("Your population size is "),
    verbatimTextOutput("text")
  
  )
  
)))