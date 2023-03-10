-- Création des tables de notre schéma relationnel
CREATE TABLE CATEGORIE (
   NomC VARCHAR(50) PRIMARY KEY
);

CREATE TABLE A_PARENT (
  NomC VARCHAR(50) PRIMARY KEY,
  NomParent VARCHAR(50)
);

CREATE TABLE COMPTE (
    IDCompte VARCHAR(50) NOT NULL,
    PRIMARY KEY(IDCompte)
);

CREATE TABLE UTILISATEUR (
    Email VARCHAR(50),
    MotDePasse VARCHAR(50),
    Prenom VARCHAR(50),
    Nom VARCHAR(50),
    Adresse VARCHAR(100),
    IDCompte VARCHAR(50),
    PRIMARY KEY(Email),
    FOREIGN KEY(IDCompte) REFERENCES COMPTE(IDCompte)
);

CREATE TABLE PRODUIT (
    IdProd VARCHAR(30) NOT NULL,
    Intitule VARCHAR(50) NOT NULL,
    PrixCourant INTEGER,
    Description VARCHAR(100),
    URL VARCHAR(50),
    NomC VARCHAR(50),
    PRIMARY KEY(IdProd),
    FOREIGN KEY(NomC) REFERENCES CATEGORIE(NomC)
);

CREATE TABLE CARACTERISTIQUES(
    IdProd VARCHAR(30) NOT NULL,
    Idcaracteristiques INTEGER NOT NULL,
    Caracteristique VARCHAR(50),
    Valeur VARCHAR(50),
    PRIMARY KEY (Idcaracteristiques, IdProd)
);

CREATE TABLE OFFRE (
  IDProd VARCHAR(30) NOT NULL,
  Heure DATE,
  PrixPropose INTEGER,
  PRIMARY KEY (IDProd, Heure),
  IDCompte VARCHAR(50),
  FOREIGN KEY (IDCompte) REFERENCES COMPTE(IDCompte)
);


CREATE TABLE OFFRE_GAGNANTE(
    IdProd VARCHAR(30) NOT NULL,
    Heure DATE NOT NULL,
    IDCompte VARCHAR(50),
    PRIMARY KEY (IdProd, Heure),
    FOREIGN KEY(IdProd,Heure) REFERENCES OFFRE(IdProd,Heure)
);

--Nous créeons des utilisateurs avec leur ID de compte issu du hachage de leur adresse mail par la methode hashcode de la classe String de java
--Les adresses emails sont normalement uniques, ce qui fait que les id de compte le seront aussi
--L'idée est d'avoir des id uniques et qui réfèrent pas à l'utilisateur si ce dernier souhaite supprimer ses données
INSERT INTO COMPTE VALUES('1601482255');
INSERT INTO UTILISATEUR VALUES('karim@gmail.com','karim123','Karim','Benzema','9 rue de Madrid','1601482255');
INSERT INTO COMPTE VALUES('256037753');
INSERT INTO UTILISATEUR VALUES('leo@gmail.com','Leo123','Leo','Messi','30 rue de Paris','256037753');
INSERT INTO COMPTE VALUES('1391307914');
INSERT INTO UTILISATEUR VALUES('cris@gmail.com','Cris123','Cris','Ronaldo','7 rue de Manchester','1391307914');
INSERT INTO COMPTE VALUES('1035275821');
INSERT INTO UTILISATEUR VALUES('kiki@gmail.com','Kiki123','Kiki','Mbappe','7 rue de Paris','1035275821');
INSERT INTO COMPTE VALUES('721440632');
INSERT INTO UTILISATEUR VALUES('Sergio4@gmail.com','LaDecima2014','Sergio','Ramos','30 rue de Paris','721440632');
INSERT INTO COMPTE VALUES('1527891832');
INSERT INTO UTILISATEUR VALUES('Kevin17@gmail.com','KD17BG','Kevin','De bruyne','17 rue de Manchester','1527891832');
INSERT INTO COMPTE VALUES('2121107676');
INSERT INTO UTILISATEUR VALUES('Thibaut@gmail.com','ThiCMadrid1','Thibaut','Courtois','9 rue de Madrid','2121107676');
INSERT INTO COMPTE VALUES('2044915212');
INSERT INTO UTILISATEUR VALUES('zizo10@gmail.com','Zizo1005','Zinedine','Zidane','20 rue de Marseille','2044915212');
INSERT INTO COMPTE VALUES('184825182');
INSERT INTO UTILISATEUR VALUES('Achraf@gmail.com','Achraf222','Achraf','Hakimi','33 rue de Paris','184825182');
INSERT INTO COMPTE VALUES('1172187128');
INSERT INTO UTILISATEUR VALUES('Robert9@gmail.com','Robert999','Robert','Lewandowski','19 rue de Munich','1172187128');
INSERT INTO COMPTE VALUES('566424171');
INSERT INTO UTILISATEUR VALUES('Haland99@gmail.com','HalandBooom','Erling','Haaland','9 rue de Dortmund','566424171');
INSERT INTO COMPTE VALUES('1307180466');
INSERT INTO UTILISATEUR VALUES('hafidi@gmail.com','hafidi123','Abdelilah','Hafidi','9 rue de CASABLANCA','1307180466');
INSERT INTO COMPTE VALUES('14952529');
INSERT INTO UTILISATEUR VALUES('Matthijs@gmail.com','deligt444','Matthijs','de Ligt','9 rue de Torino','14952529');
INSERT INTO COMPTE VALUES('1068366156');
INSERT INTO UTILISATEUR VALUES('pep@gmail.com','pepbeast','Pep','Guardiola','10 rue de Manchester','1068366156');
INSERT INTO COMPTE VALUES('977640051');
INSERT INTO UTILISATEUR VALUES('klop@gmail.com','klophero1','Jürgen','Klopp','24 rue de Liverpool','977640051');
INSERT INTO COMPTE VALUES('1935351848');
INSERT INTO UTILISATEUR VALUES('Eric@gmail.com','Ajax123','Eric','ten Hag','33 rue de Amesterdam','1935351848');
INSERT INTO COMPTE VALUES('845646785');
INSERT INTO UTILISATEUR VALUES('Vini@gmail.com','Vini2222','Vini','Jr','99 rue de Madrid','845646785');
INSERT INTO COMPTE VALUES('1197541657');
INSERT INTO UTILISATEUR VALUES('Ibra@gmail.com','Ibrathebest','Zlatan','Ibrahimovic','39 rue de MIlan','1197541657');
INSERT INTO COMPTE VALUES('631595308');
INSERT INTO UTILISATEUR VALUES('Sarri@gmail.com','Sarri45','Maurizio','Sarri','1 rue de Rome','631595308');
INSERT INTO COMPTE VALUES('1334737044');
INSERT INTO UTILISATEUR VALUES('Lukako@gmail.com','Romelu123','Romelu','Lukako','9 rue de London','1334737044');
INSERT INTO COMPTE VALUES('1594947577');
INSERT INTO UTILISATEUR VALUES('Toni@gmail.com','Toni123','Toni','Kroos','24 rue de Madrid','1594947577');


