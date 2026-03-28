-- =====================================================
-- SCRIPT DE CRIAÇÃO DO BANCO E TABELAS (primeira execução)
-- =====================================================

-- Drop database se existir (cuidado: apaga dados existentes)
--DROP DATABASE IF EXISTS otaku_rpg;
CREATE DATABASE otaku_rpg;
USE otaku_rpg;

-- -----------------------------------------------------
-- Tabela: usuarios
-- -----------------------------------------------------
CREATE TABLE usuarios (
    id VARCHAR(50) PRIMARY KEY DEFAULT (UUID()),
    nome_usuario VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Índice para email (já criado automaticamente por UNIQUE, mas explícito para busca)
CREATE INDEX idx_email ON usuarios(email);

-- -----------------------------------------------------
-- Tabela: personagens
-- -----------------------------------------------------
CREATE TABLE personagens (
    id VARCHAR(50) PRIMARY KEY DEFAULT (UUID()),
    usuario_id VARCHAR(50) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    revisao INT NOT NULL DEFAULT 1,
    dados JSON NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

-- Índices
CREATE INDEX idx_usuario_id ON personagens(usuario_id);
CREATE INDEX idx_nome ON personagens(nome);

-- -----------------------------------------------------
-- Tabela: historico_personagens
-- -----------------------------------------------------
CREATE TABLE historico_personagens (
    id VARCHAR(50) PRIMARY KEY DEFAULT (UUID()),
    personagem_id VARCHAR(50) NOT NULL,
    versao INT NOT NULL,
    dados JSON NOT NULL,
    alterado_por VARCHAR(50),
    motivo_alteracao VARCHAR(255),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (personagem_id) REFERENCES personagens(id) ON DELETE CASCADE,
    FOREIGN KEY (alterado_por) REFERENCES usuarios(id) ON DELETE SET NULL,
    UNIQUE KEY uk_personagem_versao (personagem_id, versao)
);

-- Índice para buscar histórico por personagem
CREATE INDEX idx_historico_personagem ON historico_personagens(personagem_id);

