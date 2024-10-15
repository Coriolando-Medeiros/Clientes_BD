-- Criação da base de dados
CREATE DATABASE IF NOT EXISTS orm_mysql;
USE orm_mysql;

-- Criação da tabela 'clientes'
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    cpf VARCHAR(14) NOT NULL
);

-- Inserção de 10 registros na tabela 'clientes'
INSERT INTO clientes (nome, telefone, cpf) VALUES
('Ana Clara Silva', '11987654321', '123.456.789-01'),
('Bruno Henrique Costa', '21965432187', '987.654.321-00'),
('Carla Maria Santos', '31987654322', '456.789.123-02'),
('Daniel Oliveira Lima', '41987654323', '789.123.456-03'),
('Eduardo Pereira Souza', '51987654324', '321.654.987-04'),
('Fernanda Alves Dias', '61987654325', '654.321.789-05'),
('Gabriel Martins Rocha', '71987654326', '963.852.741-06'),
('Helena Borges Ferreira', '81987654327', '852.741.963-07'),
('Igor Lima Nunes', '91987654328', '741.852.963-08'),
('Juliana Costa Mendes', '11998765432', '159.753.486-09');

-- Criação da tabela 'fornecedores'
CREATE TABLE IF NOT EXISTS fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    cnpj VARCHAR(18) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

-- Inserção de 10 registros na tabela 'fornecedores'
INSERT INTO fornecedores (nome, telefone, cnpj, endereco) VALUES
('Alimentos Rio Ltda', '2134567890', '12.345.678/0001-90', 'Rua A, 123 - Rio de Janeiro, RJ'),
('Bebidas São Paulo SA', '1134567891', '23.456.789/0001-80', 'Avenida B, 456 - São Paulo, SP'),
('Limpeza Total Distribuidora', '4134567892', '34.567.890/0001-70', 'Rua C, 789 - Belo Horizonte, MG'),
('Comercial Alimentos Sul', '5134567893', '45.678.901/0001-60', 'Avenida D, 101 - Porto Alegre, RS'),
('Distribuidora Norte Lda', '6134567894', '56.789.012/0001-50', 'Rua E, 202 - Manaus, AM'),
('Fornecedor de Bebidas Leste', '7134567895', '67.890.123/0001-40', 'Avenida F, 303 - Brasília, DF'),
('Tecidos Brasil Importados', '8134567896', '78.901.234/0001-30', 'Rua G, 404 - Salvador, BA'),
('Indústria Oeste Produtos', '9134567897', '89.012.345/0001-20', 'Avenida H, 505 - Curitiba, PR'),
('Mercado Distribuidor Nordeste', '1134567898', '90.123.456/0001-10', 'Rua I, 606 - Recife, PE'),
('Comércio Global Central', '2134567899', '01.234.567/0001-09', 'Avenida J, 707 - Goiânia, GO');

-- Fim do script
