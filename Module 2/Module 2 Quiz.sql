--1. Filtering data is used to do which of the following? (select all that apply)

--Reduce the time it takes to run the query
--Narrows down the results of the data
--Reduces the strain on the client application
--Helps you understand the contents of your data
--Removes unwanted data in a calculation


--2. You are doing an analysis on musicians that start with the letter “K”. 
--Select the correct query that would retrieve only the artists whose name starts with this letter. 

SELECT name
FROM Artists
WHERE name LIKE ‘K%’;


--3. A null and a zero value effectively mean the same thing. True or false?

--False


--4. Select all that are true regarding wildcards (Select all that apply.)

-- Wildcards take longer to run compared to a logical operator
--Wildcards at the end of search patterns take longer to run


--5. Select the statements below that ARE NOT true of the ORDER BY clause (select all that apply).

--Can be anywhere in the select statement
--Cannot sort by a column not retrieved


--6. Select all of the valid math operators in SQL (select all that apply).

-- -(subtraction)
-- *(multiplication)
-- +(addition)
-- /(division)


--7. Which of the following is an aggregate function? (select all that apply)

--Max()
--Min()
--Count()


--8. Which of the following is true of GROUP BY clauses? (Select all that apply.)

--NULLs will be grouped together if your Group By column contains NULLs
--Every column in your select statement may/can be present in a group by clause, except for aggregated calculations.
--GROUP BY clauses can contain multiple columns


--9. Select the true statement below.

--HAVING filters after the data is grouped. 


--10. Which is the correct order of occurrence in a SQL statement?

--select, from, where, group by, having
