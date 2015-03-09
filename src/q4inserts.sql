--COMP 421
--Group 11
--Project Part 2
--Populating Tables

INSERT INTO users (user_id, email, password) VALUES 
	(1, 'furrymachine@gmail.com', 'woofwoof123'),
	(2, 'phil@yahoo.com', 'password'),
	(3, 'australia@outbackgrill.com', 'icantrememberthis321'),
	(4, 'ihateinsertstatements@everyone.com', 'whyyyyyyY'),
	(5, 'cat@daddy.com', 'purrrfect'),
	(6, 'gavin.belsen@whitehouse.gov', 'l33t5p34k');

INSERT INTO pages (page_id, pname, pic_path, description, manager_user_id) VALUES
	(01, 'Max', DEFAULT, 'The best dog ever', 1),
	(02, 'Sam', DEFAULT, 'The worst dog ever', 1),
	(03, 'Tim', DEFAULT, 'Everyone should have fish', 2),
	(04, 'Kit', DEFAULT, 'My fish will kill you', 2),
	(05, 'Kat', DEFAULT, 'Cats are the best', 3),
	(06, 'Jim', DEFAULT, 'Fat cat', 3),
	(07, 'Ric', DEFAULT, 'Max is my best friend', 4),
	(08, 'Rex', DEFAULT, 'I <3 catnip', 4),
	(09, 'Wot', DEFAULT, 'I am turtle I am slow', 5),
	(10, 'Mat', DEFAULT, NULL, 5),
	(11, 'Pig', DEFAULT, 'Why would anyone own a pig as a pet?', 6),
	(12, 'Cashew', DEFAULT, 'I hate the FBI', 5),
	(13, 'Dogs@McGill', DEFAULT, NULL, 5),
	(14, 'Cats@McGill', DEFAULT, 'Dogs suck', 5),
	(15, 'The best frisbee team', DEFAULT, NULL, 5),
	(16, 'Associated Soccerballers of Swaziland', DEFAULT, NULL, 6),
	(17, 'Frisbee', DEFAULT, NULL, 6),
	(18, 'Watching People', DEFAULT, NULL, 6),
	(19, 'Whatever', DEFAULT, NULL, 6),
	(20, '3AM DB party', DEFAULT, NULL, 6),
	(21, 'People', DEFAULT, NULL, 6),
	(22, 'Watching', DEFAULT, NULL, 6),
	(23, 'Waple', DEFAULT, NULL, 6),
	(24, 'Watce', DEFAULT, NULL, 6),
	(25, 'ple', DEFAULT, NULL, 6),
	(26, 'apple', DEFAULT, NULL, 2);


INSERT INTO group_pages (page_id, num_members, privacy) VALUES
	(13, 0, 'P'),
	(14, 0, 'G'),
	(15, 0, 'G');

INSERT INTO interest_pages (page_id, num_likers) VALUES
	(16, 0),
	(17, 0),
	(18, 0),
	(19, 0),
	(20, 11),
	(21, 4),
	(22, 10),
	(23, 25),
	(24, 55),
	(25, 11),
	(26, 25);

INSERT INTO pet_pages (page_id, species, gender, age) VALUES
	(01, 'Dog', 'M', 1),
	(02, 'Dog', 'F', 7),
	(03, 'Fish', 'M', 1),
	(04, 'Fish', 'F', 1),
	(05, 'Cat', 'F', 1),
	(06, 'Cat', 'N', 6),
	(07, 'Dog', 'M', 1),
	(08, 'Cat', 'F', 1),
	(09, 'Turtle', 'M', 2),
	(10, 'Cat', 'F', 1),
	(11, 'Pig', 'M', 1),
	(12, 'Gerbil', 'M', 3);

