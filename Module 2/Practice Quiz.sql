--1. For all the questions in this practice set, you will be using the Salary by Job Range Table. This is a single table titled: salary_range_by_job_classification.]

--yes


--2. Find the distinct values for the extended step. The code has been started for you, but you will need to program the third line yourself before running the query.

SELECT 
distinct Extended_step 
from salary_range_by_job_classification

--Which of the following values is not a distinct value?
--5


--3. Excluding $0.00, what is the minimum bi-weekly high rate of pay (please include the dollar sign and decimal point in your answer)? 
  --The code has been started for you, but you will need to add onto the last line of code to get the correct answer.
  
Select 
min(Biweekly_high_Rate)
From salary_range_by_job_classification
where Biweekly_high_Rate <>'$0.00'

--$100.00


--4. What is the maximum biweekly high rate of pay (please include the dollar sign and decimal point in your answer)?
  --The code has been started for you, but you will need to add onto the last line of code to get the correct answer.
  
SELECT 
Max(Biweekly_high_Rate) 
From salary_range_by_job_classification

--$9726.38


--5. What is the pay type for all the job codes that start with '03'? 
  --The code has been started for you, but you will need to program the fourth and fifth lines yourself before running the query.
  
Select
job_code,
pay_type
from salary_range_by_job_classification
where job_code like '03%'
  
--B


--6. Run a query to find the Effective Date (eff_date) or Salary End Date (sal_end_date) for grade Q90H0? 
  --The code has been started for you, but you will need to program the third through the sixth lines yourself before running the query. 
  
Select
sal_end_date
from salary_range_by_job_classification
where grade = 'Q90H0'

--What is the Salary End Date (sal_end_date) for grade Q90H0? (Enter date format as follows: mm/dd/yyyy)
--06/30/2010


--7. Sort the Biweekly low rate in ascending order. 
  --There is no starter code, as you need to write and run the query on your own. Hint: there are 4 lines to run this query.

SELECT 
Biweekly_Low_Rate
FROM salary_range_by_job_classification
ORDER BY Biweekly_Low_Rate ASC;

--Are these values properly sorted? 
--No


--8. Write and run a query, with no starter code to answer this question: What Step are Job Codes 0110-0400? 
  --Hint: there are 6 lines to run this query.
  
SELECT 
Job_Code,
Salary_setID,
Step
FROM salary_range_by_job_classification
where Job_Code between "0110" and "0400"
 
--1


--9. Write and run a query, with no starter code or hints to answer this question: What is the Biweekly High Rate minus the Biweekly Low Rate for job Code 0170?

Select
Job_code,
Biweekly_high_rate,
Biweekly_low_rate, 
(biweekly_high_rate - Biweekly_low_rate) as calc
From salary_range_by_job_classification
Where Job_code = '0170'

--0


--10. Write and run a query, with no starter code or hints to answer this question: What is the Extended Step for Pay Types M, H, and D? 

Select
Extended_step,
Pay_Type
From salary_range_by_job_classification
Where Pay_Type in ('M', 'H', 'D');

--0


--11. Write and run a query, with no starter code or hints to answer this question: What is the step for Union Code 990 and a Set ID of SFMTA or COMMN? 

SELECT 
Union_code,
SetID,
Step
from salary_range_by_job_classification
where Union_code = 990 and (SetID = 'SFMTA' or SetID = 'COMMN')

--1 
