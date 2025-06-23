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
(1, 'Sao Carlos', 'SP', 'Brasil', 'Bloco A - Central'),
(2, 'Sao Paulo', 'SP', 'Brasil', 'Campus Butantã'),
(3, 'Ribeirao Preto', 'SP', 'Brasil', 'Campus Saúde'),
(4, 'Bauru', 'SP', 'Brasil', 'Bloco 1')
;

INSERT INTO CEPs (CEP,Pais,Uf,Cidade,Rua) VALUES
('13561-090','Brasil','SP','Sao Carlos','R. Profa. Alice Josephina DAnna Juliana' ),
( '04224-010', 'Brasil', 'SP', 'Sao Paulo','R. Campante'),
('04425-050', 'Brasil', 'SP', 'Sao Paulo', 'Rua Jordao Ramalho'),
('04598-035', 'Brasil', 'SP', 'Sao Paulo', 'Rua Estrada do Sabao'),
('32454-024','Brasil', 'BA', 'Salvador', 'R. do Jambo'),
('76785-123', 'Brasil', 'MG', 'Belo Horizonte', 'R. Cabrobo'),
('45632-177', 'Brasil', 'MG', 'Gov. Valadares', 'Av. Rio Doce'),
('39855-015', 'Brasil', 'Ms', 'Campo Grande', 'R. Domingos Marquês'),
('70390-100', 'Brasil', 'DF', 'Brasilia','Superquadra sul 111'),
('12312-123','China','CT', 'Shenzhen', 'R. Bulong');


