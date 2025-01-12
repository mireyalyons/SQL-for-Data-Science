--This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. 
--For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. 
--You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

--In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. 
--You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, 
--so use proper formatting and comments to illustrate and communicate your intent as required.

--For both parts of this assignment, use this "worksheet."
--It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work.
--You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. 
--If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
--In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.

Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:

  SELECT COUNT(*)
  FROM Table
	
  i. Attribute table = 10000
  ii. Business table = 10000
  iii. Category table = 10000
  iv. Checkin table = 10000
  v. elite_years table = 10000
  vi. friend table = 10000
  vii. hours table = 10000
  viii. photo table = 10000
  ix. review table = 10000
  x. tip table = 10000
  xi. user table = 10000
  
2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

  SELECT COUNT(DISTINCT(key))
  FROM Table

  i. Business = 10000
  ii. Hours = 1562
  iii. Category = 2643
  iv. Attribute = 1115
  v. Review = id = 10000, business_id = 8090, user_id = 9581
  vi. Checkin = 493
  vii. Photo = business_id = 6493, id = 10000
  viii. Tip = user_id = 537, business_id = 3979
  ix. User = 10000
  x. Friend = 11
  xi. Elite_years = 2780

 Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.
  
3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: No
	
  SQL code used to arrive at answer:

	SELECT COUNT(*)
	FROM user
	WHERE id = NULL OR
      		name = NULL OR
      		review_count = NULL OR
      		yelping_since = NULL OR
      		useful = NULL OR
      		funny = NULL OR
      		cool = NULL OR
      		fans = NULL OR
      		average_stars = NULL OR
      		compliment_hot = NULL OR
      		compliment_more = NULL OR
      		compliment_profile = NULL OR
      		compliment_cute = NULL OR
      		compliment_list = NULL OR
      		compliment_note = NULL OR
      		compliment_plain = NULL OR
      		compliment_cool = NULL OR
      		compliment_funny = NULL OR
      		compliment_writer = NULL OR
      		compliment_photos = NULL
          
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	SELECT Min(Column),
		 Max(Column),
		 Avg(Column)
	FROM Table

	i. Table: Review, Column: Stars
	
		min:	1	max:	5	avg: 3.7082
	
	ii. Table: Business, Column: Stars
	
		min:	1	max:	5	avg: 3.6549
		
	iii. Table: Tip, Column: Likes
	
		min:	0	max:	2	avg: 0.0144
		
	iv. Table: Checkin, Column: Count
	
		min:	1	max:	53	avg: 1.9414
		
	v. Table: User, Column: Review_count
	
		min: 0	max:	2000	avg: 24.2995
		
5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	
	SELECT city,
        	SUM(review_count) as reviews
	FROM business
	GROUP BY city
	ORDER BY reviews
	DESC
	
	Copy and Paste the Result Below:
	
  +-----------------+---------+
  | city            | reviews |
  +-----------------+---------+
  | Las Vegas       |   82854 |
  | Phoenix         |   34503 |
  | Toronto         |   24113 |
  | Scottsdale      |   20614 |
  | Charlotte       |   12523 |
  | Henderson       |   10871 |
  | Tempe           |   10504 |
  | Pittsburgh      |    9798 |
  | Montréal        |    9448 |
  | Chandler        |    8112 |
  | Mesa            |    6875 |
  | Gilbert         |    6380 |
  | Cleveland       |    5593 |
  | Madison         |    5265 |
  | Glendale        |    4406 |
  | Mississauga     |    3814 |
  | Edinburgh       |    2792 |
  | Peoria          |    2624 |
  | North Las Vegas |    2438 |
  | Markham         |    2352 |
  | Champaign       |    2029 |
  | Stuttgart       |    1849 |
  | Surprise        |    1520 |
  | Lakewood        |    1465 |
  | Goodyear        |    1155 |
  +-----------------+---------+

6. Find the distribution of star ratings to the business in the following cities:

  i. Avon

  SQL code used to arrive at answer:

  SELECT stars,
        COUNT(stars) as count
  FROM business
  WHERE city == 'Avon'
  GROUP BY stars

  Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):

  +-------+-------+
  | stars | count |
  +-------+-------+
  |   1.5 |     1 |
  |   2.5 |     2 |
  |   3.5 |     3 |
  |   4.0 |     2 |
  |   4.5 |     1 |
  |   5.0 |     1 |
  +-------+-------+

  ii. Beachwood

  SQL code used to arrive at answer:

  SELECT stars,
        COUNT(stars) as count
  FROM business
  WHERE city == 'Beachwood'
  GROUP BY stars


  Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
  +-------+-------+
  | stars | count |
  +-------+-------+
  |   2.0 |     1 |
  |   2.5 |     1 |
  |   3.0 |     2 |
  |   3.5 |     2 |
  |   4.0 |     1 |
  |   4.5 |     2 |
  |   5.0 |     5 |
  +-------+-------+
  
