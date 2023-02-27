--Inscription d'un nouveau client : 
Begin; 
INSERT INTO COMPTE VALUES ( 'idCompte' );
INSERT INTO UTILISATEUR VALUES ( 'mail',  'passwd',  'prenom', 'nom', 'adresse', 'idcompte');
Commit;

--Connexion du client à l’application avec son email comme identifiant et vérification du mot de passe
SELECT IDCompte FROM UTILISATEUR WHERE EMAIL = '' AND MotDePasse = '';

--Parcours des catégories et sous-catégories

--Si l'on souhaite avoir toutes les catégories et sous-catégories :
SELECT * FROM CATEGORIE

--Si l'on souhaite avoir des recommandations : 
--Selon les offres précédentes de l'utilisateur qui n'ont pas abouties
SELECT COUNT(NOMC) AS NBR, NOMC FROM (SELECT P.IDPROD, P.NOMC FROM ((SELECT IDPROD,IDCOMPTE FROM OFFRE WHERE IDCOMPTE = 'idCompte')
MINUS (SELECT IDPROD,IDCOMPTE FROM OFFRE_GAGNANTE WHERE IDCOMPTE = 'idCompte')) M 
JOIN PRODUIT P ON P.IDPROD = M.IDPROD WHERE M.IDCOMPTE = 'idCompte') H 
JOIN OFFRE O ON O.IDPROD = H.IDPROD WHERE O.IDCOMPTE = 'idCompte'
GROUP BY NOMC ORDER BY NBR DESC")

--Selon les offres populaires du moment 
SELECT SUM(NBR)/COUNT(*) AS FINAL_NBR,NOMC 
FROM (SELECT COUNT(*) AS NBR, NOMC,IDPROD FROM (SELECT O.IDPROD, P.NOMC  FROM OFFRE O 
JOIN PRODUIT P ON P.IDPROD = O.IDPROD) H "
GROUP BY NOMC, IDPROD) M 
GROUP BY M.NOMC ORDER BY FINAL_NBR DESC

--Affichage des produits de telle sorte à avoir uniquement les produits encore dispos et selon la catégorie choisie
SELECT H.IDPROD, H.INTITULE, H.PRIXCOURANT, H.URL, H.NOMC FROM (SELECT COUNT(*) AS NBROFFRE,P.IDPROD, P.INTITULE, P.PRIXCOURANT, P.URL, P.NOMC  FROM PRODUIT P
LEFT JOIN OFFRE O
ON P.IDPROD = O.IDPROD
WHERE NOMC IN ((SELECT * FROM CATEGORIE WHERE NomC = 'NomC') UNION (SELECT A.NomC FROM CATEGORIE C JOIN A_PARENT A ON C.NomC = A.NomParent WHERE C.NomC = 'NomC')) AND P.IDPROD NOT IN (SELECT IDPROD FROM OFFRE_GAGNANTE)
GROUP BY P.IDPROD, P.INTITULE, P.PRIXCOURANT, P.URL, P.NOMC
ORDER BY NBROFFRE DESC) H

--Transaction pour effectuer une offre
--On vérifie si le prix courant est inférieur stric aux prix proposé
Begin;
INSERT INTO OFFRE VALUES ('idprod', to_date('date', 'YYYY-MM-DD HH24:MI:SS'), prix, 'idCompte');
DELETE FROM OFFRE WHERE IDCompte = 'CR7777777' and PrixPropose <= PrixCourant and Heure = to_date('date', 'YYYY-MM-DD HH24:MI:SS');
UPDATE PRODUIT SET PrixCourant = PrixPropose WHERE PrixPropose > PrixCourant AND IdProd = 'idprod' AND IDProd NOT IN (Select IDProd FROM OFFRE_GAGNANTE);
(Si 5e offre :) 
INSERT INTO OFFRE_GAGNANTE VALUES('idprod',to_date('date', 'YYYY-MM-DD HH24:MI:SS'),'idCompte')
Commit;

--Droit à l'oubli, on garde uniquement l'id dans la table COMPTE 
Begin;
DELETE FROM UTILISATEUR WHERE Email = '';
Commit;
