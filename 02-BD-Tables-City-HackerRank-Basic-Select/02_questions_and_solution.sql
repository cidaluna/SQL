-- ORACLE DATABASE - PRACTICING BASIC SELECTS
-- WebSite: https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=true
-- 1. Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA. 
-- CITY TABLE:
SELECT *
FROM CITY
WHERE
COUNTRYCODE = 'USA'
AND
POPULATION > 100000;

-- 2. Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA. 
SELECT NAME
FROM CITY
WHERE
COUNTRYCODE = 'USA'
AND POPULATION > 120000;

-- 3. Query all columns (attributes) for every row in the CITY table.
SELECT *
FROM CITY;

-- 4. Query all columns for a city in CITY with the ID 1661.
SELECT *
FROM CITY
WHERE ID = 1661;

-- 5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN. 
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';

-- 6. Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN. 
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';

-- STATION TABLE:
-- 7. Query a list of CITY and STATE from the STATION table. 
SELECT CITY, STATE
FROM STATION;

-- 8. Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer. 
SELECT CITY, LENGTH(ID)
FROM STATION
ORDER BY LENGTH(ID)

-- 9. Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer. 
SELECT DISTINCT CITY 
FROM STATION 
WHERE MOD(ID,2)=0 
ORDER BY CITY ASC;       -- TODO: TESTAR NO ORACLE O MOD;


-- 10. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). 
-- If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically. 
-- TODO: TESTAR.. EM ORACLE NAO USAMOS O LIMIT, TEMOS QUE USAR O ROWNUM
SELECT * FROM (SELECT DISTINCT city, LENGTH(city) FROM station ORDER BY LENGTH(city) ASC, city ASC) WHERE ROWNUM = 1   
UNION  
SELECT * FROM (SELECT DISTINCT city, LENGTH(city) FROM station ORDER BY LENGTH(city) DESC, city ASC) WHERE ROWNUM = 1; 

-- 11. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION WHERE
CITY LIKE 'A%' OR
CITY LIKE 'E%' OR
CITY LIKE 'I%' OR
CITY LIKE 'O%' OR
CITY LIKE 'U%'; 
-- 12. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION WHERE CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u';

-- 13. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters.
-- Your result cannot contain duplicates.
-- ORACLE
SELECT DISTINCT CITY FROM STATION WHERE (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%') 
AND (CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u');


-- 14. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION WHERE CITY NOT LIKE 'A%' AND CITY NOT LIKE 'E%' AND CITY NOT LIKE 'I%' AND CITY NOT LIKE 'O%' AND CITY NOT LIKE 'U%';


-- 15. Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION WHERE CITY NOT LIKE '%a' AND CITY NOT LIKE '%e' AND CITY NOT LIKE '%i' AND CITY NOT LIKE '%o' AND CITY NOT LIKE '%u';

-- 16. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION WHERE (CITY NOT LIKE 'A%' AND CITY NOT LIKE 'E%' AND CITY NOT LIKE 'I%' AND CITY NOT LIKE 'O%' AND CITY NOT LIKE 'U%') 
OR (CITY NOT LIKE '%a' AND CITY NOT LIKE '%e' AND CITY NOT LIKE '%i' AND CITY NOT LIKE '%o' AND CITY NOT LIKE '%u'); 

-- 17. Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
SELECT (COUNT(CITY) - COUNT(DISTINCT CITY)) FROM STATION;

-- 18. Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION WHERE (CITY NOT LIKE 'A%' AND CITY NOT LIKE 'E%' AND CITY NOT LIKE 'I%' AND CITY NOT LIKE 'O%' AND CITY NOT LIKE 'U%' 
AND CITY NOT LIKE '%a' AND CITY NOT LIKE '%e' AND CITY NOT LIKE '%i' AND CITY NOT LIKE '%o' AND CITY NOT LIKE '%u');

-- 19. Query the Name of any student in STUDENTS who scored higher than Marks. Order your output by the last three characters of each name. 
-- If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
SELECT NAME FROM STUDENTS WHERE MARKS > 75 ORDER BY SUBSTR(NAME, -3) ASC, ID ASC;

-- 20. Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
SELECT NAME FROM EMPLOYEE ORDER BY NAME ASC;

-- 21. Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a 
-- salary greater than 2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.
SELECT NAME FROM EMPLOYEE WHERE SALARY > 2000 AND MONTHS < 10 ORDER BY EMPLOYEE_ID ASC;

-- 22. Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. 
-- Output one of the following statements for each record in the table:
--    Isosceles: It's a triangle with 2 sides of equal length.
--    Equilateral: It's a triangle with 3 sides of equal length.
--    Scalene: It's a triangle with 3 sides of differing lengths. --WHEN (A != B AND B != C) THEN 'Scalene'
--    Not A Triangle: The given values of A, B, and C don't form a triangle. Those 13,14,30 cannot form a triangle because the combined value of sides
--    A and B is not larger than that of side C.
SELECT (CASE WHEN (A+B)<=C THEN 'Not A Triangle'  WHEN (A=B AND A=C AND B=C) THEN 'Equilateral'  
WHEN (A!=B AND A!=C AND B!=C) THEN 'Scalene' ELSE 'Isosceles' END) FROM TRIANGLES;
