--Requêtes : (réponses en bas)

--Question 1
--Trouver le prix total des commandes qui contiennent des lunettes de la marque dont on possède le plus de paires.

SELECT sum(prix)
FROM ligne_commande INNER JOIN lunette ON lunette_id = id_lunette
WHERE marque IN (SELECT marque 
				 FROM lunette
			 	 GROUP BY marque
			 	 HAVING count(*) = (SELECT max(nombre) 
									FROM(SELECT count(*) as nombre
				 	  			    	 FROM lunette
				   		   		         GROUP BY marque) AS max));

--Question 2
--On voudrait connaître nos clients qui ont acheté des paires de lunettes supérieur à la moyenne du nombre total de commandes effectuées
--sur le site

SELECT utilisateur_id
FROM commande
GROUP BY utilisateur_id
HAVING count(*) > (SELECT avg(c.nombreCommande) FROM (SELECT count(*) nombreCommande
													  FROM commande 
													  GROUP BY utilisateur_id) c);
												
--Question 3
--On voudrait savoir le nom et l’identifiant de nos lunettes plus chères que la moyenne des prix totaux des lunettes.

SELECT nom_lunette, id_lunette
FROM lunette INNER JOIN categorie ON categorie_id = id_categorie
WHERE libelle_categorie = 'Vue' AND id_lunette IN (SELECT id_lunette 
												   FROM lunette
												   WHERE prix_lunette > (SELECT avg(prix_lunette)
					 							   FROM lunette));

--Question 4
--Suite à un problème de logistique à cause de la nouvelle année, nous avons besoin de l’id et de l’état des commandes passés après 
--le 01/01/2024.

SELECT libelle, id_commande, utilisateur_id
FROM etat INNER JOIN commande ON id_etat = etat_id WHERE utilisateur_id IN (SELECT utilisateur_id
																	        FROM commande
																	        WHERE date_achat > '01/01/2024'
																	        GROUP BY utilisateur_id
																	        HAVING count(*) >= 2);
																	
--Question 5
--On voudrait stocker une vue contenant les emails des clients qui ont ajouté des lunettes dans le panier et qui n'ont jamais commandé.

CREATE VIEW potentiel_client AS
SELECT DISTINCT email
FROM utilisateur INNER JOIN ligne_panier ON id_utilisateur = utilisateur_id 
WHERE email NOT IN(SELECT email
				   FROM utilisateur inner join commande ON id_utilisateur = utilisateur_id);
				   
SELECT * FROM potentiel_client;

--Question 6
--Trouver par utilisateur le nombre de lunettes de soleil commandées, afficher 0 pour ceux qui n’en ont pas commandé.

Select id_utilisateur,nom, count(commande_id)
from utilisateur left outer join 
(select * 
from commande 
inner join ligne_commande on (id_commande = commande_id)
inner join lunette on (id_lunette = lunette_id)
inner join categorie on (id_categorie = categorie_id)
WHERE libelle_categorie = 'Soleil') AS t  on (t.utilisateur_id = id_utilisateur)
group by id_utilisateur,nom;


--Correction

--Question 1 : 
--"sum"
--1088.97


--Question 2 : 
--"utilisateur_id"
--3
--5
--6
--2


--Question 3 :
--"nom_lunette"	"id_lunette"
--"Jim Optics"	1
--"Clubmaster Optic"	5
--"CM"	14


--Question 4 :

--"libelle"	"id_commande"	"utilisateur_id"
--"expédié"	2	2
--"en attente"	5	5
--"validé"	11	2
--"confirmé"	12	2
--"validé"	15	5


--Question 5 :

--"email"
--"mdubois300@gmail.com"


--Question 6 :
--"id_utilisateur"	"nom"	"count"
--4	"Beaulac"	0
--10 "Fontais"	0
--6	"Auprey"	0
--2	"Corbeil"	1
--9	"Bourg"	1
--7	"Dubois"	0
--3	"Bousquet"	2
--1	"Poulin"	0
--5	"Morin"	0
--8	"Tolan"	0