-- -----------------------------------------------------
-- 3. Tabela Usuario
-- Inserindo mais de 20 registros, incluindo Professores, Alunos e Funcionários.
-- Nota: A especialização e titulação são preenchidas apenas para professores.
-- -----------------------------------------------------
INSERT INTO Usuario (usuarioId, tipoUsuario, nome, sobrenome, telefone, dataNascimento, numero, complemento, CEP, sexo, email, senha, especializacao, titulacao, unidadeId) VALUES
-- Professores (7)
(1, 'professor', 'Mirela', 'Cazzolato', '16991110001', '1980-05-15',  '100', NULL, '04224-010', 'F', 'mirela.c@escola.edu', 'senha123', 'Bancos de Dados', 'Doutorado', 1),
(101, 'professor', 'Roudinei','Goularte', '10110210001', '1972-03-28', '45', 'Apto 6', '32454-024','M', 'rudinei.g@rudimol.edu', 'noglobalvar', 'Processamento de Imagens', 'Doutorado', 1),
(102, 'professor', 'Tatiane', 'Moura', '76785123001', '1985-11-12', '55', NULL, '76785-123', 'F', 'tatiane.moura@estat.edu', 'sigma>123', 'Estatística Aplicada', 'Doutorado', 1),
(103, 'professor', 'Fernando', 'Tavares', '45632177111', '1979-06-08', '301', 'Bloco C', '45632-177', 'M', 'fernando.tavares@enf.edu', 'enfermagem++', 'Cuidados Intensivos', 'Mestrado', 1),
(104, 'professor', 'Juliana', 'Andrade', '70390100122', '1988-02-17', '1200', NULL, '70390-100', 'F', 'juliana.andrade@fismed.edu', 'fisika#42', 'Física Médica Nuclear', 'Doutorado', 1),
(2, 'professor', 'Leonardo', 'Campos', '16991110002', '1990-08-20',  '200', 'Apto 10', '04425-050', 'M', 'leo.campos@escola.edu', '12343221', 'Inteligência Artificial', 'Mestrado', 1),
(3, 'professor', 'Alan', 'Turing', '11992220003', '1952-06-23',  '300', NULL, '04598-035', 'M', 'alan.turing@escola.edu', 'alopio', 'Teoria da Computação', 'Doutorado', 2),
(4, 'professor', 'Ada', 'Lovelace', '11992220004', '1975-12-10',  '400', 'Sala B', '32454-024', 'F', 'ada.lovelace@escola.edu', 'senha123', 'Algoritmos', 'Doutorado', 2),
(5, 'professor', 'Isaac', 'Newton', '16993330005', '1963-01-04',  '500', NULL, '45632-177', 'M', 'isaac.newton@escola.edu', 'senha123', 'Física Clássica', 'Doutorado', 2),
(6, 'professor', 'Carlinhos', 'Brown', '22993330005', '1962-01-04',  '500', NULL, '70390-100', 'M', 'CBrown@escola.edu', 'x0x0ilvu', 'Cardiologia Aplicada', 'Doutorado', 3),
(7, 'professor', 'Isadora', 'Bachet', '71993330005', '1989-01-04',  '500', 'Ap 24', '13561-090', 'F', 'isadora.Bachet@escola.edu', '1317LB<3', 'Geopolitica Moderna', 'Mestrado', 4),
/*Funcionarios administrativos(3)*/
(8, 'administrativo', 'Carlos', 'Rocha', '16991110006', '1985-02-10', '600', 'Piso 1', '13561-090', 'M', 'carlos.adm@escola.edu', 'senha123', NULL, NULL, 1),
(9, 'administrativo', 'Beatriz', 'Sedrie', '11992220007', '1992-11-30', '700', NULL, '04224-010', 'F', 'bia.sec@escola.edu', 'senha123', NULL, NULL, 2),
(10, 'administrativo', 'Roberto', 'Faro', '16993330008', '1978-07-18', '800', 'Térreo', '04425-050', 'M', 'roberto.fin@escola.edu', 'senha123', NULL, NULL, 3),
/*Alunos(22)*/
(11, 'aluno', 'Felipe', 'Machado', '16998880009', '2002-01-25', '901', 'Apto 1', '04598-035', 'M', 'felipe.m@aluno.edu', 'senha123', NULL, NULL, 1),
(12, 'aluno', 'Ana', 'Silva', '16998880010', '2003-03-12', '902', NULL, '32454-024', 'F', 'ana.s@aluno.edu', 'senha123', NULL, NULL, 1),
(13, 'aluno', 'Bruno', 'Souza', '11997770011', '1972-07-08',  '1101', 'Bloco B', '76785-123', 'M', 'bruno.s@aluno.edu', 'senha123', NULL, NULL, 1),
(14, 'aluno', 'Carla', 'Pereira', '11997770012', '2004-05-19',  '1102', NULL, '45632-177', 'F', 'carla.p@aluno.edu', 'senha123', NULL, NULL, 1),
(15, 'aluno', 'Daniel', 'Ferreira', '16996660013', '2003-09-01', '1301', 'Casa 2', '39855-015', 'M', 'daniel.f@aluno.edu', 'senha123', NULL, NULL, 1),
(16, 'aluno', 'Eduarda', 'Almeida', '16998880014', '1974-02-28', '903', 'Apto 2', '70390-100', 'F', 'eduarda.a@aluno.edu', 'senha123', NULL, NULL, 1),
(17, 'aluno', 'Gabriel', 'Oliveira', '11997770015', '2001-12-15', '1103', NULL, '12312-123', 'M', 'gabriel.o@aluno.edu', 'senha123', NULL, NULL, 1),
(18, 'aluno', 'Helena', 'Ribeiro', '16996660016', '2003-11-20', '1302', NULL, '04224-010', 'F', 'helena.r@aluno.edu', 'senha123', NULL, NULL, 2),
(19, 'aluno', 'Lazaro', 'Vinaud', '16998880017', '2002-08-14',  '904', 'Apto 3', '04425-050', 'M', 'igor.m@aluno.edu', 'senha123', NULL, NULL, 2),
(20, 'aluno', 'Juliana', 'Santos', '11997770018', '1973-06-05', '1104', 'Bloco C', '04598-035', 'F', 'juliana.s@aluno.edu', 'senha123', NULL, NULL, 2),
(21, 'aluno', 'Lucas', 'Gomes', '16996660019', '2004-10-10', '1303', NULL, '32454-024', 'M', 'lucas.g@aluno.edu', 'senha123', NULL, NULL, 2),
(22, 'aluno', 'Mariana', 'Rodrigues', '16998880020', '2002-04-03', '905', 'Apto 4', '76785-123', 'F', 'mariana.r@aluno.edu', 'senha123', NULL, NULL, 2),
(23, 'aluno', 'Nicolas', 'Carvalho', '11997770021', '2003-01-07', '1105', NULL, '45632-177', 'M', 'nicolas.c@aluno.edu', 'senha123', NULL, NULL, 2),
(24, 'aluno', 'Olivia', 'Nogueira', '16996660022', '2004-08-22', '1304', 'Casa 3', '70390-100', 'F', 'olivia.n@aluno.edu', 'senha123', NULL, NULL, 2),
(25, 'aluno', 'Pedro', 'Mendes', '16998880023', '2002-11-18','906', NULL, '12312-123', 'M', 'pedro.m@aluno.edu', 'senha123', NULL, NULL, 3),
(26, 'aluno', 'Quintino', 'Barbosa', '11997770024', '2003-02-14', 'Bloco D', NULL, '39855-015', 'M', 'quintino.b@aluno.edu', 'senha123', NULL, NULL, 3),
(27, 'aluno', 'Rafaela', 'Lima', '16996660025', '2004-03-29',  '1305', NULL, '13561-090', 'F', 'rafaela.l@aluno.edu', 'senha123', NULL, NULL, 3),
(28, 'aluno', 'Sofia', 'Araujo', '16998880026', '1999-09-09', '907', 'Apto 5', '04224-010', 'F', 'sofia.a@aluno.edu', 'senha123', NULL, NULL, 3),
(29, 'aluno', 'Tiago', 'Costa', '11997770027', '2003-07-27', '1107', NULL, '04425-050', 'M', 'tiago.c@aluno.edu', 'senha123', NULL, NULL, 3),
(30, 'aluno', 'Ursula', 'Dias', '16996660028', '2004-12-01',  '1306', 'Casa 4', '04598-035', 'F', 'ursula.d@aluno.edu', 'senha123', NULL, NULL, 3),
(31, 'aluno', 'Victor', 'Pinto', '16998880029', '2002-06-17', '908', NULL, '32454-024', 'M', 'victor.p@aluno.edu', 'senha123', NULL, NULL, 4),
(32, 'aluno', 'Yasmin', 'Teixeira', '11997770030', '2003-04-21', '1108', 'Bloco E', '12312-123', 'F', 'yasmin.t@aluno.edu', 'senha123', NULL, NULL, 4);


