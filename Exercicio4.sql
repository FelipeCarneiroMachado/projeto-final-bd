--Inserir dados na tabela 

-- A ordem de inserção é crucial para respeitar as chaves estrangeiras.
-- 1. Unidade
-- 2. Usuario (base para todos os outros)
-- 3. Departamento (depende de Usuario para o chefe)
-- 4. Curso (depende de Departamento)
-- 5. CursoRegras e CursoNecessidadesInfra (dependem de Curso)
-- 6. Disciplina (depende de Curso)
-- 7. Turma (depende de Usuario(Professor) e Disciplina)
-- 8. Matricula (depende de Usuario(Aluno) e Turma)
-- 9. MatriculaNotas e MatriculaBeneficios (dependem de Matricula)
-- 10. Avaliacao, Mensagem, Aviso (dependem de Usuario)


-- -----------------------------------------------------
-- 1. Tabela Unidade
-- -----------------------------------------------------
INSERT INTO Unidade (unidadeId, cidade, estado, pais, bloco) VALUES
(1, 'São Carlos', 'SP', 'Brasil', 'Bloco A - Central'),
(2, 'São Paulo', 'SP', 'Brasil', 'Campus Butantã'),
(3, 'Ribeirão Preto', 'SP', 'Brasil', 'Campus Saúde');


-- -----------------------------------------------------
-- 2. Tabela Usuario
-- Inserindo mais de 20 registros, incluindo Professores, Alunos e Funcionários.
-- Nota: A especialização e titulação são preenchidas apenas para professores.
-- -----------------------------------------------------
INSERT INTO Usuario (usuarioId, tipoUsuario, nome, sobrenome, telefone, dataNascimento, pais, UF, cidade, rua, numero, complemento, CEP, sexo, email, senha, especializacao, titulacao, unidadeId) VALUES
-- Professores (5)
(1, 'professor', 'Mirela', 'Cazzolato', '16991110001', '1980-05-15', 'Brasil', 'SP', 'São Carlos', 'Rua dos Professores', '100', NULL, '13560001', 'F', 'mirela.c@escola.edu', 'senha123', 'Bancos de Dados', 'Doutorado', 1),
(2, 'professor', 'Leonardo', 'Campos', '16991110002', '1990-08-20', 'Brasil', 'SP', 'São Carlos', 'Rua dos Monitores', '200', 'Apto 10', '13560002', 'M', 'leo.campos@escola.edu', 'senha123', 'Inteligência Artificial', 'Mestrado', 1),
(3, 'professor', 'Alan', 'Turing', '11992220003', '1912-06-23', 'Brasil', 'SP', 'São Paulo', 'Rua da Computação', '300', NULL, '05508003', 'M', 'alan.turing@escola.edu', 'senha123', 'Teoria da Computação', 'Doutorado', 2),
(4, 'professor', 'Ada', 'Lovelace', '11992220004', '1815-12-10', 'Brasil', 'SP', 'São Paulo', 'Avenida dos Algoritmos', '400', 'Sala B', '05508004', 'F', 'ada.lovelace@escola.edu', 'senha123', 'Algoritmos', 'Doutorado', 2),
(5, 'professor', 'Isaac', 'Newton', '16993330005', '1643-01-04', 'Brasil', 'SP', 'Ribeirão Preto', 'Praça da Física', '500', NULL, '14049900', 'M', 'isaac.newton@escola.edu', 'senha123', 'Física Clássica', 'Doutorado', 3),

-- Funcionários Administrativos (3)
(6, 'administrativo', 'Carlos', 'Administrador', '16991110006', '1985-02-10', 'Brasil', 'SP', 'São Carlos', 'Rua da Secretaria', '600', 'Piso 1', '13560006', 'M', 'carlos.adm@escola.edu', 'senha123', NULL, NULL, 1),
(7, 'administrativo', 'Beatriz', 'Secretária', '11992220007', '1992-11-30', 'Brasil', 'SP', 'São Paulo', 'Avenida da Reitoria', '700', NULL, '05508007', 'F', 'bia.sec@escola.edu', 'senha123', NULL, NULL, 2),
(8, 'administrativo', 'Roberto', 'Financeiro', '16993330008', '1978-07-18', 'Brasil', 'SP', 'Ribeirão Preto', 'Rua das Finanças', '800', 'Térreo', '14040008', 'M', 'roberto.fin@escola.edu', 'senha123', NULL, NULL, 3),