--Toutes les catégories sont recensées dans la table CATEGORIE
INSERT INTO CATEGORIE VALUES ('Chaussures');
INSERT INTO CATEGORIE VALUES ('Chemise');
INSERT INTO CATEGORIE VALUES ('Pantalon');
INSERT INTO CATEGORIE VALUES ('Pantalon de sport');
INSERT INTO CATEGORIE VALUES ('Chaussures de sport');
INSERT INTO CATEGORIE VALUES ('Chemise pour été');
INSERT INTO CATEGORIE VALUES ('Chemise pour hiver');
INSERT INTO CATEGORIE VALUES ('Sac');
INSERT INTO CATEGORIE VALUES ('Gants');
INSERT INTO CATEGORIE VALUES ('Bonnet');
INSERT INTO CATEGORIE VALUES ('Echarpe');
INSERT INTO CATEGORIE VALUES ('Chaussures de lux');
INSERT INTO CATEGORIE VALUES ('Pantalon jeans');
INSERT INTO CATEGORIE VALUES ('T-shirt');
INSERT INTO CATEGORIE VALUES ('Casquette');
INSERT INTO CATEGORIE VALUES ('Accessoires');

--Nous avons ici les catégories qui ont des catégories mères
INSERT INTO A_PARENT VALUES ('Chaussures de sport', 'Chaussures');
INSERT INTO A_PARENT VALUES ('Chemise pour hiver', 'Chemise');
INSERT INTO A_PARENT VALUES ('Chemise pour été', 'Chemise');
INSERT INTO A_PARENT VALUES ('Pantalon de sport', 'Pantalon');
INSERT INTO A_PARENT VALUES ('Pantalon jeans', 'Pantalon');
INSERT INTO A_PARENT VALUES ('Chaussures de lux', 'Chaussures');
INSERT INTO A_PARENT VALUES ('Echarpe', 'Accessoires');
INSERT INTO A_PARENT VALUES ('Bonnet', 'Accessoires');
INSERT INTO A_PARENT VALUES ('Gants', 'Accessoires');
INSERT INTO A_PARENT VALUES ('Sac', 'Accessoires');
INSERT INTO A_PARENT VALUES ('T-shirt', 'T-shirt');
INSERT INTO A_PARENT VALUES ('Casquette', 'Casquette');


