-- 1. Which of the following statements is true regarding subqueries?

--Subqueries always process the innermost query first and the work outward.


--2. If you can accomplish the same outcome with a join or a subquery, which one should you always choose?

--Joins are usually faster, but subqueries can be more reliable, so it depends on your situation. 


--3. The following diagram is a depiction of what type of join?

--Inner Join


--4. Select which of the following statements are true regarding inner joins. (Select all that apply) 

--Performance will most likely worsen with the more joins you make
--There is no limit to the number of table you can join with an inner join.
--Inner joins are one of the most popular types of joins use


--5. Which of the following is true regarding Aliases? (Select all that apply.) 

--SQL aliases are used to give a table, or a column in a table, a temporary name.
--Aliases are often used to make column names more readable.
--An alias only exists for the duration of the query.


--6. What is wrong with the following query?

SELECT Customers.CustomerName, 
  Orders.OrderID
FROM LEFT JOIN ON Customers.CustomerID = Orders.CustomerID FROM Orders AND Customers
ORDER BY CustomerName;

--The table name comes after the join condition


--7. What is the difference between a left join and a right join?

--The only difference between a left and right join is the order in which the tables are relating. 


--8. If you perform a cartesian join on a table with 10 rows and a table with 20 rows, how many rows will there be in the output table?

--200


--9. Which of the following statements about Unions is true? (select all that apply)

--Each SELECT statement within UNION must have the same number of columns
--The columns must also have similar data types
--The UNION operator is used to combine the result-set of two or more SELECT statements


--10. Data scientists need to use joins in order to: (select the best answer)

--Retrieve data from multiple tables. 
