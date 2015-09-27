library(shiny)

source("processamento.R")
countries <- sort(unique(arquivo$Country))

shinyServer
(
        function(input, output)
        {
                output$goalsHist <- renderPlot({
                        hist(
                                arquivo$Goals
                                ,xlab = 'Goals'
                                ,ylab = '# of Player'
                                ,col = 'lightblue'
                                ,main = 'Goals Histogram'
                        )
                        goals1 <- input$goals[1]
                        goals2 <- input$goals[2]
                        lines(
                                c(goals1, goals2)
                                ,c(0, 70)
                                ,col = "red"
                                ,lwd = 5
                        )
                })
          
                # Prepare dataset
                tabela <- reactive({
                        selecionaGols(
                                 arquivo
                                ,input$goals[1]
                                ,input$goals[2]
                        )
                })

                # Render data table
                output$dTable <- renderDataTable({
                        tabela()
                })
        }
)