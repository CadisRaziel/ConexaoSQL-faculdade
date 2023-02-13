CREATE TABLE jogador (
    id_jogador NUMBER(10,0) NOT NULL,
    nome VARCHAR2(100) NOT NULL,
    posicao VARCHAR2(100) NOT NULL,
    bi VARCHAR2(100),
    CONSTRAINT pk_jogador PRIMARY KEY (id_jogador);
);

CREATE TABLE contratado (
    id_jogador NUMBER(10,0) NOT NULL
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    CONSTRAINT pk_contratado PRIMARY KEY(id_jogador, data_inicio)
    CONSTRAINT fk_contratado_ref_jogador FOREIGN KEY (id_jogador)
      REFERENCES jogador(id_jogador),
    CONSTRAINT ck_contratado CHECK (data_fim > data_inicio)
); 

ALTER TABLE jogador RENAME TO jogadores;


ALTER TABLE jogador ADD apelido VARCHAR2(30);

ALTER TABLE jogador RENAME COLUMN apelido TO nickname;

DESC jogador;

ALTER TABLE jogador MODIFY posicao NUMBER(5,0);

ALTER TABLE jogador DROP COLUMN BI CASCADE CONSTRAINT;

DROP TABLE jogador;

ALTER TABLE contratado
DROP CONSTRAINT fk_contratado_ref_jogador;

ALTER TABLE contratado
ADD CONSTRAINT fk_contratado_ref_jogador FOREIGN KEY (id_jogador)
      REFERENCES jogador(id_jogador),
      
ALTER TABLE contratado
DISABLE CONSTRAINT fk_contratado_ref_jogador;

ALTER TABLE contratado
ENABLE CONSTRAINT fk_contratado_ref_jogador;