-- -----------------------------------------------------
-- 4. Tabela Departamento
-- profId é FK para Usuario.usuarioId
-- -----------------------------------------------------
INSERT INTO Departamento (codigoDpt, nomeDpt, profId) VALUES
('DCC', 'Departamento de Ciência da Computação', 1),
('DME', 'Departamento de Matemática e Estatística', 3),
('DF', 'Departamento de Física', 5),
('DA', 'Departamento de Anatomia', 6),
('DCH', 'Departamento de Ciencias Humanas', 7);


-- -----------------------------------------------------
-- 5 Tabela Curso
-- codigoDpt é FK para Departamento.codigoDpt
-- -----------------------------------------------------
INSERT INTO Curso (codigoCurso, nome, nivelEnsino, cargaHoraria, numVagas, ementa, salaPadrao, codigoDpt) VALUES
('BCC', 'Bacharelado em Ciência da Computação', 'Graduação', 3200, 50, 'Formação de cientistas decomputação...', 'Sala 501', 'DCC'),
('BSI', 'Bacharelado em Sistemas de Informação', 'Graduação', 2800, 50, 'Formação de profissionais em computação...', 'Sala 403', 'DCC'),
('Estat', 'Tecnico em Estatística', 'Técnico', 2800, 40, 'Estudo de métodos de coleta, análise e interpretação de dados...', 'Sala 302', 'DME'),
('Mat', 'Bacharelado em Matemática Pura', 'Graduação', 2800, 40, 'Estudo de matemática em nível avançado...', 'Sala 302', 'DME'),
('FisMed', 'Bacharelado em Física Médica', 'Graduação', 3000, 30, 'Aplicação de conceitos da física na medicina...', 'Sala 101-A', 'DF'),
('Fisica', 'Bacharelado em Física', 'Graduação', 3000, 30, 'Aplicação pratica dos conceitos físicos...', 'Sala 204-A', 'DF'),
('Med', 'Bacharelado em Medicina ', 'Graduação', 4000, 30, 'Formar médicos com sólida base técnico-científica, senso ético e responsabilidade social...','Sala A','DA'),
('Enf', 'Bacharelado em enfermagem ', 'Graduação', 4000, 30, 'Formar enfermeiros com sólida base técnica, senso ético e responsabilidade social...','Sala B','DA'),
('GeoComp','Geografia computacional', 'Técnico', 2000, 12, 'Aplicação de conhecimentos geográficos e técnicas computacionais para a análise, modelagem e visualização de fenômenos espaciais...','Sala 2-B','DCH' );

