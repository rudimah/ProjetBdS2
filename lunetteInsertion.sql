INSERT INTO utilisateur (id_utilisateur, login, email, nom, prenom, pwd, user_role) VALUES
(1, 'jpoulin', 'jeanpoulin.77@gmail.com', 'Poulin', 'Jean', 'l2db-5v2e', 'client'),
(2, 'acorbeil', 'calice62@orange.fr', 'Corbeil', 'Alice', '88f$Tt~E70)Izx', 'client'),
(3, 'zbousquet', '4zakbousquet@gmail.com', 'Bousquet', 'Zakaria', '75nFE_a(Cj$9', 'client'),
(4, 'admin1', 'rbeaulac805@sfr.fr', 'Beaulac', 'Romane', '_-83D6/g7fnhSP', 'administrateur'),
(5, 'lmorin', 'lucie.morin@gmail.com', 'Morin', 'Lucie', '2]88eU/pn[5DKh', 'client'),
(6, 'dauprey', 'davidauprey47@gmail.com', 'Auprey', 'David', '_Qz8N~]ku353rG', 'client'),
(7, 'admin2', 'mdubois300@gmail.com', 'Dubois', 'Marie', 's4A)[pj6@tL26D', 'administrateur'),
(8, 'otolan', 'tolivier@gmail.com', 'Tolan', 'Olivier', 'G95cT2v4Y,)q!a', 'client'),
(9, 'sbourg', 'bourgsophie6@gmail.com', 'Bourg', 'Sophie', '6=TLqiJv97!#2z', 'client'),
(10, 'afontais', 'fontaisanthony8gmail.com', 'Fontais', 'Anthony', '9^;vE4kvm+QS29', 'client');


INSERT INTO couleur (id_couleur, libelle_couleur) VALUES
(1, 'Rouge'),
(2, 'Bleu'),
(3, 'Rose'),
(4, 'Gris'),
(5, 'Noir'),
(6, 'Blanc'),
(7, 'Orange');

INSERT INTO categorie (id_categorie, libelle_categorie) VALUES
(1, 'Vue'),
(2, 'Soleil'),
(3, 'Enfant'),
(4, 'Lecture'),
(5, 'Sport');

INSERT INTO lunette (id_lunette, nom_lunette, sexe, taille_monture, prix_lunette, fournisseur, marque, quantite_dispo, couleur_id, categorie_id) VALUES
(1, 'Jim Optics', 'H', 55, 185, 'Montreuil Lunette', 'RayBan', 20, 1, 1),
(2, 'KJ', 'H', 49, 60, 'Hoptique', 'Kumquat', 15, 3, 4),
(3, 'Sutro Lite', 'H', 53, 155.99, 'Montreuil Lunette', 'Oakley', 10, 2, 5),
(4, 'SFP', 'F', 57, 100, 'N.Oeil', 'Baila', 25, 2, 2),
(5, 'Clubmaster Optic', 'F', 50, 164.99, 'Hoptique', 'RayBan', 18, 4, 1),
(6, 'French Retro', 'H', 51, 80, 'Hoptique', 'Ulysse', 30, 1, 2),
(7, 'Lunettes de lecture Madrid', 'H', 56, 19.90, 'Hoptique', 'Le Petit Cordon', 20, 5, 4),
(8, 'Hurry', 'F', 58, 120, 'N.Oeil', 'Demetz', 12, 3, 5),
(9, 'Aviator Classic', 'H', 48, 215, 'Montreuil Lunette', 'RayBan', 0, 6, 2),
(10, 'Britt Optics', 'F', 49, 90, 'N.Oeil', 'Rayban', 22, 7, 1),
(11, 'Lunettes de lecture Bristol', 'H', 56, 29.99, 'Hoptique', 'Le Petit Cordon', 17, 7, 4),
(12, 'Aerial E', 'F', 59, 130, 'N.Oeil', 'Nike', 14, 3, 5),
(13, 'Erika Classic', 'F', 53, 169.49, 'N.Oeil', 'RayBan', 27, 1, 2),
(14, 'CM', 'F', 51, 139, 'Hoptique', 'Cosmopolitan', 16, 5, 1),
(15, 'Fenix', 'H', 59, 149.99, 'Montreuil Lunette', 'Bollé', 9, 4, 5);


INSERT INTO etat (id_etat, libelle) VALUES
(1, 'en attente'),
(2, 'expédié'),
(3, 'validé'),
(4, 'confirmé');


INSERT INTO commande (id_commande, date_achat, utilisateur_id, etat_id) VALUES
(1, '2023-09-20', 1, 1),
(2, '2024-12-05', 2, 2),
(3, '2024-04-19', 3, 3),
(4, '2023-11-12', 3, 4),
(5, '2024-10-26', 5, 1),
(6, '2022-02-20', 6, 2),
(7, '2023-07-14', 6, 3),
(8, '2023-03-08', 8, 4),
(9, '2022-03-09', 9, 1),
(10, '2021-03-10', 10, 2),
(11, '2024-03-11', 2, 3),
(12, '2024-03-12', 2, 4),
(13, '2023-03-13', 3, 1),
(14, '2024-03-14', 4, 2),
(15, '2024-03-15', 5, 3);

--MODIF LES PRIX
INSERT INTO ligne_commande (lunette_id, commande_id, prix, quantite) VALUES
(11, 1, 29.99, 1),
(14, 2, 278, 2),
(9, 3, 215, 1),
(6, 4, 80, 1),
(7, 5, 19.90, 1),
(2, 6, 120, 2),
(10, 7, 90, 1),
(3, 8, 155.99, 1),
(13, 9, 338.98, 2),
(15, 10, 149.99, 1),
(1, 11, 370, 2),
(4, 12, 100, 1),
(12, 13, 130, 1),
(8, 14, 120, 1),
(5, 15, 164.99, 1);

INSERT INTO ligne_panier (utilisateur_id, lunette_id, quantite, date_ajout) VALUES
(1, 11, 1, '2024-03-01'),
(2, 14, 1, '2024-03-02'),
(3, 9, 1, '2024-03-03'),
(3, 6, 1, '2024-03-04'),
(5, 7, 1, '2024-03-05'),
(6, 2, 2, '2024-03-06'),
(6, 10, 1, '2024-03-07'),
(8, 3, 1, '2024-03-08'),
(9, 13, 2, '2024-03-09'),
(10, 15, 1, '2024-03-10'),
(2, 1, 2, '2024-03-11'),
(2, 4, 1, '2024-03-12'),
(3, 12, 1, '2024-03-13'),
(4, 8, 1, '2024-03-14'),
(7, 15, 1, '2024-03-07'),
(5, 5, 2, '2024-03-15');
