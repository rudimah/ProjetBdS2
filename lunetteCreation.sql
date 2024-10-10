DROP SCHEMA if exists lunette CASCADE;
DROP TABLE if exists ligne_commande;
DROP TABLE if exists ligne_panier CASCADE;
DROP TABLE if exists lunette;
DROP TABLE if exists couleur;
DROP TABLE if exists categorie;
DROP TABLE if exists commande CASCADE;
DROP TABLE if exists utilisateur;
DROP TABLE if exists etat;

CREATE SCHEMA lunette;

CREATE TABLE utilisateur(
        id_utilisateur Int NOT NULL ,
        login          Varchar (50) NOT NULL ,
        email          Varchar (50) NOT NULL ,
        nom            Varchar (50) NOT NULL ,
        prenom         Varchar (50) NOT NULL ,
        pwd            Varchar (50) NOT NULL ,
        user_role      Varchar (50) NOT NULL ,
        CONSTRAINT utilisateur_PK PRIMARY KEY (id_utilisateur)
);



CREATE TABLE etat(
        id_etat Int NOT NULL ,
        libelle Varchar (50) NOT NULL
	,CONSTRAINT etat_PK PRIMARY KEY (id_etat)
);



CREATE TABLE commande(
        id_commande    Int NOT NULL ,
        date_achat     Date NOT NULL ,
        utilisateur_id Int NOT NULL ,
        etat_id        Int NOT NULL
	,CONSTRAINT commande_PK PRIMARY KEY (id_commande)

	,CONSTRAINT commande_utilisateur_FK FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id_utilisateur)
	,CONSTRAINT commande_etat0_FK FOREIGN KEY (etat_id) REFERENCES etat(id_etat)
);



CREATE TABLE couleur(
        id_couleur      Int NOT NULL ,
        libelle_couleur Varchar (50) NOT NULL
	,CONSTRAINT couleur_PK PRIMARY KEY (id_couleur)
);



CREATE TABLE categorie(
        id_categorie      Int NOT NULL ,
        libelle_categorie Varchar (50) NOT NULL
	,CONSTRAINT categorie_PK PRIMARY KEY (id_categorie)
);



CREATE TABLE lunette(
        id_lunette     Int NOT NULL ,
        nom_lunette    Varchar (50) NOT NULL ,
        sexe           Varchar (50) NOT NULL ,
        taille_monture Int NOT NULL ,
        prix_lunette   Numeric NOT NULL ,
        fournisseur    Varchar (50) NOT NULL ,
        marque         Varchar (50) NOT NULL ,
        quantite_dispo Int NOT NULL ,
        couleur_id     Int NOT NULL ,
        categorie_id   Int NOT NULL
	,CONSTRAINT lunette_PK PRIMARY KEY (id_lunette)

	,CONSTRAINT lunette_couleur_FK FOREIGN KEY (couleur_id) REFERENCES couleur(id_couleur)
	,CONSTRAINT lunette_categorie0_FK FOREIGN KEY (categorie_id) REFERENCES categorie(id_categorie)
);



CREATE TABLE ligne_commande(
        lunette_id  Int NOT NULL ,
        commande_id Int NOT NULL ,
        prix        Numeric NOT NULL ,
        quantite    Int NOT NULL
	,CONSTRAINT ligne_commande_PK PRIMARY KEY (lunette_id,commande_id)

	,CONSTRAINT ligne_commande_lunette_FK FOREIGN KEY (lunette_id) REFERENCES lunette(id_lunette)
	,CONSTRAINT ligne_commande_commande0_FK FOREIGN KEY (commande_id) REFERENCES commande(id_commande)
);

CREATE TABLE ligne_panier(
        utilisateur_id Int NOT NULL ,
        lunette_id     Int NOT NULL ,
        quantite       Int NOT NULL ,
        date_ajout     Date NOT NULL
	,CONSTRAINT ligne_panier_PK PRIMARY KEY (utilisateur_id,lunette_id)

	,CONSTRAINT ligne_panier_utilisateur_FK FOREIGN KEY (utilisateur_id) REFERENCES utilisateur(id_utilisateur)
	,CONSTRAINT ligne_panier_lunette0_FK FOREIGN KEY (lunette_id) REFERENCES lunette(id_lunette)
);


