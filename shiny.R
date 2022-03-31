library(shiny)


ui <- fluidPage(
  titlePanel("Zestaw"),
  sidebarLayout(
    sidebarPanel(checkboxGroupInput("kategoria", label = h3("Wybierz kategorie do zestawu"),
                                    choices = list("obiad" = menu$ID == "O", "pizza" = menu$ID == "P", "śniadanie" = menu$ID == "S", "kanapka" = menu$ID == "K", "przekąska słona" = menu$ID == "PR", "deser" = menu$ID == "DS", "dodatki" = menu$ID == "D", "napój" = menu$ID == "N"), selected = 1), fluidRow(column(3, verbatimTextOutput("text_choice")))),
    
    mainPanel(textOutput("zestaw"))
  )
)

server <- function(input, output)
{
  
  output$text_choices = renderPrint({
    return(paste0("Twój wylosowany zestaw to:", losowanie(input$kategoria)))
  })
}


shinyApp(ui = ui, server = server) 

