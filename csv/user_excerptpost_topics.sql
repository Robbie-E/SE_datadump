SELECT posts.owneruserid AS excerptpost_authorid, tags.excerptpostid, tags.tagname 
FROM posts INNER JOIN tags ON (posts.id=tags.excerptpostid) 
ORDER BY excerptpost_authorid;