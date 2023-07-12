--1.1

select nome, cpf from medicos 
	where cpf in(
		select cpf from pacientes);

--1.2

select codp, nome from pacientes
	where codp in (
	  select codp from consultas
	  	where hora > '14:00'
	);

--1.3

select nome, idade from medicos
	where codm in(
	  select codm from consultas
	  	where codp in(
			select codp from pacientes
				where nome ='Ana')
	);

--1.4

select nroa, andar from ambulatorios
	where nroa not in(
	  select nroa from medicos
	);

--2.1

select nroa, andar from ambulatorios
	where capacidade > any (
	  select capacidade from ambulatorios
	);

--2.2

select nome, idade from medicos
	where idade <= all (
	  select idade from medicos
	);
	
--2.3

select nome, cpf from pacientes
	where exists (
	  select * from consultas
	  where pacientes.codp = consultas.codp
		and consultas.hora < all (
		  select hora from consultas
		 	where data = '2016-10-14'
		)
	);

--2.4

select nome, cpf from medicos
	where not exists (
	  select * from ambulatorios
		  where andar = 2
			and capacidade < all (
			  select capacidade from ambulatorios
				  where andar = 2
				)
			and ambulatorios.nroa in (
			  select nroa from consultas
			  	where consultas.codm = medicos.codm
				)
		);