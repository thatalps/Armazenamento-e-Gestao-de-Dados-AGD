-- a)-------------------------------------------------------------------------
-- crie um procedimento que retorne o maior salario por departamento
delimiter $$
create procedure buscaMaiorSalarioPorDepartamento()
begin    
	select dept_name, Max(salary)  
	from salaries, departments, dept_emp
	where salaries.emp_no = dept_emp.emp_no and departments.dept_no=dept_emp.dept_no
	group by (dept_name);
end $$
call buscaMaiorSalarioPorDepartamento();

-- b)-------------------------------------------------------------------------
--  crie um procedimento que retorne o maior salario da empresa
delimiter $$
create procedure maiorSalario()
begin
	select MAX(salary) from salaries;
end $$

-- c)-------------------------------------------------------------------------
-- crie um procedimento que retorne nome, sobrenome, idade,
-- salario e departamento do funcionario mais antigo da empresa
delimiter $$
create procedure funcionarioMaisAntigo()
begin
declare dataNascimento date;
    DECLARE num_empregado INT;
    DECLARE primeiroNome VARCHAR(14);
    DECLARE ultimoNome VARCHAR(16);
    DECLARE dataNasc DATE;
    DECLARE idade INT;
    DECLARE salario INT;
    DECLARE nomeDept VARCHAR(40);

    -- Encontrar o número do funcionário mais antigo
    SELECT emp_no, birth_date, first_name, last_name 
    INTO num_empregado, dataNasc, primeiroNome, ultimoNome
    FROM employees
    ORDER BY hire_date ASC
    LIMIT 1;

    -- Calcular a idade do funcionário
    SET idade := TIMESTAMPDIFF(YEAR, dataNasc, CURDATE());

    -- Encontrar o salário mais recente do funcionário
    SELECT salary
    INTO salario
    FROM salaries
    WHERE emp_no = num_empregado
    ORDER BY to_date DESC
    LIMIT 1;

    -- Encontrar o departamento do funcionário
    SELECT dept_name
    INTO nomeDept
    FROM departments d
    JOIN dept_emp de ON d.dept_no = de.dept_no
    WHERE de.emp_no = num_empregado
    ORDER BY de.to_date DESC
    LIMIT 1;

    -- Retornar as informações do funcionário
    SELECT primeiroNome, 
           ultimoNome, 
           idade, 
           salario, 
           nomeDept AS departamento;
end$$
call funcionarioMaisAntigo();

-- d)-------------------------------------------------------------------------
-- crie um procedimento que retorne nome, sobrenome, idade,
-- salario e departamento do funcionario mais novo da empresa
delimiter $$
create procedure funcionarioMaisNovo()
begin
declare dataNascimento date;
    DECLARE num_empregado INT;
    DECLARE primeiroNome VARCHAR(14);
    DECLARE ultimoNome VARCHAR(16);
    DECLARE dataNasc DATE;
    DECLARE idade INT;
    DECLARE salario INT;
    DECLARE nomeDept VARCHAR(40);

    -- Encontrar o número do funcionário mais antigo
    SELECT emp_no, birth_date, first_name, last_name 
    INTO num_empregado, dataNasc, primeiroNome, ultimoNome
    FROM employees
    ORDER BY hire_date DESC
    LIMIT 1;

    -- Calcular a idade do funcionário
    SET idade := TIMESTAMPDIFF(YEAR, dataNasc, CURDATE());

    -- Encontrar o salário mais recente do funcionário
    SELECT salary
    INTO salario
    FROM salaries
    WHERE emp_no = num_empregado
    ORDER BY to_date DESC
    LIMIT 1;

    -- Encontrar o departamento do funcionário
    SELECT dept_name
    INTO nomeDept
    FROM departments d
    JOIN dept_emp de ON d.dept_no = de.dept_no
    WHERE de.emp_no = num_empregado
    ORDER BY de.to_date DESC
    LIMIT 1;

    -- Retornar as informações do funcionário
    SELECT primeiroNome, 
           ultimoNome, 
           idade, 
           salario, 
           nomeDept AS departamento;
end$$
call funcionarioMaisNovo();

-- e)-------------------------------------------------------------------------
-- crie um procedimento que mostre todos os departamentos e seus gerentes
delimiter $$
create procedure gerentesDeDepartamentos()
begin
	SELECT d.dept_name AS nomeDepartamento, 
           e.first_name AS gerente, 
           e.last_name AS sobrenome
    FROM departments d
    JOIN dept_manager dm ON d.dept_no = dm.dept_no
    JOIN employees e ON dm.emp_no = e.emp_no; 
end$$
call gerentesDeDepartamentos();

-- f)-------------------------------------------------------------------------
-- crie um procedimento que filtre todos os funcionarios de acordo com o sexo/genero
delimiter $$
CREATE PROCEDURE buscarEmpregadoPorGenero(genero char(2))
BEGIN
    SELECT emp_no, first_name, last_name, birth_date, hire_date
    FROM employees
    WHERE gender = genero;
END $$
call buscarEmpregadoPorGenero('M');
call buscarEmpregadoPorGenero('F');

-- g)-------------------------------------------------------------------------
-- crie um procedimento que conte a quantidade de funcionarios do genero masculino e feminino
delimiter $$
create procedure quantFuncionariosPorGenero()
begin
 SELECT gender,
           COUNT(*) AS quantidade_total
    FROM employees
    GROUP BY gender;
end$$
call quantFuncionariosPorGenero();

-- h)-------------------------------------------------------------------------
-- crie um procedimento que exiba e retorne o titulo com maior numero de funcionarios
delimiter $$
create procedure tituloComMaisFuncionarios()
begin 
   SELECT title, COUNT(emp_no) AS quant_funcionarios
    FROM titles
    GROUP BY title
    LIMIT 1;
end $$
call tituloComMaisFuncionarios()

-- i)-------------------------------------------------------------------------
-- crie um procedimento que retorne todos os funcionarios de um determinado titulo
delimiter $$
create procedure funcionariosPorTitulo(titulo VARCHAR(50))
begin
   SELECT e.emp_no, e.first_name, e.last_name, e.birth_date, e.hire_date
    FROM employees e
    JOIN titles t ON e.emp_no = t.emp_no
    WHERE t.title = titulo;
end $$

-- j)-------------------------------------------------------------------------
-- crie um procedimento que filtre funcionarios por titulo e departamento
delimiter $$
create procedure filtraPorTituloEdepartamento(titulo varchar(50), departamento varchar(50))
begin
	SELECT e.emp_no, e.first_name, e.last_name, e.birth_date, e.hire_date, dept_no
    FROM employees e
    JOIN titles t ON e.emp_no = t.emp_no
    JOIN dept_emp de ON e.emp_no = de.emp_no
    join departments dp on dp.dept_no=de.dept_no
    WHERE t.title = titulo AND dp.dept_name = departamento;
end $$
call filtraPorTituloEdepartamento('Staff', 'Sales');
drop procedure filtraPorTituloEdepartamento
-- ---------------------------------------------------------------------
select * from departments
select * from salaries
select * from titles
select * from dept_emp
select * from dept_manager
select count(*) from employees