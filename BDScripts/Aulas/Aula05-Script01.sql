use bancoaula03

# 1. Para cada médico contar em quantas clinicas eles atendem. Resposta ordenada em ordem alfabética:
select m.nome, count(*) as QtdClinicas from medico m, clinica c, medicoclinica mc where m.cod = mc.medico_cod and c.cod = mc.clinica_cod group by m.nome order by m.nome asc;

# 2. Listar o nome dos médicos que tem 2 especialidades:
select m.nome, count(*) as DuasEspecialidades from medico m, especialidade e, medicoespecialidade me where m.cod = me.medico_cod and e.cod = me.especialidade_cod group by e.cod having DuasEspecialidades = 2; 

# 3. Listar o menor e maior horário de cada data de consulta:
select c.`data`, min(c.hora), max(c.hora) from consulta c group by c.`data`;

# 4. Para cada clinica, listar o nome das suas especialidades, ordenado pelo nome da clinica:
select c.nome, e.nome from clinica c, especialidade e, especialidadeclinica ec where c.cod = ec.especialidade_cod and e.cod = ec.especialidade_cod group by e.nome order by c.nome asc;

# 5. Para cada clínica, listar quantas especialidades ela atende:
select c.nome, count(e.nome) from clinica c, especialidade e, especialidadeclinica ec where c.cod = ec.especialidade_cod and e.cod = ec.especialidade_cod group by e.nome order by c.nome asc;

# 6. Selecionar o nome da Clinica em que a media de horario das consultas é maior que 20:
select c.nome from clinica c, consulta co where c.cod = co.clinica_cod group by c.nome having avg(co.hora) > 200000;

# 7. Listar o nome dos medicos que realizaram mais de 3 consultas:
select m.nome from medico m, consulta c where m.cod = c.medico_cod group by m.cod having count(*) > 3;

# 8. Listar o número total de consultas realizadas por cada clínica:
select c.nome, count(*) as NumeroConsultas from clinica c, consulta co where c.cod = co.clinica_cod group by c.nome;


# Desconsiderar, exercício antes da mudança:
# Simplificado: select min(c.hora), max(c.hora) from consulta c
# select * from consulta c where c.hora = (select min(c.hora) from consulta c) or c.hora = (select max(c.hora) from consulta c);