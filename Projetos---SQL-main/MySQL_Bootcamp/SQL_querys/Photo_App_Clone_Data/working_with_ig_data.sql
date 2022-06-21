-- CHALLENGE 1
SELECT username AS "Username", 
    created_at AS "Date entered"
FROM users
ORDER BY created_at
LIMIT 5;


SELECT DAYNAME(created_at) AS "Day of the week",
    COUNT(DAYNAME(created_at)) AS "Frequency"
FROM users
GROUP BY DAYNAME(created_at)
ORDER BY COUNT(DAYNAME(created_at)) DESC
LIMIT 2;


-- CHALLENGE 3
SELECT username AS "Inactive users"
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.created_at IS NULL;


-- CHALLENGE 4
SELECT users.username AS "Username", 
    photos.image_url "Photo posted", 
    COUNT(*) AS "Number of likes" 
FROM photos
JOIN likes
    ON photos.id = likes.photo_id
JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY COUNT(*) DESC
LIMIT 1;


-- CHALLENGE 5
SELECT
    (SELECT COUNT(*) FROM photos)
    /
    (SELECT COUNT(*) FROM users) AS "Average post";


-- CHALLENGE 6
SELECT tags.tag_name AS "Hashtag", 
    COUNT(*) AS "Frequency"
FROM tags
JOIN photo_tags
    ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY COUNT(*) DESC
LIMIT 5;


-- CHALLENGE 7
SELECT username, COUNT(*) AS total
FROM users
JOIN likes
    ON users.id = likes.user_id
GROUP BY users.id
HAVING total = (SELECT COUNT(*) FROM photos);