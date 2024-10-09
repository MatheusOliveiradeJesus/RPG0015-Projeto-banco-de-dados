INSERT INTO Produto (nome, quantidade, precoVenda)
VALUES ('Banana', 100, 5.00);

INSERT INTO Produto (nome, quantidade, precoVenda)
VALUES ('Laranja', 500, 2.00);

INSERT INTO Produto (nome, quantidade, precoVenda)
VALUES ('Manga', 800, 4.00);

SELECT * FROM Produto;

DELETE FROM Produto;

DELETE FROM MovimentoCompra;

DELETE FROM MovimentoVenda;

DELETE FROM Produto;

SET IDENTITY_INSERT Produto ON;

INSERT INTO Produto (id, nome, quantidade, precoVenda)
VALUES (1, 'Banana', 100, 5.00);

INSERT INTO Produto (id, nome, quantidade, precoVenda)
VALUES (2, 'Laranja', 500, 2.00);

INSERT INTO Produto (id, nome, quantidade, precoVenda)
VALUES (3, 'Manga', 800, 4.00);

SET IDENTITY_INSERT Produto OFF;

SELECT * FROM Produto;



