Developing Data Products
========================================================
author: Sachin Sangtani
date: Nov 23, 2015

Predicting Flower Species
========================================================
The application (https://sangtani.shinyapps.io/DataProducts) is built to predict flower species from one of three based on four predictors. 
- Sepal Width
- Sepal Length
- Petal Width 
- Petal Length

Based on values selected in the application, the closest of three species is selected:

1. Setosa
2. Versicolor
3. Virginica



Prediction Model
========================================================
The prediction model uses the Trees Alogrithm. It was built with a training set of 70% of the iris dataset. 

Training the dataset involves partitioning the data and using only a portion of it to build the prediction model, as shown:




```r
data(iris)
inTrain <- createDataPartition(y=iris$Species, p=0.7,list=FALSE)
training <- iris[inTrain,]
testing <- iris[-inTrain,]

modFit <- train(Species ~ ., data=training, method="rpart")
```

Example of predictions
========================================================






| Sepal.Length| Sepal.Width| Petal.Length| Petal.Width|
|------------:|-----------:|------------:|-----------:|
|          1.4|           2|          1.3|         1.8|

```
[1] "setosa"
```

Model Accuracy
========================================================

```
CART 

105 samples
  4 predictor
  3 classes: 'setosa', 'versicolor', 'virginica' 

No pre-processing
Resampling: Bootstrapped (25 reps) 
Summary of sample sizes: 105, 105, 105, 105, 105, 105, ... 
Resampling results across tuning parameters:

  cp         Accuracy   Kappa      Accuracy SD  Kappa SD  
  0.0000000  0.9474101  0.9204303  0.02796948   0.04197199
  0.4428571  0.8020164  0.7082552  0.16371814   0.23817716
  0.5000000  0.5208308  0.3108220  0.17161946   0.22328986

Accuracy was used to select the optimal model using  the largest value.
The final value used for the model was cp = 0. 
```
