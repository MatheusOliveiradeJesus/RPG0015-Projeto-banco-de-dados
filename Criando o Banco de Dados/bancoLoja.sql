
IF OBJECT_ID('dbo.MovimentoVenda', 'U') IS NOT NULL
    DROP TABLE dbo.MovimentoVenda;

IF OBJECT_ID('dbo.MovimentoCompra', 'U') IS NOT NULL
    DROP TABLE dbo.MovimentoCompra;

IF OBJECT_ID('dbo.PessoaJuridica', 'U') IS NOT NULL
    DROP TABLE dbo.PessoaJuridica;

IF OBJECT_ID('dbo.PessoaFisica', 'U') IS NOT NULL
    DROP TABLE dbo.PessoaFisica;

IF OBJECT_ID('dbo.Produto', 'U') IS NOT NULL
    DROP TABLE dbo.Produto;

IF OBJECT_ID('dbo.Pessoa', 'U') IS NOT NULL
    DROP TABLE dbo.Pessoa;

IF OBJECT_ID('dbo.Usuarios', 'U') IS NOT NULL
    DROP TABLE dbo.Usuarios;


CREATE TABLE Usuarios (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL
);


CREATE TABLE Pessoa (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(20)
);


CREATE TABLE PessoaFisica (
    id INT PRIMARY KEY FOREIGN KEY REFERENCES Pessoa(id),
    cpf VARCHAR(11) NOT NULL
);


CREATE TABLE PessoaJuridica (
    id INT PRIMARY KEY FOREIGN KEY REFERENCES Pessoa(id),
    cnpj VARCHAR(14) NOT NULL
);


CREATE TABLE Produto (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    precoVenda DECIMAL(10, 2) NOT NULL
);


CREATE TABLE MovimentoCompra (
    id INT PRIMARY KEY IDENTITY(1,1),
    idProduto INT FOREIGN KEY REFERENCES Produto(id),
    idPessoaJuridica INT FOREIGN KEY REFERENCES PessoaJuridica(id),
    quantidade INT NOT NULL,
    precoUnitario DECIMAL(10, 2) NOT NULL,
    dataMovimento DATE NOT NULL,
    idUsuario INT FOREIGN KEY REFERENCES Usuarios(id)
);


CREATE TABLE MovimentoVenda (
    id INT PRIMARY KEY IDENTITY(1,1),
    idProduto INT FOREIGN KEY REFERENCES Produto(id),
    idPessoaFisica INT FOREIGN KEY REFERENCES PessoaFisica(id),
    quantidade INT NOT NULL,
    precoUnitario DECIMAL(10, 2) NOT NULL,
    dataMovimento DATE NOT NULL,
    idUsuario INT FOREIGN KEY REFERENCES Usuarios(id)
);


IF OBJECT_ID('dbo.PessoaSeq', 'SO') IS NOT NULL
    DROP SEQUENCE dbo.PessoaSeq;

CREATE SEQUENCE dbo.PessoaSeq
AS INT
START WITH 1
INCREMENT BY 1;
