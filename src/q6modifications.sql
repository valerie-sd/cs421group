--COMP 421
--Group 11
--Project Part 2
--Table modifications

--alteration: for all pets with birthdays today, increment age by 1.
UPDATE pet_pages SET age = age + 1
	WHERE birthday = current_date;

--alteration: delete all pages that no one likes.
DELETE FROM posts
	WHERE parent_post_id
	IN (SELECT page_id FROM interest_pages WHERE num_likers = 0);
DELETE FROM pet_likes_interest
	WHERE interest_id
	IN (SELECT page_id FROM interest_pages WHERE num_likers = 0);
DELETE FROM pages 
	WHERE page_id 
	IN (SELECT page_id FROM interest_pages WHERE num_likers = 0);
		
--alteration: delete a pet, and then decrement all pages that they liked.
UPDATE interest_pages ip SET num_likers = num_likers - 1
	FROM pet_likes_interest pli 
	WHERE pli.pet_id = 02 AND pli.interest_id = ip.page_id;
DELETE FROM polls WHERE creator = 02;
DELETE FROM pet_friends_with WHERE pet_id = 02 OR friend_id = 02;
DELETE FROM pet_likes_interest WHERE pet_id = 02;
DELETE FROM pet_in_activity WHERE pet_id = 02;
DELETE FROM pet_in_group WHERE pet_id = 02 OR group_id = 02;
DELETE FROM pet_poll_response WHERE pet_id = 02;
DELETE FROM posts WHERE parent_post_id = 02;
DELETE FROM pages WHERE page_id = 02;	
 
--alteration: add a "City" field to the pages table, and make it NULL-able. Add some values.
ALTER TABLE pages 
	ADD COLUMN city varchar(20) NULL;
UPDATE pages SET city = 'Montreal'
	WHERE page_id % 3 = 2;
UPDATE pages SET city = 'Verdun'
	WHERE page_id % 3 = 1;
UPDATE pages SET city = 'Westmount'
	WHERE page_id % 3 = 0;