create database BancoAula02;
use BancoAula02;

create table Ator(
	coda int,
	nomeart varchar(50),
	nomereal varchar(50),
	nacionalidade varchar(50),
	sexo char,
	idade int,
	indicacoesoscar int,
	oscar int,	
	
	primary key(coda)
);

create table Filme(
	codf int,
	nome varchar(50),
	ano int,
	orcamento int,
	tempo int,
	
	primary key(codf)
);

create table Personagem(
	coda int,
	codf int,
	personagem varchar(50),
	cache int,
	
	primary key(coda, codf),
	foreign key(coda) references Ator(coda),
	foreign key(codf) references Filme(codf)
);

insert into ator(coda, nomeart, nomereal, nacionalidade, sexo, idade, indicacoesoscar, oscar) values (1, "Demi Moore", "Maria da Silva", "USA", "f", 32, 0, 0),(2, "Brad Pitt", "João Paulo", "USA", "f", 28, 1, 0), (3, "Dustin Hoffman", "Dustin Hoffman", "USA", "f", 36, 2, 0), (4, "Jessica Lange", "Jessica Lange", "USA", "f", 36, 4, 2), (5, "Sonia Braga", "Sonia Braga", "Brasil", "f", 45, 0, 0);
insert into filme(codf, nome, ano, orcamento, tempo) values (1, "A Jurada", 1996, 1000000, 18), (2, "A Letra Escarlate", 1995, 10000000, 24), (3, "Seven", 1995, 1500000, 20), (4, "Tootsie", 1982, 50000, 16), (5, "Tieta", 1995, 200000, 18);
insert into personagem(coda, codf, personagem, cache) values (1, 1, "Mary", 3000), (1, 2, "Sandy", 5000), (2, 3, "John", 5000), (3, 4, "Mary", 1000), (4, 4, "Tootsie", 2000), (5, 5, "Tieta", 500);

update ator set sexo="m" where nomeart='Brad Pitt';