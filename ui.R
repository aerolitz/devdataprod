library(shiny)

shinyUI(pageWithSidebar(
                headerPanel("FIFA World Cup 2014 - All Players"),
                sidebarPanel(
                        sliderInput(
                                'goals'
                                ,'Select the # of goals:'
                                ,min = 0
                                ,max = 68
                                ,value = c(5, 10)
                        )
                ),
                mainPanel(
                        tabsetPanel(
                                # Panels Data
                                tabPanel(
                                        p(icon("table"), "Dataset")
                                        ,dataTableOutput(outputId = "dTable")
                                ),
                                tabPanel(
                                        p(icon("line-chart"), "Visualize the Data")
                                        ,plotOutput('goalsHist')
                                ),
                                tabPanel(
                                        p(icon("bug"), "About")
                                        ,includeMarkdown("about.md")
                                )
                        )
                )
        )
)