Feul Consumption Predictor
========================================================
author: Andre Jordaan
date: 2017-04-9
autosize: true

Prediction
========================================================

Motor Trend Car Road Tests will be used to predict the feul consumption. Tee following attributes are used:

- Weight
- Horsepower
- Cylinders

If the weight, horsepower and number of cylinders are know, we will be able to predict teh milage of the car per galon of fuel. We will apply our algorithm on the mtcars dataset wich is the data extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models). 

MTCARS data set
========================================================

There are 11 variables but the most important ones are: mpg (Miles/(US) gallon), cyl (Number of cylinders) and wt (Weight (1000 lbs).

Basic observation:


```r
data(mtcars)
head(mtcars)
```

```
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```

Prediction
========================================================

Prediction algorithm -> standard linear regression (weight, cylinders and horsepower)

model <- lm(mpg ~ wt + cyl + hp, data = mtcars)

Prediction outcome
========================================================

Succesfully predicted fuel consumption!

predict(linear_model,newdata=data.frame(wt=weight,cyl=cylinders,hp=horsepower))

Weight: 3.33, horse power: 123, number of cylinders: 6

Total feaul consumpotion: 20.33738 mpg

The live app can be found here: https://abjordaan.shinyapps.io/feulconsumptionpredictor/

R code can be found here: https://github.com/abjordaan/abjordaan.github.io

