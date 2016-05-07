library(ggplot2)
library(fpc)
data(iris)

shinyServer(
        function(input, output) {
                output$k = renderPrint({input$k})
                output$alg = renderPrint({ifelse(input$alg == "1","kmeans clustering","Hierarchical clustering")})
                
                output$Hist1 = renderPlot({
                        ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
                                geom_point(aes(colour = Species),size=2.5)+
                                theme(text = element_text(size = 15))  
                        
                })
                

                output$Hist2 = renderPlot({
                        if (input$alg == "1") {
                                km <- kmeans(iris[,1:2],as.integer(input$k))
                                cluster <- factor(km$cluster)
                                
                        }else{
                                hc <- hclust(dist(iris[,1:2]))
                                hc_cut <- cutree(hc, as.integer(input$k))
                                cluster <- factor(hc_cut)
                        }
                        input$goButton
                        isolate(ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
                                        geom_point(aes(colour = Species,shape=cluster),size=2.5)+
                                        theme(text = element_text(size = 15)))
                })

        }
)