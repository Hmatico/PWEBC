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
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 1, "plats/fr/gratin.jpg", "Gratin dauphinois", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 2, "fromages/fr/brie.jpg", "Brie de Meaux", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 3, "paysages/fr/etretat.jpg", "Falaises d'Etretat", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 4, "boissons/fr/champagne.jpg", "Champagne", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 5, "artistes/fr/piaf.jpg", "Edith Piaf", "...description...", 2);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 6, "monuments/fr/eiffel.jpg", "Tour Eiffel", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 1, 6, "monuments/fr/mtMichel.jpg", "Mont Saint Michel", "...description...", 1);

INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 2, 1, "plats/all/choucroute.jpg", "Sauerkraut", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 2, 2, "fromages/all/allgauer.jpg", "Allg�uer Bergk�se", "...description...", 2);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 2, 3, "paysages/all/chateau.jpg", "Chateau de Neuschwanstein ", "...description...", 2);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 2, 4, "boissons/all/jager.jpg", "J�germeister", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 2, 5, "artistes/all/tappert.jpg", "Horst Tappert", "...description...", 3);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 2, 6, "monuments/all/mur.jpg", "Mur de Berlin", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 2, 6, "monuments/all/.jpg", "", "...description...", 1);

INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 3, 1, "plats/es/tapas.jpg", "Tapas", "...description...", 2);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 3, 2, "fromages/es/queso.jpg", "Queso de Tronch�n ", "...description...", 3);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 3, 3, "paysages/es/ronda.jpg", "Village de Ronda", "...description...", 2);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 3, 4, "boissons/es/licor43.jpg", "Licor 43", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 3, 5, "artistes/es/dali.jpg", "Salvador Dali", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 3, 6, "monuments/es/mosquee.jpg", "Mosqu�e-Cath�drale", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 3, 6, "monuments/es/sagrada.jpg", "Sagrada Fam�lia", "...description...", 1);

INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 4, 1, "plats/be/fricadelles.jpg", "Fricadelles", "...description...", 2);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 4, 2, "fromages/be/herve.jpg", "Le Herve", "...description...", 2);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 4, 3, "paysages/be/canaux.jpg", "Canaux de Bruges", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 4, 4, "boissons/be/kriek.jpg", "Bi�re Kriek", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 4, 5, "artistes/be/brel.jpg", "Jacques Brel", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 4, 6, "monuments/be/beffroi.jpg", "Beffroi de Bruges", "...description...", 2);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 4, 6, "monuments/be/manneken.jpg", "Manneken Pis", "...description...", 1);

INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 5, 1, "plats/ru/stroganoff.jpg", "Boeuf Stroganoff", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 5, 2, "fromages/ru/tvorog.jpg", "Tvorog", "...description...", 2);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 5, 3, "paysages/ru/baikal.jpg", "Lac Baikal gel�", "...description...", 2);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 5, 4, "boissons/ru/kvass.jpg", "Kvass", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 5, 5, "artistes/ru/kandinsky.jpg", "Vassily Kandinsky", "...description...", 3);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 5, 5, "artistes/ru/coeurs.jpg", "Coeurs de l'arm�e Rouge", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 5, 6, "monuments/ru/kremlin.jpg", "Place Rouge", "...description...", 1);
INSERT INTO IMAGES VALUES (IMAGES_SEQ.NEXTVAL, 5, 6, "monuments/ru/triumph.jpg", "Arc de Triumph", "...description...", 3);

REM ************************* FIN DATAS **************************************