-- 1
INSERT INTO petEvent VALUES 
    ('Fluffy', '2020-10-15', 'vet', 'antibiotics')  
    
-- 2
INSERT INTO petPet VALUES
    ('Hammy', 'Diane', 'hamster', 'M', '2010-10-15', NULL)

INSERT INTO petEvent VALUES
    ('Hammy', '2020-10-15', 'vet', 'antibiotics')

-- 3
UPDATE petEvent SET remark="5 kittens, 3 female, 2 male" WHERE petname="Fluffy";

-- 4
UPDATE petEvent SET petname="Claws" WHERE petname= "Slim" AND remark="broken rib";

-- 5
UPDATE petPet SET death="2020-09-01" WHERE petname="Puffball";

-- 6
DELETE FROM petPet WHERE petname="Buffy";