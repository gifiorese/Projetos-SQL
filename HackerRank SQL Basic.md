Hi! Here you'll find the solutions to "SQL Basic" exercises from Hacker Rank 😁 <br>
Click on the titles to be directed to the full question 😁 <br>
<br>
Olá! Aqui você irá encontrar a resolução dos exercícios "SQL Basic" do Hacker Rank 😁 <br>
Clique nos títulos para ser direcionado(a) ao enunciado completo 😁

<br>
<br>
<br>

[Revising SELECT Query I](https://www.hackerrank.com/challenges/revising-the-select-query)

**Question -** Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

**Solution** 
```sql
SELECT * FROM city
WHERE population > 100000 && countrycode='USA';
```

<br>
<br>
<br>

[Revising SELECT Query II](https://www.hackerrank.com/challenges/revising-the-select-query-2)

**Question -** Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

**Solution**
```sql
SELECT name FROM city
WHERE population > 120000 && countrycode='USA';
```

<br>
<br>
<br>

[Select All](https://www.hackerrank.com/challenges/select-all-sql)

**Question -** Query all columns (attributes) for every row in the CITY table.

**Solution**
```sql
SELECT * FROM city;
```

<br>
<br>
<br>

[Select by ID](https://www.hackerrank.com/challenges/select-by-id)

**Question -** Query all columns for a city in CITY with the ID 1661.

**Solution**
```sql
SELECT * FROM city
WHERE id=1661;
```

<br>
<br>
<br>

[Japanese Cities' Attributes](https://www.hackerrank.com/challenges/japanese-cities-attributes)

**Question -** Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

**Solution**
```sql
SELECT * FROM city
WHERE countrycode='JPN';
```

<br>
<br>
<br>

[Japanese Cities' Names](https://www.hackerrank.com/challenges/japanese-cities-name)

**Question -** Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

**Solution**
```sql
SELECT name FROM city
WHERE countrycode='JPN';
```

<br>
<br>
<br>

[Employee's Names](https://www.hackerrank.com/challenges/name-of-employees)

**Question -** Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

**Solution**
```sql
SELECT name FROM Employee
ORDER BY name;
```

<br>
<br>
<br>

[Employee's Salaries](https://www.hackerrank.com/challenges/salary-of-employees)

**Question -** Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

**Solution**
```sql
SELECT name FROM Employee
WHERE salary > 2000 && months < 10
ORDER BY employee_id;
```

<br>
<br>
<br>

[Weather Observation Station 1](https://www.hackerrank.com/challenges/weather-observation-station-1)

**Question -** Query a list of CITY and STATE from the STATION table.

**Solution**
```sql
SELECT city, state FROM station;
```

<br>
<br>
<br>

[Weather Observation Station 2](https://www.hackerrank.com/challenges/weather-observation-station-2)

**Question -** Query the following two values from the STATION table:
1) The sum of all values in LAT_N rounded to a scale of 2 decimal places.
2) The sum of all values in LONG_W rounded to a scale of 2 decimal places.

**Solution**
```sql
SELECT
    ROUND(SUM(lat_n), 2),
    ROUND(SUM(long_w), 2)
FROM station;
```

<br>
<br>
<br>

[Weather Observation Station 3](https://www.hackerrank.com/challenges/weather-observation-station-3)

**Question -** Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

**Solution**
```sql
SELECT DISTINCT city FROM station
WHERE MOD(ID, 2)=0;
```

<br>
<br>
<br>

[Weather Observation Station 4](https://www.hackerrank.com/challenges/weather-observation-station-4)

**Question -** Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

**Solution**
```sql
SELECT 
    COUNT(city) - COUNT(DISTINCT(city))
FROM station;
```

<br>
<br>
<br>

[Weather Observation Station 6](https://www.hackerrank.com/challenges/weather-observation-station-6)

**Question -** Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

**Solution**
```sql
SELECT city FROM station
WHERE city LIKE 'a%' || city LIKE 'e%' || 
    city LIKE 'i%' || city LIKE 'o%' || city LIKE 'u%';
```

<br>
<br>
<br>

[Weather Observation Station 7](https://www.hackerrank.com/challenges/weather-observation-station-7)

**Question -** Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

**Solution**
```sql
SELECT DISTINCT(city) 
FROM station
WHERE city LIKE '%a' || city LIKE '%e' || city LIKE '%i' ||
    city LIKE '%o' || city LIKE '%u';
```

<br>
<br>
<br>

[Weather Observation Station 8](https://www.hackerrank.com/challenges/weather-observation-station-8)

**Question -** Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

**Solution**
```sql
SELECT DISTINCT(city)
FROM station
WHERE (city LIKE 'a%' || city LIKE 'e%' || 
       city LIKE 'i%' || city LIKE 'o%' || city LIKE 'u%') && 
    (city LIKE '%a' || city LIKE '%e' || 
       city LIKE '%i' || city LIKE '%o' || city LIKE '%u');
```

<br>
<br>
<br>

[Weather Observation Station 9](https://www.hackerrank.com/challenges/weather-observation-station-9)

**Question -** Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

**Solution**
```sql
SELECT DISTINCT(city)
FROM station
WHERE UPPER(SUBSTR(city,1,1)) NOT IN ('A', 'E', 'I', 'O', 'U');
```
**OBS** SQL starts counting at 1, since we want only the first letter it'll be (1,1)

<br>
<br>
<br>

[Weather Observation Station 10](https://www.hackerrank.com/challenges/weather-observation-station-10)

**Question -** Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

**Solution**
```sql
SELECT DISTINCT(city)
FROM station
WHERE LOWER(SUBSTR(city, LENGTH(city), 1)) NOT IN ('a', 'e', 'i', 'o', 'u');
```

<br>
<br>
<br>

[Weather Observation Station 11](https://www.hackerrank.com/challenges/weather-observation-station-11)

**Question -** Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

**Solution**
```sql
SELECT DISTINCT(city)
FROM station
WHERE (UPPER(SUBSTR(city, 1, 1)) NOT IN ('A','E','I','O','U')) ||
    (LOWER(SUBSTR(city, LENGTH(city), 1)) NOT IN ('a','e','i','o','u'));
```

<br>
<br>
<br>

[Weather Observation Station 12](https://www.hackerrank.com/challenges/weather-observation-station-12)

**Question -** Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

**Solution**
```sql
SELECT DISTINCT(city)
FROM station
WHERE (UPPER(SUBSTR(city, 1, 1)) NOT IN ('A','E','I','O','U')) &&
    (LOWER(SUBSTR(city, LENGTH(city), 1)) NOT IN ('a','e','i','o','u'));
SELECT DISTINCT(city)
FROM station
WHERE (UPPER(SUBSTR(city, 1, 1)) NOT IN ('A','E','I','O','U')) &&
    (LOWER(SUBSTR(city, LENGTH(city), 1)) NOT IN ('a','e','i','o','u'));
```

<br>
<br>
<br>

[Weather Observation Station 13](https://www.hackerrank.com/challenges/weather-observation-station-13)

**Question -** Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places.

**Solution**
```sql
SELECT
    ROUND(SUM(lat_n), 4)
FROM station
WHERE lat_n BETWEEN 38.7880 AND 137.2345;
```

<br>
<br>
<br>

[Weather Observation Station 14](https://www.hackerrank.com/challenges/weather-observation-station-14)

**Question -** Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places.

**Solution**
```sql
SELECT
    TRUNCATE(MAX(lat_n), 4)
FROM station
WHERE lat_n < 137.2345;
```

<br>
<br>
<br>

[Weather Observation Station 15](https://www.hackerrank.com/challenges/weather-observation-station-15/problem?isFullScreen=true)

**Question -** Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places.

**Solution**
```sql
SELECT
    ROUND(long_w, 4)
FROM station
WHERE lat_n = (SELECT MAX(lat_n) 
               FROM station 
               WHERE lat_n < 137.2345);
```

<br>
<br>
<br>

[Weather Observation Station 16](https://www.hackerrank.com/challenges/weather-observation-station-16)

**Question -** Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.

**Solution**
```sql
SELECT
    ROUND(MIN(lat_n), 4)
FROM station
WHERE lat_n > 38.7780;
```

<br>
<br>
<br>

[Weather Observation Station 17](https://www.hackerrank.com/challenges/weather-observation-station-17)

**Question -** Query the Western Longitude (LONG_W) where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places.

**Solution**
```sql
SELECT
    ROUND(long_w, 4)
FROM station
WHERE lat_n = (SELECT MIN(lat_n)
      FROM station
      WHERE lat_n > 38.7780);
```

<br>
<br>
<br>

[Weather Observation Station 18](https://www.hackerrank.com/challenges/weather-observation-station-18) - MEDIUM

**Question -** Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.

- a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
- b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
- c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
- d happens to equal the maximum value in Western Longitude (LONG_W in STATION).

Query the Manhattan Distance (|x1 - x2| + |y1 - y2|) between points P1 and P2 and round it to a scale of 4 decimal places.

**Solution**
```sql
SELECT
    ROUND(
        ABS(MIN(lat_n) - MAX(lat_n)) + ABS(MIN(long_w) - MAX(long_w)), 
        4
    )
FROM station;
```

<br>
<br>
<br>

[Weather Observation Station 19](https://www.hackerrank.com/challenges/weather-observation-station-19) - MEDIUM

**Question -** Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) re the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidian Distance ( ((y1 - x1)^2 + (y2 - x2)^2)^(1/2) ) between points P1 and P2 and round it to a scale of 4 decimal places.

**Solution**
```sql
SELECT
    ROUND(
        SQRT(
            POWER((MAX(lat_n)-MIN(lat_n)), 2) + POWER((MAX(long_w)-MIN(long_w)), 2)
        ),
        4
    )
FROM station;
```

<br>
<br>
<br>

[More Than 75 Marks](https://www.hackerrank.com/challenges/more-than-75-marks)

**Question -** Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

**Solution**
```sql
SELECT Name FROM Students
WHERE Marks > 75
ORDER BY SUBSTR(Name, -3, LENGTH(Name)), ID;
```

<br>
<br>
<br>

[Type of Triangle](https://www.hackerrank.com/challenges/what-type-of-triangle)

**Question -** Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table: _Equilateral_ - It's a triangle with  sides of equal length; _Isosceles_ - It's a triangle with  sides of equal length; _Scalene_ - It's a triangle with  sides of differing lengths; _Not A Triangle_ - The given values of A, B, and C don't form a triangle.

**Solution**
```sql
SELECT
  CASE
    WHEN A + B > C AND A + C > B AND B + C > A THEN 
      CASE
        WHEN A = B && B = C THEN 'Equilateral' 
        WHEN A = B || B = C || A = C THEN 'Isosceles' 
        ELSE 'Scalene' 
      END 
    ELSE 'Not A Triangle' 
  END FROM TRIANGLES;
```

<br>
<br>
<br>

[The PADS](https://www.hackerrank.com/challenges/the-pads) - MEDIUM

**Question -** Generate the following two result sets:

1) Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).

2) Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format

**Solution**
```sql
SELECT CONCAT(Name, '(', SUBSTR(Occupation,1,1), ')') AS name
FROM OCCUPATIONS
ORDER BY name;

SELECT CONCAT('There are a total of', ' ', COUNT(Occupation), ' ', LOWER(Occupation), 's', '.') AS profession
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY profession;
```

<br>
<br>
<br>

[Revising Aggregations](https://www.hackerrank.com/challenges/revising-aggregations-the-count-function)

**Question -** Query a count of the number of cities in CITY having a Population larger than 100000.

**Solution**
```sql
SELECT COUNT(*)
FROM city
WHERE population > 100000;
```

<br>
<br>
<br>

[Revising Aggregations - The Sum function](https://www.hackerrank.com/challenges/revising-aggregations-sum)

**Question -** Query the total population of all cities in CITY where District is California.

**Solution**
```sql
SELECT SUM(population)
FROM city
WHERE district = 'California';
```

<br>
<br>
<br>

[Revising Aggregations - Averages](https://www.hackerrank.com/challenges/revising-aggregations-the-average-function)

**Question -** Query the average population of all cities in CITY where District is California.

**Solution**
```sql
SELECT AVG(population)
FROM city
WHERE district = 'California';
```

<br>
<br>

**Solution 2** - In case you want to display a rounded value with 2 decimals
```sql
SELECT ROUND(AVG(population), 2)
FROM city
WHERE district = 'California';
```

<br>
<br>
<br>

[Average Population](https://www.hackerrank.com/challenges/average-population)

**Question -** Query the average population for all cities in CITY, rounded down to the nearest integer.

**Solution**
```sql
SELECT ROUND(AVG(population))
FROM city;
```

<br>
<br>
<br>

[Japan Population](https://www.hackerrank.com/challenges/japan-population)

**Question -** Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

**Solution**
```sql
SELECT SUM(population)
FROM city
WHERE countrycode = 'JPN';
```

<br>
<br>
<br>

[Population Density Difference](https://www.hackerrank.com/challenges/japan-population)

**Question -** Query the difference between the maximum and minimum populations in CITY.

**Solution**
```sql
SELECT 
    (MAX(population) - MIN(population))
FROM city;
```

<br>
<br>
<br>

[The Blunder](https://www.hackerrank.com/challenges/the-blunder) <br>

**Question -** Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's 0 key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries), and round it up to the next integer.

<br>

CEIL --> Gets the nearest integer of the number (The output will always be greater than or equal to) <br>
Using ROUND will not give the desired output <br>

**Solution**
```sql
SELECT 
    CEIL(
        AVG(salary) - AVG(REPLACE(salary, '0', ''))
    )
FROM employees;
```

<br>
<br>
<br>

[Top Earners](https://www.hackerrank.com/challenges/earnings-of-employees)

**Question -** We define an employee's total earnings to be their monthly (salary X months) worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.

**Solution**
```sql
SELECT
    MAX(salary * months),
    COUNT(salary * months)
FROM employee
WHERE salary * months = (SELECT 
                            MAX(salary * months) 
                         FROM employee);
```

<br>
<br>
<br>

[Population Census](https://www.hackerrank.com/challenges/asian-population)

**Question -** Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

**Solution**
```sql
SELECT 
    SUM(city.population)
FROM country
JOIN city 
    ON country.code = city.countrycode
WHERE country.continent = 'Asia';
```

<br>
<br>
<br>

[African Cities](https://www.hackerrank.com/challenges/african-cities)

**Question -** Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

**Solution**
```sql
SELECT city.name
FROM city
JOIN country
    ON city.countrycode = country.code
WHERE country.continent = 'Africa';
```

<br>
<br>
<br>

[Average Population of Each Country](https://www.hackerrank.com/challenges/average-population-of-each-continent)

**Question -** Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

FLOOR() --> Returns the largest integer value that is smaller than or equal to a number.

**Solution**
```sql
SELECT
    country.continent,
    FLOOR(AVG(city.population))
FROM country
JOIN city
    ON country.code = city.countrycode
GROUP BY country.continent;
```
