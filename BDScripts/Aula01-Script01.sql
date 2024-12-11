/*Criação de novo banco de dados*/
create database JoaoPZampoli;
use JoaoPZampoli;

create table Fornecedor(
	fcod int,
	fone int,
	status int,
	cidade varchar(20),
	PRIMARY KEY(fcod)
)

create table Peca(
	pcod int not null,
	pnome varchar(50) not null,
	cor varchar(50) not null,
	peso float not null,
	cidade varchar(50) not null,
	PRIMARY KEY(pcod)
)

create table Projeto(
	prcod int,
	prnome varchar(50),
	cidade varchar(50),
	PRIMARY KEY(prcod)
)

create table Fornecimento(
	fcod int,
	pcod int,
	prcod int,
	quantidade int,
	
	PRIMARY KEY(fcod, pcod, prcod),
	FOREIGN KEY(fcod) REFERENCES Fornecedor(fcod),
	FOREIGN KEY(pcod) REFERENCES Peca(pcod),
	FOREIGN KEY(prcod) REFERENCES Projeto(prcod) ON DELETE CASCADE
)

ALTER TABLE Projeto
ADD horas INT;

ALTER TABLE Peca
DROP COLUMN cidade;