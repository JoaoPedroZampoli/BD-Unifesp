create database BancoDoTOR;

use BancoDoTOR;

create table Professor(
	IDProfessor int not null auto_increment,
	NomeProf varchar(80) not null,
	StatusProf varchar(10) not null,
	IDCapitao int,
	foreign key(IDCapitao) references Capitao(IDCapitao),
	primary key(IDProfessor)
)engine=MyISAM default charset="latin1";

create table Ano_Semestre(
	IDAnoSemestre int not null auto_increment,
	Ano year not null,
	Semestre int not null,
	primary key(IDAnoSemestre)
)engine=MyISAM default charset="latin1";

create table Monitor(
	IDMonitor int not null auto_increment,
	NomeMonitor varchar(80) not null,
	StatusMonitor varchar(10) not null,
	IDCapitao int,
	IDAnoSemestre int not null,
	primary key(IDMonitor),
	foreign key(IDCapitao) references Capitao(IDCapitao),
	foreign key(IDAnoSemestre) references Ano_Semestre(IDAnoSemestre)
)engine=MyISAM default charset="latin1";	

create table Capitao(
	IDCapitao int not null,
	StatusCapitao varchar(10) not null,
	primary key(IDCapitao),
	foreign key(IDCapitao) references Monitor(IDMonitor)
)engine=MyISAM default charset="latin1";	

create table Aluno(
	IDAluno int not null auto_increment,
	NomeAluno varchar(80) not null,
	CPFAluno varchar(11) not null,
	NumeroTelAluno varchar(11) not null,
	StatusAluno varchar(10) not null,
	IDAnoSemestre int not null,
	primary key(IDAluno),
	foreign key(IDAnoSemestre) references AnoSemestre(IDAnoSemestre)
)engine=MyISAM default charset="latin1";

create table Ensina(
	IDAluno int not null,
	IDMonitor int not null,
	primary key(IDAluno, IDMonitor),
	foreign key(IDAluno) references Aluno(IDAluno),
	foreign key(IDMonitor) references Monitor(IDMonitor)
)engine=MyISAM default charset="latin1";

create table Responsavel(
	IDResponsavel int not null auto_increment,
	NomeResponsavel varchar(80) not null,
	NumeroTelResponsavel varchar(11) not null,
	primary key(IDResponsavel)
)engine=MyISAM default charset="latin1";

create table Responsavel_Aluno(
	IDAluno int not null,
	IDResponsavel int not null,
	primary key(IDAluno,IDResponsavel),
	foreign key(IDAluno) references Aluno(IDAluno),
	foreign key(IDResponsavel) references Responsavel(IDResponsavel)
)engine=MyISAM default charset="latin1";

create table Equipe(
	IDEquipe int not null auto_increment,
	NomeEquipe varchar(80) not null,
	primary key(IDEquipe)
)engine=MyISAM default charset="latin1";

create table Projeto(
	IDProjeto int not null auto_increment,
	primary key(IDProjeto)
)engine=MyISAM default charset="latin1";

create table Projeto_Interno(
	IDProjeto int not null,
	DescricaoProjeto varchar(80) not null,
	primary key(IDProjeto),
	foreign key(IDProjeto) references Projeto(IDProjeto)
)engine=MyISAM default charset="latin1";

create table Competicao(
	IDProjeto int not null,
	NomeCompeticao varchar(80) not null,
	FaseCompeticao varchar(50) not null,
	primary key(IDProjeto),
	foreign key(IDProjeto) references Projeto(IDProjeto)
)engine=MyISAM default charset="latin1";

create table Material(
	IDMaterial int not null auto_increment,
	DescricaoMaterial varchar(80) not null,
	primary key(IDMaterial)
)engine=MyISAM default charset="latin1";

create table Robo(
	IDRobo int not null auto_increment, 
	NomeRobo varchar(80) not null,
	IDEquipe int not null,
	IDMaterial int not null, 
	IDProjeto int not null,
	primary key(IDRobo, IDMaterial, IDProjeto),
	foreign key(IDEquipe) references Equipe(IDEquipe),
	foreign key(IDMaterial) references Material(IDMaterial),
	foreign key(IDProjeto) references Projeto(IDProjeto)
)engine=MyISAM default charset="latin1";

create table Aula(
	IDAula int not null auto_increment,
	IDProjeto int not null,
	DescricaoAula varchar(80),
	primary key(IDAula, IDProjeto),
	foreign key(IDProjeto) references Projeto_Interno(IDProjeto)
)engine=MyISAM default charset="latin1";

create table Aluno_Equipe_Projeto(
	IDAluno int not null,
	IDEquipe int not null,
	IDProjeto int not null,
	primary key(IDAluno, IDEquipe, IDProjeto),
	foreign key(IDAluno) references Aluno(IDAluno),
	foreign key(IDEquipe) references Equipe(IDEquipe),
	foreign key(IDProjeto) references Projeto(IDProjeto)
)engine=MyISAM default charset="latin1";

create table Projeto_AnoSemestre(
	IDAnoSemestre int not null,
	IDProjeto int not null,
	primary key(IDAnoSemestre, IDProjeto),
	foreign key(IDAnoSemestre) references AnoSemestre(IDAnoSemestre),
	foreign key(IDProjeto) references Projeto(IDProjeto)
)engine=MyISAM default charset="latin1";