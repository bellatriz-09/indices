-- ============================================================
-- Cenário: Company — departamentos e empregados
-- ============================================================

CREATE DATABASE IF NOT EXISTS company;
USE company;

CREATE TABLE departamento (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    cidade          VARCHAR(80) NOT NULL
);

CREATE TABLE empregado (
    id_empregado    INT AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(150) NOT NULL,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);
