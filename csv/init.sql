SET client_encoding TO 'UTF8';

CREATE TABLE Users (
  Id INTEGER NOT NULL PRIMARY KEY,
  AccountId INTEGER,
  Reputation INTEGER,
  Views INTEGER,
  DownVotes INTEGER,
  UpVotes INTEGER,
  DisplayName VARCHAR(50),
  Location VARCHAR(100),
  ProfileImageUrl VARCHAR(200),
  WebsiteUrl VARCHAR(200),
  AboutMe VARCHAR(10000),
  CreationDate TIMESTAMP,
  LastAccessDate TIMESTAMP
);

CREATE TABLE Badges (
  Id INTEGER NOT NULL PRIMARY KEY, 
  UserId INTEGER REFERENCES Users (Id),
  Class INTEGER,
  Name VARCHAR(50) NOT NULL, 
  TagBased VARCHAR(10),
  Date TIMESTAMP NOT NULL
);

CREATE TABLE Posts (
  Id INTEGER NOT NULL PRIMARY KEY,
  OwnerUserId INTEGER REFERENCES Users (Id),
  LastEditorUserId INTEGER REFERENCES Users (Id),
  PostTypeId INTEGER,
  AcceptedAnswerId INTEGER, 
  Score INTEGER,
  ParentId INTEGER, 
  ViewCount INTEGER,
  AnswerCount INTEGER,
  CommentCount INTEGER,
  OwnerDisplayName VARCHAR(200),
  LastEditorDisplayName VARCHAR(200),
  Title VARCHAR(200),
  Tags VARCHAR(1000),
  ContentLicense VARCHAR(50),
  Body VARCHAR(100000),
  FavoriteCount INTEGER,
  CreationDate TIMESTAMP,
  CommunityOwnedDate TIMESTAMP,
  ClosedDate TIMESTAMP,
  LastEditDate TIMESTAMP,
  LastActivityDate TIMESTAMP
);

CREATE TABLE Comments (
  Id INTEGER NOT NULL PRIMARY KEY,
  PostId INTEGER REFERENCES Posts (Id),
  UserId INTEGER REFERENCES Users (Id),
  Score INTEGER,
  ContentLicense VARCHAR(50),
  UserDisplayName VARCHAR(50),
  Text VARCHAR(100000),
  CreationDate TIMESTAMP
);

CREATE TABLE Tags(
  Id INTEGER NOT NULL PRIMARY KEY,
  ExcerptPostId INTEGER REFERENCES Posts (Id), 
  WikiPostId INTEGER REFERENCES Posts (Id),
  TagName VARCHAR(100),
  Count INTEGER
);

COPY Users (Id, AccountId, Reputation, Views, DownVotes, UpVotes, DisplayName, Location, ProfileImageUrl, WebsiteUrl, AboutMe, CreationDate, LastAccessDate) 
FROM 'C:/Users/Public/csv/Users.csv' CSV HEADER;

COPY Badges (Id, UserId, Class, Name, TagBased, Date) FROM 'C:/Users/Public/csv/Badges.csv' CSV HEADER;

COPY Posts (Id, OwnerUserId, LastEditorUserId, PostTypeId, AcceptedAnswerId, Score, ParentId, ViewCount, AnswerCount, CommentCount, OwnerDisplayName, LastEditorDisplayName, Title, Tags, ContentLicense, Body, FavoriteCount, CreationDate, CommunityOwnedDate, ClosedDate, LastEditDate, LastActivityDate)
FROM 'C:/Users/Public/csv/Posts.csv' CSV HEADER;

COPY Comments (Id, PostId, UserId, Score, ContentLicense, UserDisplayName, Text, CreationDate) FROM 'C:/Users/Public/csv/Comments.csv' CSV HEADER;

COPY Tags (Id, ExcerptPostId, WikiPostId, TagName, Count) FROM 'C:/Users/Public/csv/Tags.csv' CSV HEADER;
