create database gestao_vendas;
use gestao_vendas;

CREATE TABLE Cliente (
cliente_id INT PRIMARY KEY auto_increment,
nome VARCHAR(100),
cpf CHAR(11),
email VARCHAR(100),
telefone VARCHAR(15)
);

CREATE TABLE Vendedor (
vendedor_id INT PRIMARY KEY auto_increment,
nome VARCHAR(100),
email VARCHAR(100),
salario DECIMAL(10,2)
);

CREATE TABLE Produto (
produto_id INT PRIMARY KEY auto_increment,
nome VARCHAR(100),
preco DECIMAL(10,2),
estoque INT
);

CREATE TABLE Venda (
venda_id INT PRIMARY KEY auto_increment,
cliente_id INT,
vendedor_id INT,
data_venda DATE,
total DECIMAL(10,2),
FOREIGN KEY ( cliente_id ) REFERENCES Cliente( cliente_id),
FOREIGN KEY ( vendedor_id ) REFERENCES Vendedor( vendedor_id)
);

CREATE TABLE ItemVenda(
item_id INT PRIMARY KEY auto_increment,
venda_id INT,
produto_id INT,
quantidade INT,
preco_unitario DECIMAL(10,2),
FOREIGN KEY ( venda_id ) REFERENCES Venda( venda_id),
FOREIGN KEY ( produto_id ) REFERENCES Produto( produto_id)
);

INSERT INTO Cliente (nome, cpf, email, telefone) VALUES
('Ana Clara', '12345678901', 'ana.clara@gmail.com', '(11) 90000-0001'),
('Bruno Alves', '23456789012', 'bruno.alves@yahoo.com', '(21) 90000-0002'),
('Camila Dias', '34567890123', 'camila.dias@hotmail.com', '(31) 90000-0003'),
('Diego Souza', '45678901234', 'diego.souza@outlook.com', '(41) 90000-0004'),
('Elaine Martins', '56789012345', 'elaine.martins@icloud.com', '(51) 90000-0005'),
('Felipe Lima', '67890123456', 'felipe.lima@gmail.com', '(61) 90000-0006'),
('Gabriela Rocha', '78901234567', 'gabriela.rocha@yahoo.com', '(71) 90000-0007');

INSERT INTO Vendedor (nome, email, salario) VALUES
('Lucas Mendes', 'lucas.mendes@empresa.com', 3500.00),
('Mariana Costa', 'mariana.costa@empresa.com', 4200.00),
('Roberto Silva', 'roberto.silva@empresa.com', 3900.00),
('Juliana Lopes', 'juliana.lopes@empresa.com', 4100.00),
('Fernando Nunes', 'fernando.nunes@empresa.com', 3700.00),
('Patrícia Souza', 'patricia.souza@empresa.com', 3600.00),
('Rafael Oliveira', 'rafael.oliveira@empresa.com', 3800.00);

INSERT INTO Produto (nome, preco, estoque) VALUES
('Pneu Aro 16', 480.00, 20),
('Óleo de Motor 5W30', 160.00, 50),
('Lanterna Traseira LED', 230.00, 12),
('Tapete Automotivo Borracha', 120.00, 25),
('Câmera de Ré', 190.00, 9),
('Suporte Celular Veicular', 45.00, 40),
('Kit Palhetas Limpador', 90.00, 35);

INSERT INTO Venda (cliente_id, vendedor_id, data_venda, total) VALUES
(1, 1, '2025-04-01', 570.00),
(2, 2, '2023-04-02', 190.00),
(3, 3, '2023-04-03', 640.00),
(4, 4, '2022-04-04', 270.00),
(5, 5, '2021-04-05', 480.00),
(6, 6, '2024-04-06', 205.00),
(7, 7, '2024-04-07', 135.00);

INSERT INTO ItemVenda (venda_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 480.00),   -- Pneu
(1, 6, 2, 45.00),    -- Suporte
(2, 5, 1, 190.00),   -- Câmera de Ré
(3, 2, 2, 160.00),   -- Óleo
(3, 4, 1, 120.00),   -- Tapete
(3, 7, 2, 90.00),    -- Palhetas
(4, 3, 1, 230.00),   -- Lanterna
(4, 6, 1, 45.00),    -- Suporte
(5, 1, 1, 480.00),   -- Pneu
(6, 4, 1, 120.00),   -- Tapete
(6, 6, 1, 45.00),    -- Suporte
(6, 7, 1, 90.00),    -- Palheta
(7, 7, 1, 90.00),    -- Palheta
(7, 6, 1, 45.00);    -- Suporte

-- 1.Liste todos os clientes cadastrados.
select * from Cliente;

-- 2.Quais são os nomes dos produtos existentes?
select nome from Produto;

-- 3.Liste os produtos com preço superior a R$ 100.
select * from Produto where preco > 100.00;

-- 4.Quais clientes estão cadastrados no sistema?
select Nome from Cliente;

-- 5.Exiba os clientes e os produtos cadastrado.
select Cliente.nome as nome_cliente, Produto.nome as nome_produto from Cliente inner join Produto on Cliente.cliente_id = Produto.produto_id; 

-- 6.Quantos cliente existem na empresa?
select count(*) from Cliente;

-- 7.Quantos produtos estão cadastrados no sistema?
select count(*) as Qdt_ProdutosTotal from Produto;

-- 8.Quantos pedidos foram feitos no ano de 2024?
select count(*) as Pedidos_Realizados_2024 from Venda where year(data_venda) = 2024 ;

-- 9.Qual o valor total de vendas realizadas?
select count(*) as Qtd_Vendas_Realizados from Venda ;

-- 10.Qual o valor total de vendas feitas pelo funcionário de ID 5?
select count(*) as Qtd_Vendas_Funcionario_id5 from Venda where vendedor_id = 5;

-- 11.Quantos pedidos foram feitos pelo cliente 'João Silva'?
select count(*) as Qtd_Pedidos_João_Silva from Venda join Cliente on Venda.cliente_id = Cliente.cliente_id where Cliente.nome = 'João Silva' ;

-- 12.Qual a soma dos pedido s 'Vendas?
select sum(total) as Valor_Soma_Vendas from venda;

-- 13.Quantos cliente ganham mais de R$ 3000,00?
select nome as Vendedores_salario_mais_3000,salario from Vendedor where salario > 3000.00;

-- 14.Quantos produtos custam mais de R$ 100,00?
select nome,preco from  Produto where preco > 100.00;

-- 15.Qual a soma dos valores dos pedidos feitos pelo cliente de ID 2?
select sum(total) as Soma_compras_do_cliente_id2 from Venda join Cliente on Venda.cliente_id = Cliente.cliente_id where Cliente.cliente_id = 2;