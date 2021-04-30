I followed this schematic for the relationship between tables and meaning of variables:
https://meta.stackexchange.com/questions/2677/database-schema-documentation-for-the-public-data-dump-and-sede

SETUP: Put the original CSV files from https://drive.google.com/file/d/16QZ33cGlGTlg7rzC_N9AnF0FG3oUkDuG/view?usp=sharing in this folder if you will run locally.
on psql shell:

CREATE DATABASE se_datadump;
\c se_datadump
\i 'C:/Users/Public/csv/init.sql'

Run these queries:
1) For Item 1:
\i 'C:/Users/Public/csv/user_post_count.sql'
\i 'C:/Users/Public/csv/user_comment_count.sql'

To export to CSV:
\copy (SELECT users.id, users.reputation, COUNT(comments.id) AS comment_count, EXTRACT(YEAR FROM (SELECT AGE(NOW(), users.creationdate))) AS age FROM users LEFT JOIN comments ON (users.id=comments.userid) GROUP BY users.id HAVING COUNT(comments.id) >=1 ORDER BY comment_count) TO 'C:/Users/Public/csv/user_comment_count.csv' With CSV HEADER
\copy (SELECT users.id, users.reputation, COUNT(posts.id) AS post_count, EXTRACT(YEAR FROM (SELECT AGE(NOW(), users.creationdate))) AS age FROM users LEFT JOIN posts ON (users.id=posts.owneruserid)  GROUP BY users.id HAVING COUNT(posts.id) >=1  ORDER BY post_count) To 'C:/Users/Public/csv/user_post_count.csv' With CSV HEADER

2) For Item 2:
\i 'C:/Users/Public/csv/questions_answers_comments.sql'

To export to CSV:
\copy (SELECT qa_counts.userid, ROUND((ques_count+1)/(ans_count + comment_count)+2, 2) AS ques_to_reply_ratio FROM (SELECT userid, ques_count, ans_count FROM (SELECT posts.owneruserid AS userid, COUNT(posts.id) AS ques_count FROM posts WHERE posts.posttypeid=1 AND posts.owneruserid IS NOT NULL GROUP BY posts.owneruserid)question INNER JOIN (SELECT posts.owneruserid AS userid, COUNT(posts.id) AS ans_count FROM posts WHERE posts.posttypeid=2 AND posts.owneruserid IS NOT NULL GROUP BY posts.owneruserid)answer USING (userid))qa_counts INNER JOIN (SELECT comments.userid, COUNT(comments.id) AS comment_count FROM comments GROUP BY comments.userid HAVING comments.userid IS NOT NULL)cmt_counts ON (qa_counts.userid=cmt_counts.userid) ORDER BY userid) To 'C:/Users/Public/csv/questions_answers_comments.csv' With CSV HEADER

3) For Item 3:
\i 'C:/Users/Public/csv/user_excerptpost_topics.sql'
\i 'C:/Users/Public/csv/user_excerptpost_topic_counts.sql'

To export the latter query to CSV:
\copy (SELECT posts.owneruserid AS excerptpost_authorid, COUNT(tags.tagname) AS excerptpost_topic_count FROM posts INNER JOIN tags ON (posts.id=tags.excerptpostid) GROUP BY excerptpost_authorid ORDER BY excerptpost_authorid) To 'C:/Users/Public/csv/excerpt_topic_counts.csv' With CSV HEADER

\i 'C:/Users/Public/csv/user_wikipost_topics.sql'
\i 'C:/Users/Public/csv/user_wikipost_topic_counts.sql'

To export the latter query to CSV:
\copy (SELECT posts.owneruserid AS wikipost_authorid, COUNT(tags.tagname) AS wikipost_topic_count FROM posts INNER JOIN tags ON (posts.id=tags.wikipostid) GROUP BY wikipost_authorid ORDER BY wikipost_authorid) To 'C:/Users/Public/csv/wiki_topic_counts.csv' With CSV HEADER

The resulting CSV files are used for analysis as shown in the JuPyter notebook.
