library(rpart)
library(rpart.plot)
v <- iris$Species
table(v)
summary(iris)
head(iris)
set.seed(522)
iris[, 'train'] <- ifelse(runif(nrow(iris)) < 0.75, 1, 0)
trainSet <- iris[iris$train == 1,]
testSet <- iris[iris$train == 0, ]
trainColNum <- grep('train', names(trainSet))
trainSet <- trainSet[, -trainColNum]
testSet <- testSet[, -trainColNum]
treeFit <- rpart(Species~.,data=trainSet,method = 'class')
rpart.plot(treeFit, box.col=c("red", "yellow"))
