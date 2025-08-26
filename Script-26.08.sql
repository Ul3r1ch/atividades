create database db_revenda_julia;

create table produto(
	id serial primary key,
	nome varchar(60),
	quantidade int,
	descricao varchar(40),
	tamanho varchar(60),
	valor_produto_id numeric(10,2)
);

create table clientes(
	id serial primary key,
	nome varchar(50),
	data_nascimento date,
	endereco_id int,
	telefone char(11)
);

create table endereco(
	id serial primary key,
	cep char(8),
	uf varchar(20),
	bairro varchar(50),
	logradouro varchar(50)

);

create table vendedor(
	id serial primary key,
	nome varchar(40),
	data_nascimento date,
	cargo varchar(30)
);

create table pagamento(
	id serial primary key,
	tipo_de_pagamento varchar(50),
	valor_produto_id int
);

create table valor_produto(
	id serial primary key
);


CREATE VIEW view_produto_detalhado AS
SELECT 
    p.id AS produto_id,
    p.nome AS nome_produto,
    p.tipo,
    p.tamanho,
    p.quantidade,
    vp.id AS valor_id
FROM 
    produto p
INNER JOIN 
    valor_produto vp ON p.valor_produto_id = vp.id;
   
   CREATE VIEW view_clientes_endereco AS
SELECT 
    c.id AS cliente_id,
    c.nome AS nome_cliente,
    c.data_nascimento,
    c.telefone,
    e.cep,
    e.uf,
    e.bairro,
    e.logradouro
FROM 
    clientes c
INNER JOIN 
    endereco e ON c.endereco_id = e.id;

INSERT INTO produto (nome, quantidade, tipo, tamanho, valor_produto_id)
VALUES 
('bolsa', 1000, 'lisa', 'pequena', 110.00),
('bolsa', 200, 'estampada', 'grande', 220.00),
('bolsa', 300, 'lisa, branca', 'média', 150.00),
('gloss', 100, 'lip oil', 'pequeno', 15.00),
('gloss', 160, 'lip honey', 'pequeno', 90.00),
('gloss', 1040, 'mari maria', 'pequeno', 100.00),
('calça', 100, 'wide leg, azul claro', '34', 120.00),
('saia', 100, 'praiana', '36', 100.00),
('calça', 1000, 'wide leg, azul claro', '38', 140.00),
('blusa', 1090, 'top tube', 'p', 60.00);



INSERT INTO clientes (nome, data_nascimento, endereco_id, telefone) VALUES
('AnaLuisa', '2008-07-17', 1, '24988649326'),
('AnnaJulia', '1998-09-20', 2, '24988987698'),
('André', '1990-01-09', 3, '24988564332'),
('Amanda', '1890-08-27', 4, '24988765490'), 
('Cicilo', '2005-05-15', 5, '24988554908'),
('Bianca', '2005-04-07', 6, '24988594211'),
('Breno', '2001-11-21', 7, '24988795329'),
('Carla', '2003-07-05', 8, '24988056421'),
('Carla', '2005-05-15', 9, '24988127632'),
('Carla', '1997-10-10', 10, '24988886599');

INSERT INTO endereco (cep, uf, bairro, logradouro) VALUES
('20419528', 'Rio de Janeiro', 'Quissama', 'Francisco Scali'),
('20429012', 'Rio de Janeiro', 'Marechael Deodoro', 'Rua Teresa'),
('20498343', 'Rio de Janeiro', 'Cascatinha', 'Rua do Imperador'),
('20067497', 'Rio de Janeiro', 'Cascatinha', 'Nova Cascatinha'),
('20223156', 'Rio de Janeiro', 'Quissama', 'Itamarati'),
('20490871', 'São Paulo', 'Quissama', 'Francisco Scali'),
('23267890', 'Rio de Janeiro', 'Quissama', 'Francisco Scali'),
('20409145', 'Rio de Janeiro', 'Quissama', 'Amaral'),
('20416543', 'Rio de Janeiro', 'Avenida', 'Senai'),
('20987653', 'Rio de Janeiro', 'dr.touzeth', 'Tunel');


INSERT INTO vendedor (nome, data_nascimento, cargo) VALUES
('Ju', '2008-11-21', 'Vendedora'),
('Carlos', '1990-05-10', 'Supervisor'),
('Ana', '1985-03-15', 'Vendedora'),
('Pedro', '1992-07-30', 'Atendente'),
('Larissa', '1998-12-09', 'Vendedora'),
('Marcos', '1980-08-01', 'Gerente'),
('Juliana', '1995-09-17', 'Caixa'),
('Felipe', '2000-01-25', 'Vendedor'),
('Renata', '1993-06-22', 'Consultora'),
('Diego', '1987-04-03', 'Vendedor');


INSERT INTO pagamento (tipo_de_pagamento, valor_produto_id) VALUES
('Pix', 1),
('Cartão de Crédito', 2),
('Dinheiro', 3),
('Boleto Bancário', 4),
('Transferência', 5),
('Débito', 6),
('Cartão de Débito', 7),
('PIX Parcelado', 8),
('QR Code', 9),
('Pagamento Instantâneo', 10);


select * from view_produto_detalhado vpd ;










