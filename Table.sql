CREATE TABLE IF NOT EXISTS Wirecard_client_id (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Wirecard_Buyer (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    buyer_name VARCHAR(255) NOT NULL,
    buyer_email VARCHAR(255) NOT NULL,
    buyer_CPF VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Wirecard_CredidCard (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    card_name VARCHAR(255) NOT NULl,
    card_number BIGINT NOT NULL,
    card_expiration VARCHAR(255) NOT NULL,
    card_CVV INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Wirecard_Payment_Boleto (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    amount INT NOT NULL,
    type Enum ('BOLETO') NOT NULL,
    status ENUM('CONCLUED','PENDENT','EXPIRED') DEFAULT ('PENDENT'),
    number VARCHAR(255) NOT NULL,
    clientId VARCHAR(255) NOT NULL,
    buyerId VARCHAR(255) NOT NULL,
    FOREIGN KEY(clientId) REFERENCES Wirecard_client_id(id),
    FOREIGN KEY(buyerId) REFERENCES Wirecard_Buyer(id)
);

CREATE TABLE IF NOT EXISTS Wirecard_Payment_CreditCard (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    amount INT NOT NULL,
    type Enum ('CREDITCARD') NOT NULL,
    status ENUM('CONCLUED','PENDENT','REFUSED','REVERSED') DEFAULT ('PENDENT'),
    clientId VARCHAR(255) NOT NULL,
    buyerId VARCHAR(255) NOT NULL,
    creditCard VARCHAR(255) NOT NULL,
    FOREIGN KEY(clientId) REFERENCES Wirecard_client_id(id),
    FOREIGN key(buyerId) REFERENCES Wirecard_Buyer(id),
    FOREIGN key(creditCard) REFERENCES Wirecard_CredidCard(id)
);

INSERT INTO Wirecard_client_id (id,name) values('Jr3PybPdvçIZXHQ5hG3yfKdZcyEwkMÇ','Casas Bahia');
INSERT INTO Wirecard_client_id (id,name) values('a7GEsTYwhcGDcçIDo2rZHlfYxJzfIzg','Kabum');
INSERT INTO Wirecard_client_id (id,name) values('pnVLNKXOcuoltzNzKKbk3Qe8nwIkHt5','Pichau');
INSERT INTO Wirecard_client_id (id,name) values('1XT3ywI5kMwJOlkOAgsZTVxbfBOvPHy','Amazon');
INSERT INTO Wirecard_client_id (id,name) values('NNWdW246HQsp5bxU5QX7vAb1fcrT5ÇD','Aliexpress');
