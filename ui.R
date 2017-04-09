library(shiny)

shinyUI(pageWithSidebar(

        headerPanel("Motor Trend Car Road Tests"),

        sidebarPanel(
                p("Values set by default to the median"),
                sliderInput('wt','Weight (1000 lbs):',min=min(mtcars$wt),max=max(mtcars$wt),value=median(mtcars$wt)),
                sliderInput('hp','Gross horsepower:',min=min(mtcars$hp),max=max(mtcars$hp),value=median(mtcars$hp)),
                numericInput('cyl','Number of cylinders',median(mtcars$cyl),min=min(mtcars$cyl),max=max(mtcars$cyl),step=2)
        ),
        mainPanel(
                h3("Documentation"),
                p("The data was extracted from the 1974 Motor Trend US magazine,
                  and comprises fuel consumption and 10 aspects of automobile design
                  and performance for 32 automobiles (1973–74 models)."),
                
                h3("Model as follows:"),
                code('lm(mpg ~ wt + cyl + hp,data=mtcars)'),
                br(),

                p("The standard mtcars R dataset is used for modeling this prediction."),

                h5('Selected weight'),
                verbatimTextOutput("wt"),

                h5('Selected cylinders'),
                verbatimTextOutput("cyl"),

                h5('Selected horsepower'),
                verbatimTextOutput("hp"),
                br(),
                h5('Your predicted fuel consumption'),
                verbatimTextOutput("prediction"),
                br(),

                h4('Prediction compared to the rest of the vehicles'),
                p("Note that this is compared to all types od vehicles wrt the cylinders, horsepower and weight"),
                plotOutput("distPlot")
        )
))
