CREATE DATABASE IF NOT EXISTS cantina_if;
USE cantina_if;

CREATE TABLE estudante (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  matricula VARCHAR(30) NOT NULL UNIQUE,
  nome VARCHAR(120) NOT NULL,
  turno ENUM('MANHA','TARDE','NOITE') NOT NULL,
  curso VARCHAR(120),
  ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE operador (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(120) NOT NULL,
  username VARCHAR(60) NOT NULL UNIQUE,
  senha_hash VARCHAR(255) NOT NULL,
  perfil ENUM('ADMIN','OPERADOR') NOT NULL
);

CREATE TABLE item_estoque (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  quantidade_atual INT NOT NULL,
  quantidade_minima INT NOT NULL DEFAULT 10,
  ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE retirada (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  estudante_id BIGINT NOT NULL,
  operador_id BIGINT NOT NULL,
  item_estoque_id BIGINT NOT NULL,
  turno ENUM('MANHA','TARDE','NOITE') NOT NULL,
  data_retirada DATE NOT NULL,
  data_hora DATETIME NOT NULL,
  CONSTRAINT fk_retirada_estudante FOREIGN KEY (estudante_id) REFERENCES estudante(id),
  CONSTRAINT fk_retirada_operador FOREIGN KEY (operador_id) REFERENCES operador(id),
  CONSTRAINT fk_retirada_item FOREIGN KEY (item_estoque_id) REFERENCES item_estoque(id),
  CONSTRAINT uk_retirada_unica UNIQUE (estudante_id, turno, data_retirada)
);

CREATE TABLE movimentacao_estoque (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  item_estoque_id BIGINT NOT NULL,
  tipo ENUM('ENTRADA','SAIDA') NOT NULL,
  quantidade INT NOT NULL,
  motivo VARCHAR(255),
  data_hora DATETIME NOT NULL,
  operador_id BIGINT,
  CONSTRAINT fk_mov_item FOREIGN KEY (item_estoque_id) REFERENCES item_estoque(id),
  CONSTRAINT fk_mov_operador FOREIGN KEY (operador_id) REFERENCES operador(id)
);
