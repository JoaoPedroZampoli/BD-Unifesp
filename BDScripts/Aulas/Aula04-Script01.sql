create database bancoaula03;
use bancoaula03;

CREATE TABLE Medico (cod integer, nome varchar(20), telefone varchar(15),
PRiMARY KEY(cod)) Engine=INNODB;

CREATE TABLE Especialidade(cod integer, nome varchar(20),
PRiMARY KEY(cod)) Engine=INNODB;

CREATE TABLE Clinica (cod integer, nome varchar(50), endereco varchar(15),
PRiMARY KEY(cod)) Engine=INNODB;

CREATE TABLE Consulta(cod integer, data date, hora time, especialidade_cod integer, medico_cod integer, clinica_cod integer,
PRiMARY KEY(cod),
FOREIGN KEY(especialidade_cod) REFERENCES Especialidade(cod),
FOREIGN KEY(medico_cod) REFERENCES Medico(cod),
FOREIGN KEY(clinica_cod) REFERENCES Clinica(cod)
) Engine=INNODB;



INSERT INTO Medico VALUES (1,'Andre', '1111-1111');
INSERT INTO Medico VALUES (2,'Arthur', '2222-2222');
INSERT INTO Medico VALUES (3, 'Marcia', '3333-3333');
INSERT INTO Medico VALUES (4, 'Jessica', '4444-4444' );
INSERT INTO Medico VALUES (5, 'Leonardo', '5555-5555');
INSERT INTO Medico VALUES (6, 'Paulo', '6666-6666');
INSERT INTO Medico VALUES (7, 'Joao', '7777-7777');
INSERT INTO Medico VALUES (8, 'Soraia', '8888-8888');
INSERT INTO Medico VALUES  (9, 'Elaine', '9999-9999');
INSERT INTO Medico VALUES (10, 'Jose Maria', '1010-1010');


INSERT INTO Especialidade VALUES (1, 'OTORRINOLARINGOLOGIA');
INSERT INTO Especialidade VALUES (2, 'PEDIATRIA');
INSERT INTO Especialidade VALUES (3, 'GINECOLOGIA');
INSERT INTO Especialidade VALUES (4, 'CARDIOLOGIA');
INSERT INTO Especialidade VALUES (5, 'UROLOGIA');
INSERT INTO Especialidade VALUES (6, 'DERMATOLOGIA');
INSERT INTO Especialidade VALUES (7, 'OFTALMOLOGIA');
INSERT INTO Especialidade VALUES (8, 'GERiATRIA');
INSERT INTO Especialidade VALUES (9, 'ORTOPEDIA');
INSERT INTO Especialidade VALUES (10,'CLINICO GERAL');


INSERT INTO Clinica VALUES (1, 'centro de otorrino', 'Centro');
INSERT INTO Clinica VALUES (2, 'clinica pediatrica', 'barro preto');
INSERT INTO Clinica VALUES (3, 'clinica papa nicolau',  'barro preto');
INSERT INTO Clinica VALUES (4, 'clinica sagrado coraçao de jesus', 'sagrada familia');
INSERT INTO Clinica VALUES (5, 'clinica urológica', 'sagrada familia');
INSERT INTO Clinica VALUES (6, 'clinica dermatológica flor da pele',  'funcionarios');
INSERT INTO Clinica VALUES (7, 'ortocentro', 'padre eustaquio');
INSERT INTO Clinica VALUES (8, 'clinica bem estar', 'mangabeiras');
INSERT INTO Clinica VALUES(9, 'clinica oftalmológica', 'santa efigenia');
INSERT INTO Clinica VALUES(10, 'centro de geriatria', 'centro' );


