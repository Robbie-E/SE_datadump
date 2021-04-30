SELECT posts.owneruserid AS excerptpost_authorid, COUNT(tags.tagname) AS excerptpost_topic_count 
FROM posts INNER JOIN tags ON (posts.id=tags.excerptpostid) 
GROUP BY excerptpost_authorid ORDER BY excerptpost_authorid;