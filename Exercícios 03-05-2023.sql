-- 1
select * from ambulatorios
	where capacidade > 30;
--2	
select * from medicos
	where idade < 40 or especialidade = 'traumatologia';
--3	
select codm, codp from consultas
	where hora > '13:00' and data > '2018-10-15';
--4	
select nome from pacientes
	where cidade != 'Florianópolis';
--5	
select nome, idade*12 AS idade_meses from pacientes;
--6
SELECT MIN(salario) AS menor_salario, MAX(salario) AS maior_salario
FROM funcionarios;
--7
select (sum(idade)/count(idade)) AS media_idades, sum(nroa) AS numero_ambulatorios from medicos;
--8
select codf, nome, (salario-(salario*0.2)) AS salario_liquido from funcionarios;
--9
select nome, especialidade from medicos
	where nome like '_o%' and nome like '%o';
--10
select cpf, nome, idade from medicos union
select cpf, nome, idade from funcionarios union
select cpf, nome, idade from pacientes;