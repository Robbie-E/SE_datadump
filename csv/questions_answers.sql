SELECT qa_counts.userid, ques_count, ans_count FROM
(
SELECT userid, ques_count, ans_count FROM
	(SELECT posts.owneruserid AS userid, COUNT(posts.id) AS ques_count 
	FROM posts WHERE posts.posttypeid=1 AND posts.owneruserid IS NOT NULL 
	GROUP BY posts.owneruserid)question 
INNER JOIN
	(SELECT posts.owneruserid AS userid, COUNT(posts.id) AS ans_count 
	FROM posts WHERE posts.posttypeid=2 AND posts.owneruserid IS NOT NULL 
	GROUP BY posts.owneruserid)answer 
USING (userid)
)qa_counts;