-- Alunos (22)
(9, 'aluno', 'Felipe', 'Machado', '16998880009', '2002-01-25', 'Brasil', 'SP', 'São Carlos', 'Rua dos Estudantes', '901', 'Apto 1', '13560109', 'M', 'felipe.m@aluno.edu', 'senha123', NULL, NULL, 1),
(10, 'aluno', 'Ana', 'Silva', '16998880010', '2003-03-12', 'Brasil', 'SP', 'São Carlos', 'Rua dos Estudantes', '902', NULL, '13560110', 'F', 'ana.s@aluno.edu', 'senha123', NULL, NULL, 1),
(11, 'aluno', 'Bruno', 'Souza', '11997770011', '2002-07-08', 'Brasil', 'SP', 'São Paulo', 'Avenida dos Alunos', '1101', 'Bloco B', '05508111', 'M', 'bruno.s@aluno.edu', 'senha123', NULL, NULL, 2),
(12, 'aluno', 'Carla', 'Pereira', '11997770012', '2004-05-19', 'Brasil', 'SP', 'São Paulo', 'Avenida dos Alunos', '1102', NULL, '05508112', 'F', 'carla.p@aluno.edu', 'senha123', NULL, NULL, 2),
(13, 'aluno', 'Daniel', 'Ferreira', '16996660013', '2003-09-01', 'Brasil', 'SP', 'Ribeirão Preto', 'Alameda dos Calouros', '1301', 'Casa 2', '14040113', 'M', 'daniel.f@aluno.edu', 'senha123', NULL, NULL, 3),
(14, 'aluno', 'Eduarda', 'Almeida', '16998880014', '2004-02-28', 'Brasil', 'SP', 'São Carlos', 'Rua dos Estudantes', '903', 'Apto 2', '13560114', 'F', 'eduarda.a@aluno.edu', 'senha123', NULL, NULL, 1),
(15, 'aluno', 'Gabriel', 'Oliveira', '11997770015', '2001-12-15', 'Brasil', 'SP', 'São Paulo', 'Avenida dos Alunos', '1103', NULL, '05508115', 'M', 'gabriel.o@aluno.edu', 'senha123', NULL, NULL, 2),
(16, 'aluno', 'Helena', 'Ribeiro', '16996660016', '2003-11-20', 'Brasil', 'SP', 'Ribeirão Preto', 'Alameda dos Calouros', '1302', NULL, '14040116', 'F', 'helena.r@aluno.edu', 'senha123', NULL, NULL, 3),
(17, 'aluno', 'Igor', 'Martins', '16998880017', '2002-08-14', 'Brasil', 'SP', 'São Carlos', 'Rua dos Estudantes', '904', 'Apto 3', '13560117', 'M', 'igor.m@aluno.edu', 'senha123', NULL, NULL, 1),
(18, 'aluno', 'Juliana', 'Santos', '11997770018', '2003-06-05', 'Brasil', 'SP', 'São Paulo', 'Avenida dos Alunos', '1104', 'Bloco C', '05508118', 'F', 'juliana.s@aluno.edu', 'senha123', NULL, NULL, 2),
(19, 'aluno', 'Lucas', 'Gomes', '16996660019', '2004-10-10', 'Brasil', 'SP', 'Ribeirão Preto', 'Alameda dos Calouros', '1303', NULL, '14040119', 'M', 'lucas.g@aluno.edu', 'senha123', NULL, NULL, 3),
(20, 'aluno', 'Mariana', 'Rodrigues', '16998880020', '2002-04-03', 'Brasil', 'SP', 'São Carlos', 'Rua dos Estudantes', '905', 'Apto 4', '13560120', 'F', 'mariana.r@aluno.edu', 'senha123', NULL, NULL, 1),
(21, 'aluno', 'Nicolas', 'Carvalho', '11997770021', '2003-01-07', 'Brasil', 'SP', 'São Paulo', 'Avenida dos Alunos', '1105', NULL, '05508121', 'M', 'nicolas.c@aluno.edu', 'senha123', NULL, NULL, 2),
(22, 'aluno', 'Olivia', 'Nogueira', '16996660022', '2004-08-22', 'Brasil', 'SP', 'Ribeirão Preto', 'Alameda dos Calouros', '1304', 'Casa 3', '14040122', 'F', 'olivia.n@aluno.edu', 'senha123', NULL, NULL, 3),
(23, 'aluno', 'Pedro', 'Mendes', '16998880023', '2002-11-18', 'Brasil', 'SP', 'São Carlos', 'Rua dos Estudantes', '906', NULL, '13560123', 'M', 'pedro.m@aluno.edu', 'senha123', NULL, NULL, 1),
(24, 'aluno', 'Quintino', 'Barbosa', '11997770024', '2003-02-14', 'Brasil', 'SP', 'São Paulo', 'Avenida dos Alunos', '1106', 'Bloco D', '05508124', 'M', 'quintino.b@aluno.edu', 'senha123', NULL, NULL, 2),
(25, 'aluno', 'Rafaela', 'Lima', '16996660025', '2004-03-29', 'Brasil', 'SP', 'Ribeirão Preto', 'Alameda dos Calouros', '1305', NULL, '14040125', 'F', 'rafaela.l@aluno.edu', 'senha123', NULL, NULL, 3),
(26, 'aluno', 'Sofia', 'Araujo', '16998880026', '2002-09-09', 'Brasil', 'SP', 'São Carlos', 'Rua dos Estudantes', '907', 'Apto 5', '13560126', 'F', 'sofia.a@aluno.edu', 'senha123', NULL, NULL, 1),
(27, 'aluno', 'Tiago', 'Costa', '11997770027', '2003-07-27', 'Brasil', 'SP', 'São Paulo', 'Avenida dos Alunos', '1107', NULL, '05508127', 'M', 'tiago.c@aluno.edu', 'senha123', NULL, NULL, 2),
(28, 'aluno', 'Ursula', 'Dias', '16996660028', '2004-12-01', 'Brasil', 'SP', 'Ribeirão Preto', 'Alameda dos Calouros', '1306', 'Casa 4', '14040128', 'F', 'ursula.d@aluno.edu', 'senha123', NULL, NULL, 3),
(29, 'aluno', 'Victor', 'Pinto', '16998880029', '2002-06-17', 'Brasil', 'SP', 'São Carlos', 'Rua dos Estudantes', '908', NULL, '13560129', 'M', 'victor.p@aluno.edu', 'senha123', NULL, NULL, 1),
(30, 'aluno', 'Yasmin', 'Teixeira', '11997770030', '2003-04-21', 'Brasil', 'SP', 'São Paulo', 'Avenida dos Alunos', '1108', 'Bloco E', '05508130', 'F', 'yasmin.t@aluno.edu', 'senha123', NULL, NULL, 2);


