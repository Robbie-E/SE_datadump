SELECT users.id, users.reputation, COUNT(comments.id) AS comment_count, EXTRACT(YEAR FROM (SELECT AGE(NOW(), users.creationdate))) AS age
FROM users LEFT JOIN comments ON (users.id=comments.userid)
GROUP BY users.id HAVING COUNT(comments.id) >=1 
ORDER BY comment_count;