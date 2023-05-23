# Import the dataset
install.packages("rpart")
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)
yr1 <- read.csv("2020-2021.csv")
yr2 <- read.csv("2021-2022.csv")
View(yr1)

model1 <- glm(FTHG~HS + AS, data = yr1)
summary(model1)

model2 <- glm(FTAG~HS + AS, data = yr1)
summary(model2)

model3 <- glm(FTHG~HST + AST, data = yr1)
summary(model3)

model4 <- glm(FTAG~HST + AST, data = yr1)
summary(model4)

model5 <- glm(FTHG~HS + AS, data = yr2)
summary(model5)

model6 <- glm(FTAG~HS + AS, data = yr2)
summary(model6)

model7 <- glm(FTHG~HST + AST, data = yr2)
summary(model7)

model8 <- glm(FTAG~HST + AST, data = yr2)
summary(model8)

model9 <- glm(FTHG~HST + HS + HC + AST + AS + AC, data = yr1)
summary(model9)

model10 <- glm(FTAG~HST + HS + HC + AST + AS + AC, data = yr1)
summary(model9)






colnames(yr1)
str(statistics)
summary(sample_index)
index <- sample(nrow(statistics),nrow(statistics)*0.80) 
statistics_train <- statistics[sample_index,] 
statistics_test <- statistics[-sample_index,]
statistics_data <- read.csv(file.choose())
summary(statistics_data)

