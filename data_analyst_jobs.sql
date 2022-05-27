-- #1 
-- QUESTION: How many rows are in the data_analyst_jobs table?
-- ANSWER: 1793
SELECT COUNT(*)
FROM data_analyst_jobs;

-- #2  
-- QUESTION: What company is associated with the job posting on the 10th row?
-- ANSWER: Exxon Mobil 
SELECT *
FROM data_analyst_jobs 
LIMIT 10;

-- #3 
-- QUESTION: How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
-- ANSWER: 21,27
SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location ='TN';

SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN' OR location ='KY';

-- #4 
-- QUESTION:How many postings in Tennessee have a star rating above 4?
-- ANSWER: 3
SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN' 
AND star_rating > 4;

-- #5 
-- QUESTION: How many postings in the dataset have a review count between 500 and 1000?
-- ANSWER: 151
SELECT COUNT(*)  
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- #6
-- QUESTION: Show the average star rating for companies in each state. The output should show the state as `state` and the 
-- 		average rating for the state as `avg_rating`. Which state shows the highest average rating?
-- ANSWER: NE, avg_rating = 4.199999
SELECT location AS state, ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL 
GROUP BY location
ORDER BY avg_rating DESC; 
-- 'NULLS LAST' optional after DESC if "WHERE" removed

-- #7
-- QUESTION: Select unique job titles from the data_analyst_jobs table. How many are there?
-- ANSWER: 881
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs

-- #8
-- QUESTION: How many unique job titles are there for California companies?
-- ANSWER: 230
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

-- #9
-- QUESTION: Find the name of each company and its average star rating for all companies that have more than 5000 reviews 
-- 		across all locations. How many companies are there with more that 5000 reviews across all locations?
-- ANSWER: 40
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company

SELECT COUNT(DISTINCT company)
FROM data_analyst_jobs
WHERE review_count >5000
AND company IS NOT NULL;


-- #10
-- QUESTION: Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 
-- 		5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
-- ANSWER: 6 way tie - General Motors, Unilever, Microsoft, Nike, American Express, Kaiser Permanente
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
AND company IS NOT NULL
GROUP BY company
ORDER BY avg_rating DESC;

-- #11
-- QUESTION: Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?
-- ANSWER: 774
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs 
WHERE title ILIKE '%analyst%'

-- #12
-- QUESTION: How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
-- ANSWER: Tableau
SELECT title 
FROM data_analyst_jobs
WHERE title NOT ILIKE '%analyst%' 
AND title NOT ILIKE '%analytics%'
	 


-- BONUS
-- You want to understand which jobs requiring SQL are hard to fill. 
-- Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
-- 		- Disregard any postings where the domain is NULL. 
-- 		- Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
-- 		- Which three industries are in the top 4 on this list? Internet & Software Company, Banks and Financial Services, Health Care
-- 		- How many jobs have been listed for more than 3 weeks for each of the top 4?
SELECT domain, COUNT(title) AS total_jobs
FROM data_analyst_jobs
WHERE skill ILIKE '%sql%' 
AND days_since_posting > 21
AND domain IS NOT NULL 
GROUP BY domain
ORDER BY total_jobs DESC

 

