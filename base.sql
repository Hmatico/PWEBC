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
INSERT INTO JOUEURS VALUES ("Sébastien", "over9000", 0);
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
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 1, "plats/fr/gratin.jpg", "Gratin dauphinois", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 2, "fromages/fr/brie.jpg", "Brie de Meaux", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 3, "paysages/fr/etretat.jpg", "Falaises d'Etretat", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 4, "boissons/fr/champagne.jpg", "Champagne", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 5, "artistes/fr/piaf.jpg", "Edith Piaf", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 6, "monuments/fr/eiffel.jpg", "Tour Eiffel", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 6, "monuments/fr/mtMichel.jpg", "Mont Saint Michel", "...description...", 1);

INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 2, 1, "plats/all/choucroute.jpg", "Sauerkraut", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 2, 2, "fromages/all/allgauer.jpg", "Allgäuer Bergkäse", "...description...", 2);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 2, 3, "paysages/all/chateau.jpg", "Chateau de Neuschwanstein ", "...description...", 2);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 2, 4, "boissons/all/jager.jpg", "Jägermeister", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 2, 5, "artistes/all/tappert.jpg", "Horst Tappert", "...description...", 3);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 2, 6, "monuments/all/mur.jpg", "Mur de Berlin", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 2, 6, "monuments/all/.jpg", "", "...description...", 1);

INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 3, 1, "plats/es/tapas.jpg", "Tapas", "...description...", 2);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 3, 2, "fromages/es/queso.jpg", "Queso de Tronchón ", "...description...", 3);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 3, 3, "paysages/es/ronda.jpg", "Village de Ronda", "...description...", 2);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 3, 4, "boissons/es/licor43.jpg", "Licor 43", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 3, 5, "artistes/es/dali.jpg", "Salvador Dali", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 3, 6, "monuments/es/mosquee.jpg", "Mosquée-Cathédrale", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 3, 6, "monuments/es/sagrada.jpg", "Sagrada Família", "...description...", 1);



REM ************************* FIN DATAS **************************************