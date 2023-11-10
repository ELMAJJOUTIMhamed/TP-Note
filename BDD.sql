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

