install.packages("rpart")
install.packages("rpart.plot")
install.packages("devtools")
devtools::install_github("devanshagr/CrossValidation", force= TRUE)
library(rpart)
library(rpart.plot)
P4_test[,5] <- ""
colnames(P4_test)[5] <- "Revenue"
tree <- rpart(Revenue ~ ., data=P4_train, control = rpart.control(minsplit = 10))
decision <- predict(tree, newdata=P4_test)\
P4_test$Revenue <- decision
CrossValidation::cross_validate(P4_train, tree, 2, 0.8)


train.tree.v <- rpart(Revenue~ Activity + Source + Duration,  data=P4_train)
pred.tree.v <-  predict(train.tree.v,newdata=P4_test)
mean((pred.tree.v - P4_test$Revenue)^2)

train.lm.v <- lm(Revenue~ Activity + Source + Duration,  data=P4_train)
pred.lm.v <-  predict(train.lm.v,newdata=P4_test)
mean((pred.lm.v - P4_test$Revenue)^2)

outcome<-data.frame("ID"=P4_test$ID,"Revenue"=P4_test$Revenue)
View(outcome)
write.csv(outcome,"prediction4.csv")