-- -----------------------------------------------------
-- 6. Tabelas multivaloradas de Curso
-- -----------------------------------------------------
-- Tabela CursoRegras
INSERT INTO CursoRegras (codigoCurso, regra) VALUES
('BCC', 'Frequência mínima obrigatória de 75% em todas as disciplinas.'),
('BCC', 'Aprovação com média final maior ou igual a 5.0.'),
('BSI', 'Aprovação com média final maior ou igual a 5.0.'),
('FisMed', 'Aprovação com média final maior ou igual a 5.0.'),
('Mat', 'Aprovação com média final maior ou igual a 6.0.'),
('Fisica', 'Aprovação com média final maior ou igual a 5.0.'),
('Med', 'Aprovação com média final maior ou igual a 7.0.'),
('Enf', 'Aprovação com média final maior ou igual a 7.0.'),
('Estat', 'Frequência mínima obrigatória de 70%.'),
('Med', 'Proibido inscrição em estágios remunerados'),
('FisMed', 'Uso obrigatório de jaleco nos laboratórios.');

-- Tabela CursoNecessidades
INSERT INTO CursoNecessidades(codigoCurso, necessidadeInfra) VALUES
('BCC', 'Laboratório de informática com acesso à internet.'),
('BCC', 'Projetor multimídia em todas as salas.'),
('FisMed', 'Laboratório de física com equipamentos de medição.'),
('Med', 'Modelos anatômicos para estudo'),
('FisMed', 'Modelos anatômicos para estudo');


