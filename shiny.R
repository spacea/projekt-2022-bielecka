menu = read.csv("menu.csv", encoding = "UTF-8")

library(tidyverse)
library(shiny)
library(shinyWidgets)

ui = fluidPage(
  
  titlePanel(span("Wylosuj swój zestaw", style = "color:magenta")),
  
  sidebarPanel( 
  
    numericInput("kwota", "Zaznacz kwotę, w której ma się mieścić zestaw:", 20, min = 20, max = 50),
    
    materialSwitch(inputId = "wege",label = "Zaznacz jeśli jesteś wegeterianinem. ", value = FALSE),
    
    prettyRadioButtons(
      inputId = "radio",
      label = "Czy chcesz wyświetlić wykres, pokazujący procentowy wzrost średniej ceny dania głównego? ( !UWAGA! Jeśli zaznaczysz 'TAK', nie będziesz już mógł cofnąć tej decyzji.)",
      icon = icon("check"),
      choices = c("TAK", "NIE"),
      animation = "tada",
      status = "default"
                      ),
    
    actionButton("button", "kliknij tutaj, by wylosować"),
    
             ),
  
  
  mainPanel(
    textOutput("tekst"),
    
    verbatimTextOutput("value"),
    
    plotOutput("plot", click = "plot_click"),
           )
            )

server = function(input, output, session) {
  
  observeEvent(input$button, {
    
    if(input$radio == "TAK"){ 
    output$plot = renderPlot({
      ggplot(wzrost_cen, aes(x=procent,
                             y=rok)) + stat_smooth()  + geom_point() +ggtitle("Procentowy wzrost średniej ceny, na podstawie dania głownego")+theme(plot.title=element_text(hjust=0.5))+xlab("wzrost procentowy")
                 }, res = 96)}
   
    
   output$tekst = renderText({ paste("Twój wylosowany zestaw to: ")})
    
   output$value =  renderPrint({ 
     if(input$wege == TRUE){
       zestaw_wege(input$kwota)
       }
     else{
       zestaw(input$kwota)
     }
  })   
  }
)}

shinyApp(ui, server)

