use bancoaula03;

# 1.  Recuperar nome dos médicos que atendem na Clínica Bem Estar
select m.nome, c.nome from medico m join medicoclinica mc on (m.cod = mc.medico_cod) join clinica c on (c.cod = mc.clinica_cod) where c.nome = "clínica bem estar";

# 2.  Exiba o nome e endereço das clínicas onde o médico André trabalha
select m.nome, c.nome, c.endereco from medico m join medicoclinica mc on (m.cod = mc.medico_cod) join clinica c on (c.cod = mc.clinica_cod) where m.nome = "Andre";

# 3.  Insira 2 clinicas, apenas na tabela Clínica
insert into clinica values (11, "Clinica Geral", "Centro");
insert into clinica values (12, "Clinica do Coração", "Centro");

# 4.  Insira 2 médicos, apenas na tabela Medico
insert into medico values (11, "Ana", "2020-2020");
insert into medico values (12, "Ricardo", "3030-3030");

# 5.  Liste o Nome das Clinicas e suas especialidades
select c.nome, e.nome from clinica c join especialidadeclinica ec on (c.cod = ec.clinica_cod) join especialidade e on (e.cod = ec.especialidade_cod);

# 6.  Liste o Nome de todas as clinicas e suas Especialidade.  Clinicas que não possuem especialidade devem aparecer. Ordenar o resultado pelo nome da Clinica.
select c.nome, e.nome from clinica c left join especialidadeclinica ec on (c.cod = ec.clinica_cod) left join especialidade e on (e.cod = ec.especialidade_cod) order by c.nome asc;

# 7.  Liste o nome de todos os médicos cadastrados e para aqueles que tem consulta, listar a data e hora da consulta.
select m.nome, c.data, c.hora from medico m left join consulta c on (m.cod = c.medico_cod);

# 8.  Liste para cada médico, o seu nome e a quantidade de consultas que ele possui.
select m.nome, count(c.data) from medico m join consulta c on (m.cod = c.medico_cod) group by m.nome;

# 9.  Liste para cada médico, o seu nome e a quantidade de consultas que ele  possui. Médicos que não possuem consulta também devem aparecer no resultado.
select m.nome, count(c.data) from medico m left join consulta c on (m.cod = c.medico_cod) group by m.nome;

# 10. Listar nomes dos médicos que atendem na Clinica ortocentro.
select m.nome, c.nome from medico m join medicoclinica mc on (m.cod = mc.medico_cod) join clinica c on (c.cod = mc.clinica_cod) where c.nome = "Ortocentro";