use bancoaula04

# Crie visões para cada uma das consultas abaixo:
# 1) Selecionar o nome dos pilotos e nome dos circuitos que eles participaram
create view PilotosEPistas as select p.nomepil, c.nomecir from piloto p join pospilotoprova ppp on (p.codpil = ppp.codpil) join circuito c on (c.codcirc = ppp.codcirc) group by p.nomepil;

# 2) Selecionar o nome de todos os pilotos do banco de dados e para aqueles que participaram de prova, listar a data da prova, duração e posição do piloto na prova.
create view PilotosEProvas as select distinct p.nomepil, ppp.`data`, ppp.posicao, p2.duracao from piloto p left join pospilotoprova ppp on (p.codpil = ppp.codpil) left join prova p2 on (p2.codcirc = ppp.codcirc);

# 3) Selecionar o nome do piloto, seu país de origem, nome da equipe e país da equipe. 
create view PilotosEEquipes as select piloto.nomepil, paispiloto.nomepais as PaisPiloto, equipe.nomeeq, paisequipe.nomepais as PaisEquipe from piloto, equipe, pais paispiloto, pais paisequipe where piloto.codpais = paispiloto.codpais and piloto.codeq = equipe.codeq and equipe.codpais = paisequipe.codpais;

# 4) Listar o nome das equipes que não possuem piloto
create view EquipesSemPilotos as select e.nomeeq from equipe e where e.codeq not in (select p.codeq from piloto p);


# Usando a visões criadas, selecione:
# 1) Para cada nome de piloto, indique quantos circuitos eles participaram
select nomepil, count(nomecir) from pilotosepistas p group by nomepil;

# 2) Listar o nome do piloto e o nome da sua equipe
select nomepil, nomeeq from pilotoseequipes p 

# 3) Listar os pilotos que são do mesmo país que a sua equipe 
select * from pilotoseequipes p where PaisPiloto <> PaisEquipe 

# 4)  Inserir um novo piloto na tabela piloto 
insert into piloto values(8, "Lando Norris", 2, 3);

# 5)  Execute um select * from ….  na view criada na questão 3) e diga o que ocorreu.
select * from pilotoseequipes p; # Apareceram todos os pilotos, incluindo Lewis Hamilton e Lando Norris, ambos são e possuem suas equipes situadas na inglaterra

# 6) É possível fazer um comando Insert ou Delete em uma View? Explique.
# É possível, no entanto, a view deve ser baseada em apenas uma tabela, não pode conter clásulas ou funções agregadas e a view deve ter todas as colunas não nulas (o que faz perder um pouco da praticidade da view)

