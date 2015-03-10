--COMP 421
--Group 11
--Project Part 2
--Views

--Pets interested in frisbee
CREATE VIEW FrisbeeFans AS
SELECT PA.page_id, PA.pname, PP.species, PP.age FROM pages PA, pet_pages PP, pet_likes_interest I
WHERE PP.page_id = I.pet_id AND PA.page_id = I.pet_id AND I.interest_id = 17;

--Shows pets with more than 5 friends
CREATE VIEW NumberOfFriends AS
SELECT DISTINCT pages.page_id, pages.pname, pet_pages.species, pet_pages.age, COUNT(*) AS friends FROM pages, pet_pages, pet_friends_with
WHERE pages.page_id = pet_pages.page_id AND pages.page_id = pet_friends_with.pet_id OR pages.page_id = pet_friends_with.friend_id
GROUP BY pages.page_id, pages.pname, pet_pages.species, pet_pages.age
HAVING COUNT(*) > 5;

--Selects pets interested in frisbee older than 1 year old
SELECT DISTINCT pages.pname, pet_pages.species, pet_pages.age
FROM pages, pet_pages, FrisbeeFans
WHERE pet_pages.age > 1;

--Selects dogs with more than 5 friends
SELECT pages.pname, pet_pages.age
FROM pages, pet_pages, NumberOfFriends
WHERE species = 'dog';
