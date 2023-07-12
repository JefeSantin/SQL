ALTER TABLE Ambulatorios
ADD CONSTRAINT chk_Ambulatorios_andar_capacidade
CHECK (andar >= 0 AND capacidade >= 1);

ALTER TABLE Medicos
ADD CONSTRAINT chk_Medicos_idade
CHECK (idade >= 16);

ALTER TABLE Pacientes
ADD CONSTRAINT chk_Pacientes_idade
CHECK (idade >= 0);

ALTER TABLE Funcionarios
ADD CONSTRAINT chk_Funcionarios_idade_salario
CHECK (idade >= 0 AND salario >= 0);

--#################################################

ALTER TABLE Medicos
ADD CONSTRAINT uk_Medicos_CPF UNIQUE (CPF);

ALTER TABLE Pacientes
ADD CONSTRAINT uk_Pacientes_CPF UNIQUE (CPF);

ALTER TABLE Funcionarios
ADD CONSTRAINT uk_Funcionarios_CPF UNIQUE (CPF);

--##################################################

CREATE OR REPLACE FUNCTION numero_par (i int)
RETURNS boolean AS $$
DECLARE
temp int;
BEGIN
temp := i % 2;
IF temp = 0 THEN RETURN true;
ELSE RETURN false;
END IF;
END;
$$ LANGUAGE plpgsql;
SELECT numero_par(3), numero_par(42);


CREATE OR REPLACE FUNCTION fatorial (i numeric)
RETURNS numeric AS $$
DECLARE
temp numeric; resultado numeric;
BEGIN
resultado := 1;
FOR temp IN 1 .. i LOOP
resultado := resultado * temp;
END LOOP;
RETURN resultado;
END;
$$ LANGUAGE plpgsql;
SELECT fatorial(42::numeric);


CREATE OR REPLACE FUNCTION fatorial (i numeric)
RETURNS numeric AS $$
DECLARE temp numeric; resultado numeric;
BEGIN
resultado := 1; temp := 1;
WHILE temp <= i LOOP
resultado := resultado * temp;
temp := temp + 1;
END LOOP;
RETURN resultado;
END;
$$ LANGUAGE plpgsql;
SELECT fatorial(42::numeric);


CREATE OR REPLACE FUNCTION recupera_funcionario(id int)
RETURNS funcionarios AS $$
DECLARE
registro RECORD;
BEGIN
EXECUTE 'SELECT * FROM funcionarios WHERE codf = ' || id INTO
registro;
RETURN registro;
END;
$$ LANGUAGE plpgsql;
SELECT * FROM recupera_funcionario(1);

SELECT * FROM Funcionarios


--##############################################################

CREATE OR REPLACE FUNCTION inserir_paciente(
  in codp_paciente int,	
  in nome_paciente varchar,
  in idade_paciente int,
  in cidade_paciente varchar,
  in cpf_paciente numeric,
  in doenca_paciente varchar
	)
 RETURNS integer AS $$
DECLARE
  novo_codp integer;
BEGIN
  INSERT INTO pacientes (codp, nome, idade, cidade, cpf, doenca)
  VALUES (codp_paciente, nome_paciente, idade_paciente, cidade_paciente, cpf_paciente, doenca_paciente)
  RETURNING codp INTO novo_codp;
  
  RETURN novo_codp;
END;
$$ LANGUAGE plpgsql;

select * from pacientes
select * from inserir_paciente(11,'Jeferson', 23, 'Chapecó',11761239988, 'gripe')



CREATE OR REPLACE FUNCTION alterar_paciente(
  codp_paciente integer,
  nome_paciente varchar,
  idade_paciente integer,
  cidade_paciente varchar,
  cpf_paciente numeric,
  doenca_paciente varchar
	)
RETURNS void AS $$
BEGIN
  UPDATE pacientes
  SET nome = nome_paciente, idade = idade_paciente, cidade = cidade_paciente,
  cpf = cpf_paciente, doenca = doenca_paciente
  WHERE codp = codp_paciente;
  
  RETURN;
END;
$$ LANGUAGE plpgsql;


select * from alterar_paciente(3,'Pedro',30,'Biguaçu',2200020000,'tendinite')
drop function alterar_paciente(integer, varchar, integer, varchar, numeric, varchar)



CREATE OR REPLACE FUNCTION excluir_paciente(codp_paciente integer) RETURNS void AS $$
BEGIN
  DELETE FROM Pacientes
  WHERE codp = codp_paciente;
  
  RETURN;
END;
$$ LANGUAGE plpgsql;

select * from excluir_paciente(11)
select* from pacientes