7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:

	SELECT name,
       	 	id,
        	review_count
	FROM user 
	ORDER BY review_count
	DESC
	LIMIT 3
	
	Copy and Paste the Result Below:
		
  +--------+------------------------+--------------+
  | name   | id                     | review_count |
  +--------+------------------------+--------------+
  | Gerald | -G7Zkl1wIWBBmD0KRy_sCw |         2000 |
  | Sara   | -3s52C4zL_DHRK0ULG6qtg |         1629 |
  | Yuri   | -8lbUNlXVSoXqaRRiHiSNg |         1339 |
  +--------+------------------------+--------------+
  
8. Does posing more reviews correlate with more fans?
  Please explain your findings and interpretation of the results:
	
  Posing more reviews does not correlate with more fans.
  Looking at the table below, we can see that while the number of fans widely varies, most of the users have a similar number of reviews.

  SELECT name,
       id,
       fans,
       review_count
  FROM user
  WHERE review_count > 1000
  ORDER BY fans
  DESC

  +---------+------------------------+------+--------------+
  | name    | id                     | fans | review_count |
  +---------+------------------------+------+--------------+
  | Harald  | --2vR0DIsmQ6WfcSzKWigw |  311 |         1153 |
  | Gerald  | -G7Zkl1wIWBBmD0KRy_sCw |  253 |         2000 |
  | William | -FZBTkAZEXoP7CYvRV2ZwQ |  126 |         1215 |
  | Roanna  | -DFCC64NXgqrxlO8aLU5rg |  104 |         1039 |
  | .Hon    | -K2Tcgh2EKX6e6HqqIrBIQ |  101 |         1246 |
  | Yuri    | -8lbUNlXVSoXqaRRiHiSNg |   76 |         1339 |
  | Sara    | -3s52C4zL_DHRK0ULG6qtg |   50 |         1629 |
  | eric    | -gokwePdbXjfS0iF7NsUGA |   16 |         1116 |
  +---------+------------------------+------+--------------+
  
