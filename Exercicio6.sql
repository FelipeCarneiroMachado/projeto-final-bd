-- ==========================================================
-- LIMPEZA DAS TABELAS (DROP em ordem reversa de dependência)
-- ==========================================================
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
DROP TABLE IF EXISTS Usuario CASCADE;
DROP TABLE IF EXISTS Departamento CASCADE;
DROP TABLE IF EXISTS Unidade CASCADE;
DROP TABLE IF EXISTS CEPs CASCADE;

-- ==========================================================
-- LIMPEZA DOS ENUMS
-- ==========================================================
DROP TYPE IF EXISTS TipoUsuario CASCADE;


-- ==========================================================
-- ENUM
-- ==========================================================

CREATE TYPE TipoUsuario AS ENUM('professor','aluno','administrativo');

-- ==========================================================
-- CRIAÇÃO DAS TABELAS
-- ==========================================================
-- ---------------------------
-- Localização e Estrutura
-- ---------------------------
CREATE TABLE IF NOT EXISTS Unidade (
    UnidadeID INT PRIMARY KEY,
    Cidade VARCHAR(30),
    Estado VARCHAR(30),
    Pais VARCHAR(30),
    Bloco VARCHAR(30),
    UNIQUE (Cidade, Estado, Pais, Bloco)
);

CREATE TABLE IF NOT EXISTS CEPs (
    CEP VARCHAR(10) PRIMARY KEY,
    Pais VARCHAR(50),
    UF VARCHAR(2),
    Cidade VARCHAR(50),
    Rua VARCHAR(100)
);

-- ---------------------------
-- Usuários
-- ---------------------------
CREATE TABLE IF NOT EXISTS Usuario (
    UsuarioID INT PRIMARY KEY,
    TipoUsuario TipoUsuario,
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Telefone VARCHAR(20),
    DataNascimento DATE,
    Numero VARCHAR(10),
    Complemento VARCHAR(50),
    CEP VARCHAR(10),
    Sexo VARCHAR(10),
    Email VARCHAR(100) UNIQUE,
    Senha VARCHAR(100),
    Especializacao VARCHAR(100),
    Titulacao VARCHAR(100),
    UnidadeID INT,
    FOREIGN KEY (UnidadeID) REFERENCES Unidade(UnidadeID),
    FOREIGN KEY (CEP) REFERENCES CEPs(CEP),
    UNIQUE (Nome, Sobrenome, Telefone)
);



-- ---------------------------
-- Departamento
-- ---------------------------
CREATE TABLE IF NOT EXISTS Departamento (
    CodigoDPT VARCHAR(3) PRIMARY KEY,
    NomeDPT VARCHAR(50),
    ProfID INT,
    FOREIGN KEY (ProfID) REFERENCES Usuario(UsuarioID)
);

-- ---------------------------
-- Cursos e Disciplinas
-- ---------------------------
CREATE TABLE IF NOT EXISTS Curso (
    CodigoCurso VARCHAR(10) PRIMARY KEY,
    Nome VARCHAR(100) UNIQUE,
    NivelEnsino VARCHAR(30),
    CargaHoraria INT,
    NumVagas INT,
    Ementa TEXT,
    SalaPadrao VARCHAR(20),
    CodigoDPT VARCHAR(3),
    FOREIGN KEY (CodigoDPT) REFERENCES Departamento(CodigoDPT)
);

CREATE TABLE IF NOT EXISTS CursoRegras (
    CodigoCurso VARCHAR(10),
    Regra TEXT,
    FOREIGN KEY (CodigoCurso) REFERENCES Curso(CodigoCurso),
    UNIQUE (CodigoCurso, Regra)
);

CREATE TABLE IF NOT EXISTS CursoNecessidades (
    CodigoCurso VARCHAR(10),
    NecessidadeInfra TEXT,
    FOREIGN KEY (CodigoCurso) REFERENCES Curso(CodigoCurso),
    UNIQUE (CodigoCurso, NecessidadeInfra)
);

CREATE TABLE IF NOT EXISTS Disciplina (
    NomeDisciplina VARCHAR(100) PRIMARY KEY,
    NumAulasSemanais INT,
    MaterialDidatico TEXT,
    CodigoCurso VARCHAR(10),
    FOREIGN KEY (CodigoCurso) REFERENCES Curso(CodigoCurso)
);

-- ---------------------------
-- Turmas e Matrículas
-- ---------------------------
CREATE TABLE IF NOT EXISTS Turma (
    TurmaID INT PRIMARY KEY,
    ProfessorID INT,
    NomeDisciplina VARCHAR(100),
    HorarioTurma TIME,
    DataInicio DATE,
    DataFim DATE,
    FOREIGN KEY (ProfessorID) REFERENCES Usuario(UsuarioID),
    FOREIGN KEY (NomeDisciplina) REFERENCES Disciplina(NomeDisciplina)
);

CREATE TABLE IF NOT EXISTS Matricula (
    UsuarioID INT,
    TurmaID INT,
    DataMatricula DATE,
    Status VARCHAR(20),
    DataLimite DATE,
    Taxa FLOAT,
    PRIMARY KEY (UsuarioID, TurmaID),
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(UsuarioID),
    FOREIGN KEY (TurmaID) REFERENCES Turma(TurmaID)
);

CREATE TABLE IF NOT EXISTS MatriculaNotas (
    UsuarioID INT,
    TurmaID INT,
    Nota FLOAT,
    PRIMARY KEY (UsuarioID, TurmaID, Nota),
    FOREIGN KEY (UsuarioID, TurmaID) REFERENCES Matricula(UsuarioID, TurmaID)
);

CREATE TABLE IF NOT EXISTS MatriculaBeneficios (
    UsuarioID INT,
    TurmaID INT,
    Beneficio TEXT,
    PRIMARY KEY (UsuarioID, TurmaID, Beneficio),
    FOREIGN KEY (UsuarioID, TurmaID) REFERENCES Matricula(UsuarioID, TurmaID)
);

-- ---------------------------
-- Avaliações e Comunicação
-- ---------------------------
CREATE TABLE IF NOT EXISTS Avaliacao (
    AlunoID INT,
    ProfessorID INT,
    NomeDisciplina VARCHAR(100),
    Comentario TEXT,
    ScoreDidatica INT,
    ScoreMaterial INT,
    ScoreRelevancia INT,
    ScoreInfra INT,
    PRIMARY KEY (AlunoID, ProfessorID, NomeDisciplina),
    FOREIGN KEY (AlunoID) REFERENCES Usuario(UsuarioID),
    FOREIGN KEY (ProfessorID) REFERENCES Usuario(UsuarioID),
    FOREIGN KEY (NomeDisciplina) REFERENCES Disciplina(NomeDisciplina)
);

CREATE TABLE IF NOT EXISTS Mensagem (
    RemetenteID INT,
    DestinatarioID INT,
    Timestamp TIMESTAMP,
    Texto TEXT,
    PRIMARY KEY (RemetenteID, DestinatarioID, Timestamp),
    FOREIGN KEY (RemetenteID) REFERENCES Usuario(UsuarioID),
    FOREIGN KEY (DestinatarioID) REFERENCES Usuario(UsuarioID)
);

CREATE TABLE IF NOT EXISTS Aviso (
    AdminID INT,
    Timestamp TIMESTAMP,
    Texto TEXT,
    PRIMARY KEY (AdminID, Timestamp),
    FOREIGN KEY (AdminID) REFERENCES Usuario(UsuarioID)
);


SELECT * FROM pg_catalog.pg_tables;