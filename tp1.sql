Tremeau Guillaume
G22

# Question 1

SELECT DISTINCT categorie
FROM clients;


# Question 2

SELECT NomClt
FROM Clients
WHERE Categorie = 'A';


# Question 3

SELECT COUNT(*)
FROM Produits;


# Question 4

SELECT DISTINCT COUNT(*)
FROM Livraisons 
WHERE NumClt = 1;


# Question 5

SELECT NumClt
FROM Livraisons
WHERE Quantite > 2 AND NumProduit = 6;


# Question 6

SELECT MAX(PrixBrut)
FROM Produits;


# Question 7

SELECT NumProduit, Libelle
FROM Produits
WHERE PrixBrut = 
	(SELECT MAX(PrixBrut) 
	FROM Produits);


# Question 8

SELECT NomClt
FROM Clients
WHERE NomClt LIKE 'Du%';


# Question 9

SELECT DISTINCT NumClt
FROM Livraisons
WHERE NumProduit IN (5,6);


# Question 10

SELECT DISTINCT NumClt
FROM Livraisons
WHERE NumProduit = 1
	INTERSECT
SELECT DISTINCT NumClt
FROM Livraisons
WHERE NumProduit = 6;


# Question 11

SELECT DISTINCT NomClt, C.NumClt
FROM Clients C JOIN Livraisons L ON C.NumClt = L.NumClt;



# Question 12

SELECT P.NumProduit
FROM Produits P 
	JOIN Livraisons L ON P.NumProduit = L.NumProduit 
	JOIN Clients C ON C.NumClt = L.NumClt
WHERE PrixBrut < 55 AND Categorie = 'A';



# Question 13

SELECT DISTINCT Libelle
FROM Produits P
	JOIN Livraisons L ON P.NumProduit = L.NumProduit
MINUS
SELECT DISTINCT Libelle
FROM Produits P
	JOIN Livraisons L ON P.NumProduit = L.NumProduit
	JOIN Clients C ON C.NumClt = L.NumClt
WHERE NomClt <> 'Haddock';



# Question 14

SELECT DISTINCT Libelle
FROM Produits P
	JOIN Livraisons L ON P.NumProduit = L.NumProduit
WHERE NumClt = 3
	INTERSECT
SELECT DISTINCT Libelle
FROM Produits P
	JOIN Livraisons L ON P.NumProduit = L.NumProduit
WHERE NumClt = 5;


# Question 15

SELECT DISTINCT L1.NumClt
FROM Livraisons L1 
	JOIN Livraisons L2 ON L1.NumProduit <> L2.NumProduit AND L1.NumClt = L2.NumClt;


# Question 16

SELECT DISTINCT L1.NumClt
FROM Livraisons L1 
	JOIN Livraisons L2 ON L1.NumProduit <> L2.NumProduit 
		AND L1.NumClt = L2.NumClt 
		AND L1.Quantite = L2.Quantite;


# Question 17

SELECT Libelle
FROM Produits P
WHERE EXISTS (
	SELECT *
	FROM Livraisons L WHERE P.NumProduit = L.NumProduit );


# Question 18

SELECT Libelle
FROM Produits P
WHERE NOT EXISTS (
	SELECT *
	FROM Livraisons L WHERE P.NumProduit = L.NumProduit );


# Question 19

SELECT NumProduit, COUNT(*) "Nbre de Livraison"
FROM Livraisons
GROUP BY NumProduit;


# Question 20

SELECT NumClt
FROM Livraisons L JOIN Produits P ON L.NumProduit = P.NumProduit
GROUP BY NumClt
HAVING COUNT(*) = (SELECT COUNT(*) FROM Produits);


# Question 21

SELECT NumClt
FROM Livraisons L JOIN Produits P ON L.NumProduit = P.NumProduit
WHERE P.PrixBrut < 50
GROUP BY NumClt
HAVING COUNT(*) = (SELECT COUNT(*) FROM Produits WHERE PrixBrut < 50);


# Question 22

SELECT NumProduit, AVG(Quantite)
FROM Livraisons 
GROUP BY NumProduit
HAVING COUNT(*) > 2
ORDER BY NumProduit DESC;


# Question 23

SELECT P.Libelle, COUNT(*)
FROM Livraisons L JOIN Produits P ON L.NumProduit = P.NumProduit
GROUP BY L.NumProduit, P.libelle
HAVING COUNT(*) = (
	SELECT MAX(COUNT(*))
	FROM Livraisons
	GROUP BY NumProduit);


# Question 24

SELECT P.libelle, SUM(L.Quantite)*P.PrixBrut "chiffre d affaire"
FROM Livraisons L JOIN Produits P ON L.NumProduit = P.NumProduit
GROUP BY P.libelle, P.PrixBrut;


# Question 25

SELECT C.NumClt, C.NomClt, L.NumProduit, L.Quantite
FROM Clients C LEFT JOIN Livraisons L ON C.NumClt = L.NumClt
GROUP BY C.NumClt, C.NomClt, L.NumProduit, L.Quantite
ORDER BY C.NumClt;


# Question 26

SELECT LEVEL, NumProComposant "Composant", Quantite
FROM Composition
CONNECT BY PRIOR NumProComposant = NumProCompose;
START WITH NumProCompose = 40;
