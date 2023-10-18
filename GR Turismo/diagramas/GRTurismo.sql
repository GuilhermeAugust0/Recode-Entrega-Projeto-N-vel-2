/* Lógico_GRTurismo: */

CREATE TABLE Contato (
    Telefone varchar(11) PRIMARY KEY,
    Nome varchar(40),
    Email varchar(20),
    Mensagem varchar(200),
    fk_Usuario_cod_usuario varchar(6)
);

CREATE TABLE Usuario (
    cod_usuario varchar(6) PRIMARY KEY,
    nome_completo varchar(40)
);

CREATE TABLE Destino (
    cod_destino varchar(6) PRIMARY KEY,
    origem varchar(20),
    destino varchar(20),
    data_ida varchar(8),
    data_volta VARCHAR(8),
    email VARCHAR(20)
);

CREATE TABLE cadastro (
    id_cadastro varchar(6) PRIMARY KEY,
    login varchar(20),
    senha varchar(10)
);

CREATE TABLE promocoes (
    cod_promocao varchar(6) PRIMARY KEY,
    data varchar(8),
    destino varchar(20)
);

CREATE TABLE faz (
    fk_Usuario_cod_usuario varchar(6),
    fk_cadastro_id_cadastro varchar(6)
);

CREATE TABLE acessa_promocoes_cadastro_Destino (
    fk_promocoes_cod_promocao varchar(6),
    fk_cadastro_id_cadastro varchar(6),
    fk_Destino_cod_destino varchar(6)
);
 
ALTER TABLE Contato ADD CONSTRAINT FK_Contato_2
    FOREIGN KEY (fk_Usuario_cod_usuario)
    REFERENCES Usuario (cod_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE faz ADD CONSTRAINT FK_faz_1
    FOREIGN KEY (fk_Usuario_cod_usuario)
    REFERENCES Usuario (cod_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE faz ADD CONSTRAINT FK_faz_2
    FOREIGN KEY (fk_cadastro_id_cadastro)
    REFERENCES cadastro (id_cadastro)
    ON DELETE SET NULL;
 
ALTER TABLE acessa_promocoes_cadastro_Destino ADD CONSTRAINT FK_acessa_promocoes_cadastro_Destino_1
    FOREIGN KEY (fk_promocoes_cod_promocao)
    REFERENCES promocoes (cod_promocao)
    ON DELETE NO ACTION;
 
ALTER TABLE acessa_promocoes_cadastro_Destino ADD CONSTRAINT FK_acessa_promocoes_cadastro_Destino_2
    FOREIGN KEY (fk_cadastro_id_cadastro)
    REFERENCES cadastro (id_cadastro)
    ON DELETE NO ACTION;
 
ALTER TABLE acessa_promocoes_cadastro_Destino ADD CONSTRAINT FK_acessa_promocoes_cadastro_Destino_3
    FOREIGN KEY (fk_Destino_cod_destino)
    REFERENCES Destino (cod_destino)
    ON DELETE NO ACTION;