--COMP 421
--Group 11
--Project Part 3
--TRIGGERS

--Table to hold old page_id entries
CREATE TABLE pet_page_backup_table (
	page_id		INTEGER		NOT NULL,
	species		VARCHAR(100)	NOT NULL,
	gender		CHAR(1)		NOT NULL,
	age		INTEGER,
	birthday	DATE
);

--Keep track of any changes to pet_pages for future retrieval or comparison
CREATE OR REPLACE FUNCTION keepBackup() RETURNS trigger AS $pet_page_backup$
	BEGIN
		IF NEW.page_id <> OLD.page_id OR NEW.species <> OLD.species OR NEW.gender <> OLD.gender OR NEW.age <> OLD.age OR NEW.birthday <> OLD.birthday THEN
			INSERT INTO pet_page_backup_table 
			VALUES (NEW.page_id, NEW.species, NEW.gender, NEW.age, NEW.birthday);
		END IF;
		RETURN NEW;
	END;
	
$pet_page_backup$ LANGUAGE plpgsql;

CREATE TRIGGER pet_page_backup BEFORE UPDATE ON pet_pages
	FOR EACH ROW EXECUTE PROCEDURE keepBackup();

--Triggers trigger
UPDATE pet_pages SET species = 'Donkhay' WHERE page_id = 1;
 
 --Does not trigger trigger
UPDATE pet_pages SET species = 'Dog' WHERE page_id = 2;