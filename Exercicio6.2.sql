-- Script para realizar Consultas nas tabelas do exercício 6

-- ---------------------
--Consulta 1 
-- ---------------------
--Consulta todos os alunos com sua informação de endereço
Select * From Usuario as U join CEPs as C on C.CEP = U.CEP
	Where U.TipoUsuario = 'aluno';
-- ---------------------
--Consulta 2 
-- ---------------------
--Consulta a contagem de usuários por cidade
Select C.Cidade, Count(U.UsuarioID)
from CEPs as C Join Usuario as U On C.CEP = U.CEP Group by C.Cidade
Order By Count(U.UsuarioID) desc;

-- ---------------------
--Consulta 3
-- ---------------------

--Consulta todas as matriculas com informação de professor
Select T.HorarioTurma, T.NomeDisciplina, U.nome, P.nome as Professor
from Turma as T, Matricula as M, Usuario as U, Usuario as P
where M.turmaId = T.TurmaId and M.UsuarioId = U.UsuarioID and T.ProfessorId = P.UsuarioID;


-- ---------------------
--Consulta 4
-- ---------------------
--Consulta quais professores dão aula para algum aluno mais velho que eles
Select P.UsuarioId, P.Nome, P.sobrenome from Usuario as P
where P.DataNascimento > ANY
	(Select A.DataNascimento from Matricula as M, Usuario as A, Turma as T
	where T.TurmaID = M.TurmaID and T.ProfessorID = P.UsuarioID and M.UsuarioID = A.UsuarioID);
-- ---------------------
--Consulta 5
-- ---------------------
--Consulta as mensagens trocadas entre usuários do mesmo sexo
Select MSG.remetenteID, U1.nome, MSG.DestinatarioID, U2.nome, MSG.texto from Mensagem as MSG, Usuario as U1, Usuario as U2
	Where MSG.RemetenteId = U1.UsuarioID and MSG.DestinatarioID = U2.UsuarioID and
	U1.Sexo = U2.sexo;
	
-- ---------------------
--Consulta 6
-- ---------------------
--Consulta todos os usuários que moram na mesma cidade cuja a unidade que frequentam reside
Select Usu.usuarioID,Usu.nome, Uni.cidade, Uni.bloco From Usuario as Usu, CEPs as C, Unidade as Uni
	Where C.CEP = Usu.CEP and
	Uni.cidade = C.Cidade;
-- ---------------------
--Consulta 7
-- ---------------------
--Conta quantas Necessidades de infraestrutura os cursos de um departamento possui
Select D.CodigoDPT, Count(CN.NecessidadeInfra)
	from Departamento D
	left join Curso C on C.CodigoDPT = D.CodigoDPT
	left join CursoNecessidades CN on CN.CodigoCurso = C.CodigoCurso
	Group by D.CodigoDPT;