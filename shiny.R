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
      label = "Jaki wykres chcesz wyświetlić?",
      icon = icon("check"),
      choices = c("Procentowy wzrost średniej ceny, na podstawie dania głownego.", "Maksymalne ceny produktów w danych kategoriach.", "Minimalne ceny produktów w danych kategoriach." ),
      animation = "tada",
      status = "default"
    ),
    
    actionButton("button", "kliknij tutaj, by wylosować"),
    
  ),
  
  
  mainPanel(
    textOutput("tekst"),
    
    verbatimTextOutput("value"),
    
    textOutput("alternatywa"),
    
    plotOutput("plot", click = "plot_click"),
  )
)

server = function(input, output, session) {
  
  observeEvent(input$button, {
    
    if(input$radio == "Procentowy wzrost średniej ceny, na podstawie dania głownego."){ 
      output$plot = renderPlot({
        ggplot(wzrost_cen, aes(x=procent,
                               y=rok)) + stat_smooth(method = "auto" , color="magenta")  + geom_point() +ggtitle("Procentowy wzrost średniej ceny, na podstawie dania głownego")+theme(plot.title=element_text(hjust=0.5))+xlab("wzrost procentowy")
      }, res = 96)}
    else if (input$radio == "Maksymalne ceny produktów w danych kategoriach."){output$plot = renderPlot(ggplot(dane, aes(nazwa,ceny_maksymalne)) + geom_bar(stat = "identity", color = "magenta") + theme_light() +
                                                              ggtitle("Maksymalne ceny produktów z każdej kategorii")+theme(plot.title=element_text(hjust=0.5))+xlab("nazwa produktu") + ylab("cena najdroższego produktu"))}
    
    else if (input$radio == "Minimalne ceny produktów w danych kategoriach."){output$plot = renderPlot(ggplot(dane,aes(nazwa,ceny_minimalne)) + geom_bar(stat = "identity", color ="magenta") + theme_light() +
                                                                                                          ggtitle("Minimalne ceny produktów z każdej kategorii")+theme(plot.title=element_text(hjust=0.5))+xlab("nazwa produktu") + ylab("cena najtańszego produktu"))}
    
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