-- -----------------------------------------------------
-- 7. Tabela Disciplina
-- codigoCurso é FK para Curso.codigoCurso
-- -----------------------------------------------------
INSERT INTO Disciplina (nomeDisciplina, numAulasSemanais, materialDidatico, codigoCurso) VALUES
('Bases de Dados', 4, 'Livro: Sistemas de Banco de Dados, Elmasri & Navathe', 'BCC'),
('Algoritmos computacionais', 4, 'Livro: Introduction to Algorithms, CLRS', 'BCC'),
('Multimidia', 2, 'Livro: Multimedia in the computer, CIPC', 'BSI'),
('Cálculo I', 6, 'Livro: Cálculo, Volume 1, James Stewart', 'Mat'),
('Mecânica Clássica', 4, 'Livro: Curso de Física Básica, Moysés Nussenzveig', 'Fisica'),
('Relevo', 1,'Livro: Análise extendida de Relevo Geográfico, Ana Mikaski','GeoComp'),
('Citologia I', 3, 'Livro: Biologia celular e molecular, José Carneiro', 'Med'),
('Algoritmos Avançados', 4, 'Livro: Understanding complex Algorithms, CLRS', 'BCC'),
('Processamento de Imagens', 2, 'Livro: Image Processing, CIPC', 'BSI'),
('Inteligencia artificial', 4, 'Livro: Introdução a Inteligencia Artificial, CLRS', 'BCC'),
('Cálculo II', 6, 'Livro: Cálculo Integral I, James baxter', 'Mat'),
('Probabilidade',3,'Livro: Análise probabilistica, Eduardo Euler', 'Estat'),
('Comportamento Biomolecular' ,3, 'Livro: Introdução a Física Básica, Marcos P.', 'FisMed' ),
('Dinâmica', 4, 'Livro: Curso de Física Básica, Moysés Nussenzveig', 'Fisica'),
('Geopolitica', 1,'Livro: Estudo sobre Geopolitica, Ana Mikaski','GeoComp'),
('Cirurgia I', 3, 'Livro: Manual Cirúrgico, André Cointra', 'Med'),
('Citologia II', 3, 'Livro: Biologia celular e molecular, José Carneiro', 'Med'),
('Enfermagem I',4 , 'Livro: Manual de Cuidados e Enfermagem, Luísa Cointra', 'Enf'),
('Probabilidade II', 3,'Livro: Análise probabilistica, Eduardo Euler', 'Estat'),
('Cuidados Paliativos',2 , 'Livro: Manual de Cuidados e Enfermagem, Luísa Cointra', 'Enf');


-- -----------------------------------------------------
-- 8. Tabela Turma
-- professorId é FK para Usuario.usuarioId
-- nomeDisciplina é FK para Disciplina.nomeDisciplina
-- -----------------------------------------------------
INSERT INTO Turma (turmaId, professorId, nomeDisciplina, horarioTurma, dataInicio, dataFim) VALUES
(1, 1, 'Bases de Dados', '10:00', '2025-02-10', '2025-06-25'),
(2, 4, 'Algoritmos computacionais', '08:00', '2025-02-11', '2025-06-26'),
(101,101, 'Multimidia', '14:00', '2025-02-11', '2025-06-26'),
(3, 3, 'Cálculo I', '14:00', '2025-02-10', '2025-06-27'),
(4, 5, 'Mecânica Clássica', '16:00', '2025-02-11', '2025-06-26'),
(5, 7, 'Relevo', '13:00', '2025-02-12', '2025-06-28'),
(6, 6, 'Citologia I', '11:00', '2025-02-12', '2025-06-28'),
(102, 104, 'Comportamento Biomolecular', '9:00', '2025-02-12', '2025-06-28'),
(202, 103, 'Enfermagem I', '10:00', '2025-02-12', '2025-06-28'),
(201, 102, 'Probabilidade', '8:00', '2025-02-12', '2025-06-28'),


(8, 4, 'Algoritmos Avançados', '08:00', '2025-07-11', '2025-11-26'),
(103, 2, 'Inteligencia artificial', '08:00', '2025-07-11', '2025-11-26'),
(104,101, 'Processamento de Imagens', '14:00', '2025-07-11', '2025-11-26'),
(105, 6, 'Citologia II', '11:00', '2025-07-12', '2025-11-28'),
(106, 7, 'Geopolitica', '11:00', '2025-07-12', '2025-11-28'),
(107, 6, 'Cirurgia I', '9:00', '2025-07-12', '2025-11-28'),
(9, 3, 'Cálculo II', '14:00', '2025-02-10', '2025-07-11'),
(203, 102, 'Probabilidade II', '14:00', '2025-02-10', '2025-07-11'),
(204, 103, 'Cuidados Paliativos', '14:00', '2025-02-10', '2025-07-11'),
(10, 5, 'Dinâmica', '16:00', '2025-02-11', '2025-07-11');