--Nous procédons ici à l'insersion des produits de notre catalogue
INSERT INTO PRODUIT VALUES('PR1', 'Chaussure1', 45, 'Chaussures en cuir', 'http//:chaussure.siteweb.fr', 'Chaussures de lux');
INSERT INTO PRODUIT VALUES('PR2', 'Pantalon1', 20, 'Pantalon en jeans', 'http//:pantalon.siteweb.fr', 'Pantalon jeans');
INSERT INTO PRODUIT VALUES('PR3', 'Chemise1', 30, 'Chemise aérée', 'http//:chemise.siteweb.fr', 'Chemise pour été');
INSERT INTO PRODUIT VALUES('PR4', 'Chemise2', 30, 'Chemise en cotton', 'http//:chemise.siteweb.fr', 'Chemise pour hiver');
INSERT INTO PRODUIT VALUES('PR5', 'Chaussure2', 45, 'Chaussures en caoutchouc', 'http//:chaussure.siteweb.fr', 'Chaussures de sport');
INSERT INTO PRODUIT VALUES('PR6', 'Bonnet1', 5, 'Bonnet en cotton', 'http//:accessoires.siteweb.fr', 'Bonnet');
INSERT INTO PRODUIT VALUES('PR7', 'Chaussure3', 40, 'Chaussures en caoutchouc', 'http//:chaussure.siteweb.fr', 'Chaussures de sport');
INSERT INTO PRODUIT VALUES('PR8', 'Sac1', 20, 'Sac en cuir', 'http//:sac.siteweb.fr', 'Sac');
INSERT INTO PRODUIT VALUES('PR9', 'Gants', 7, 'Gants', 'http//:accessoires.siteweb.fr', 'Gants');
INSERT INTO PRODUIT VALUES('PR10', 'Pantalon2', 20, 'Pantalon en jeans elastique', 'http//:pantalon.siteweb.fr', 'Pantalon jeans');
INSERT INTO PRODUIT VALUES('PR11', 'Echarpe1', 4, 'Echarpe', 'http//:accessoires.siteweb.fr', 'Echarpe');
INSERT INTO PRODUIT VALUES('PR12' , 'Casquette1', 8, 'Casquette en cuir', 'http//:accessoires.siteweb.fr', 'Casquette');
INSERT INTO PRODUIT VALUES('PR13' , 'T-shirt1', 12, 'T-shirt en polyester', 'http//:Tshirt.siteweb.fr', 'T-shirt');



--La table CARACTERISTIQUES contient toutes les caracteristiques de tous les produits
--Vu qu'un produit peut avoir plus d'une caractéristique, il nous a paru judicieux de regrouper tout ça dans une table à part
INSERT INTO CARACTERISTIQUES VALUES ('PR1', 1, 'taille', '40');
INSERT INTO CARACTERISTIQUES VALUES ('PR1', 2, 'matiere', 'cuir');
INSERT INTO CARACTERISTIQUES VALUES ('PR1', 3, 'couleur', 'noir');
INSERT INTO CARACTERISTIQUES VALUES ('PR2', 1, 'taille', '38');
INSERT INTO CARACTERISTIQUES VALUES ('PR2', 2, 'matiere', 'jeans');
INSERT INTO CARACTERISTIQUES VALUES ('PR2', 3, 'couleur', 'bleu');
INSERT INTO CARACTERISTIQUES VALUES ('PR3', 1, 'taille', '12');
INSERT INTO CARACTERISTIQUES VALUES ('PR3', 2, 'matiere', 'jeans');
INSERT INTO CARACTERISTIQUES VALUES ('PR3', 3, 'couleur', 'vert');
INSERT INTO CARACTERISTIQUES VALUES ('PR4', 1, 'taille', '36');
INSERT INTO CARACTERISTIQUES VALUES ('PR4', 2, 'matiere', 'cotton');
INSERT INTO CARACTERISTIQUES VALUES ('PR4', 3, 'couleur', 'blanc');
INSERT INTO CARACTERISTIQUES VALUES ('PR5', 1, 'taille', '22');
INSERT INTO CARACTERISTIQUES VALUES ('PR5', 2, 'matiere', 'caoutchouc');
INSERT INTO CARACTERISTIQUES VALUES ('PR5', 3, 'couleur', 'noir');
INSERT INTO CARACTERISTIQUES VALUES ('PR6', 1, 'taille', '30');
INSERT INTO CARACTERISTIQUES VALUES ('PR6', 2, 'matiere', 'cotton');
INSERT INTO CARACTERISTIQUES VALUES ('PR6', 3, 'couleur', 'vert');
INSERT INTO CARACTERISTIQUES VALUES ('PR7', 1, 'taille', '40');
INSERT INTO CARACTERISTIQUES VALUES ('PR7', 2, 'matiere', 'caoutchouc');
INSERT INTO CARACTERISTIQUES VALUES ('PR7', 3, 'couleur', 'orange');
INSERT INTO CARACTERISTIQUES VALUES ('PR8', 1, 'taille', '40');
INSERT INTO CARACTERISTIQUES VALUES ('PR8', 2, 'matiere', 'cuir');
INSERT INTO CARACTERISTIQUES VALUES ('PR8', 3, 'couleur', 'noir');
INSERT INTO CARACTERISTIQUES VALUES ('PR9', 1, 'taille', '30');
INSERT INTO CARACTERISTIQUES VALUES ('PR9', 2, 'matiere', 'cotton');
INSERT INTO CARACTERISTIQUES VALUES ('PR9', 3, 'couleur', 'gris');
INSERT INTO CARACTERISTIQUES VALUES ('PR10', 1, 'taille', '25');
INSERT INTO CARACTERISTIQUES VALUES ('PR10', 2, 'matiere', 'jeans elastique');
INSERT INTO CARACTERISTIQUES VALUES ('PR10', 3, 'couleur', 'bleu');
INSERT INTO CARACTERISTIQUES VALUES ('PR11', 1, 'taille', '10');
INSERT INTO CARACTERISTIQUES VALUES ('PR11', 2, 'matiere', 'cotton');
INSERT INTO CARACTERISTIQUES VALUES ('PR11', 3, 'couleur', 'blanc');
INSERT INTO CARACTERISTIQUES VALUES ('PR12', 1, 'taille', '40');
INSERT INTO CARACTERISTIQUES VALUES ('PR12', 2, 'matiere', 'cuir');
INSERT INTO CARACTERISTIQUES VALUES ('PR12', 3, 'couleur', 'noir');
INSERT INTO CARACTERISTIQUES VALUES ('PR13', 1, 'taille', '40');
INSERT INTO CARACTERISTIQUES VALUES ('PR13', 2, 'matiere', 'polyester');
INSERT INTO CARACTERISTIQUES VALUES ('PR13', 3, 'couleur', 'rouge');