-- -----------------------------------------------------
-- 3. Tabela Departamento
-- profId é FK para Usuario.usuarioId
-- -----------------------------------------------------
INSERT INTO Departamento (codigoDpt, nomeDpt, profId) VALUES
('DCC', 'Departamento de Ciência da Computação', 1),
('DME', 'Departamento de Matemática e Estatística', 3),
('DF', 'Departamento de Física', 5);


-- -----------------------------------------------------
-- 4. Tabela Curso
-- codigoDpt é FK para Departamento.codigoDpt
-- -----------------------------------------------------
INSERT INTO Curso (codigoCurso, nome, nivelEnsino, cargaHoraria, numVagas, ementa, salaPadrao, codigoDpt) VALUES
('BCC', 'Bacharelado em Ciência da Computação', 'Graduação', 3200, 50, 'Formação de profissionais em computação...', 'Sala 501', 'DCC'),
('Estat', 'Bacharelado em Estatística', 'Graduação', 2800, 40, 'Estudo de métodos de coleta, análise e interpretação de dados.', 'Sala 302', 'DME'),
('Fisica', 'Bacharelado em Física Médica', 'Graduação', 3000, 30, 'Aplicação de conceitos da física na medicina.', 'Sala 101-A', 'DF');


-- -----------------------------------------------------
-- 5. Tabelas multivaloradas de Curso
-- -----------------------------------------------------
-- Tabela CursoRegras
INSERT INTO CursoRegras (codigoCurso, regra) VALUES
('BCC', 'Frequência mínima obrigatória de 75% em todas as disciplinas.'),
('BCC', 'Aprovação com média final maior ou igual a 5.0.'),
('Estat', 'Frequência mínima obrigatória de 70%.'),
('Fisica', 'Uso obrigatório de jaleco nos laboratórios.');

-- Tabela CursoNecessidadesInfra
INSERT INTO CursoNecessidadesInfra (codigoCurso, necessidadeInfra) VALUES
('BCC', 'Laboratório de informática com acesso à internet.'),
('BCC', 'Projetor multimídia em todas as salas.'),
('Fisica', 'Laboratório de física com equipamentos de medição.');


-- -----------------------------------------------------
-- 6. Tabela Disciplina
-- codigoCurso é FK para Curso.codigoCurso
-- -----------------------------------------------------
INSERT INTO Disciplina (nomeDisciplina, numAulasSemanais, materialDidatico, codigoCurso) VALUES
('Bases de Dados', 4, 'Livro: Sistemas de Banco de Dados, Elmasri & Navathe', 'BCC'),
('Algoritmos Avançados', 4, 'Livro: Introduction to Algorithms, CLRS', 'BCC'),
('Cálculo I', 6, 'Livro: Cálculo, Volume 1, James Stewart', 'Estat'),
('Mecânica Clássica', 4, 'Livro: Curso de Física Básica, Moysés Nussenzveig', 'Fisica');


