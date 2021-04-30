SELECT posts.owneruserid AS wikipost_authorid, tags.wikipostid, tags.tagname 
FROM posts INNER JOIN tags ON (posts.id=tags.wikipostid)
ORDER BY wikipost_authorid;