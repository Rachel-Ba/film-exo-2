DROP DATABASE IF EXISTS film;
CREATE DATABASE IF NOT EXISTS `film`;
USE `film`;


CREATE TABLE `film` (
  `ident_film` int(10) PRIMARY KEY,
  `titre` varchar(50) DEFAULT NULL,
  `genre1` varchar(20) DEFAULT NULL,
  `recette` decimal(15,2) DEFAULT NULL,
  `date_sortie` date DEFAULT NULL,
  `pays` smallint DEFAULT NULL,
  `nb_entree` integer DEFAULT NULL,
  `date_et_heure_de_saisie` timestamp DEFAULT NOW());


ALTER TABLE film ADD name_real varchar(40);
ALTER TABLE film ADD distribution varchar(40);
ALTER TABLE film ADD resumer varchar(2000);

--
-- Exercice 1
-- 



INSERT INTO film VALUES (6, 
						'Die Hard 4',
                        'film daction',
                         NULL, 
                         '2007-07-04',
                         NULL,
                         NULL,
                         '2018-09-15',
                         'Len Wiseman',
                         'Twentieth Century Fox Film Corporation',
                         'Pour sa quatrième aventure, l''inspecteur John McClane se trouve confronté 
                         à un nouveau genre de terrorisme. Le réseau informatique national qui contrôle absolument 
                         toutes les communications, les transports et l''énergie des Etats-Unis, est détruit de façon 
                         systématique, plongeant le pays dans le chaos. Le cerveau qui est derrière le complot a tout 
                         calculé à la perfection. Ou presque... Il n''avait pas prévu McClane, un flic de la vieille école
                         qui connait deux ou trois trucs efficaces pour déjouer les attaques terroristes.');


--
-- Exercice 3
-- 


CREATE TABLE acteur (
  idacteur INT(10) NOT NULL,
  nom VARCHAR(45),
  dateNaissance DATE,
  nbreFilms SMALLINT(5),
  nbreJoursTournage INT(10),
  nationalite VARCHAR(45),
  CONSTRAINT PK_idacteur PRIMARY KEY (idacteur));

INSERT INTO acteur VALUES (1, 'Bruce Willis', NOW(), 89, 152, 'USA');

CREATE TABLE IF NOT EXISTS CASTING (
  fkIdacteur INT(10) NOT NULL,
  fkIDENT_FILM INT,
  CONSTRAINT FK_Idacteur FOREIGN KEY (fkIdacteur) REFERENCES acteur(idacteur),
  CONSTRAINT FK_ident_film  FOREIGN KEY (FKident_film ) REFERENCES film(ident_film )
);

INSERT INTO CASTING VALUES ((SELECT idacteur FROM acteur WHERE nom='Bruce Willis'),(SELECT IDENT_FILM FROM film WHERE IDENT_FILM=6));

--
-- Exercice 2
--                    

CREATE TABLE acteur_fr AS SELECT idacteur AS id_acteur_fr, nom FROM acteur WHERE nationalite = 'fr';

--
-- Exercice 4
--  

CREATE TABLE animals ( type varchar(60), sexe char(1), date_Acquisition datetime, nom varchar (100), description varchar(1000)   );
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/animaux.csv' 
INTO TABLE animals FIELDS terminated by ";"  enclosed by "\"";