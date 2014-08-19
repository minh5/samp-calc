

library(shiny)

calc<-function(pop,clevel,stdev,moe){
  if(clevel==1){
    zstar<-qnorm(.90)
  }
  else if(clevel==2){
    zstar<-qnorm(.95)
  }
  else if(clevel==3){
    zstar<-qnorm(.99)
  }
  p<-stdev/100
  E<-moe/100
  x<-(zstar^2)*p*(1-p)/E^2
  pop*x/(x+pop-1)
}

shinyServer(function(input,output){
  
  
  output$text<-renderPrint({calc(input$pop,input$clevel,input$stdev,input$moe)})
}
)