--Nous avons au début inséré des offres et des offres gagnantes pour tester notre schéma
--Mais par la suite, les offres sont insérées directement à partir de l'application
--Et les offres gagnantes sont insérées en fonction du fonctionnement de l'enchère

INSERT INTO OFFRE_GAGNANTE VALUES ('PR1',to_date('2021-06-18 10:34:45', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO OFFRE_GAGNANTE VALUES ('PR2', to_date('2021-06-20 00:20:13', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO OFFRE_GAGNANTE VALUES ('PR3', to_date('2021-07-02 12:30:02', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO OFFRE VALUES ('PR1', to_date('2021-06-18 10:34:45', 'YYYY-MM-DD HH24:MI:SS'), 150,'KB9999999');
INSERT INTO OFFRE VALUES ('PR1', to_date('2021-06-20 11:20:13', 'YYYY-MM-DD HH24:MI:SS'), 200,'LM10101010');
INSERT INTO OFFRE VALUES ('PR1', to_date('2021-07-02 11:30:02', 'YYYY-MM-DD HH24:MI:SS'), 170,'CR7777777');
INSERT INTO OFFRE VALUES ('PR1', to_date('2020-06-08 8:04:45', 'YYYY-MM-DD HH24:MI:SS'), 110,'EH999999');
INSERT INTO OFFRE VALUES ('PR1', to_date('2021-02-20 4:20:13', 'YYYY-MM-DD HH24:MI:SS'), 200,'ET333333');
INSERT INTO OFFRE VALUES ('PR1', to_date('2021-09-01 9:30:02', 'YYYY-MM-DD HH24:MI:SS'), 172,'TK88888');
INSERT INTO OFFRE VALUES ('PR2', to_date('2021-06-18 10:34:45', 'YYYY-MM-DD HH24:MI:SS'), 100,'KB9999999');
INSERT INTO OFFRE VALUES ('PR2', to_date('2019-11-20 06:20:13', 'YYYY-MM-DD HH24:MI:SS'), 50,'LM10101010');
INSERT INTO OFFRE VALUES ('PR2', to_date('2021-05-02 12:00:02', 'YYYY-MM-DD HH24:MI:SS'), 30,'VJ202020');
INSERT INTO OFFRE VALUES ('PR2', to_date('2020-03-18 10:04:55', 'YYYY-MM-DD HH24:MI:SS'), 43,'AH232323');
INSERT INTO OFFRE VALUES ('PR2', to_date('2021-06-20 04:20:00', 'YYYY-MM-DD HH24:MI:SS'), 79,'KD17171717');
INSERT INTO OFFRE VALUES ('PR3', to_date('2021-05-01 08:30:02', 'YYYY-MM-DD HH24:MI:SS'), 65,'EH999999');
INSERT INTO OFFRE VALUES ('PR3', to_date('2021-06-05 10:34:45', 'YYYY-MM-DD HH24:MI:SS'), 100,'JK101010');
INSERT INTO OFFRE VALUES ('PR3', to_date('2021-06-10 11:20:13', 'YYYY-MM-DD HH24:MI:SS'), 99,'ZI999999');
INSERT INTO OFFRE VALUES ('PR3', to_date('2020-01-02 12:30:02', 'YYYY-MM-DD HH24:MI:SS'), 101,'CR7777777');
INSERT INTO OFFRE VALUES ('PR3', to_date('2021-05-01 10:36:05', 'YYYY-MM-DD HH24:MI:SS'), 100,'SR4444444');
INSERT INTO OFFRE VALUES ('PR3', to_date('2021-06-20 00:20:13', 'YYYY-MM-DD HH24:MI:SS'), 50,'LW999999');
INSERT INTO OFFRE VALUES ('PR3', to_date('2021-07-02 04:30:02', 'YYYY-MM-DD HH24:MI:SS'), 170,'CR7777777');
INSERT INTO OFFRE VALUES ('PR4', to_date('2018-11-18 10:40:45', 'YYYY-MM-DD HH24:MI:SS'), 20,'KB9999999');
INSERT INTO OFFRE VALUES ('PR4', to_date('2018-12-12 05:20:13', 'YYYY-MM-DD HH24:MI:SS'), 25,'AH222222');
INSERT INTO OFFRE VALUES ('PR5', to_date('2021-07-02 06:30:02', 'YYYY-MM-DD HH24:MI:SS'), 150,'CR7777777');
INSERT INTO OFFRE VALUES ('PR5', to_date('2021-06-18 10:34:45', 'YYYY-MM-DD HH24:MI:SS'), 155,'TC1111111');
INSERT INTO OFFRE VALUES ('PR5', to_date('2021-02-20 11:30:13', 'YYYY-MM-DD HH24:MI:SS'), 200,'MD444444');
INSERT INTO OFFRE VALUES ('PR5', to_date('2021-02-20 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 204,'RL999999');
INSERT INTO OFFRE VALUES ('PR6', to_date('2021-02-10 11:24:15', 'YYYY-MM-DD HH24:MI:SS'), 10,'AH232323');
INSERT INTO OFFRE VALUES ('PR6', to_date('2021-03-20 06:10:14', 'YYYY-MM-DD HH24:MI:SS'), 45,'PG111111');
INSERT INTO OFFRE VALUES ('PR6', to_date('2021-07-02 12:33:12', 'YYYY-MM-DD HH24:MI:SS'), 23,'RL999999');
INSERT INTO OFFRE VALUES ('PR6', to_date('2021-06-18 07:14:49', 'YYYY-MM-DD HH24:MI:SS'), 30,'KB9999999');
INSERT INTO OFFRE VALUES ('PR6', to_date('2021-06-23 11:22:13', 'YYYY-MM-DD HH24:MI:SS'), 42,'LM10101010');
INSERT INTO OFFRE VALUES ('PR7', to_date('2020-12-20 12:11:02', 'YYYY-MM-DD HH24:MI:SS'), 170,'LW999999');
INSERT INTO OFFRE VALUES ('PR7', to_date('2021-05-30 10:04:44', 'YYYY-MM-DD HH24:MI:SS'), 180,'KD17171717');
INSERT INTO OFFRE VALUES ('PR7', to_date('2021-02-22 08:25:12', 'YYYY-MM-DD HH24:MI:SS'), 200,'ET333333');
INSERT INTO OFFRE VALUES ('PR7', to_date('2021-07-02 03:30:52', 'YYYY-MM-DD HH24:MI:SS'), 170,'TC1111111');
INSERT INTO OFFRE VALUES ('PR8', to_date('2021-06-18 10:34:45', 'YYYY-MM-DD HH24:MI:SS'), 100,'KB9999999');
INSERT INTO OFFRE VALUES ('PR8', to_date('2021-06-29 09:28:13', 'YYYY-MM-DD HH24:MI:SS'), 150,'SR4444444');
INSERT INTO OFFRE VALUES ('PR8', to_date('2021-01-04 02:30:02', 'YYYY-MM-DD HH24:MI:SS'), 170,'CR7777777');
INSERT INTO OFFRE VALUES ('PR8', to_date('2021-06-18 10:24:45', 'YYYY-MM-DD HH24:MI:SS'), 200,'TC1111111');
INSERT INTO OFFRE VALUES ('PR8', to_date('2021-06-18 10:20:13', 'YYYY-MM-DD HH24:MI:SS'), 200,'LM10101010');
INSERT INTO OFFRE VALUES ('PR8', to_date('2021-07-02 12:30:02', 'YYYY-MM-DD HH24:MI:SS'), 179,'MS999999');
INSERT INTO OFFRE VALUES ('PR9', to_date('2020-12-12 10:04:45', 'YYYY-MM-DD HH24:MI:SS'), 100,'ZZ101010');
INSERT INTO OFFRE VALUES ('PR9', to_date('2021-06-26 06:20:13', 'YYYY-MM-DD HH24:MI:SS'), 80,'KD17171717');
INSERT INTO OFFRE VALUES ('PR9', to_date('2021-07-22 11:33:02', 'YYYY-MM-DD HH24:MI:SS'), 70,'PG111111');
INSERT INTO OFFRE VALUES ('PR9', to_date('2021-01-30 11:54:00', 'YYYY-MM-DD HH24:MI:SS'), 76,'KB9999999');
INSERT INTO OFFRE VALUES ('PR9', to_date('2021-03-25 05:29:03', 'YYYY-MM-DD HH24:MI:SS'), 85,'ZI999999');
INSERT INTO OFFRE VALUES ('PR9', to_date('2019-12-02 12:30:02', 'YYYY-MM-DD HH24:MI:SS'), 170,'CR7777777');
INSERT INTO OFFRE VALUES ('PR10', to_date('2021-09-10 10:30:40', 'YYYY-MM-DD HH24:MI:SS'), 190,'KB9999999');
INSERT INTO OFFRE VALUES ('PR10', to_date('2020-11-12 02:20:13', 'YYYY-MM-DD HH24:MI:SS'), 140,'LM10101010');
INSERT INTO OFFRE VALUES ('PR10', to_date('2021-07-30 11:39:02', 'YYYY-MM-DD HH24:MI:SS'), 170,'CR7777777');
INSERT INTO OFFRE VALUES ('PR11', to_date('2020-12-19 09:59:45', 'YYYY-MM-DD HH24:MI:SS'), 25,'TK88888');
INSERT INTO OFFRE VALUES ('PR11', to_date('2021-02-20 00:20:13', 'YYYY-MM-DD HH24:MI:SS'), 30,'MD444444');
INSERT INTO OFFRE VALUES ('PR11', to_date('2021-04-19 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 15,'EH999999');
INSERT INTO OFFRE VALUES ('PR12', to_date('2021-04-21 07:10:09', 'YYYY-MM-DD HH24:MI:SS'), 50,'JK101010');
INSERT INTO OFFRE VALUES ('PR12', to_date('2021-09-30 04:37:05', 'YYYY-MM-DD HH24:MI:SS'), 75,'TC1111111');
INSERT INTO OFFRE VALUES ('PR12', to_date('2020-11-25 11:30:50', 'YYYY-MM-DD HH24:MI:SS'), 65,'AH232323');
INSERT INTO OFFRE VALUES ('PR12', to_date('2020-10-19 09:34:50', 'YYYY-MM-DD HH24:MI:SS'), 45,'EH999999');
INSERT INTO OFFRE VALUES ('PR13', to_date('2021-06-25 11:46:00', 'YYYY-MM-DD HH24:MI:SS'), 90,'CR7777777');
INSERT INTO OFFRE VALUES ('PR13', to_date('2020-11-30 06:23:05', 'YYYY-MM-DD HH24:MI:SS'), 79,'PG111111');
INSERT INTO OFFRE VALUES ('PR13', to_date('2020-12-25 09:06:50', 'YYYY-MM-DD HH24:MI:SS'), 115,'ZZ101010');
INSERT INTO OFFRE VALUES ('PR13', to_date('2021-06-29 02:40:02', 'YYYY-MM-DD HH24:MI:SS'), 76,'TK88888');
INSERT INTO OFFRE VALUES ('PR13', to_date('2021-09-25 05:41:06', 'YYYY-MM-DD HH24:MI:SS'), 75,'MD444444');
INSERT INTO OFFRE VALUES ('PR13', to_date('2021-01-05 10:40:00', 'YYYY-MM-DD HH24:MI:SS'), 75,'ET333333');
INSERT INTO OFFRE VALUES ('PR13', to_date('2020-11-30 09:40:55', 'YYYY-MM-DD HH24:MI:SS'), 90,'MS999999');
INSERT INTO OFFRE VALUES ('PR13', to_date('2021-07-25 11:43:00', 'YYYY-MM-DD HH24:MI:SS'), 110,'ET333333');
INSERT INTO OFFRE VALUES ('PR1', to_date('2021-01-21 21:00:45', 'YYYY-MM-DD HH24:MI:SS'), 48,'JK101010');
INSERT INTO OFFRE VALUES ('PR1', to_date('2021-03-23 18:22:13', 'YYYY-MM-DD HH24:MI:SS'), 58,'CR7777777');
INSERT INTO OFFRE VALUES ('PR1', to_date('2021-05-04 14:13:02', 'YYYY-MM-DD HH24:MI:SS'), 67,'LW999999');
INSERT INTO OFFRE VALUES ('PR1', to_date('2021-02-22 18:01:45', 'YYYY-MM-DD HH24:MI:SS'), 70,'AH232323');
INSERT INTO OFFRE VALUES ('PR1', to_date('2021-04-29 14:08:13', 'YYYY-MM-DD HH24:MI:SS'), 72,'MD444444');
INSERT INTO OFFRE VALUES ('PR1', to_date('2021-02-11 19:13:02', 'YYYY-MM-DD HH24:MI:SS'), 80,'KM7777777');
INSERT INTO OFFRE VALUES ('PR2', to_date('2021-01-30 20:13:45', 'YYYY-MM-DD HH24:MI:SS'), 22,'KB9999999');
INSERT INTO OFFRE VALUES ('PR2', to_date('2021-04-01 16:55:13', 'YYYY-MM-DD HH24:MI:SS'), 25,'LM10101010');
INSERT INTO OFFRE VALUES ('PR2', to_date('2021-02-04 14:20:02', 'YYYY-MM-DD HH24:MI:SS'), 27,'LM10101010');
INSERT INTO OFFRE VALUES ('PR2', to_date('2021-12-21 14:55:55', 'YYYY-MM-DD HH24:MI:SS'), 35,'ZZ101010');
INSERT INTO OFFRE VALUES ('PR2', to_date('2021-05-18 15:11:00', 'YYYY-MM-DD HH24:MI:SS'), 40,'LM10101010');
INSERT INTO OFFRE VALUES ('PR3', to_date('2021-02-12 19:57:02', 'YYYY-MM-DD HH24:MI:SS'), 42,'SR4444444');
INSERT INTO OFFRE VALUES ('PR3', to_date('2021-05-17 23:22:45', 'YYYY-MM-DD HH24:MI:SS'), 46,'PG111111');
INSERT INTO OFFRE VALUES ('PR3', to_date('2021-02-10 13:19:13', 'YYYY-MM-DD HH24:MI:SS'), 60,'ZI999999');
INSERT INTO OFFRE VALUES ('PR3', to_date('2021-07-10 16:53:02', 'YYYY-MM-DD HH24:MI:SS'), 67,'CR7777777');
INSERT INTO OFFRE VALUES ('PR3', to_date('2021-04-29 17:12:05', 'YYYY-MM-DD HH24:MI:SS'), 79,'VJ202020');
INSERT INTO OFFRE VALUES ('PR3', to_date('2021-07-28 22:02:13', 'YYYY-MM-DD HH24:MI:SS'), 82,'EH999999');
INSERT INTO OFFRE VALUES ('PR3', to_date('2021-08-29 14:11:02', 'YYYY-MM-DD HH24:MI:SS'), 85,'TK88888');
INSERT INTO OFFRE VALUES ('PR4', to_date('2021-09-10 13:42:45', 'YYYY-MM-DD HH24:MI:SS'), 37,'KB9999999');
INSERT INTO OFFRE VALUES ('PR4', to_date('2021-06-01 15:20:13', 'YYYY-MM-DD HH24:MI:SS'), 46,'AH222222');
INSERT INTO OFFRE VALUES ('PR5', to_date('2021-05-09 13:23:02', 'YYYY-MM-DD HH24:MI:SS'), 53,'CR7777777');
INSERT INTO OFFRE VALUES ('PR5', to_date('2021-03-04 19:34:45', 'YYYY-MM-DD HH24:MI:SS'), 55,'TC1111111');
INSERT INTO OFFRE VALUES ('PR5', to_date('2021-08-03 18:44:13', 'YYYY-MM-DD HH24:MI:SS'), 60,'MD444444');
INSERT INTO OFFRE VALUES ('PR5', to_date('2021-05-20 20:23:00', 'YYYY-MM-DD HH24:MI:SS'), 64,'MD444444');
INSERT INTO OFFRE VALUES ('PR6', to_date('2021-08-10 35:53:15', 'YYYY-MM-DD HH24:MI:SS'), 10,'AH232323');
INSERT INTO OFFRE VALUES ('PR6', to_date('2021-09-21 15:13:14', 'YYYY-MM-DD HH24:MI:SS'), 11,'MD444444');
INSERT INTO OFFRE VALUES ('PR6', to_date('2021-11-20 13:03:12', 'YYYY-MM-DD HH24:MI:SS'), 15,'ET333333');
INSERT INTO OFFRE VALUES ('PR6', to_date('2021-10-29 17:13:49', 'YYYY-MM-DD HH24:MI:SS'), 17,'KM7777777');
INSERT INTO OFFRE VALUES ('PR6', to_date('2021-12-23 19:00:13', 'YYYY-MM-DD HH24:MI:SS'), 42,'LM10101010');
INSERT INTO OFFRE VALUES ('PR7', to_date('2021-12-22 21:42:02', 'YYYY-MM-DD HH24:MI:SS'), 55,'SR4444444');
INSERT INTO OFFRE VALUES ('PR7', to_date('2021-02-11 13:52:44', 'YYYY-MM-DD HH24:MI:SS'), 57,'KD17171717');
INSERT INTO OFFRE VALUES ('PR7', to_date('2021-03-10 22:14:12', 'YYYY-MM-DD HH24:MI:SS'), 70,'KD17171717');
INSERT INTO OFFRE VALUES ('PR7', to_date('2021-03-18 22:14:52', 'YYYY-MM-DD HH24:MI:SS'), 77,'ZZ101010');
INSERT INTO OFFRE VALUES ('PR8', to_date('2021-03-18 20:14:45', 'YYYY-MM-DD HH24:MI:SS'), 30,'LW999999');
INSERT INTO OFFRE VALUES ('PR8', to_date('2021-09-29 19:14:13', 'YYYY-MM-DD HH24:MI:SS'), 34,'AH232323');
INSERT INTO OFFRE VALUES ('PR8', to_date('2021-08-17 22:42:02', 'YYYY-MM-DD HH24:MI:SS'), 35,'MD444444');
INSERT INTO OFFRE VALUES ('PR8', to_date('2021-07-03 20:23:45', 'YYYY-MM-DD HH24:MI:SS'), 37,'PG111111');
INSERT INTO OFFRE VALUES ('PR8', to_date('2021-02-09 15:52:13', 'YYYY-MM-DD HH24:MI:SS'), 41,'JK101010');
INSERT INTO OFFRE VALUES ('PR8', to_date('2021-05-07 14:24:02', 'YYYY-MM-DD HH24:MI:SS'), 45,'ET333333');
INSERT INTO OFFRE VALUES ('PR9', to_date('2021-04-12 16:03:45', 'YYYY-MM-DD HH24:MI:SS'), 9,'KB9999999');
INSERT INTO OFFRE VALUES ('PR9', to_date('2021-02-29 16:01:13', 'YYYY-MM-DD HH24:MI:SS'), 10,'MD444444');
INSERT INTO OFFRE VALUES ('PR9', to_date('2021-01-28 16:12:02', 'YYYY-MM-DD HH24:MI:SS'), 14,'AH232323');
INSERT INTO OFFRE VALUES ('PR9', to_date('2021-05-26 16:53:00', 'YYYY-MM-DD HH24:MI:SS'), 15,'EH999999');
INSERT INTO OFFRE VALUES ('PR9', to_date('2021-04-25 22:22:03', 'YYYY-MM-DD HH24:MI:SS'), 16,'ZZ101010');
INSERT INTO OFFRE VALUES ('PR9', to_date('2021-12-09 13:35:02', 'YYYY-MM-DD HH24:MI:SS'), 17,'KD17171717');
INSERT INTO OFFRE VALUES ('PR10', to_date('2021-09-20 21:45:40', 'YYYY-MM-DD HH24:MI:SS'), 25,'SR4444444');
INSERT INTO OFFRE VALUES ('PR10', to_date('2021-10-22 15:57:13', 'YYYY-MM-DD HH24:MI:SS'), 30,'LM10101010');
INSERT INTO OFFRE VALUES ('PR10', to_date('2021-02-20 19:55:02', 'YYYY-MM-DD HH24:MI:SS'), 40,'LM10101010');
INSERT INTO OFFRE VALUES ('PR11', to_date('2021-09-02 19:45:45', 'YYYY-MM-DD HH24:MI:SS'), 10,'TK88888');
INSERT INTO OFFRE VALUES ('PR11', to_date('2021-06-08 19:52:13', 'YYYY-MM-DD HH24:MI:SS'), 12,'RL999999');
INSERT INTO OFFRE VALUES ('PR11', to_date('2021-04-13 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 14,'EH999999');
INSERT INTO OFFRE VALUES ('PR12', to_date('2021-08-24 13:13:09', 'YYYY-MM-DD HH24:MI:SS'), 10,'RL999999');
INSERT INTO OFFRE VALUES ('PR12', to_date('2021-04-08 20:21:05', 'YYYY-MM-DD HH24:MI:SS'), 11,'TC1111111');
INSERT INTO OFFRE VALUES ('PR12', to_date('2021-06-06 23:42:50', 'YYYY-MM-DD HH24:MI:SS'), 15,'AH232323');
INSERT INTO OFFRE VALUES ('PR12', to_date('2021-12-03 13:45:50', 'YYYY-MM-DD HH24:MI:SS'), 20,'MS999999');
INSERT INTO OFFRE VALUES ('PR13', to_date('2021-05-30 18:28:00', 'YYYY-MM-DD HH24:MI:SS'), 15,'ZI999999');
INSERT INTO OFFRE VALUES ('PR13', to_date('2021-01-02 16:47:05', 'YYYY-MM-DD HH24:MI:SS'), 20,'PG111111');
INSERT INTO OFFRE VALUES ('PR13', to_date('2021-02-05 19:46:50', 'YYYY-MM-DD HH24:MI:SS'), 21,'JK101010');
INSERT INTO OFFRE VALUES ('PR13', to_date('2021-05-22 14:23:02', 'YYYY-MM-DD HH24:MI:SS'), 22,'PG111111');
INSERT INTO OFFRE VALUES ('PR13', to_date('2021-02-23 18:56:06', 'YYYY-MM-DD HH24:MI:SS'), 24,'AH232323');
INSERT INTO OFFRE VALUES ('PR13', to_date('2021-05-02 19:34:00', 'YYYY-MM-DD HH24:MI:SS'), 25,'EH999999');
INSERT INTO OFFRE VALUES ('PR13', to_date('2021-11-08 20:45:55', 'YYYY-MM-DD HH24:MI:SS'), 27,'LW999999');
INSERT INTO OFFRE VALUES ('PR13', to_date('2021-03-11 22:53:00', 'YYYY-MM-DD HH24:MI:SS'), 30,'CR7777777');
INSERT INTO OFFRE VALUES ('PR13', to_date('2021-05-01 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), 35,'KB9999999');


