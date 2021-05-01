# SE_datadump
Exploring users and how they post/comment using a subset of the StackExchange Data Dump.

I followed this schematic for the relationship between tables and meaning of variables:
https://meta.stackexchange.com/questions/2677/database-schema-documentation-for-the-public-data-dump-and-sede

See csv/readme.txt for more details.

A) Setup: Include the original CSV files from https://drive.google.com/file/d/16QZ33cGlGTlg7rzC_N9AnF0FG3oUkDuG/view?usp=sharing in this folder if you will run locally.

  On psql shell (:
  CREATE DATABASE se_datadump;
  \c se_datadump
  \i 'C:/Users/Public/csv/init.sql'

B) Run these queries:
  1) For user profiles:
  \i 'C:/Users/Public/csv/user_post_count.sql'
  \i 'C:/Users/Public/csv/user_comment_count.sql'

  2) For user posting/commenting frequency:
  \i 'C:/Users/Public/csv/questions_answers_comments.sql'

  3) Topics posted by users:
  \i 'C:/Users/Public/csv/user_excerptpost_topics.sql'
  \i 'C:/Users/Public/csv/user_excerptpost_topic_counts.sql'

  \i 'C:/Users/Public/csv/user_wikipost_topics.sql'
  \i 'C:/Users/Public/csv/user_wikipost_topic_counts.sql'
  
C) The resulting CSV files are used for analysis as shown in the Jupyter notebook.
