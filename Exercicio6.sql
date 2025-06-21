-- Criar tabelas
-- --CREATE TABLE  < Nome da Tabela >  [IF NOT EXISTS] (
--    < Definição de coluna > , ...
--    < Restrições de Integridade > , ...
--   );

-- =============================================================================
-- SEÇÃO DE LIMPEZA (DROP TABLES)
-- Deleta as tabelas na ordem inversa de dependência para evitar erros.
-- Usamos 'CASCADE' para remover objetos dependentes (como views ou constraints).
-- =============================================================================
DROP TABLE IF EXISTS Avaliacao CASCADE;
DROP TABLE IF EXISTS Mensagem CASCADE;
DROP TABLE IF EXISTS Aviso CASCADE;
DROP TABLE IF EXISTS MatriculaNotas CASCADE;
DROP TABLE IF EXISTS MatriculaBeneficios CASCADE;
DROP TABLE IF EXISTS Matricula CASCADE;
DROP TABLE IF EXISTS Turma CASCADE;
DROP TABLE IF EXISTS CursoRegras CASCADE;
DROP TABLE IF EXISTS CursoNecessidades CASCADE;
DROP TABLE IF EXISTS Disciplina CASCADE;
DROP TABLE IF EXISTS Curso CASCADE;
DROP TABLE IF EXISTS Aluno CASCADE;
DROP TABLE IF EXISTS Professor CASCADE;
DROP TABLE IF EXISTS Funcionario CASCADE;
DROP TABLE IF EXISTS Usuario CASCADE;
DROP TABLE IF EXISTS Departamento CASCADE;
DROP TABLE IF EXISTS Unidade CASCADE;



-- ==================================================
-- As tabelas são criadas em ordem de dependência.
-- ==================================================

-- -----------------------------------------------------
-- Tabelas de Estrutura Básica e Localização
-- -----------------------------------------------------

-- Tabela Unidade: Armazena os campi ou localidades da escola.
CREATE TABLE IF NOT EXISTS Unidade (

);

-- Tabela Departamento: Armazena os departamentos acadêmicos.
CREATE TABLE IF NOT EXISTS Departamento (

);


-- -----------------------------------------------------
-- Tabelas de Usuários (Generalização/Especialização)
-- -----------------------------------------------------

-- Tabela Usuario: Tabela base para todos os tipos de usuários.
CREATE TABLE IF NOT EXISTS Usuario (

);

-- Tabela Professor: Especialização de Usuario.
CREATE TABLE IF NOT EXISTS Professor (

);

-- Tabela Aluno: Especialização de Usuario.
CREATE TABLE IF NOT EXISTS Aluno (

);

-- Tabela Funcionario: Especialização de Usuario para a equipe administrativa.
CREATE TABLE IF NOT EXISTS Funcionario (

);


-- -----------------------------------------------------
-- Tabelas de Estrutura Acadêmica (Cursos e Disciplinas)
-- -----------------------------------------------------

-- Tabela Curso: Armazena as informações dos cursos oferecidos.
CREATE TABLE IF NOT EXISTS Curso (

);

-- Tabela CursoRegras: Atributo multivalorado da tabela Curso.
CREATE TABLE IF NOT EXISTS CursoRegras (

);

-- Tabela CursoNecessidades: Atributo multivalorado da tabela Curso.
CREATE TABLE IF NOT EXISTS CursoNecessidades (

);

-- Tabela Disciplina: Armazena as disciplinas que compõem os cursos.
CREATE TABLE IF NOT EXISTS Disciplina (

);


-- -----------------------------------------------------
-- Tabelas de Oferta Acadêmica e Matrículas
-- -----------------------------------------------------

-- Tabela Turma: Representa a oferta de uma disciplina em um período letivo.
CREATE TABLE IF NOT EXISTS Turma (

);

-- Tabela Matricula: Liga um aluno a uma turma.
CREATE TABLE IF NOT EXISTS Matricula (

);

-- Tabela MatriculaNotas: Atributo multivalorado da tabela Matricula.
CREATE TABLE IF NOT EXISTS MatriculaNotas (

);

-- Tabela MatriculaBeneficios: Atributo multivalorado da tabela Matricula (bolsas, descontos).
CREATE TABLE IF NOT EXISTS MatriculaBeneficios (

);


-- -----------------------------------------------------
-- Tabelas de Comunicação e Avaliação
-- -----------------------------------------------------

-- Tabela Avaliacao: Armazena as avaliações feitas pelos alunos sobre disciplinas/professores.
CREATE TABLE IF NOT EXISTS Avaliacao (

);

-- Tabela Mensagem: Armazena as mensagens trocadas entre usuários.
CREATE TABLE IF NOT EXISTS Mensagem (

);

-- Tabela Aviso: Armazena os avisos gerais enviados pela administração.
CREATE TABLE IF NOT EXISTS Aviso (

);
