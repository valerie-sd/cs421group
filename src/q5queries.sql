--COMP 421
--Group 11
--Project Part 2
--Queries

--Returns all the posts made by a given page
SELECT posts.post_id, posts.creator, pages.pname, pages.description, pages.manager_user_id
FROM posts, pages
WHERE posts.creator = pages.page_id;

--Returns all pets who are in some sort of activity
SELECT * 
FROM pet_pages
WHERE pet_pages.page_id 
IN (SELECT pet_in_activity.pet_id 
	FROM pet_in_activity);
	
--Returns the popular responses amoungst users
SELECT TEMP.question_text, TEMP.response_text, TEMP.num_votes
FROM ( SELECT * 
	   FROM polls 
	   JOIN responses 
	   ON polls.poll_id = responses.poll_id )  AS TEMP
WHERE TEMP.num_votes >= 10;

--Lists everyone and their friends
SELECT DISTINCT *
FROM pet_pages
JOIN pet_friends_with
ON pet_pages.page_id = pet_friends_with.pet_id;

--Lists all interests of each pet
SELECT DISTINCT 
FROM interest_pages, pet_likes_interest, pet_pages
WHERE interest_pages.page_id = pet_likes_interest.interest_id AND pet_pages.page_id = pet_likes_interest.pet_id;
