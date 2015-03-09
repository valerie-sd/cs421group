--COMP 421
--Group 11
--Project Part 2
--Queries

--Returns all the posts made by a given page
SELECT posts.post_id, posts.creator, pages.pname, pages.description, pages.manager_user_id
FROM posts, pages
WHERE posts.creator = pages.page_id;

--Returns all pets who are in some sort of activity
SELECT * FROM pet_pages WHERE pet_pages.page_id IN (SELECT pet_in_activity.pet_id FROM pet_in_activity);
--Returns the most popular interests amoungst users

--Returns the more popular responses for each poll
/*
--A view composed of the most popular interests amoungst users
CREATE VIEW Popular_Interests AS
SELECT pages.pname, pages.description, interest_pages.page_id, interest_pages.num_likers
FROM pages, interest_pages
WHERE interest_pages.num_likers >= 10 ;

--A view composed of the more popular responses for each poll
CREATE VIEW Popular_Responses AS
SELECT polls.question_text, responses.response_text, responses.num_votes
FROM polls, responses
WHERE polls.poll_id = responses.poll_id AND responses.num_votes >= 10 ;
*/