INSERT INTO posts (post_id, content_path, time_stamp, creator, parent_post_id) VALUES
	(01, DEFAULT, '2015-01-05 15:32:00', 01, NULL),
	(02, DEFAULT, '2015-01-05 15:55:00', 01, 01),
	(03, DEFAULT, '2015-01-06 09:32:00', 02, NULL),
	(04, DEFAULT, '2015-01-08 15:22:00', 06, 01),
	(05, DEFAULT, '2015-01-15 12:32:00', 13, NULL),
	(06, DEFAULT, '2015-01-17 07:11:00', 13, 02),
	(07, DEFAULT, '2015-01-19 15:32:00', 18, NULL),
	(08, DEFAULT, '2015-01-21 15:32:00', 18, NULL),
	(09, DEFAULT, '2015-01-21 15:33:00', 12, 06),
	(10, DEFAULT, '2015-01-21 21:10:00', 17, 06),
	(11, DEFAULT, '2015-02-05 15:32:00', 12, NULL),
	(12, DEFAULT, '2015-02-05 17:45:00', 07, 11);

INSERT INTO activities (activity_id, a_name, a_date, a_time, visibility, description, manager_user_id) VALUES
	(01, 'Go to dog park', '2015-02-21', '10:00:00', 'P', 'Max and friends go park', 1),
	(02, 'Cat meeting', '2015-03-01', '21:00:00', 'I', 'Secret Australian ILLUMINATI cats meet to plot plan to conquer SPACE THE FINAL FRONTIER', 3);

INSERT INTO polls (poll_id, creator, question_text) VALUES
	(01, 01, 'Is Max a good boy?'),
	(02, 12, 'Who is your favourite character on House of Cards?');

INSERT INTO responses (response_id, response_text, num_votes, poll_id) VALUES
	(01, 'Yes', 0, 01),
	(02, 'No', 0, 01),
	(03, 'Frank Underwood', 0, 02),
	(04, 'Claire Underwood', 0, 02),
	(05, 'Edward Meechum', 0, 02);

INSERT INTO pet_friends_with (pet_id, friend_id) VALUES
	(01, 02),
	(01, 03),
	(02, 03),
	(02, 07),
	(03, 07),
	(03, 04),
	(07, 04),
	(07, 10),
	(08, 02),
	(08, 03),
	(09, 07),
	(09, 11),
	(09, 12),
	(10, 02),
	(10, 05),
	(11, 04),
	(11, 05),
	(11, 12);

INSERT INTO pet_in_group (pet_id, group_id) VALUES
	(01, 13),
	(01, 15),
	(02, 13),
	(03, 15),
	(05, 14),
	(06, 14),
	(07, 13),
	(08, 14),
	(09, 15),
	(10, 14),
	(12, 15);

INSERT INTO pet_likes_interest (pet_id, interest_id) VALUES
	(01, 17),
	(02, 17),
	(03, 18),
	(04, 18),
	(05, 18),
	(06, 16),
	(07, 18),
	(07, 16),
	(07, 17),
	(08, 18),
	(09, 16),
	(10, 16),
	(10, 18),
	(11, 16),
	(11, 17),
	(12, 16);

INSERT INTO pet_in_activity (pet_id, activity_id) VALUES
	(01, 01),
	(02, 01),
	(03, 01),
	(03, 02),
	(05, 02),
	(06, 02),
	(07, 01),
	(08, 02),
	(09, 02),
	(10, 02),
	(12, 02);

INSERT INTO pet_poll_response(pet_id, response_id, time_stamp) VALUES
	(01, 01, DEFAULT),
	(02, 01, DEFAULT),
	(03, 03, DEFAULT),
	(04, 03, DEFAULT),
	(05, 02, DEFAULT),
	(06, 02, DEFAULT),
	(06, 03, DEFAULT),
	(07, 01, DEFAULT),
	(08, 01, DEFAULT),
	(08, 04, DEFAULT),
	(09, 04, DEFAULT),
	(10, 02, DEFAULT),
	(11, 01, DEFAULT),
	(12, 02, DEFAULT),
	(12, 05, DEFAULT),
	(03, 03, DEFAULT);