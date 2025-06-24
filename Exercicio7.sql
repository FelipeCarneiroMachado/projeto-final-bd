--Criação de Índices

DROP INDEX IF EXISTS IdxTipoUsuario;
DROP INDEX IF EXISTS IdxCEPUsuario;
DROP INDEX IF EXISTS IdxCodigoDPTCurso;
DROP INDEX IF EXISTS IdxRegraCurso;
DROP INDEX IF EXISTS IdxNecessidadeCurso;
DROP INDEX IF EXISTS IdxAvaliacaoAutor;
DROP INDEX IF EXISTS IdxAvaliacaoProfessor;
DROP INDEX IF EXISTS IdxAvaliacaoDisciplina;
DROP INDEX IF EXISTS IdxMatriculaUsuario;
DROP INDEX IF EXISTS IdxMatriculaTurmaID;
DROP INDEX IF EXISTS IdxMatriculaData;
DROP INDEX IF EXISTS IdxNotaMatricula;
DROP INDEX IF EXISTS IdxBeneficioMatricula;
DROP INDEX IF EXISTS IdxMensagemRemetente;
DROP INDEX IF EXISTS IdxMensagemDestinatario;
DROP INDEX IF EXISTS IdxMensagemTimestamp;
DROP INDEX IF EXISTS IdxAvisoTimestamp;
DROP INDEX IF EXISTS IdxTurmaProfessor;


-- Otimiza buscas que apenas incluem um tipo usuário, como alunos
CREATE INDEX IdxTipoUsuario ON Usuario(TipoUsuario);
-- Otimiza joins com CEPs
CREATE INDEX IdxCEPUsuario ON Usuario(CEP);

-- Otimiza joins com Departamento
CREATE INDEX IdxCodigoDPTCurso ON Curso(CodigoDPT);


-- Otimiza a busca desses atributos multivalorados
-- para um curso em particular
CREATE INDEX IdxRegraCurso ON CursoRegras(CodigoCurso);
CREATE INDEX IdxNecessidadeCurso ON CursoNecessidades(CodigoCurso);


-- Todas as avaliações feitas por um aluno
CREATE INDEX IdxAvaliacaoAutor ON Avaliacao(AlunoID);

-- Todas as avaliações sobre um professor
CREATE INDEX IdxAvaliacaoProfessor ON Avaliacao(ProfessorID);

-- Todas as avaliações sobre uma disciplina
CREATE INDEX IdxAvaliacaoDisciplina ON Avaliacao(NomeDisciplina);


-- Todas as matrículas de um aluno
CREATE INDEX IdxMatriculaUsuario ON Matricula(UsuarioID);
-- Todas as matrículas em uma turma
CREATE INDEX IdxMatriculaTurmaID ON Matricula(TurmaID);

-- Ajuda a buscar matrículas que ocorreram dentro de um período
-- de tempo ou em uma data específica
CREATE INDEX IdxMatriculaData ON Matricula(DataMatricula);

-- Otimiza a busca desses atributos multivalorados 
-- para um usuário e sua matrícula específicos
CREATE INDEX IdxNotaMatricula ON MatriculaNotas(UsuarioID, TurmaID);
CREATE INDEX IdxBeneficioMatricula ON MatriculaBeneficios(UsuarioID, TurmaID);

-- Todas as mensagens enviadas por um usuário
CREATE INDEX IdxMensagemRemetente ON Mensagem(RemetenteID);
-- Todas as mensagens destinadas a um usuário
CREATE INDEX IdxMensagemDestinatario ON Mensagem(DestinatarioID);
-- Ajuda a filtrar/ordenar mensagens com base na sua data
CREATE INDEX IdxMensagemTimestamp ON Mensagem(Timestamp);


-- Ajuda a filtrar/ordenar avisos com base na sua data
CREATE INDEX IdxAvisoTimestamp ON Aviso(Timestamp);

-- Todas as turma lecionadas por um professor
CREATE INDEX IdxTurmaProfessor ON Turma(ProfessorID);