-- -----------------------------------------------------
-- 9. Tabela Matricula
-- usuarioId é FK para Usuario.usuarioId
-- turmaId é FK para Turma.turmaId
-- -----------------------------------------------------
INSERT INTO Matricula (usuarioId, turmaId, dataMatricula, status, dataLimite, taxa) VALUES
(9, 1, '2025-01-15', 'ativa', '2025-02-05', 550.00),
(10, 1, '2025-01-16', 'ativa', '2025-02-05', 550.00),
(14, 1, '2025-01-17', 'ativa', '2025-02-05', 550.00),
(11, 2, '2025-01-15', 'ativa', '2025-02-05', 600.00),
(12, 2, '2025-01-16', 'ativa', '2025-02-05', 600.00),
(26, 2, '2025-01-29', 'ativa', '2025-02-05', 600.00),
(15, 2, '2025-01-17', 'concluída', '2025-02-05', 120.00),
(13, 3, '2025-01-18', 'trancada', '2025-02-05', 480.00),
(16, 3, '2025-01-19', 'ativa', '2025-02-05', 480.00),
(27, 3, '2025-01-30', 'ativa', '2025-02-05', 480.00),
(19, 4, '2025-01-20', 'reprovada', '2025-02-05', 520.00),
(22, 4, '2025-01-21', 'ativa', '2025-02-05', 520.00),
(17, 101, '2025-01-22', 'ativa', '2025-02-05', 500.00),
(18, 101, '2025-01-23', 'ativa', '2025-02-05', 500.00),
(20, 5, '2025-01-24', 'ativa', '2025-02-05', 400.00),
(21, 5, '2025-01-25', 'ativa', '2025-02-05', 400.00),
(23, 6, '2025-01-26', 'ativa', '2025-02-05', 530.00),
(24, 6, '2025-01-27', 'ativa', '2025-02-05', 530.00),
(25, 6, '2025-01-28', 'ativa', '2025-02-05', 530.00),


(11, 8, '2025-06-15', 'ativa', '2025-07-10', 600.00),
(12, 8, '2025-06-15', 'ativa', '2025-07-10', 600.00),
(15, 8, '2025-06-15', 'ativa', '2025-07-10', 600.00),
(11, 103, '2025-06-16', 'ativa', '2025-07-10', 650.00),
(14, 103, '2025-06-16', 'ativa', '2025-07-10', 650.00),
(16, 103, '2025-06-17', 'trancada', '2025-07-10', 650.00),
(17, 104, '2025-06-16', 'ativa', '2025-07-10', 600.00),
(18, 104, '2025-06-17', 'ativa', '2025-07-10', 600.00),
(25, 105, '2025-06-18', 'ativa', '2025-07-10', 530.00),
(26, 105, '2025-06-19', 'ativa', '2025-07-10', 530.00),
(27, 106, '2025-06-18', 'ativa', '2025-07-10', 400.00),
(28, 106, '2025-06-18', 'ativa', '2025-07-10', 400.00),
(29, 107, '2025-06-19', 'ativa', '2025-07-10', 550.00),
(30, 107, '2025-06-19', 'ativa', '2025-07-10', 550.00),
(23, 9, '2025-06-15', 'ativa', '2025-07-10', 500.00),
(22, 9, '2025-06-15', 'reprovada', '2025-07-10', 500.00),
(24, 203, '2025-06-15', 'ativa', '2025-07-10', 500.00),
(21, 203, '2025-06-16', 'ativa', '2025-07-10', 500.00),
(19, 204, '2025-06-15', 'ativa', '2025-07-10', 500.00),
(20, 204, '2025-06-16', 'ativa', '2025-07-10', 500.00);




