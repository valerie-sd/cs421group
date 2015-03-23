--COMP 421
--Group 11
--Project Part 3
--STORED PROCEDURES

CREATE OR REPLACE FUNCTION get_friends_of(pet_page_id INTEGER)
  RETURNS SETOF INTEGER AS $$
BEGIN
  RETURN QUERY(
    SELECT t.friend_id AS friend_id
      FROM pet_friends_with t
     WHERE t.pet_id = pet_page_id
     UNION
    SELECT s.pet_id AS friend_id
      FROM pet_friends_with s
     WHERE s.friend_id = pet_page_id
     ORDER BY friend_id
  );
END;
$$ LANGUAGE plpgsql;

CREATE TABLE pet_suggested_interests (
	pet_page_id		INTEGER		NOT NULL,
	interest_page_id	INTEGER		NOT NULL
);

CREATE OR REPLACE FUNCTION update_suggested_interests(given_pet_id INTEGER)
  RETURNS SETOF INTEGER AS $$
DECLARE
  perc_friends_likes	REAL;
  friend_count		INTEGER;
BEGIN
  perc_friends_likes := 0.10;
  SELECT COUNT(*) INTO friend_count FROM get_friends_of(given_pet_id);
  DELETE FROM pet_suggested_interests psi
   WHERE psi.pet_page_id = given_pet_id;
  INSERT INTO pet_suggested_interests
  SELECT given_pet_id, 
         t.interest_id
    FROM (SELECT pli.interest_id
	    FROM pet_likes_interest pli
	   WHERE pli.pet_id IN (
		SELECT * FROM get_friends_of(given_pet_id)
		)
	   GROUP BY pli.interest_id
	  HAVING COUNT(pli.interest_id) > (perc_friends_likes * friend_count)
	  EXCEPT
	  SELECT pli.interest_id
	    FROM pet_likes_interest pli
	   WHERE pli.pet_id = given_pet_id
	  ) t;
  RETURN QUERY (
	SELECT psi.interest_page_id
	  FROM pet_suggested_interests psi
	 WHERE psi.pet_page_id = given_pet_id
	 );
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_suggested_interests_all()
  RETURNS void AS $$
DECLARE
  pet_page_id	INTEGER;
BEGIN
  FOR pet_page_id IN (SELECT pp.page_id FROM pet_pages pp)
  LOOP
    PERFORM update_suggested_interests(pet_page_id);
  END LOOP;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION find_mutual_friends(first_pet_id INTEGER, second_pet_id INTEGER)
  RETURNS SETOF INTEGER AS $$
BEGIN
  RETURN QUERY (
       SELECT * FROM get_friends_of(first_pet_id)
    INTERSECT
       SELECT * FROM get_friends_of(second_pet_id)
  );
END;
$$ LANGUAGE plpgsql;

SELECT * FROM update_suggested_interests(1);

SELECT * FROM update_suggested_interests_all();

SELECT * FROM pet_suggested_interests;

SELECT * FROM find_mutual_friends(3, 7);
