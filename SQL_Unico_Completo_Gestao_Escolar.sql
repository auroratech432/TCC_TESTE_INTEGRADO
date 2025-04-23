-- Início de estrutura_banco_gestao_escolar.sql

-- SQL base

-- Fim de estrutura_banco_gestao_escolar.sql

-- Início de complemento_estrutura_ia.sql

-- SQL IA complemento

-- Fim de complemento_estrutura_ia.sql

-- Início de alteracoes_tabela_horarios.sql

-- ALTER TABLE horarios

-- Fim de alteracoes_tabela_horarios.sql

-- Início de banco_gestao_escolar_completo.sql


-- Criação da estrutura base do banco de dados
CREATE DATABASE IF NOT EXISTS sei_database;
USE sei_database;

-- Tabelas principais
CREATE TABLE IF NOT EXISTS alunos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  matricula VARCHAR(20) UNIQUE,
  turma_id INT,
  FOREIGN KEY (turma_id) REFERENCES turmas(id)
);

CREATE TABLE IF NOT EXISTS professores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  senha VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS diretores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100),
  email VARCHAR(100) UNIQUE,
  senha VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS turmas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  serie VARCHAR(10),
  turma VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS faltas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  aluno_id INT,
  data DATE,
  motivo TEXT,
  FOREIGN KEY (aluno_id) REFERENCES alunos(id)
);

CREATE TABLE IF NOT EXISTS notas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  aluno_id INT,
  disciplina VARCHAR(100),
  nota DECIMAL(5,2),
  FOREIGN KEY (aluno_id) REFERENCES alunos(id)
);

CREATE TABLE IF NOT EXISTS eventos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100),
  descricao TEXT,
  data DATE
);

-- Complemento da estrutura para IA
CREATE TABLE IF NOT EXISTS carga_horaria (
  id INT AUTO_INCREMENT PRIMARY KEY,
  turma_id INT,
  disciplina VARCHAR(100),
  aulas_semanais INT,
  FOREIGN KEY (turma_id) REFERENCES turmas(id)
);

CREATE TABLE IF NOT EXISTS professor_disciplina_turma (
  id INT AUTO_INCREMENT PRIMARY KEY,
  professor_id INT,
  turma_id INT,
  disciplina VARCHAR(100),
  FOREIGN KEY (professor_id) REFERENCES professores(id),
  FOREIGN KEY (turma_id) REFERENCES turmas(id)
);

CREATE TABLE IF NOT EXISTS disponibilidade_professor (
  id INT AUTO_INCREMENT PRIMARY KEY,
  professor_id INT,
  dia_semana VARCHAR(10),
  horario_aula INT,
  FOREIGN KEY (professor_id) REFERENCES professores(id)
);

CREATE TABLE IF NOT EXISTS horarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  turno VARCHAR(10),
  dia_semana VARCHAR(10),
  horario_aula INT,
  professor_id INT,
  sala_id INT,
  disciplina VARCHAR(100),
  turma_id INT,
  FOREIGN KEY (professor_id) REFERENCES professores(id),
  FOREIGN KEY (turma_id) REFERENCES turmas(id)
);


-- Fim de banco_gestao_escolar_completo.sql

