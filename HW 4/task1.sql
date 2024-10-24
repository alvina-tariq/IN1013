DROP DATABASE IF EXISTS pet_database;
CREATE DATABASE pet_database;
USE pet_database;

DROP TABLE IF EXISTS petPet, petEvent;

-- Up to the next CUTOFF POINT should be in task1.sql

CREATE TABLE petPet (
  petname VARCHAR(20) PRIMARY KEY,
  owner VARCHAR(45),
  species VARCHAR(45),
  gender ENUM('M', 'F'),
  birth DATE,
  death DATE
);

CREATE TABLE petEvent (
  petname VARCHAR(15),
  eventdate DATE,
  eventtype VARCHAR(15),
  remark VARCHAR(255),
  PRIMARY KEY (petname, eventdate),
  FOREIGN KEY (petname) REFERENCES petPet(petname) ON DELETE CASCADE
);,

