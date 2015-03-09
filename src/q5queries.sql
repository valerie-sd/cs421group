--COMP 421
--Group 11
--Project Part 2
--Queries

--Returns all the posts made by a given page
SELECT posts.post_id, posts.creator, pages.pname, pages.description, pages.manager_user_id
FROM posts
JOIN pages
ON (posts.creator = pages.page_id);

--Returns the most popular interests amoungst users
SELECT pages.pname, pages.description, interest_pages.page_id, interest_pages.num_likers
FROM pages
JOIN interest_pages
ON interest_pages.num_likers >= 10;


--Returns the more popular responses for each poll
