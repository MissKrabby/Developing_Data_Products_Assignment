# load shiny package
library(shiny)
# begin shiny UI
shinyUI(pageWithSidebar(
        headerPanel("Testing of two clustering algorithm with iris data"),
        sidebarPanel(
                numericInput('k', 'Define the number of clusters', 3, min = 2, max = 6, step = 1),
                selectInput("alg", "Choose a clustering algorithm",
                            c("kmeans clustering"="1","Hierarchical clustering"="2")),
                actionButton("goButton", "Run!")
        ),
        mainPanel(
                h3('Results of algorithm'),
                p("Use the first two variables(Sepal.Length and Sepal.Width) in the iris dataset to test the algorithm"),
                h4('The raw data'),
                plotOutput('Hist1'),
                h4('cluster number'),
                verbatimTextOutput("k"),
                h4('clustering algorithm'),
                verbatimTextOutput("alg"),
                h4('The result of the algorithm'),
                plotOutput('Hist2')
        )
))