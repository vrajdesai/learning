install.packages("rpart")
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)
colnames(Marriage_training)[5] <- "JointIncome"
colnames(Marriage_testing)[6] <- "JointIncome"
Marriage_testing_students1[,7] <- ""
colnames(Marriage_testing)[7] <- "STATUS"
tree <- rpart(STATUS ~ BrideAge+GroomAge+JointIncome, data=Marriage_training, control = rpart.control(minsplit = 30))
decision <- predict(tree, newdata=Marriage_testing, type="class")
Marriage_testing$STATUS <- decision
install.packages("devtools")
devtools::install_github("devanshagr/CrossValidation", force= TRUE)
CrossValidation::cross_validate(Marriage_training, tree, 2, 0.8)
outcome<-data.frame("ID"=Marriage_testing$ID,"STATUS"=Marriage_testing$STATUS)
View(outcome)
write.csv(outcome,"predictionRpart3.csv")}
