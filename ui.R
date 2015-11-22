library(shiny)
library(shiny)
library(caret)
library(rpart)
library(lattice)
library(ggplot2)

shinyUI(pageWithSidebar(
  headerPanel (h1("Data Products Course Project"),
               h2("Prediction of Species")
  ),
  sidebarPanel(
    h3("Use the sliders below to vary the predictors"),
    sliderInput('PWidth', 'Select Petal Width',value = 1.189, min = 0.1, max = 2.5, step = 0.05,),
    sliderInput('PLength', 'Select Petal Length',value = 4.4, min = 1.2, max = 6.9, step = 0.05,),
    sliderInput('SLength', 'Select Sepal Length',value = 5.8, min = 4.4, max = 7.9, step = 0.05,),
    sliderInput('SWidth', 'Select Sepal Width',value = 3.0, min = 2.0, max = 4.4, step = 0.05,)
  ),
  mainPanel(
    h3("The table below represents the values selected on the slider") ,
    tableOutput("inputValues"),
    h3("The application uses the Trees alogrithm to predict the species of the flower based on the Sepal and Petal lengths and widths."),
    h3("Based on your selected input, the Trees alogrithm predicts the species to be: "),
    h1(textOutput("PredictionValue"))
    )
))