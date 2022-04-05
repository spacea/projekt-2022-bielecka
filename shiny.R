menu = read.csv("menu.csv", encoding = "UTF-8")

library(shiny)
library(shinyWidgets)

ui <- fluidPage(
  
  titlePanel(span("Wylosuj swój zestaw", style = "color:magenta")),
  
  sidebarPanel( 
    materialSwitch(inputId = "wege",label = "Czy jesteś wegeterianinem? ", value = FALSE),
    actionButton("button", "kliknij tutaj"),
    ),
  
  
  mainPanel(
    textOutput("tekst"),
    verbatimTextOutput("value")
            )
)

server = function(input, output, session) {
  
  observeEvent(input$button, {
    
   output$tekst = renderText({ paste("Twój wylosowany zestaw to: ")})
    
   output$value =  renderPrint({ 
     if(input$wege == TRUE){
       zestaw_wege("O", "DS", "N")
       }
     else{
       zestaw("O", "DS", "N")
     }
  })
    
  }
)}

shinyApp(ui, server)
