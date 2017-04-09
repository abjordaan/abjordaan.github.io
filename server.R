library(shiny)
library(plotly)

data(mtcars)
linear_model <- lm(mpg ~ wt + cyl + hp, data=mtcars)

funcPredict <- function(weight,cylinders,horsepower){
        predict(linear_model,newdata=data.frame(wt=weight,cyl=cylinders,hp=horsepower))
}

shinyServer(
        function(input, output) {
                output$wt <- renderPrint({input$wt})
                output$cyl <- renderPrint({input$cyl})
                output$hp <- renderPrint({input$hp})
                output$prediction <- renderPrint({funcPredict(input$wt,input$cyl,input$hp)})

                output$distPlot <- renderPlot({
                        my_pred <- funcPredict(input$wt,input$cyl,input$hp)
                        boxplot(mtcars$mpg~mtcars$cyl, col='blue',ylab='mpg',xlab='Cylinder', main="Avg Feul Consumption",ylim=c(5,40))
                        abline(h=my_pred, col='red', lwd=3)
                        legend("topright","Predicted", lty=1, col="red", lwd=3)
                })

        })
