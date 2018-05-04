Prediction Challenge 3:

A data set of 1000+ couples was collected with Groom's and Bride's Ages at their wedding time, Groom's and Bride's personality types (A or B) as well as their income  when they got married. The current status of their marriage was also collected: Married, Divorced or Separated.

Goal is to build a predictor which would predict the marriage status (3 classes: Married, Divorced and Separated), with the usual notion of error. Ended up ranking in the top 80% so I dropped from my last challenge.

The problem with my approach was that I considered and analyzed each attribute individually - groom personality, bride personality, groom age, bride age, etc. Since I was dealing with couple, my intuition should have been "how different are these 2 people and how is this affecting their realtionship".

In that case, reasonable intuitions would be - couple with high age difference will have more problems, couples with different personalities might have more problems.

Once I formed these intuitions, I should have created a new column to test this data - a column with age difference, a column stating whether personalities are same or different. 

