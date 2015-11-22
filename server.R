library(shiny)
library(caret)
library(rpart)
library(lattice)
library(ggplot2)
library(e1071)

data(iris)
inTrain <- createDataPartition(y=iris$Species, p=0.7,list=FALSE)
training <- iris[inTrain,]
testing <- iris[-inTrain,]


modFit <- train(Species ~ ., data=training, method="rpart")


shinyServer(
  function(input,output)
  {
    
    output$PredictionValue <- renderText({
      inputData <- data.frame(input$SLength, input$SWidth, input$PLength, input$PWidth)
      names(inputData) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
      output$inputValues <- renderTable(inputData)
      pred <- predict(modFit, newdata=inputData)
      outputMessage <- as.character(pred)
      outputMessage})
  }    
)