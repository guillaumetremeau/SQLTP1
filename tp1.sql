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



# Question 20



# Question 21



# Question 22



# Question 23



# Question 24



# Question 25



# Question 26


