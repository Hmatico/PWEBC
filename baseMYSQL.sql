USE pwebc;
-- REM **************************************************************************
-- REM BASE PWEBC
-- REM Auteur : Mathieu VALENTIN & Sebastien VIGUIER 
-- REM Group : 204
-- REM Date de Mise à Jour : 21/02/2017
-- REM **************************************************************************

-- REM ************************* DROP *******************************************
DROP TABLE IF EXISTS JOUEURS CASCADE ;
DROP TABLE IF EXISTS IMAGES CASCADE ;
DROP TABLE IF EXISTS PAYS CASCADE ;
DROP TABLE IF EXISTS THEMES CASCADE ;

-- DROP SEQUENCE IF EXISTS PAYS_SEQ;
-- DROP SEQUENCE IF EXISTS THEMES_SEQ;
-- DROP SEQUENCE IMAGES_SEQ;
-- -- REM ************************* FIN DROP ***************************************

-- -- REM ************************* SEQUENCES **************************************
-- CREATE SEQUENCE PAYS_SEQ START WITH 0 INCREMENTS BY 1 NOCACHE NOCYCLE
-- ;
-- CREATE SEQUENCE THEMES_SEQ START WITH 0 INCREMENTS BY 1 NOCACHE NOCYCLE
-- ;
-- CREATE SEQUENCE IMAGES_SEQ START WITH 0 INCREMENTS BY 1 NOCACHE NOCYCLE
-- ;
-- REM ************************* FIN SEQUENCES **********************************

