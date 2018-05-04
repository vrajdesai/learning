install.packages("rpart")

install.packages("rpart.plot")

library(rpart)

train <- read.csv("C:/Users/vnd12/Downloads/M2017_train.csv")

tree <- rpart(train$GRADE ~ train$SCORE+train$PARTICIPATION, data=M2017_train, control=rpart.control(minsplit=300))

library(rpart.plot)

rpart.plot(tree)

M2017_test_students[,6] <- ""

View(M2017_test_students)

colnames(M2017_test_students)[6] <- "Grades"

decision <- predict(tree, newdata=M2017_test_students, type="class")

M2017_test_students$Grades <- decision

outcome<-data.frame("StudentID"=M2017_test_students$STUDENTID,"Grades"=M2017_test_students$Grades)
View(outcome)
write.csv(outcome,"predictionRpart.csv")