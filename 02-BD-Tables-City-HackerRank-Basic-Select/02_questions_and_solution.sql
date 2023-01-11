-- PRACTICING BASIC SELECTS
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