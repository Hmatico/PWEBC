REM **************************************************************************
REM BASE PWEBC
REM Auteur : Mathieu VALENTIN & Sebastien VIGUIER 
REM Group : 204
REM Date de Mise à Jour : 21/02/2017
REM **************************************************************************

REM ************************* DROP *******************************************
DROP TABLE JOUEURS CASCADE CONSTRAINTS PURGE
/
DROP TABLE IMAGES CASCADE CONSTRAINTS PURGE
/
DROP TABLE PAYS CASCADE CONSTRAINTS PURGE
/
REM ************************* FIN DROP ***************************************

REM ************************* TABLES *****************************************
REM ***** CREATE TABLE JOUEURS
CREATE TABLE JOUEURS (
	nomJoueur VARCHAR(15),
	mdpJoueur VARCHAR(30) NOT NULL,
	scoreJoueur INTEGER DEFAULT 0
)/

REM ***** CREATE TABLE PAYS
CREATE TABLE PAYS (
	numPays INTEGER,
	nomPays VARCHAR(15) NOT NULL
)/

REM ***** CREATE TABLE IMAGES
CREATE TABLE IMAGES (
	numImage INTEGER,
	numPays INTEGER,
	nombrePoints INTEGER DEFAULT 1
)/
REM ************************* FIN TABLES *************************************

REM ************************* CONSTRAINT *************************************
ALTER TABLE JOUEURS ADD CONSTRAINT PK_JOUEUR PRIMARY KEY (nomJoueur)
/
ALTER TABLE PAYS ADD CONSTRAINT PK_PAYS PRIMARY KEY (nomPays)
/
ALTER TABLE IMAGES ADD CONSTRAINT FK_IMAGES_PAYS FOREIGN KEY (numPays) REFERENCES PAYS(numPays)
/
ALTER TABLE IMAGES ADD CONSTRAINT PK_IMAGES PRIMARYEY (numImage,numPays)
/
REM ************************* FIN CONSTRAINT *********************************