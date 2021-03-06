test<-M2017_train
myprediction <-test
decision <- rep('F',nrow(myprediction))
decision[(myprediction$SCORE*.8)+(myprediction$PARTICIPATION*.2)>24]<- 'D'
decision[(myprediction$SCORE*.8)+(myprediction$PARTICIPATION*.2)>37]<- 'C'
decision[(myprediction$SCORE*.8)+(myprediction$PARTICIPATION*.2)>50]<- 'B'
decision[(myprediction$SCORE*.8)+(myprediction$PARTICIPATION*.2)>58]<- 'A'
myprediction$GRADE<-decision
error<-mean(test$GRADE!=myprediction$GRADE)
test_error <- test[test$GRADE!=myprediction$GRADE,]
dim(test_error)


testing <- read_csv("C:/Users/vnd12/Downloads/M2017_test_students.csv")
testing[,6] <- ""
View(testing)
colnames(testing)[6] <- "Grades"
testing$Grades[(testing$SCORE*.8)+(testing$PARTICIPATION*.2)<=24] <- 'F'
testing$Grades[(testing$SCORE*.8)+(testing$PARTICIPATION*.2)>24] <- 'D'
testing$Grades[(testing$SCORE*.8)+(testing$PARTICIPATION*.2)>37] <- 'C'
testing$Grades[(testing$SCORE*.8)+(testing$PARTICIPATION*.2)>50] <- 'B'
testing$Grades[(testing$SCORE*.8)+(testing$PARTICIPATION*.2)>58] <- 'A'


outcome<-data.frame("StudentID"=testing$STUDENTID,"Grades"=testing$Grades)
View(outcome)
write.csv(outcome,"outcome_test_wr.csv")