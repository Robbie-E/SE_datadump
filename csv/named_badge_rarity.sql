SELECT badges.name, COUNT(badges.userid) AS user_count FROM badges 
GROUP BY badges.name ORDER BY COUNT(badges.userid) DESC;