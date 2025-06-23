-- Criacao de views

-- dropar views para nao crair novamente

DROP VIEW IF EXISTS dados_aluno;
DROP VIEW IF EXISTS medias;

-- View Para permitir acesso sem JOINs a todos od dados de aluno
CREATE VIEW dados_aluno AS
    SELECT
        aluno.usuarioid id,
        COALESCE(aluno.nome, '') || ' ' || COALESCE(aluno.sobrenome, '') AS nome_completo,
        aluno.telefone,
        aluno.datanascimento,
        aluno.email,
        aluno.cep endereco_cep,
        cep.pais endereco_pais,
        cep.uf endereco_uf,
        cep.cidade endereco_cidade,
        aluno.numero endereco_numero,
        cep.rua endereco_rua,
        aluno.complemento endereco_complemento,
        aluno.sexo,
        uni.cidade unidade_cidade,
        uni.estado unidade_estado,
        uni.pais unidade_pais,
        uni.bloco unidade_bloco,
        COUNT(*) matriculasAtivas
    FROM
        usuario aluno
        LEFT JOIN unidade uni
            ON aluno.unidadeid = uni.unidadeid
        LEFT JOIN ceps cep
            ON aluno.cep = cep.cep
        LEFT JOIN matricula mat
            ON aluno.usuarioid = mat.usuarioid
                AND
            NOW()::timestamp BETWEEN mat.datamatricula AND mat.datalimite
    WHERE
        aluno.tipousuario = 'aluno'
    GROUP BY
        aluno.usuarioid,
        aluno.nome,
        aluno.sobrenome,
        aluno.telefone,
        aluno.datanascimento,
        aluno.email,
        aluno.numero,
        aluno.complemento,
        aluno.cep,
        cep.pais,
        cep.uf,
        cep.cidade,
        cep.rua,
        aluno.sexo,
        uni.cidade,
        uni.estado,
        uni.pais,
        uni.bloco;


-- Relaciona aluno com sua media

CREATE VIEW medias AS
    SELECT
        aluno.usuarioid id,
        COALESCE(aluno.nome, '') || ' ' || COALESCE(aluno.sobrenome, '') AS nome_completo,
        AVG(notas.nota) media_global
    FROM
        usuario aluno
        LEFT JOIN matriculanotas notas
            ON aluno.usuarioid = notas.usuarioid
    WHERE
        aluno.tipousuario = 'aluno'
    GROUP BY
        aluno.usuarioid,
        aluno.nome,
        aluno.sobrenome;


-- Adiciona a média das avaliações de um professor a seus dados

CREATE VIEW professor_com_avaliacao AS
    SELECT
        prof.usuarioid,
        COALESCE(prof.nome, '') || ' ' || COALESCE(prof.sobrenome, '') AS nome_completo,
        prof.telefone,
        prof.datanascimento,
        prof.email,
        prof.titulacao,
        prof.especializacao,
        prof.cep endereco_cep,
        cep.pais endereco_pais,
        cep.uf endereco_uf,
        cep.cidade endereco_cidade,
        prof.numero endereco_numero,
        cep.rua endereco_rua,
        prof.complemento endereco_complemento,
        prof.sexo,
        uni.cidade unidade_cidade,
        uni.estado unidade_estado,
        uni.pais unidade_pais,
        uni.bloco unidade_bloco,
        AVG(ava.scoredidatica) score_didatica -- Outros scores dizem respeito à disciplina, apenas a didática é só pro professor
    FROM
        usuario prof
        LEFT JOIN unidade uni
            ON prof.unidadeid = uni.unidadeid
        LEFT JOIN ceps cep
            ON prof.cep = cep.cep
        LEFT JOIN avaliacao ava
            ON prof.usuarioid = ava.professorid
    WHERE
        prof.tipousuario = 'professor'
    GROUP BY
        prof.usuarioid,
        prof.nome,
        prof.sobrenome,
        prof.telefone,
        prof.datanascimento,
        prof.email,
        prof.titulacao,
        prof.especializacao,
        prof.numero,
        prof.complemento,
        prof.cep,
        cep.pais,
        cep.uf,
        cep.cidade,
        cep.rua,
        prof.sexo,
        uni.cidade,
        uni.estado,
        uni.pais,
        uni.bloco;

SELECT * FROM professor_com_avaliacao WHERE nome_completo LIKE 'Mirela%';