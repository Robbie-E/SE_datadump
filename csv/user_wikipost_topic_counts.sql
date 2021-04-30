SELECT posts.owneruserid AS wikipost_authorid, COUNT(tags.tagname) AS wikipost_topic_count 
FROM posts INNER JOIN tags ON (posts.id=tags.wikipostid)
GROUP BY wikipost_authorid ORDER BY wikipost_authorid;