--COMP 421
--Group 11
--Project Part 2
--Table modifications

--alteration: for all pets with birthdays today, increment age by 1.
UPDATE pet_pages SET age = age + 1
	WHERE birthday == current_date;

--alteration: for all pets who answered yes to this poll, make a post saying so.
	
--alteration: delete a pet, and then decrement all pages that they liked.
UPDATE interest_pages i 
	INNER JOIN pet_likes_interest l ON
		l.pet_id = 02 AND l.interest_id = i.page_id
	SET num_likers -= 1;
DELETE FROM pages WHERE page_id = 02;
	 

--alteration: add a "City" field to the pages table, and make it NULL-able. Add some values.
ALTER TABLE pages 
	ADD COLUMN city varchar(20) NULL;
INSERT INTO pages (city) VALUES ("Montreal")
	WHERE page_id % 3 == 2;
INSERT INTO pages (city) VALUES ("Verdun")
	WHERE page_id % 3 == 1;
INSERT INTO pages (city) VALUES ("Westmount")
	WHERE page_id % 3 == 0;