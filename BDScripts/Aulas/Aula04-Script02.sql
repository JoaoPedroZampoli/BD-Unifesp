use bancoaula03;

# 1. Listar as clinicas que o medico Arthur atende:
select c.cod, c.nome, c.endereco, m.nome from medico m, clinica c, medicoclinica mc where m.nome = "Arthur" and m.cod = mc.medico_cod and c.cod = mc.clinica_cod;

# 2. Selecionar o nome das Clinicas que atendem a especialidade ortopedia:
select c.nome from especialidade e, clinica c, especialidadeclinica ec where e.cod = ec.especialidade_cod and c.cod = ec.clinica_cod and e.nome = 'ORTOPEDIA';

# 3. Buscar as especialidades do médico Andre
select m.nome, e.nome from medico m, especialidade e, medicoespecialidade me where m.cod = me.medico_cod and e.cod = me.especialidade_cod and m.nome = "Andre";

# 4.  Retornar o nome dos  médicos que tem  consulta e a data das consultas 
select m.nome, c.`data`, c.hora  from medico m, consulta c where m.cod = c.medico_cod; #Hora só foi colocada para verificar que há médicos com dois horários marcados no mesmo dia

# 5. Listar o nome de todos os médicos em ordem alfabetica
select m.nome from medico m order by m.nome asc;