SELECT users.id, users.reputation, COUNT(posts.id) AS post_count, EXTRACT(YEAR FROM (SELECT AGE(NOW(), users.creationdate))) AS age
FROM users LEFT JOIN posts ON (users.id=posts.owneruserid) 
GROUP BY users.id HAVING COUNT(posts.id) >=1 
ORDER BY post_count;

