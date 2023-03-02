# Summary-of-SQL-on-Leetcode

#### This Summary is based on the structure made by https://github.com/siqichen-usc/LeetCode-SQL-Summary. Some connections between questions are supplemented.

1. The Difference between Aggregation function xx over (partition by) and Group by:
  Details in having 
  select actor_id, director_id, count(timestamp) over (partition by actor_id, director_id) from actordirector 
     actor_id | director_id | count(timestamp) over (partition by actor_id, director_id) |
    | -------- | ----------- | ---------------------------------------------------------- |
    | 1        | 1           | 3                                                          |
    | 1        | 1           | 3                                                          |
    | 1        | 1           | 3                                                          |
    | 1        | 2           | 2                                                          |
    | 1        | 2           | 2                                                          |
    | 2        | 1           | 2                                                          |
    | 2        | 1           | 2                                                          |


select actor_id, director_id, count(timestamp) from actordirector group by actor_id, director_id

     actor_id | director_id | count(timestamp) |
    | -------- | ----------- | ---------------- |
    | 1        | 1           | 3                |
    | 1        | 2           | 2                |
    | 2        | 1           | 2                |





2. How to display '0' for Null values after joinning :
  
  COUNT(expression) could be used because it does not take account if expression is null
  
  
  

3. 从 YYYY-MM-DD里面提取YYYY-MM：
  
  DATE_FORMAT(pay_date, '%Y-%m')



4. Report the max value if there is a tie
  Rank () over (partition xxx order by desc) ...
