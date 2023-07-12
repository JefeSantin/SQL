--1.1

select nome, cpf from medicos
	where exists (
	  select * from pacientes
	  	where medicos.cpf = pacientes.cpf
	);
	
--1.2

select m.nome, m.cpf, c.data from medicos m
	join consultas c on m.codm = c.codm
		where 
			c.codp = 1
			and m.especialidade = 'ortopedia';

--1.3

select nome, cpf from medicos
	where exists (
	  select * from consultas
	 	 where medicos.codm = consultas.codm
	);

--1.4

select nome, cpf from medicos
	where exists (
  		select * from pacientes
  			where cidade = 'Florianópolis'
	)
	and not exists (
  		select * from pacientes
  			where not exists (
    			select * from consultas
    				where medicos.codm = consultas.codm
      				and pacientes.codp = consultas.codp
      				and pacientes.cidade = 'Florianópolis'
					)
					and cidade = 'Florianópolis'
					)
					and especialidade = 'ortopedia';

--2.1

select * from funcionarios
order by salario desc, idade asc
limit 3;

--2.2

select medicos.nome, ambulatorios.nroa, ambulatorios.andar
from medicos
join consultas on medicos.codm = consultas.codm
join ambulatorios on medicos.nroa = ambulatorios.nroa
order by ambulatorios.nroa;

--2.3

select data, count(*) as total_consultas
from consultas
where hora > '12:00'
group by data;

--2.4

select andar, sum(capacidade) as capacidade_total
from ambulatorios
group by andar;

--2.5

select andar
from ambulatorios
group by andar
having avg(capacidade) >= 40;

--2.6

select nome
from medicos
where codm in (
  select codm
  from consultas
  group by codm
  having count(*) > 1
);