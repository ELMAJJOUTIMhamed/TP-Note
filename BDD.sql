CREATE TABLE Clients (
  id_client INT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(255) NOT NULL,
  prenom VARCHAR(255) NOT NULL,
  tel VARCHAR(255) NOT NULL,
  adresse_email VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_client)
);


CREATE TABLE Compte (
  id_compte INT NOT NULL AUTO_INCREMENT,
  iban VARCHAR(255) NOT NULL,
  type_compte VARCHAR(255) NOT NULL,
  solde FLOAT NOT NULL,
  id_client INT NOT NULL,
  id_banque INT NOT NULL,
  id_conseiller_bancaire INT NOT NULL,
  PRIMARY KEY (id_compte),
  FOREIGN KEY (id_client) REFERENCES Clients (id_client),
  FOREIGN KEY (id_banque) REFERENCES Banque (id_banque),
  FOREIGN KEY (id_conseiller_bancaire) REFERENCES Conseiller_bancaire (id_conseiller_bancaire)
);

CREATE TABLE Banque (
  id_banque INT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(255) NOT NULL,
  pays VARCHAR(255) NOT NULL,
  ville VARCHAR(255) NOT NULL,
  adresse VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_banque)
);

CREATE TABLE Agence (
  id_agence INT NOT NULL AUTO_INCREMENT,
  nom_agence VARCHAR(255) NOT NULL,
  ville VARCHAR(255) NOT NULL,
  adresse VARCHAR(255) NOT NULL,
  id_banque INT NOT NULL,
  PRIMARY KEY (id_agence),
  FOREIGN KEY (id_banque) REFERENCES Banque (id_banque)
);

CREATE TABLE Conseiller_bancaire (
  id_conseiller_bancaire INT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(255) NOT NULL,
  prenom VARCHAR(255) NOT NULL,
  specialiste VARCHAR(255) NOT NULL,
  id_agence INT NOT NULL,
  PRIMARY KEY (id_conseiller_bancaire),
  FOREIGN KEY (id_agence) REFERENCES Agence (id_agence)
);

/*Insertion : */
INSERT INTO Client (nom, prenom, tel, adresse_email) VALUES
    ("M'hamed", "EL MAJJOUTI", '0695758624', 'mhamed.mjt18@gmail.com')
    ('Doe', 'John', '123456789', 'john.doe@example.com'),
    ('Smith', 'Alice', '987654321', 'alice.smith@example.com'),
    ('Brown', 'Bob', '456789012', 'bob.brown@example.com'),
    ('White', 'Charlie', '789012345', 'charlie.white@example.com'),
    ('Johnson', 'David', '345678901', 'david.johnson@example.com'),
    ('Clark', 'Eva', '890123456', 'eva.clark@example.com'),
    ('Taylor', 'Frank', '567890123', 'frank.taylor@example.com'),
    ('Walker', 'Grace', '901234567', 'grace.walker@example.com'),
    ('King', 'Henry', '234567890', 'henry.king@example.com');


INSERT INTO Banque (nom, pays, ville, adresse) VALUES
    ('MaBanque', 'France', 'Paris', '1 Rue de la Banque');

INSERT INTO Agence (nom_agence, ville, adresse, id_banque) VALUES
    ('Agence A', 'Paris', '2 Rue de l''Agence A', 1),
    ('Agence B', 'Marseille', '3 Rue de l''Agence B', 1),
    ('Agence C', 'Lyon', '4 Rue de l''Agence C', 1),
    ('Agence D', 'Toulouse', '5 Rue de l''Agence D', 1),
    ('Agence E', 'Nice', '6 Rue de l''Agence E', 1);


INSERT INTO Conseiller_bancaire (nom, prenom, specialiste, id_agence) VALUES
    ('Conseiller A', 'Amanda', 'Epargne', 1),
    ('Conseiller B', 'Benjamin', 'Crédit', 2),
    ('Conseiller C', 'Catherine', 'Assurance', 3),
    ('Conseiller D', 'David', 'Épargne', 4),
    ('Conseiller E', 'Emma', 'Crédit', 5),
    ('Conseiller F', 'Frank', 'Assurance', 1),
    ('Conseiller G', 'Grace', 'Épargne', 2),
    ('Conseiller H', 'Henry', 'Crédit', 3),
    ('Conseiller I', 'Ivy', 'Assurance', 4);


INSERT INTO Compte (iban, type_compte, solde, id_client, id_banque, id_conseiller_bancaire) VALUES
    ('FR12345678901234567890123', 'Épargne', 1000.50, 1, 1, 1),
    ('FR23456789012345678901234', 'Crédit', 1500.75, 2, 1, 2),
    ('FR34567890123456789012345', 'Assurance', 2000.00, 3, 1, 3),
    ('FR45678901234567890123456', 'Épargne', 1200.25, 4, 1, 4),
    ('FR56789012345678901234567', 'Crédit', 800.00, 5, 1, 5),
    ('FR67890123456789012345678', 'Assurance', 2500.50, 6, 1, 1),
    ('FR78901234567890123456789', 'Épargne', 1800.75, 7, 1, 2),
    ('FR89012345678901234567890', 'Crédit', 3000.00, 8, 1, 3),
    ('FR90123456789012345678901', 'Assurance', 900.25, 9, 1, 4),
    ('FR01234567890123456789012', 'Épargne', 1600.30, 10, 1, 5);
