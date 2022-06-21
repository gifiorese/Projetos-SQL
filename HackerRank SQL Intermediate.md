Hi! Here you'll find the solutions to "SQL Intermediate" exercises from Hacker Rank 😁 <br>
Click on the titles to be directed to the full question 😁 <br>
<br>
Olá! Aqui você irá encontrar a resolução dos exercícios "SQL Intermediate" do Hacker Rank 😁 <br>
Clique nos títulos para ser direcionado(a) ao enunciado completo 😁

<br>
<br>
<br>

[Weather Observation Station 5](https://www.hackerrank.com/challenges/weather-observation-station-5)

**Question -** Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

**Solution** 
```sql
-- Shortest
SELECT 
    city, 
    LENGTH(city)
FROM station
ORDER BY LENGTH(city), city
LIMIT 1;

-- Longest
SELECT 
    city, 
    LENGTH(city)
FROM station
ORDER BY LENGTH(city) DESC, city
LIMIT 1;
```

<br>
<br>
<br>

[Binary Tree Node](https://www.hackerrank.com/challenges/binary-search-tree-1)

**Question -** You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

- Root: If node is root node.
- Leaf: If node is leaf node.
- Inner: If node is neither root nor leaf node.

**Solution** 
```sql
SELECT N,
    CASE
        WHEN P IS NULL THEN 'Root'
        WHEN (SELECT COUNT(*) FROM BST WHERE X.N=P)>0 THEN 'Inner'
        ELSE 'Leaf'
    END
FROM BST X
ORDER BY N;
```

<br>
<br>
<br>

[New Companies](https://www.hackerrank.com/challenges/the-company)

**Question -** Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy:
<br>
<br>
Founder --> Lead Manager --> Senior Manager --> Manager --> Employee 
<br>
<br>
Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.

**Solution** 
```sql
SELECT
    c.Company_Code,
    c.Founder,
    COUNT(DISTINCT e.Lead_Manager_Code),
    COUNT(DISTINCT e.Senior_Manager_Code),
    COUNT(DISTINCT e.Manager_Code),
    COUNT(DISTINCT e.Employee_Code)
FROM Company c
JOIN Employee e
    ON c.Company_Code = e.Company_Code
GROUP BY c.Company_Code, c.Founder
ORDER BY c.Company_Code;
```

<br>
<br>
<br>

[Weather Observation Station 20](https://www.hackerrank.com/challenges/weather-observation-station-20)

**Question -** A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.<br>
<br>
Median - Middle value between higher and lower portions<br>
ROW_NUMBER() OVER() - Assigns a unique number to each row in the table (starts at 1). This is a order sensitive function.<br>

**Solution** 
```sql
SELECT
    f.lat
FROM (SELECT 
        ROUND(lat_n, 4) as lat,
        ROW_NUMBER() OVER(ORDER BY lat_n) AS row_num
     FROM station
     ORDER BY row_num) f
WHERE f.row_num = CEIL((SELECT
                            COUNT(*) + 1
                          FROM station)/2);
```

<br>
<br>
<br>

[The Report](https://www.hackerrank.com/challenges/the-report)

**Question -** You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.
<br>
<br>
Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

Write a query to help Eve.

**Solution** 
```sql
SELECT
    CASE
        WHEN grades.grade >= 8 THEN students.name
        WHEN grades.grade < 8 THEN NULL
    END,
    grades.grade,
    students.marks
FROM students
LEFT JOIN grades
    ON students.marks >= grades.min_mark AND students.marks <= grades.max_mark
ORDER BY grades.grade DESC, 
    students.name ASC,
    students.marks ASC;
```

<br>
<br>
<br>

[Top Competitors](https://www.hackerrank.com/challenges/full-score)

**Question -** Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

**Solution** 
```sql
SELECT submissions.hacker_id, 
    hackers.name
FROM submissions
JOIN hackers
    ON submissions.hacker_id = hackers.hacker_id
JOIN challenges
    ON submissions.challenge_id = challenges.challenge_id
JOIN difficulty
    ON challenges.difficulty_level = difficulty.difficulty_level
WHERE submissions.score = difficulty.score
GROUP BY hackers.name, hackers.hacker_id
HAVING COUNT(submissions.challenge_id) > 1
ORDER BY COUNT(submissions.challenge_id) DESC, 
    hackers.hacker_id;
```

<br>
<br>
<br>

[Ollivander's Inventory](https://www.hackerrank.com/challenges/harry-potter-and-wands)

<div style="display: inline_block"><br>
  <img align="right" alt="Gi-pic" height="80" style="border-radius:50px;"  src="https://media.giphy.com/media/6CovzgyTig7M4/giphy.gif">
</div>

**Question -** Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.

**Solution** 
```sql
SELECT w.id, 
    wp.age, 
    w.coins_needed, 
    w.power
FROM wands AS w
JOIN wands_property AS wp
    ON w.code = wp.code
JOIN (SELECT
        age AS x, 
        MIN(coins_needed) AS y, 
        power AS z
     FROM wands AS w2
     JOIN wands_property AS wp2
        ON w2.code = wp2.code
     WHERE is_evil = 0
     GROUP BY power, age) AS a
    ON wp.age = x AND 
        w.coins_needed = y AND 
        w.power = z
ORDER BY w.power DESC, 
    wp.age DESC;
```

<br>
<br>
<br>