-- -----------------------------------------------------
-- 10. Tabelas multivaloradas de Matricula
-- -----------------------------------------------------
-- Tabela MatriculaNotas
-- (usuarioId, turmaId) é FK para Matricula
INSERT INTO MatriculaNotas (usuarioId, turmaId, nota) VALUES
(15, 2, 8.5), 
(15, 2, 9.0),
(19, 4, 3.0), 
(19, 4, 4.5),
(11, 2, 8.0),
(11, 2, 9.2),
(12, 2, 7.5),
(12, 2, 8.0),
(26, 2, 6.5),
(26, 2, 7.0),
(14, 1, 8.5),
(14, 1, 8.7),
(16, 3, 6.0),
(16, 3, 6.8),
(27, 3, 7.0),
(27, 3, 7.2),
(22, 4, 8.0),
(22, 4, 7.5),
(17, 101, 9.0),
(17, 101, 9.5),
(18, 101, 8.8),
(18, 101, 9.1),
(20, 5, 7.5),
(20, 5, 7.8),
(21, 5, 8.0),
(21, 5, 8.4),
(23, 6, 6.0),
(23, 6, 6.5),
(24, 6, 9.0),
(24, 6, 9.5),
(25, 6, 7.8),
(25, 6, 8.0);


-- Tabela MatriculaBeneficios
-- (usuarioId, turmaId) é FK para Matricula
INSERT INTO MatriculaBeneficios (usuarioId, turmaId, beneficio) VALUES
(9, 1, 'Bolsa Mérito Acadêmico - 50%'),
(13, 3, 'Desconto por Indicação - 10%'),
(25, 6, 'Bolsa Mérito Acadêmico - 50%'),
(15,2, 'Bolsa Familiar Funcionário - 80%');

-- -----------------------------------------------------
-- 11. Tabelas Finais (Avaliação, Comunicação)
-- -----------------------------------------------------
-- Tabela Avaliacao
INSERT INTO Avaliacao (alunoId, professorId, nomeDisciplina, comentario, scoreDidatica, scoreMaterial, scoreRelevancia, scoreInfra) VALUES
(15, 4, 'Algoritmos Avançados', 'A professora Ada é excelente, muito didática!', 10, 9, 10, 8),
(10, 1, 'Bases de Dados', 'Gostei muito da disciplina, mas o material poderia ser mais prático.', 9, 7, 10, 9);

-- Tabela Mensagem
INSERT INTO Mensagem (remetenteId, destinatarioId, timestamp, texto) VALUES
(2, 11, '2025-03-10 09:30:00', 'Olá Felipe, seu trabalho sobre normalização ficou excelente!'),
(11, 2, '2025-03-10 11:00:00', 'Obrigado, professor Leonardo! Fico feliz que tenha gostado.'),
(1, 10, '2025-04-01 15:00:00', 'Ana, não se esqueça da data de entrega do projeto final.'),
(4, 16, '2025-03-12 08:00:00', 'favor revisar a lista 3, o envio atual não está de acordo'),
(16, 4, '2025-03-12 10:15:00', 'Obrigada pelo aviso! Vou revisar e reenviar.'),
(11, 12, '2025-03-22 21:00:00', 'você terminou o exercício de Algoritmos? Estou travado no 4.'),
(6, 27, '2025-04-02 10:30:00', 'Rafaela, não esqueça de trazer o material do laboratório amanhã.'),
(27, 6, '2025-04-02 10:45:00', 'Pode deixar, professor! Já está separado.'),
(1, 23, '2025-04-05 13:50:00', 'Nicolas, havia um pendrive com seu nome na sala 203.Deixei coordenação.'),
(23, 1, '2025-04-05 14:05:00', 'Obrigado, professora! Passo aí mais tarde pra pegar.');


-- Tabela Aviso
INSERT INTO Aviso (adminId, timestamp, texto) VALUES
(8, '2025-06-15 18:00:00', 'Atenção: O prazo para rematrícula para o próximo semestre se encerra em 30/06.'),
(9, '2025-03-01 08:00:00', 'Lembrete: Feriado na próxima sexta-feira, não haverá expediente nem aulas.'),
(10, '2025-02-04 00:00:00', 'Atenção: Prazo para exclusão da majoridade das disciplinas encerra amanhã' ),
(9, '2025-03-10 08:00:00', 'Oportunidade: Expedição Gratuita para Usina hidrelétrica no dia 19/03.');