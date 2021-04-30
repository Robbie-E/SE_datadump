SELECT qa_counts.userid, ROUND((ques_count+1)/(ans_count + comment_count)+2, 1) AS ques_to_reply_ratio FROM
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
)qa_counts INNER JOIN 
(SELECT comments.userid, COUNT(comments.id) AS comment_count FROM comments 
GROUP BY comments.userid HAVING comments.userid IS NOT NULL)cmt_counts
ON (qa_counts.userid=cmt_counts.userid)
ORDER BY userid;