INSERT INTO Consulta VALUES (1, '2010-05-06', '2010-05-06 13:00:00.0', 4, 1, 4);
INSERT INTO Consulta VALUES (2, '2010-05-06', '2010-05-06 15:00:00.0', 8, 1, 10 );
INSERT INTO Consulta VALUES (3, '2010-06-09', '2010-06-09 13:00:00.0', 2, 2, 2 );
INSERT INTO Consulta VALUES (4, '2010-06-09', '2010-06-09 09:30:00.0', 10, 2, 8 );
INSERT INTO Consulta VALUES (5, '2010-03-30', '2010-03-30 10:00:00.0', 1, 3, 1 );
INSERT INTO Consulta VALUES (6, '2010-03-30', '2010-03-30 21:30:00.0', 3, 4, 3 );
INSERT INTO Consulta VALUES (7, '2010-03-15', '2010-03-15 15:00:00.0', 5, 5, 5 );
INSERT INTO Consulta VALUES (8, '2010-03-21', '2010-03-21 18:00:00.0', 7, 6, 9 );
INSERT INTO Consulta VALUES(9, '2010-03-20', '2010-03-20 22:00:00.0', 9, 7, 7 );
INSERT INTO Consulta VALUES (10, '2010-03-20', '2010-03-20 22:00:00.0', 6, 8, 6 );
INSERT INTO Consulta VALUES (11,'2010-03-14', '2010-03-14 13:00:00.0', 10, 9, 8 );
INSERT INTO Consulta VALUES (12, '2010-03-30', '2010-03-30 09:00:00.0', 4, 10, 4 );


CREATE TABLE MedicoEspecialidade(            
medico_cod integer,        
especialidade_cod integer, 
PRIMARY KEY (medico_cod,especialidade_cod),          
FOREIGN KEY (medico_cod) REFERENCES Medico(cod),             
FOREIGN KEY (especialidade_cod) REFERENCES Especialidade(cod))Engine=INNODB;

CREATE TABLE EspecialidadeClinica(
especialidade_cod integer,
clinica_cod integer,
PRIMARY KEY  (especialidade_cod, clinica_cod),
FOREIGN KEY (especialidade_cod)  REFERENCES Especialidade(cod),
FOREIGN KEY (clinica_cod) REFERENCES Clinica(cod))Engine=INNODB;
             

CREATE TABLE MedicoClinica(
medico_cod integer,
clinica_cod integer,
PRIMARY KEY  (medico_cod, clinica_cod),
FOREIGN KEY   (medico_cod) REFERENCES  Medico(cod),
FOREIGN KEY (clinica_cod) REFERENCES Clinica(cod) )Engine=INNODB;


INSERT INTO MedicoEspecialidade VALUES (1,4 );
INSERT INTO MedicoEspecialidade VALUES (1, 8);
INSERT INTO MedicoEspecialidade VALUES (2, 2);
INSERT INTO MedicoEspecialidade VALUES (2, 10);
INSERT INTO MedicoEspecialidade VALUES (3, 1);
INSERT INTO MedicoEspecialidade VALUES (4, 3);
INSERT INTO MedicoEspecialidade VALUES (5, 5);
INSERT INTO MedicoEspecialidade VALUES (6, 7);
INSERT INTO MedicoEspecialidade VALUES (7, 9);
INSERT INTO MedicoEspecialidade VALUES (8, 6);
INSERT INTO MedicoEspecialidade VALUES (9,10);
INSERT INTO MedicoEspecialidade VALUES (10, 4);


INSERT INTO EspecialidadeClinica VALUES (1, 1);
INSERT INTO EspecialidadeClinica VALUES (2, 2);
INSERT INTO EspecialidadeClinica VALUES (3, 3);
INSERT INTO EspecialidadeClinica VALUES (4, 4);
INSERT INTO EspecialidadeClinica VALUES (5, 5);
INSERT INTO EspecialidadeClinica VALUES (6, 6);
INSERT INTO EspecialidadeClinica VALUES (7, 9);
INSERT INTO EspecialidadeClinica VALUES (8, 10);
INSERT INTO EspecialidadeClinica VALUES (9, 7);
INSERT INTO EspecialidadeClinica VALUES (10,8);


INSERT INTO MedicoClinica VALUES (1,4);
INSERT INTO MedicoClinica VALUES (1, 10);
INSERT INTO MedicoClinica VALUES (2, 2);
INSERT INTO MedicoClinica VALUES (2, 8);
INSERT INTO MedicoClinica VALUES (3, 1);
INSERT INTO MedicoClinica VALUES (4, 3);
INSERT INTO MedicoClinica VALUES (5, 5);
INSERT INTO MedicoClinica VALUES (6, 9);
INSERT INTO MedicoClinica VALUES (7, 7);
INSERT INTO MedicoClinica VALUES (8, 6);
INSERT INTO MedicoClinica VALUES (9, 8);
INSERT INTO MedicoClinica VALUES (10, 4);

