CREATE DATABASE Gym;
USE Gym;

CREATE TABLE info(username VARCHAR(200), password VARCHAR(500), name VARCHAR(100), prof INT, street VARCHAR(100), city VARCHAR(50), phone VARCHAR(32), PRIMARY KEY(username));

CREATE TABLE plans(name VARCHAR(100), PRIMARY KEY(name));
CREATE TABLE equip(name VARCHAR(200), count INT);

CREATE TABLE receps(username VARCHAR(200), PRIMARY KEY(username), FOREIGN KEY(username) references info(username));

CREATE TABLE trainors(username VARCHAR(200), PRIMARY KEY(username), FOREIGN KEY(username) references info(username));

CREATE TABLE members(username VARCHAR(200), plan VARCHAR(100), trainor VARCHAR(200), PRIMARY KEY(username), FOREIGN KEY(username) references info(username), FOREIGN KEY(plan) references plans(name), FOREIGN KEY(trainor) references trainors(username));

ALTER TABLE info ADD time TIMESTAMP DEFAULT CURRENT_TIMESTAMP;-- done for all tables

INSERT INTO info(username, password, name, prof, street, city, phone) VALUES('aashish', '$5$rounds=1000$lCyePJtyHjKFzT79$dAUNFGsKN7RPUKK3aLMfKSNmF5cX6sS4SuQ3rVzb5s8', 'Aashish Mahawar', 1, 'Bhim Ganj', 'Kota', 9116133021);-- admin's password is aashish@123
-- INSERT INTO info(username, password, name, prof, street, city, phone) VALUES('arun', '$5$rounds=535000$g4Ns26.CGu/G5wFm$545s5oXsWPEUv39GUiyHlfOtffojvXnT2UmNRfcmfcA', 'Arun Mishra', 3, 'Varanasi', 'Varanasi', 6393811484);-- default trainer's password is arun

CREATE TABLE progress(username VARCHAR(200), date DATE, daily_result VARCHAR(200), time TIMESTAMP DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY(username, date), FOREIGN KEY(username) references members(username));
