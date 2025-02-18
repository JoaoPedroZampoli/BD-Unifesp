-- Consultas -- 

-- Consultas Básicas -- 
-- 1. Selecione o nome dos monitores que são ou já foram capitães do TOR, indicando o status atuais deles.
SELECT m.NomeMonitor, c.StatusCapitao  
FROM Monitor m, Capitao c
WHERE m.IDMonitor = c.IDCapitao;  

-- 2. Selecione os alunos que participaram do TOR no semestre 2024/2, indicando o nome do aluno e o seu status.
SELECT a.NomeAluno, a.StatusAluno
FROM Aluno a JOIN Ano_Semestre as ON (a.IDAnoSemestre = as.IDAnoSemestre AND as.Ano = 2024 AND as.Semestre = 2);

-- 3. Retorne o nome do robô, o nome da equipe que o construiu e o nome da competição em que ele participou.
SELECT r.NomeRobo, e.NomeEquipe, c.NomeCompeticao
FROM Robo r JOIN Equipe e ON (r.IDEquipe = e.IDEquipe) JOIN Competicao c ON (r.IDProjeto = c.IDProjeto);

-- 4. Retorne o nome dos alunos e o CPF dos alunos, nos quais os responsáveis tenham um número de telefone que termine com 9.
SELECT a.NomeAluno, a.CPFAluno
FROM Aluno a JOIN Responsavel_Aluno ra ON (a.IDAluno = ra.IDAluno) JOIN Responsavel r ON (ra.IDResponsavel = r.IDResponsavel)            
WHERE r.NumeroTelResponsavel LIKE '%9';

-- 5. Indique o nome dos capitães, seguidos de seus status, e o nome de seus professores orientadores, com seus status.
SELECT m.NomeMonitor, c.StatusCapitao, p.NomeProf, p.StatusProf
FROM Capitao c, Professor p, Monitor m
WHERE c.IDCapitao = m.IDMonitor AND c.IDProf = p.IDProf;


-- Consultas com LEFT JOIN --
-- 1. Mostrar o nome dos robôs que participam de competições, indicando o nome da equipe e o nome da competição. Robôs que nao participaram de competições devem aparecer.
SELECT r.NomeRobo, e.NomeEquipe, c.NomeCompeticao
FROM Robo r LEFT JOIN Equipe e ON (r.IDEquipe = e.IDEquipe) LEFT JOIN Competicao c ON (r.IDProjeto = c.IDProjeto);


-- 2. Retorne o ID e a descrição dos projetos internos que são aulas, mostrando também a descrição da aula. Projetos internos que não são aulas devem aparecer.
SELECT pi.IDProjeto, pi.DescricaoProjeto, a.DescricaoAula
FROM Projeto_Interno pi LEFT JOIN Aula a ON (pi.IDProjeto = a.IDProjeto);

-- Consultas Agregadas --
-- 1. Obter o nome dos capitães na ordem decrescente e o número de monitores que cada capitão liderou, apenas para os que lideraram mais de 2 alunos.