--COMP 421
--Group 11
--Project Part 2
--Views
CREATE VIEW FrisbeeFans AS
SELECT page_id, name, species, age FROM pages PA, pet_pages PP, pet_likes_interest I
WHERE PP.page_id = I.pet_id AND PA.page_id = I.pet_id AND I.interest_id = 17;
