create database loja_procedure;
use loja_procedure;

create table pedidos(
idPedidos int not null primary key auto_increment,
nome_cliente varchar(45) not null,
dt_pedido timestamp not null,
total_pedido decimal(9,2)
)engine=innodb;

create table produtos(
idProdutos int not null primary key auto_increment,
nome varchar(45) not null,
quantidade int not null,
valor decimal(9,2)
)engine=innodb;

create table itens_pedidos(
idProduto int not null primary key auto_increment,
quantidade int not null,
valor_unitario decimal(9,2) not null,
produtos_idProdutos int not null,
pedidos_idPedidos int not null,
foreign key(produtos_idProdutos) references produtos(idProdutos),
foreign key(pedidos_idPedidos) references pedidos(idPedidos)
)engine=innodb;

delimiter $$
create procedure baixa_estoque(
in idProduto int,
in quantidade decimal(7,6)
)
begin
update produtos set produtos.quantidade = produtos.quantidade - quantidade 
where produtos.idProdutos = idProduto;

end
$$
call baixa_estoque(2,4);

-- drop procedure baixa_estoque;
/*CREATE DEFINER = CURRENT_USER TRIGGER `limpeza`.`produtos_AFTER_UPDATE` AFTER UPDATE ON `produtos` FOR EACH ROW
BEGIN

if NEW.valor <> OLD.valor THEN
insert into historico_prod values
(null,NOW(),NEW.idProd,OLD.valor,NEW.valor);
end if;
END */


