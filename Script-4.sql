
SELECT *
FROM vendedor v 
WHERE nome LIKE '%F';

EXPLAIN SELECT *
from endereco e 
WHERE bairro LIKE '%Quissama%';

create index idx_endereco_bairro on endereco(bairro);

EXPLAIN SELECT *
from endereco e 
WHERE bairro LIKE '%Quissama%';

ALTER TABLE vendedor
ALTER COLUMN cargo TYPE INT USING cargo::integer;

ALTER TABLE pagamento 
ALTER COLUMN valor_produto_id TYPE varchar(10) USING valor_produto_id::varchar;

CREATE USER julia WITH PASSWORD 'aluna';
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO julia;

-- 1. Criar o usuário com senha
CREATE USER ana WITH PASSWORD '12345678';

-- 2. Conceder apenas permissão de SELECT na tabela produto
GRANT SELECT ON TABLE public.clientes TO ana;


SELECT e.id, c.endereco_id 
FROM endereco e 
INNER JOIN clientes c ON c.endereco_id = c.id; 

SELECT e.id, c.nome
from clientes c
LEFT JOIN endereco e ON c.endereco_id = c.id;


SELECT p.id, p2.id
from produto p
RIGHT JOIN pagamento p2  ON p.valor_produto_id = p2.id;


alter table clientes alter column telefone drop not null;

UPDATE clientes SET telefone = NULL WHERE id IN (1,2,3);
