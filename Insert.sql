insert into ambulatorios (nroa, andar, capacidade)VALUES
 (1, 1, 30);

insert into ambulatorios (nroa, andar, capacidade)VALUES
 (2, 1, 50);
 
insert into ambulatorios (nroa, andar, capacidade)VALUES
 (3, 2, 40);

insert into ambulatorios (nroa, andar, capacidade)VALUES
 (4, 2, 25);
 
insert into ambulatorios (nroa, andar, capacidade)VALUES
 (5, 2, 55);
 
select * from ambulatorios;
 
insert into medicos (codm, nome, idade, especialidade, cpf, cidade, nroa) VALUES
(1, 'Joao', 40, 'ortopedia', '1000010000', 'Florianópolis', 1);

insert into medicos (codm, nome, idade, especialidade, cpf, cidade, nroa) VALUES
(2, 'Maria', 42, 'traumatologia', '1000110000', 'Blumenau', 2);

insert into medicos (codm, nome, idade, especialidade, cpf, cidade, nroa) VALUES
(3, 'Pedro', 51, 'pediatria', '1100010000', 'São José', 2);

insert into medicos (codm, nome, idade, especialidade, cpf, cidade) VALUES
(4, 'Carlos', 28, 'ortopedia', '1100110000', 'Joinville')

insert into medicos (codm, nome, idade, especialidade, cpf, cidade, nroa) VALUES
(5, 'Marcia', 33, 'neurologia', '1100111000', 'Biguaçu', 3)
 
select * from medicos;

insert into funcionarios (codf, nome, idade, cpf, cidade, salario) VALUES
(1, 'Rita', 32, '20000010000', 'São José', 1200);

insert into funcionarios (codf, nome, idade, cpf, cidade, salario) VALUES
(2, 'Maria', 55, '30000110000', 'Palhoça', 1220);

insert into funcionarios (codf, nome, idade, cpf, cidade, salario) VALUES
(3, 'Caio', 45, '41000100000', 'Florianópolis', 1100);

insert into funcionarios (codf, nome, idade, cpf, cidade, salario) VALUES
(4, 'Carlos', 44, '51000110000', 'Florianópolis', 1200);

insert into funcionarios (codf, nome, idade, cpf, cidade, salario) VALUES
(5, 'Paula', 33, '6100011000', 'Florianópolis', 2500);

select * from funcionarios;

insert into pacientes (codp, nome, idade, cidade, cpf, doenca) VALUES
(1, 'Ana', 20, 'Florianópolis', '2000020000', 'gripe');

insert into pacientes (codp, nome, idade, cidade, cpf, doenca) VALUES
(2, 'Paulo', 24, 'Palhoça', '2000220000', 'fratura');

insert into pacientes (codp, nome, idade, cidade, cpf, doenca) VALUES
(3, 'Lucia', 30, 'Biguaçu', '2200020000', 'tendinite');

insert into pacientes (codp, nome, idade, cidade, cpf, doenca) VALUES
(4, 'Carlos', 28, 'Joinville', '11000110000', 'sarampo');

select * from pacientes;

insert into consultas (codm, codp, data, hora)VALUES
 (1, 1, '2018-10-12', '14:00');
 
insert into consultas (codm, codp, data, hora)VALUES
 (1, 4, '2018-10-13', '10:00');
 
insert into consultas (codm, codp, data, hora)VALUES
 (2, 1, '2018-10-13', '9:00');
 
insert into consultas (codm, codp, data, hora)VALUES
 (2, 2, '2018-10-13', '11:00');
 
insert into consultas (codm, codp, data, hora)VALUES
 (2, 3, '2018-10-14', '14:00');

insert into consultas (codm, codp, data, hora)VALUES
 (2, 4, '2018-10-14', '17:00');

insert into consultas (codm, codp, data, hora)VALUES
 (3, 1, '2018-10-19', '18:00');
 
insert into consultas (codm, codp, data, hora)VALUES
 (3, 3, '2018-10-12', '10:00');

insert into consultas (codm, codp, data, hora)VALUES
 (3, 4, '2018-10-19', '13:00');

insert into consultas (codm, codp, data, hora)VALUES
 (4, 4, '2018-10-20', '13:00');
 
insert into consultas (codm, codp, data, hora)VALUES
 (4, 4, '2018-10-22', '19:30');
 
select * from consultas;

-- Parte dois dos Exercícios --

UPDATE pacientes
SET cidade = 'Ilhota'
WHERE nome = 'Paulo';

UPDATE consultas
SET hora = '12:00', data = '2018-11-04'
WHERE codm = 1
AND codp = 4;

select * from pacientes;

UPDATE pacientes
SET idade = 21, doenca = 'câncer'
WHERE codp = 1;

UPDATE consultas
SET hora = '14:30'
WHERE codm = 3
AND codp = 4;

DELETE FROM funcionarios
WHERE codf = 4;

SELECT * FROM funcionarios;

SELECT * FROM consultas
WHERE hora = '19:00';

DELETE FROM pacientes
WHERE doenca = 'câncer'
OR idade < 10;

SELECT * FROM pacientes;

DELETE FROM medicos
WHERE cidade = 'Biguaçu';

SELECT * FROM medicos;