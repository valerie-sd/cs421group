--COMP421 
--Group 11 
--Project Part 2
--Schema definitions

DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

CREATE TABLE users (
	user_id		INTEGER 	PRIMARY KEY,
	email		VARCHAR(150)	NOT NULL,
	password	VARCHAR(150)	NOT NULL
);

CREATE TABLE pages (
	page_id		INTEGER 	PRIMARY KEY,
	pname		VARCHAR(100)	NOT NULL,
	pic_path	VARCHAR(200)	NOT NULL DEFAULT '/pic/default.png',
	description	TEXT		NULL,
	manager_user_id	INTEGER		NOT NULL REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE group_pages (
	page_id		INTEGER		PRIMARY KEY REFERENCES pages(page_id) ON DELETE CASCADE,
	num_members	INTEGER		NOT NULL DEFAULT 0,
	-- privacy is a flag that is either P for public or G for group
	privacy		CHAR(1)		NOT NULL DEFAULT 'P' CHECK (privacy ~ '^[PG]$')
);

CREATE TABLE interest_pages (
	page_id		INTEGER		PRIMARY KEY REFERENCES pages(page_id) ON DELETE CASCADE,
	num_likers	INTEGER		NOT NULL DEFAULT 0
);

CREATE TABLE pet_pages (
	page_id		INTEGER		PRIMARY KEY REFERENCES pages(page_id) ON DELETE CASCADE,
	species		VARCHAR(100)	NOT NULL,
	gender		CHAR(1)		NOT NULL DEFAULT 'N' CHECK (gender ~ '^[MFN]$'),
	age		INTEGER		NULL
);

CREATE TABLE posts (
	post_id		INTEGER		PRIMARY KEY,
	content_path	VARCHAR(200)	NOT NULL DEFAULT '/post/default.txt',
	time_stamp	TIMESTAMP	NOT NULL DEFAULT CURRENT_TIMESTAMP,
	creator		INTEGER		NOT NULL REFERENCES pages(page_id),
	parent_post_id	INTEGER		NULL REFERENCES posts(post_id)
);

CREATE TABLE activities (
	activity_id	INTEGER		PRIMARY KEY,
	a_name		VARCHAR(150)	NOT NULL DEFAULT '',
	a_date		DATE		NULL,
	a_time		TIME		NULL,
	-- visibility is a flag that is either P for public or I for invited
	visibility	CHAR(1)		NOT NULL DEFAULT 'P' CHECK (visibility ~ '^[PI]$'),
	description	TEXT		NULL,
	manager_user_id	INTEGER		NOT NULL REFERENCES users(user_id) ON DELETE CASCADE
);
	
CREATE TABLE polls (
	poll_id		INTEGER		PRIMARY KEY,
	creator		INTEGER		NOT NULL REFERENCES pages(page_id) ON DELETE CASCADE,
	question_text	TEXT		NOT NULL
);

CREATE TABLE responses (
	response_id	INTEGER		PRIMARY KEY,
	response_text	TEXT		NOT NULL,
	num_votes	INTEGER		NOT NULL DEFAULT 0,
	poll_id		INTEGER		NOT NULL REFERENCES polls(poll_id) ON DELETE CASCADE
);

CREATE TABLE pet_friends_with (
	pet_id		INTEGER		NOT NULL REFERENCES pet_pages(page_id),
	friend_id	INTEGER		NOT NULL REFERENCES pet_pages(page_id)
);

CREATE TABLE pet_in_group (
	pet_id		INTEGER		NOT NULL REFERENCES pet_pages(page_id),
	group_id	INTEGER		NOT NULL REFERENCES group_pages(page_id)
);

CREATE TABLE pet_likes_interest (
	pet_id		INTEGER		NOT NULL REFERENCES pet_pages(page_id),
	interest_id	INTEGER		NOT NULL REFERENCES interest_pages(page_id)
);

CREATE TABLE pet_in_activity (
	pet_id		INTEGER		NOT NULL REFERENCES pet_pages(page_id),
	activity_id	INTEGER		NOT NULL REFERENCES activities(activity_id)
);

CREATE TABLE pet_poll_response (
	pet_id		INTEGER		NOT NULL REFERENCES pet_pages(page_id),
	response_id	INTEGER		NOT NULL REFERENCES responses(response_id),
	time_stamp	TIMESTAMP	NOT NULL DEFAULT CURRENT_TIMESTAMP
);
