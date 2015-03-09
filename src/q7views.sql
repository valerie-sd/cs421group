--COMP 421
--Group 11
--Project Part 2
--Views

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