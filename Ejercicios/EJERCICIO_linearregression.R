# WEEK 11 - day 3 Caret

# tarda mucho en instalarse
# install.packages("caret",  dependencies = c("Depends", "Suggests"))
library(caret)
library(ggplot2)
library(lattice)
library(readr)




#####################
# Linear Regression #
#####################

house<-read.csv("R-basics/day4/data/USA_Housing.csv")
str(house)
house<-house[,1:6]



# Price <-- variable dependiente (a predecir)
price<-house$Price
equis<-house[,1:5]

# Detectar si hay alguna fila incompleta
any(!complete.cases(house))


library(purrr) # para ver si hay valores nan. Y no hay.
map(house, ~sum(is.na(.)))

set.seed(42)


pairs(house)

#install.packages("PerformanceAnalytics")
library("PerformanceAnalytics")
chart.Correlation(house, histogram=TRUE, pch="+")

#install.packages("corrplot")
library(corrplot)
M <- cor(house)
corrplot(M, method = "circle")

# otro equivalente a sns.pairplot.
library(GGally)
ggpairs(house, lower = list(continuous = "smooth"),
        diag = list(continuous = "barDiag"), axisLabels = "none")


# creamos la regresión linear con R

fit <- lm(Price ~ ., data = house)
summary(fit)


## USANDO CARET

# dividimos train/test
# indicamos cual es la variable a predecir
inTrain <- createDataPartition(y = house$Price, p = 0.75, list = FALSE)

training <- house[inTrain,]
test <- house[-inTrain,]

dim(training)
dim(test)


# entrenamos el modelo
# el resultado sera similar a lo hecho anteriormente
fit_train <- train(Price ~ ., data= training, method = 'lm', metric="RMSE")
fit_train$finalModel

fit_train$results[c("RMSE","Rsquared")] %>%
  round(2)

summary(fit_train)

pred_housetrain <- predict(fit_train, newdata = training)



# calculamos el error RMSE
cal_rmse <- RMSE(pred_housetrain, training$Price)
print(cal_rmse)



# predecimos con el conjunto de test

pred_housetest <- predict(fit_train, newdata=test)


# evaluamos con test 
comparing <- data.frame(pred = pred_housetest, real = test$Price)


# Preparing data for ploting
my_data = as.data.frame(cbind(predicted = pred_housetest,
                              observed = test$Price))

# Plot predictions vs test data
ggplot(my_data,aes(predicted, observed)) +
  geom_point(color = "darkred", alpha = 0.5) + 
  geom_smooth(method=lm)+ ggtitle('Linear Regression ') +
  ggtitle("Linear Regression: Prediction vs Test Data") +
  xlab("Predecited Power Output ") +
  ylab("Observed Power Output") +
  theme(plot.title = element_text(color="darkgreen",size=18,hjust = 0.5),
        axis.text.y = element_text(size=12),
        
        axis.text.x = element_text(size=12,hjust=.5),
        axis.title.x = element_text(size=14),
        axis.title.y = element_text(size=14))



# calculamos error
postResample(pred_housetest, test$Price)


# varImp
varImp(fit)
varImp(fit_train)
