use bancoaula03;

# 1. Listar nomes das Clinicas que tem especialidade
select c.nome from clinica c where c.cod in (select ec.clinica_cod from especialidadeclinica ec);
select c.nome from clinica c where exists (select * from especialidadeclinica ec where ec.clinica_cod = c.cod);

# 2. Listar nomes dos médicos que não tem consulta
select m.nome from medico m where m.cod not in (select c.medico_cod from consulta c);
select m.nome from medico m where not exists (select * from consulta c where m.cod = c.medico_cod);

# 3. Listar nomes dos médicos que atendem na Clinica ortocentro
select m.nome from medico m where m.cod in (select mc.medico_cod from medicoclinica mc where mc.clinica_cod in (select c.cod from clinica c where c.nome = "ortocentro"));
select m.nome from medico m where exists (select * from medicoclinica mc where exists (select * from clinica c where c.cod = mc.clinica_cod and mc.medico_cod = m.cod and c.nome = "ortocentro"));

# 4. Crie a tabela Folha_pagto e insira os dados:
CREATE TABLE Folha_Pagto ( medico_cod int, consulta_cod int, valor float,
primary key(medico_cod, consulta_cod),
foreign key (medico_cod) references Medico(cod),
foreign key (consulta_cod) references Consulta(cod));

INSERT INTO Folha_Pagto VALUES (1,6,100), (1,2,150),(2,3,100), (2, 4, 150), (3,5,50);

# 5. Listar nomes dos médicos que recebem valor da consulta maior que a média
select m.nome from medico m where m.cod in (select fp.medico_cod from folha_pagto fp where fp.valor > (select avg(fp.valor) from folha_pagto fp));
select m.nome from medico m where exists (select * from folha_pagto fp where fp.valor > (select avg(fp.valor) from folha_pagto fp) and m.cod = fp.medico_cod); 

# 6. Listar nome dos médidos que não estão na folha de pagto
select m.nome from medico m where m.cod not in (select fp.medico_cod from folha_pagto fp);
select m.nome from medico m where not exists (select * from folha_pagto fp where m.cod = fp.medico_cod);

# 7. Não usar subconsulta: Listar nome dos médicos e para aqueles que estão na folha de pagto, listar a média de salário
select m.nome, avg(fp.valor) from medico m left join folha_pagto fp on (m.cod = fp.medico_cod) group by m.nome;