-- REM ************************* TABLES *****************************************
-- REM ***** CREATE TABLE JOUEURS
CREATE TABLE JOUEURS (
	nomJoueur VARCHAR(15) PRIMARY KEY,
	mdpJoueur VARCHAR(30) NOT NULL,
	scoreJoueur INT(11) DEFAULT 0
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- REM ***** CREATE TABLE PAYS
CREATE TABLE PAYS (
	numPays INT(11) AUTO_INCREMENT PRIMARY KEY,
	nomPays VARCHAR(15) NOT NULL
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- REM ***** CREATE TABLE THEMES
CREATE TABLE THEMES (
	numTheme INT(11) AUTO_INCREMENT PRIMARY KEY,
	nomTheme VARCHAR(15) NOT NULL
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- REM ***** CREATE TABLE IMAGES
CREATE TABLE IMAGES (
	numImage INT(11) AUTO_INCREMENT PRIMARY KEY,
	numPays INT(11),
	numTheme INT(11),
	pathImage VARCHAR(50) NOT NULL,
	titre VARCHAR(20) NOT NULL,
	description VARCHAR(125) NOT NULL,
	nombrePoints INT(11) DEFAULT 1
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
-- REM ************************* FIN TABLES *************************************

-- REM ************************* CONSTRAINT *************************************

ALTER TABLE IMAGES ADD CONSTRAINT FK_IMAGES_PAYS FOREIGN KEY (numPays) REFERENCES PAYS(numPays)
;
ALTER TABLE IMAGES ADD CONSTRAINT FK_IMAGES_THEME FOREIGN KEY (numTheme) REFERENCES THEMES(numTheme)
;
-- REM ************************* FIN CONSTRAINT *********************************

-- REM ************************* DATAS ******************************************
-- REM ***** JOUEURS
INSERT INTO JOUEURS VALUES ("Mathieu", "1001", 0);
INSERT INTO JOUEURS VALUES ("Sébastien", "over9000", 0);
INSERT INTO JOUEURS VALUES ("Laurent", "Manamanche", 0);
INSERT INTO JOUEURS VALUES ("Kanazaza", "Merise", 0);
INSERT INTO JOUEURS VALUES ("Jacky", "Michelle", 0);

-- REM ***** PAYS
INSERT INTO PAYS VALUES (NULL, "FRANCE");
INSERT INTO PAYS VALUES (NULL, "ALLEMAGNE");
INSERT INTO PAYS VALUES (NULL, "ESPAGNE");
INSERT INTO PAYS VALUES (NULL, "BELGIQUE");
INSERT INTO PAYS VALUES (NULL, "RUSSIE");

-- REM ***** THEMES
INSERT INTO THEMES VALUES (NULL, "PLATS");
INSERT INTO THEMES VALUES (NULL, "FROMAGES");
INSERT INTO THEMES VALUES (NULL, "PAYSAGES");
INSERT INTO THEMES VALUES (NULL, "BOISSONS");
INSERT INTO THEMES VALUES (NULL, "ARTISTES");
INSERT INTO THEMES VALUES (NULL, "MONUMENTS");

-- REM ***** IMAGES
INSERT INTO IMAGES VALUES (NULL, 1, 1, "plats/
fr/gratin.jpg", "Gratin dauphinois", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 1, 2, "fromages/
fr/brie.jpg", "Brie de Meaux", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 1, 3, "paysages/
fr/etretat.jpg", "Falaises d'Etretat", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 1, 4, "boissons/
fr/champagne.jpg", "Champagne", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 1, 5, "artistes/
fr/piaf.jpg", "Edith Piaf", "...description...", 2);
INSERT INTO IMAGES VALUES (NULL, 1, 6, "monuments/
fr/eiffel.jpg", "Tour Eiffel", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 1, 6, "monuments/
fr/mtMichel.jpg", "Mont Saint Michel", "...description...", 1);

INSERT INTO IMAGES VALUES (NULL, 2, 1, "plats/
all/choucroute.jpg", "Sauerkraut", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 2, 2, "fromages/
all/allgauer.jpg", "Allgäuer Bergkäse", "...description...", 2);
INSERT INTO IMAGES VALUES (NULL, 2, 3, "paysages/
all/chateau.jpg", "Chateau de Neuschwanstein ", "...description...", 2);
INSERT INTO IMAGES VALUES (NULL, 2, 4, "boissons/
all/jager.jpg", "Jägermeister", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 2, 5, "artistes/
all/tappert.jpg", "Horst Tappert", "...description...", 3);
INSERT INTO IMAGES VALUES (NULL, 2, 6, "monuments/
all/mur.jpg", "Mur de Berlin", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 2, 6, "monuments/
all/.jpg", "", "...description...", 1);

INSERT INTO IMAGES VALUES (NULL, 3, 1, "plats/
es/tapas.jpg", "Tapas", "...description...", 2);
INSERT INTO IMAGES VALUES (NULL, 3, 2, "fromages/
es/queso.jpg", "Queso de Tronchón ", "...description...", 3);
INSERT INTO IMAGES VALUES (NULL, 3, 3, "paysages/
es/ronda.jpg", "Village de Ronda", "...description...", 2);
INSERT INTO IMAGES VALUES (NULL, 3, 4, "boissons/
es/licor43.jpg", "Licor 43", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 3, 5, "artistes/
es/dali.jpg", "Salvador Dali", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 3, 6, "monuments/
es/mosquee.jpg", "Mosquée-Cathédrale", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 3, 6, "monuments/
es/sagrada.jpg", "Sagrada Família", "...description...", 1);

INSERT INTO IMAGES VALUES (NULL, 4, 1, "plats/
be/fricadelles.jpg", "Fricadelles", "...description...", 2);
INSERT INTO IMAGES VALUES (NULL, 4, 2, "fromages/
be/herve.jpg", "Le Herve", "...description...", 2);
INSERT INTO IMAGES VALUES (NULL, 4, 3, "paysages/
be/canaux.jpg", "Canaux de Bruges", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 4, 4, "boissons/
be/kriek.jpg", "Bière Kriek", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 4, 5, "artistes/
be/brel.jpg", "Jacques Brel", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 4, 6, "monuments/
be/beffroi.jpg", "Beffroi de Bruges", "...description...", 2);
INSERT INTO IMAGES VALUES (NULL, 4, 6, "monuments/
be/manneken.jpg", "Manneken Pis", "...description...", 1);

INSERT INTO IMAGES VALUES (NULL, 5, 1, "plats/
ru/stroganoff.jpg", "Boeuf Stroganoff", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 5, 2, "fromages/
ru/tvorog.jpg", "Tvorog", "...description...", 2);
INSERT INTO IMAGES VALUES (NULL, 5, 3, "paysages/
ru/baikal.jpg", "Lac Baikal gelé", "...description...", 2);
INSERT INTO IMAGES VALUES (NULL, 5, 4, "boissons/
ru/kvass.jpg", "Kvass", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 5, 5, "artistes/
ru/kandinsky.jpg", "Vassily Kandinsky", "...description...", 3);
INSERT INTO IMAGES VALUES (NULL, 5, 5, "artistes/
ru/coeurs.jpg", "Coeurs de l'armée Rouge", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 5, 6, "monuments/
ru/kremlin.jpg", "Place Rouge", "...description...", 1);
INSERT INTO IMAGES VALUES (NULL, 5, 6, "monuments/
ru/triumph.jpg", "Arc de Triumph", "...description...", 3);

-- REM ************************* FIN DATAS **************************************