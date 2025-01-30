use bancoaula03;

select m.nome, c.nome from medico m join medicoclinica mc on (m.cod = mc.medico_cod) join clinica c on (mc.clinica_cod = c.cod);

select m.nome, c.nome from medico m left join medicoclinica mc on (m.cod = mc.medico_cod) left join clinica c on (mc.clinica_cod = c.cod);

select m.nome, c.nome from medico m right join medicoclinica mc on (m.cod = mc.medico_cod) right join clinica c on (mc.clinica_cod = c.cod);

