--COMP 421
--Group 11
--Project Part 2
--Views
CREATE VIEW FrisbeeFans AS
SELECT page_id, name, species, age FROM pages PA, pet_pages PP, pet_likes_interest I
WHERE PP.page_id = I.pet_id AND PA.page_id = I.pet_id AND I.interest_id = 17;

CREATE VIEW NumberOfFriends AS
SELECT pages.page_id, name, species, age, COUNT(*) FROM pages, pet_pages, pet_friends_with
WHERE pages.page_id = pet_pages.page_id AND pages.page_id = pet_friends_with.pet_id OR pages.page_id = pet_friends_with.friend_id
GROUP BY pages.page_id;