-- -----------------------------------------------------
-- 7. Tabela Turma
-- professorId é FK para Usuario.usuarioId
-- nomeDisciplina é FK para Disciplina.nomeDisciplina
-- -----------------------------------------------------
INSERT INTO Turma (turmaId, professorId, nomeDisciplina, horarioTurma, dataInicio, dataFim) VALUES
(1, 1, 'Bases de Dados', 'Seg/Qua 10:00-11:50', '2025-02-10', '2025-06-25'),
(2, 4, 'Algoritmos Avançados', 'Ter/Qui 08:00-09:50', '2025-02-11', '2025-06-26'),
(3, 3, 'Cálculo I', 'Seg/Qua/Sex 14:00-15:50', '2025-02-10', '2025-06-27'),
(4, 5, 'Mecânica Clássica', 'Ter/Qui 16:00-17:50', '2025-02-11', '2025-06-26');


-- -----------------------------------------------------
-- 8. Tabela Matricula
-- usuarioId é FK para Usuario.usuarioId
-- turmaId é FK para Turma.turmaId
-- -----------------------------------------------------
INSERT INTO Matricula (usuarioId, turmaId, dataMatricula, status, dataLimite, taxa) VALUES
-- Alunos em Bases de Dados
(9, 1, '2025-01-15', 'ativa', '2025-02-05', 550.00),
(10, 1, '2025-01-16', 'ativa', '2025-02-05', 550.00),
(14, 1, '2025-01-17', 'ativa', '2025-02-05', 550.00),
-- Alunos em Algoritmos
(11, 2, '2025-01-15', 'ativa', '2025-02-05', 600.00),
(12, 2, '2025-01-16', 'ativa', '2025-02-05', 600.00),
(15, 2, '2025-01-17', 'concluída', '2025-02-05', 600.00),
-- Alunos em Cálculo
(13, 3, '2025-01-18', 'trancada', '2025-02-05', 480.00),
(16, 3, '2025-01-19', 'ativa', '2025-02-05', 480.00),
-- Alunos em Mecânica
(19, 4, '2025-01-20', 'reprovada', '2025-02-05', 520.00),
(22, 4, '2025-01-21', 'ativa', '2025-02-05', 520.00);


-- -----------------------------------------------------
-- 9. Tabelas multivaloradas de Matricula
-- -----------------------------------------------------
-- Tabela MatriculaNotas
-- (usuarioId, turmaId) é FK para Matricula
INSERT INTO MatriculaNotas (usuarioId, turmaId, nota) VALUES
(15, 2, 8.5), -- Aluno Gabriel em Algoritmos
(15, 2, 9.0), -- Aluno Gabriel em Algoritmos (P2)
(19, 4, 3.0), -- Aluno Lucas em Mecânica
(19, 4, 4.5); -- Aluno Lucas em Mecânica (P2)

-- Tabela MatriculaBeneficios
-- (usuarioId, turmaId) é FK para Matricula
INSERT INTO MatriculaBeneficios (usuarioId, turmaId, beneficio) VALUES
(9, 1, 'Bolsa Mérito Acadêmico - 50%'),
(13, 3, 'Desconto por Indicação - 10%');


-- -----------------------------------------------------
-- 10. Tabelas Finais (Avaliação, Comunicação)
-- -----------------------------------------------------
-- Tabela Avaliacao
INSERT INTO Avaliacao (alunoId, professorId, nomeDisciplina, comentario, scoreDidatica, scoreMaterial, scoreRelevancia, scoreInfra) VALUES
(15, 4, 'Algoritmos Avançados', 'A professora Ada é excelente, muito didática!', 10, 9, 10, 8),
(10, 1, 'Bases de Dados', 'Gostei muito da disciplina, mas o material poderia ser mais prático.', 9, 7, 10, 9);

-- Tabela Mensagem
INSERT INTO Mensagem (remetenteId, destinatarioId, timestamp, texto) VALUES
(2, 9, '2025-03-10 09:30:00', 'Olá Felipe, seu trabalho sobre normalização ficou excelente!'),
(9, 2, '2025-03-10 11:00:00', 'Obrigado, professor Leonardo! Fico feliz que tenha gostado.'),
(1, 10, '2025-04-01 15:00:00', 'Ana, não se esqueça da data de entrega do projeto final.');

-- Tabela Aviso
INSERT INTO Aviso (adminId, timestamp, texto) VALUES
(6, '2025-06-15 18:00:00', 'Atenção: O prazo para rematrícula para o próximo semestre se encerra em 30/06.'),
(7, '2025-03-01 08:00:00', 'Lembrete: Feriado na próxima sexta-feira, não haverá expediente nem aulas.');
