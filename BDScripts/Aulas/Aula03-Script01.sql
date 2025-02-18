use bancoaula02;

-- Inicio dos selects para ver as tabelas --
select * from ator

select * from filme

select * from personagem

-- Final dos selects para ver as tabelas --

-- 1) Os dados de todas as atrizes --
select * from ator where ator.sexo = "f"

-- 2) O nome, nacionalidade e sexo dos artistas --
select nomeart, nomereal, nacionalidade, sexo from ator

-- 3) O nome e o número de oscars indicados ou recebidos --
select nomeart, indicacoesoscar, oscar  from ator

-- 4) O código dos filmes onde houve pelo menos um artista com cachê não maior que 3000 --
select f.codf from filme f, personagem p where p.cache < 3000 and f.codf = p.codf 

-- 5) O nome dos personagens desempenhados por Demi Moore --
select p.personagem from personagem p, ator a where nomeart = "Demi Moore" and a.coda = p.coda 

-- 6) O nome dos filmes desempenhados por Demi Moore --
select f.nome from filme f, personagem p, ator a where nomeart = 'Demi Moore' and a.coda = p.coda and f.codf = p.codf

-- 7) O nome artístico de todas as atrizes chamadas Jessica
select nomeart from ator where nomereal like "Jessica%"

-- 8) O nome artístico dos artistas entre 30 e 40 anos
select nomeart from ator where idade >= 30 and idade <= 40

-- 9) O nome dos artistas que tem duas indicações a mais que Oscar ganhos
select nomeart from ator where indicacoesoscar - 2 >= oscar 

-- 10) O nome de todos os artistas em ordem alfabética
select nomeart from ator order by nomeart asc

insert into ator values(6, "Keanu Reeves", "Pedro da Silva", "USA", "m", 32, 2, 1)

-- 11) A lista das atrizes por ordem de idade (iniciando pelos mais velhos), e dentro da idade, ordenada alfabeticamente
select * from ator order by idade desc, nomeart asc

-- 11 mais novo) A lista das atrizes por ordem de idade (iniciando pelos mais velhos)
select * from ator order by idade desc

