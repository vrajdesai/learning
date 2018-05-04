Similar challenge as the first one.

The same training set and testing sets as in challenge 1 (M2017_train, M2017_test) - but I'm ALLOWED to use rpart library function to see the power of the machine.

I improved from last time to top 33%, but made a few errors along the way. There is a problem with my rpart control parameter (minsplit = 300). This meant that in order for rpart to split a particular internal mode, I forced it to split only if htere are more than or equal to 300 data points. This is a big problem and it showed in my accuracy. Looking back, I can see that grade "B" is entirely missing from my tree plot. The reason for this is that the number of B's is less than 300, and since I mentioned 300 minimum it was not shown by rpart. Lesson learned.
