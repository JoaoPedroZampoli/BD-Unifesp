create database bancoaula05;
use bancoaula05;

# 1)  crie uma tabela Empregado com id, nome e salario.
create table empregado ( 
	id integer auto_increment,
	nome varchar(20),
	salario float,
	primary key(id)
);

# 2) criar uma procedure Insere10  para inserir 10 tuplas na tabela Empregado
create procedure Insere10()
begin
	declare Contador int default 1;
	while Contador <= 10 do
		insert into Empregado(nome, salario) values (concat('nome', Contador), Contador * 900);
		set Contador = Contador + 1;
	end while;
end

# 3) Criar uma procedure que retorne a quantidade de empregados inseridos na tabela Empregado
create procedure QtdEmpregados(out total int)
begin
	select count(*) into total from Empregado;
end

CALL Insere10();


call QtdEmpregados(@total);
select @total as TotalEmpregados;