9. Are there more reviews with the word "love" or with the word "hate" in them?

  Answer: There are more reviews with the word "love" (1780 reviews) than with the word "hate" (232 reviews).

  SQL code used to arrive at answer:

  SELECT COUNT(text)
  FROM review
  WHERE text LIKE '%love%'

  +-------------+
  | COUNT(text) |
  +-------------+
  |        1780 |
  +-------------+

  SELECT COUNT(text)
  FROM review
  WHERE text LIKE '%hate%'

  +-------------+
  | COUNT(text) |
  +-------------+
  |         232 |
  +-------------+
  
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	
  SELECT name,
       id,
       fans
  FROM user
  ORDER BY fans
  DESC
  LIMIT 10
	
	Copy and Paste the Result Below:

  +-----------+------------------------+------+
  | name      | id                     | fans |
  +-----------+------------------------+------+
  | Amy       | -9I98YbNQnLdAmcYfb324Q |  503 |
  | Mimi      | -8EnCioUmDygAbsYZmTeRQ |  497 |
  | Harald    | --2vR0DIsmQ6WfcSzKWigw |  311 |
  | Gerald    | -G7Zkl1wIWBBmD0KRy_sCw |  253 |
  | Christine | -0IiMAZI2SsQ7VmyzJjokQ |  173 |
  | Lisa      | -g3XIcCb2b-BD0QBCcq2Sw |  159 |
  | Cat       | -9bbDysuiWeo2VShFJJtcw |  133 |
  | William   | -FZBTkAZEXoP7CYvRV2ZwQ |  126 |
  | Fran      | -9da1xk7zgnnfO1uTVYGkA |  124 |
  | Lissa     | -lh59ko3dxChBSZ9U7LfUw |  120 |
  +-----------+------------------------+------+
  
Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. 
Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
  i. Do the two groups you chose to analyze have a different distribution of hours?

  Yes, for shopping in Las Vegas, the 4-5 stars businesses have shorter hours than the 2-3 stars business.

  ii. Do the two groups you chose to analyze have a different number of reviews?

  Yes, the 4-5 stars businesses have more reviews (36 reviews) than the 2-3 stars business (6 reviews).
         
  iii. Are you able to infer anything from the location data provided between these two groups? Explain.
  
  Solely basing inferences on observation of the data given, I can infer that location of the business affects a yelp rating. 
  The query returned three businesses, one of which indicates it is located in the Eastside neighborhood of Las Vegas.
  While this business has more operating hours than the other two, it has less reviews and lower rating, location may be a factor. 
  The sample size of this data is too small to make any conlusions. 

  SQL code used for analysis:

  SELECT b.name,
        b.id,
        h.hours,
        b.review_count,
        b.stars,
        b.address,
        b.postal_code,
        b.neighborhood
  FROM business as b
  INNER JOIN hours as h
  ON b.id == h.business_id
  INNER JOIN category as c
  ON b.id == c.business_id
  WHERE b.city == 'Las Vegas'
  AND c.category == 'Shopping'
  AND (b.stars BETWEEN 2.0 AND 3.0
  OR b.stars BETWEEN 4.0 AND 5.0)

  +--------------------------------+------------------------+----------------------+--------------+-------+------------------------+-------------+--------------+
  | name                           | id                     | hours                | review_count | stars | address                | postal_code | neighborhood |
  +--------------------------------+------------------------+----------------------+--------------+-------+------------------------+-------------+--------------+
  | Red Rock Canyon Visitor Center | 0K2rKvqdBmiOAUTebcUohQ | Monday|8:00-16:30    |           32 |   4.5 | 1000 Scenic Loop Dr    | 89161       |              |
  | Red Rock Canyon Visitor Center | 0K2rKvqdBmiOAUTebcUohQ | Tuesday|8:00-16:30   |           32 |   4.5 | 1000 Scenic Loop Dr    | 89161       |              |
  | Red Rock Canyon Visitor Center | 0K2rKvqdBmiOAUTebcUohQ | Friday|8:00-16:30    |           32 |   4.5 | 1000 Scenic Loop Dr    | 89161       |              |
  | Red Rock Canyon Visitor Center | 0K2rKvqdBmiOAUTebcUohQ | Wednesday|8:00-16:30 |           32 |   4.5 | 1000 Scenic Loop Dr    | 89161       |              |
  | Red Rock Canyon Visitor Center | 0K2rKvqdBmiOAUTebcUohQ | Thursday|8:00-16:30  |           32 |   4.5 | 1000 Scenic Loop Dr    | 89161       |              |
  | Red Rock Canyon Visitor Center | 0K2rKvqdBmiOAUTebcUohQ | Sunday|8:00-16:30    |           32 |   4.5 | 1000 Scenic Loop Dr    | 89161       |              |
  | Red Rock Canyon Visitor Center | 0K2rKvqdBmiOAUTebcUohQ | Saturday|8:00-16:30  |           32 |   4.5 | 1000 Scenic Loop Dr    | 89161       |              |
  | Walgreens                      | 1q44aWEcDN7uRvA2l8xpvQ | Monday|8:00-22:00    |            6 |   2.5 | 3808 E Tropicana Ave   | 89121       | Eastside     |
  | Walgreens                      | 1q44aWEcDN7uRvA2l8xpvQ | Tuesday|8:00-22:00   |            6 |   2.5 | 3808 E Tropicana Ave   | 89121       | Eastside     |
  | Walgreens                      | 1q44aWEcDN7uRvA2l8xpvQ | Friday|8:00-22:00    |            6 |   2.5 | 3808 E Tropicana Ave   | 89121       | Eastside     |
  | Walgreens                      | 1q44aWEcDN7uRvA2l8xpvQ | Wednesday|8:00-22:00 |            6 |   2.5 | 3808 E Tropicana Ave   | 89121       | Eastside     |
  | Walgreens                      | 1q44aWEcDN7uRvA2l8xpvQ | Thursday|8:00-22:00  |            6 |   2.5 | 3808 E Tropicana Ave   | 89121       | Eastside     |
  | Walgreens                      | 1q44aWEcDN7uRvA2l8xpvQ | Sunday|8:00-22:00    |            6 |   2.5 | 3808 E Tropicana Ave   | 89121       | Eastside     |
  | Walgreens                      | 1q44aWEcDN7uRvA2l8xpvQ | Saturday|8:00-22:00  |            6 |   2.5 | 3808 E Tropicana Ave   | 89121       | Eastside     |
  | Desert Medical Equipment       | 2RhICgMZI6DK-t374VRoow | Friday|8:00-17:00    |            4 |   5.0 | 3555 W Reno Ave, Ste F | 89118       |              |
  | Desert Medical Equipment       | 2RhICgMZI6DK-t374VRoow | Tuesday|8:00-17:00   |            4 |   5.0 | 3555 W Reno Ave, Ste F | 89118       |              |
  | Desert Medical Equipment       | 2RhICgMZI6DK-t374VRoow | Thursday|8:00-17:00  |            4 |   5.0 | 3555 W Reno Ave, Ste F | 89118       |              |
  | Desert Medical Equipment       | 2RhICgMZI6DK-t374VRoow | Wednesday|8:00-17:00 |            4 |   5.0 | 3555 W Reno Ave, Ste F | 89118       |              |
  | Desert Medical Equipment       | 2RhICgMZI6DK-t374VRoow | Monday|8:00-17:00    |            4 |   5.0 | 3555 W Reno Ave, Ste F | 89118       |              |
  +--------------------------------+------------------------+----------------------+--------------+-------+------------------------+-------------+--------------+
  
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
  i. Difference 1:

  The businesses that are open have a higher average star rating (3.68 stars) than the businesses that are closed (3.52 stars).
         
  ii. Difference 2:

  The businesses that are open have a higher average number of reviews (31 reviews/business) than the businesses that are closed (23 reviews/business).
  
  SQL code used for analysis:

  SELECT is_open,
        COUNT(DISTINCT(id)),
        AVG(stars),
        SUM(review_count)/COUNT(DISTINCT(id))
  FROM business
  GROUP BY is_open 

  +---------+---------------------+---------------+---------------------------------------+
  | is_open | COUNT(DISTINCT(id)) |    AVG(stars) | SUM(review_count)/COUNT(DISTINCT(id)) |
  +---------+---------------------+---------------+---------------------------------------+
  |       0 |                1520 | 3.52039473684 |                                    23 |
  |       1 |                8480 | 3.67900943396 |                                    31 |
  +---------+---------------------+---------------+---------------------------------------+
  
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.
Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
  i. Indicate the type of analysis you chose to do:
         
  I would like to determine what kind of restaurants are popular. 
  
  ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
                  
  In the case of opening a new restaurant, an owner would want to know as much information about the potential competition they may have in the area. 
  A new owner would be able to infer what factors could affect the business. The types of foods served, how many restaurants, cities, average stars, and average review counts all influence the decision making. 
  Observing the types of food is served at these restaurants, number of restaurants in each category, and the cities they tend to be located in are all important. 
  This information will help decide what food will be served and where the restaurant will be located.
  Observing the average stars and average reviews for each category gives an entrepreneur the opportunity to look further into each group individually. 
  They may be able to determine what the popular restaurants are doing differently than the less popular groups. 
  It may have been helpful to determine what the average operating hours are for each category, but there was not data with that information in this dataset. 
  
  iii. Output of your finished dataset:
         
  +----------+-----------------------+-----------+---------------+------------------+
  | Category | Number_of_Restaurants | City      |     Avg_Stars | Avg_Review_Count |
  +----------+-----------------------+-----------+---------------+------------------+
  | Korean   |                     7 | Toronto   |           4.5 |              8.0 |
  | French   |                    12 | Las Vegas |           4.0 |    135.083333333 |
  | Chinese  |                    13 | Las Vegas | 3.76923076923 |    423.230769231 |
  | Mexican  |                    28 | Edinburgh |         3.625 |             73.0 |
  | Italian  |                    13 | Montréal  | 3.53846153846 |    78.2307692308 |
  | Indian   |                     6 | Aurora    |           3.5 |             32.0 |
  | Japanese |                    20 | Toronto   |         3.475 |            22.85 |
  +----------+-----------------------+-----------+---------------+------------------+
  
  iv. Provide the SQL code you used to create your final dataset:

  select c.category as Category, 
    count(b.name) as Number_of_Restaurants,  
    b.city as City,
    Avg(stars) as Avg_Stars,
    Avg(review_count) as Avg_Review_Count
  From (Business b INNER JOIN hours h on b.id = h.business_id)
  INNER JOIN category c on c.business_id = b.id
  WHERE category IN
  ("Mexican","Chinese","Korean","Japanese","Indian","French","Italian","American")
  GROUP BY c.category
  ORDER BY AVG(stars)
  Desc
