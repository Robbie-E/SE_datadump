SELECT badges.class, COUNT(badges.userid) AS user_count FROM badges 
GROUP BY badges.class ORDER BY badges.class;