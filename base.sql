REM **************************************************************************
REM BASE PWEBC
REM Auteur : Mathieu VALENTIN & Sebastien VIGUIER 
REM Group : 204
REM Date de Mise � Jour : 21/02/2017
REM **************************************************************************

REM ************************* DROP *******************************************
DROP TABLE JOUEURS CASCADE CONSTRAINTS PURGE
/
DROP TABLE IMAGES CASCADE CONSTRAINTS PURGE
/
DROP TABLE PAYS CASCADE CONSTRAINTS PURGE
/
DROP TABLE THEMES CASCADE CONSTRAINTS PURGE
/
DROP SEQUENCE PAYS_SEQ
/
DROP SEQUENCE THEMES_SEQ
/
DROP SEQUENCE IMAGES_SEQ
/
REM ************************* FIN DROP ***************************************

REM ************************* SEQUENCES **************************************
CREATE SEQUENCE PAYS_SEQ START WITH 0 INCREMENTS BY 1 NOCACHE NOCYCLE
/
CREATE SEQUENCE THEMES_SEQ START WITH 0 INCREMENTS BY 1 NOCACHE NOCYCLE
/
CREATE SEQUENCE IMAGES_SEQ START WITH 0 INCREMENTS BY 1 NOCACHE NOCYCLE
/
REM ************************* FIN SEQUENCES **********************************

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

REM ***** CREATE TABLE THEMES
CREATE TABLE THEMES (
	numTheme INTEGER,
	nomTheme VARCHAR(15) NOT NULL
)/

REM ***** CREATE TABLE IMAGES
CREATE TABLE IMAGES (
	numImage INTEGER,
	numPays INTEGER,
	numTheme INTEGER,
	pathImage VARCHAR(20) NOT NULL,
	titre VARCHAR(20) NOT NULL,
	description VARCHAR(125) NOT NULL,
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
ALTER TABLE IMAGES ADD CONSTRAINT FK_IMAGES_THEME FOREIGN KEY (numTheme) REFERENCES THEMES(numTheme)
/
ALTER TABLE IMAGES ADD CONSTRAINT PK_IMAGES PRIMARYEY (numImage,numPays,numTheme)
/
REM ************************* FIN CONSTRAINT *********************************

REM ************************* DATAS ******************************************
REM ***** JOUEURS
INSERT INTO JOUEURS VALUES ("Mathieu", "1001", 0);
INSERT INTO JOUEURS VALUES ("S�bastien", "over9000", 0);
INSERT INTO JOUEURS VALUES ("Laurent", "Manamanche", 0);
INSERT INTO JOUEURS VALUES ("Kanazaza", "Merise", 0);
INSERT INTO JOUEURS VALUES ("Jacky", "Michelle", 0);

REM ***** PAYS
INSERT INTO PAYS VALUES (PAYS_SEQ.NEXTVAL, "FRANCE");
INSERT INTO PAYS VALUES (PAYS_SEQ.NEXTVAL, "ALLEMAGNE");
INSERT INTO PAYS VALUES (PAYS_SEQ.NEXTVAL, "ESPAGNE");
INSERT INTO PAYS VALUES (PAYS_SEQ.NEXTVAL, "BELGIQUE");
INSERT INTO PAYS VALUES (PAYS_SEQ.NEXTVAL, "RUSSIE");

REM ***** THEMES
INSERT INTO THEMES VALUES (THEMES_SEQ.NEXTVAL, "PLATS");
INSERT INTO THEMES VALUES (THEMES_SEQ.NEXTVAL, "FROMAGES");
INSERT INTO THEMES VALUES (THEMES_SEQ.NEXTVAL, "PAYSAGES");
INSERT INTO THEMES VALUES (THEMES_SEQ.NEXTVAL, "BOISSONS");
INSERT INTO THEMES VALUES (THEMES_SEQ.NEXTVAL, "ARTISTES");
INSERT INTO THEMES VALUES (THEMES_SEQ.NEXTVAL, "MONUMENTS");

REM ***** IMAGES
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 1, "plats/gratin.jpg", "Gratin dauphinois", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 2, "fromages/brie.jpg", "Brie de Meaux", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 3, "paysages/etretat.jpg", "Falaises d'Etretat", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 4, "boissons/champagne.jpg", "Champagne", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 5, "artistes/piaf.jpg", "Edith Piaf", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 6, "monuments/eiffel.png", "Tour Eiffel", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 6, "monuments/mtMichel.png", "Mont Saint Michel", "...description...", 1);

REM ************************* FIN DATAS **************************************